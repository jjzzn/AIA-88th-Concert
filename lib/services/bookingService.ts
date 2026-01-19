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
  totalAmount: number;
}

export interface BookingResult {
  success: boolean;
  bookingId?: string;
  error?: string;
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
          total_amount: bookingData.totalAmount,
          status: 'confirmed',
        })
        .select()
        .single();

      if (bookingError || !booking) {
        return { success: false, error: 'Failed to create booking' };
      }

      const bookingSeats: BookingSeatInsert[] = bookingData.seats.map(seat => ({
        booking_id: booking.id,
        seat_id: seat.seatId,
        first_name: seat.firstName,
        last_name: seat.lastName,
        qr_token: crypto.randomUUID(),
      }));

      const { error: seatsError } = await supabase
        .from('booking_seats')
        .insert(bookingSeats);

      if (seatsError) {
        await supabase.from('bookings').delete().eq('id', booking.id);
        return { success: false, error: 'Failed to save attendee information' };
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

      return { success: true, bookingId: booking.id };
    } catch (error) {
      console.error('Booking creation error:', error);
      return { success: false, error: 'An unexpected error occurred' };
    }
  },

  async getBooking(bookingId: string) {
    try {
      const { data, error } = await supabase
        .from('bookings')
        .select(`
          *,
          booking_seats (
            *,
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
            seats (
              id,
              row,
              number,
              tier_id,
              zone_id
            )
          )
        `)
        .eq('phone', phone)
        .order('created_at', { ascending: false });

      if (error) throw error;
      return data || [];
    } catch (error) {
      console.error('Failed to fetch booking by phone:', error);
      return [];
    }
  },
};
