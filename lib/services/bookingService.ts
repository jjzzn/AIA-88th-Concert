import { supabase } from '../supabase';
import type { Database } from '../database.types';
import { codeService } from './codeService';
import { seatService } from './seatService';

type BookingInsert = Database['public']['Tables']['bookings']['Insert'];
type BookingSeatInsert = Database['public']['Tables']['booking_seats']['Insert'];
type BookingCodeInsert = Database['public']['Tables']['booking_codes']['Insert'];

export interface BookingData {
  email: string;
  phone: string;
  bookerFirstName?: string;
  bookerLastName?: string;
  codes: string[];
  seats: Array<{
    seatId: string;
    firstName: string;
    lastName: string;
    email?: string;
    phone?: string;
  }>;
  userType?: 'SELF' | 'AGENT' | null;
  agentInfo?: {
    agentCode: string;
    agentFirstName: string;
    agentLastName: string;
  } | null;
}

export interface BookingResult {
  success: boolean;
  bookingId?: string;
  error?: string;
}

// Generate QR Token in format: AIA-XXXXXX (6 random digits)
function generateQRToken(): string {
  const randomDigits = Math.floor(100000 + Math.random() * 900000); // 6-digit number
  return `AIA-${randomDigits}`;
}

export const bookingService = {
  async createBooking(bookingData: BookingData): Promise<BookingResult> {
    try {
      const available = await seatService.checkSeatsAvailability(
        bookingData.seats.map(s => s.seatId)
      );

      if (!available) {
        return { success: false, error: 'Some seats are no longer available' };
      }

      console.log('bookingService.createBooking - Saving phone:', bookingData.phone);
      
      const { data: booking, error: bookingError } = await supabase
        .from('bookings')
        .insert({
          email: bookingData.email,
          phone: bookingData.phone,
          booker_first_name: bookingData.bookerFirstName || null,
          booker_last_name: bookingData.bookerLastName || null,
          status: 'confirmed',
          user_type: bookingData.userType || null,
          agent_code: bookingData.agentInfo?.agentCode || null,
          agent_name: bookingData.agentInfo ? `${bookingData.agentInfo.agentFirstName} ${bookingData.agentInfo.agentLastName}` : null,
        })
        .select()
        .single();
      
      console.log('bookingService.createBooking - Booking created with phone:', booking?.phone);

      if (bookingError || !booking) {
        console.error('Booking creation error:', bookingError);
        
        // Check for duplicate booking_number constraint violation
        if (bookingError?.message?.includes('booking_number') || bookingError?.code === '23505') {
          console.error('Duplicate booking_number detected - this may indicate a database trigger issue');
          return { success: false, error: 'เกิดข้อผิดพลาดในการสร้างหมายเลขการจอง กรุณาลองอีกครั้ง' };
        }
        
        return { success: false, error: bookingError?.message || 'Failed to create booking' };
      }

      const bookingSeats: BookingSeatInsert[] = bookingData.seats.map(seat => ({
        booking_id: booking.id,
        seat_id: seat.seatId,
        first_name: seat.firstName,
        last_name: seat.lastName,
        email: seat.email,
        phone: seat.phone,
        qr_token: generateQRToken(),
      }));

      const { error: seatsError } = await supabase
        .from('booking_seats')
        .insert(bookingSeats);

      if (seatsError) {
        console.error('Booking seats insert error:', seatsError);
        await supabase.from('bookings').delete().eq('id', booking.id);
        return { success: false, error: seatsError?.message || 'Failed to save attendee information' };
      }

      const reserveSuccess = await seatService.reserveSeats(
        bookingData.seats.map(s => s.seatId)
      );

      if (!reserveSuccess) {
        await supabase.from('bookings').delete().eq('id', booking.id);
        return { success: false, error: 'Failed to reserve seats' };
      }

      const accessCodes = await codeService.getCodesByIds(bookingData.codes);
      const bookingCodes: BookingCodeInsert[] = accessCodes.map(code => ({
        booking_id: booking.id,
        code_id: code.id,
      }));

      const { error: codesError } = await supabase
        .from('booking_codes')
        .insert(bookingCodes);

      if (codesError) {
        console.error('Failed to link codes to booking:', codesError);
      }

      await codeService.markCodesAsUsed(bookingData.codes);

      // Send confirmation email
      try {
        await this.sendConfirmationEmail(booking.id);
      } catch (emailError) {
        console.error('Failed to send confirmation email:', emailError);
        // Don't fail the booking if email fails
      }

      return { success: true, bookingId: booking.id };
    } catch (error) {
      console.error('Booking creation error:', error);
      return { success: false, error: 'An unexpected error occurred' };
    }
  },

  async sendConfirmationEmail(bookingId: string): Promise<boolean> {
    try {
      console.log('sendConfirmationEmail called with bookingId:', bookingId);
      console.log('bookingId type:', typeof bookingId);
      console.log('Sending individual ticket emails for booking:', bookingId);
      
      const { data, error } = await supabase.functions.invoke('send-individual-tickets', {
        body: { bookingId },
      });

      if (error) {
        console.error('Email function error:', error);
        console.error('Error details:', JSON.stringify(error, null, 2));
        return false;
      }

      console.log('Email results:', data);
      
      if (data?.errors && data.errors.length > 0) {
        console.warn('Some emails failed to send:', data.errors);
      }

      return data?.success || false;
    } catch (error) {
      console.error('Failed to invoke email function:', error);
      return false;
    }
  },

  async getBooking(bookingId: string) {
    try {
      const { data, error } = await supabase
        .from('bookings')
        .select(`
          *,
          booking_seats (
            id,
            booking_id,
            seat_id,
            first_name,
            last_name,
            email,
            phone,
            qr_token,
            checked_in,
            checked_in_at,
            created_at,
            seats!booking_seats_seat_id_fkey (*)
          )
        `)
        .eq('id', bookingId)
        .single();

      if (error) throw error;
      return data;
    } catch (error) {
      console.error('Failed to fetch booking:', error);
      return null;
    }
  },

  async getBookingByPhone(phone: string) {
    try {
      // Normalize phone number - remove all non-digits first
      const digitsOnly = phone.replace(/\D/g, '');
      
      console.log('Searching for attendee phone:', phone, 'digits only:', digitsOnly);
      
      // Search by booking_seats.phone instead of bookings.phone
      // This allows searching by individual attendee phone numbers
      let { data: seatData, error } = await supabase
        .from('booking_seats')
        .select(`
          id,
          first_name,
          last_name,
          seat_id,
          phone,
          qr_token,
          checked_in,
          is_cancelled,
          cancelled_at,
          cancel_count,
          swap_count,
          original_seat_id,
          booking_id,
          seats!booking_seats_seat_id_fkey (
            id,
            row,
            number,
            tier_id,
            zone_id,
            tiers (
              id,
              name,
              level,
              price,
              color,
              description
            ),
            zones (
              id,
              name
            )
          ),
          check_ins (
            id,
            checked_in_at
          ),
          bookings!booking_seats_booking_id_fkey (
            id,
            email,
            phone,
            status,
            booking_number,
            created_at,
            booker_first_name,
            booker_last_name,
            user_type,
            agent_code,
            agent_name
          )
        `)
        .eq('phone', digitsOnly)
        .order('created_at', { ascending: false });

      // 2. If not found, try without leading 0
      if (!seatData || seatData.length === 0) {
        const withoutZero = digitsOnly.startsWith('0') ? digitsOnly.substring(1) : digitsOnly;
        console.log('Trying without leading 0:', withoutZero);
        
        const result = await supabase
          .from('booking_seats')
          .select(`
            id,
            first_name,
            last_name,
            seat_id,
            phone,
            qr_token,
            checked_in,
            is_cancelled,
            cancelled_at,
            cancel_count,
            swap_count,
            original_seat_id,
            booking_id,
            seats!booking_seats_seat_id_fkey (
              id,
              row,
              number,
              tier_id,
              zone_id,
              tiers (
                id,
                name,
                level,
                price,
                color,
                description
              ),
              zones (
                id,
                name
              )
            ),
            check_ins (
              id,
              checked_in_at
            ),
            bookings!booking_seats_booking_id_fkey (
              id,
              email,
              phone,
              status,
              booking_number,
              created_at,
              booker_first_name,
              booker_last_name,
              user_type,
              agent_code,
              agent_name
            )
          `)
          .eq('phone', withoutZero)
          .order('created_at', { ascending: false });
        
        seatData = result.data;
        error = result.error;
      }

      if (error) {
        console.error('Supabase error:', error);
        throw error;
      }
      
      console.log('Found booking seats:', seatData?.length || 0);
      
      // Group seats by booking_id to reconstruct booking structure
      const bookingsMap = new Map();
      
      seatData?.forEach((seat: any) => {
        const bookingId = seat.booking_id;
        const bookingInfo = seat.bookings;
        
        if (!bookingsMap.has(bookingId)) {
          bookingsMap.set(bookingId, {
            ...bookingInfo,
            booking_seats: []
          });
        }
        
        // Add seat to booking
        const booking = bookingsMap.get(bookingId);
        booking.booking_seats.push({
          id: seat.id,
          first_name: seat.first_name,
          last_name: seat.last_name,
          seat_id: seat.seat_id,
          phone: seat.phone,
          qr_token: seat.qr_token,
          checked_in: seat.checked_in,
          is_cancelled: seat.is_cancelled,
          cancelled_at: seat.cancelled_at,
          cancel_count: seat.cancel_count,
          swap_count: seat.swap_count,
          original_seat_id: seat.original_seat_id,
          seats: seat.seats,
          check_ins: seat.check_ins
        });
      });
      
      const bookings = Array.from(bookingsMap.values());
      console.log('Found bookings:', bookings.length);
      
      return bookings;
    } catch (error) {
      console.error('Failed to fetch booking by phone:', error);
      return [];
    }
  },
};
