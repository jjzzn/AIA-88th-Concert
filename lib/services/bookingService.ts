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
  codes: string[];
  seats: Array<{
    seatId: string;
    firstName: string;
    lastName: string;
  }>;
  userType?: 'SELF' | 'AGENT' | null;
  agentInfo?: {
    agentCode: string;
    agentName: string;
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

      const { data: booking, error: bookingError } = await supabase
        .from('bookings')
        .insert({
          email: bookingData.email,
          phone: bookingData.phone,
          status: 'confirmed',
          user_type: bookingData.userType || null,
          agent_code: bookingData.agentInfo?.agentCode || null,
          agent_name: bookingData.agentInfo?.agentName || null,
        })
        .select()
        .single();

      if (bookingError || !booking) {
        console.error('Booking creation error:', bookingError);
        return { success: false, error: bookingError?.message || 'Failed to create booking' };
      }

      const bookingSeats: BookingSeatInsert[] = bookingData.seats.map(seat => ({
        booking_id: booking.id,
        seat_id: seat.seatId,
        first_name: seat.firstName,
        last_name: seat.lastName,
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
      const { data, error } = await supabase.functions.invoke('send-booking-confirmation', {
        body: { bookingId },
      });

      if (error) {
        console.error('Email function error:', error);
        return false;
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
            qr_token,
            checked_in,
            checked_in_at,
            created_at,
            seats (*)
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
      // Normalize phone number (remove leading 0 if present)
      const normalizedPhone = phone.startsWith('0') ? phone.substring(1) : phone;
      const phoneWithZero = phone.startsWith('0') ? phone : `0${phone}`;
      
      console.log('Searching for phone:', phone, 'normalized:', normalizedPhone, 'with zero:', phoneWithZero);
      
      const { data, error } = await supabase
        .from('bookings')
        .select(`
          *,
          booking_seats (
            id,
            first_name,
            last_name,
            seat_id,
            qr_token,
            checked_in,
            seats (
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
            )
          )
        `)
        .or(`phone.eq.${phone},phone.eq.${normalizedPhone},phone.eq.${phoneWithZero}`)
        .order('created_at', { ascending: false });

      if (error) {
        console.error('Supabase error:', error);
        throw error;
      }
      
      console.log('Found bookings:', data?.length || 0);
      return data || [];
    } catch (error) {
      console.error('Failed to fetch booking by phone:', error);
      return [];
    }
  },
};
