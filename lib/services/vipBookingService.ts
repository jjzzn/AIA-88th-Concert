import { supabase } from '../supabase';
import { VIPRoom, VIPSeat, VIPAttendee } from '../../types/vip';

interface CreateVIPBookingParams {
  roomId: string;
  attendees: VIPAttendee[];
}

interface VIPBookingResult {
  success: boolean;
  bookingId?: string;
  qrTokens?: Record<string, string>;
  error?: string;
}

// Generate QR Token in format: AIA-XXXXXX (6 random digits)
function generateQRToken(): string {
  const randomDigits = Math.floor(100000 + Math.random() * 900000); // 6-digit number
  return `AIA-${randomDigits}`;
}

export const vipBookingService = {
  // Get all VIP rooms with booking statistics
  async getRooms(): Promise<VIPRoom[]> {
    const { data, error } = await supabase
      .from('vip_rooms')
      .select('*')
      .order('room_number');

    if (error) {
      console.error('Error fetching VIP rooms:', error);
      return [];
    }

    // Get booking statistics for each room
    const roomsWithStats = await Promise.all((data || []).map(async (room: any) => {
      const { count } = await supabase
        .from('vip_seats')
        .select('*', { count: 'exact', head: true })
        .eq('room_id', room.id)
        .eq('is_booked', true);

      return {
        id: room.id,
        roomNumber: room.room_number,
        name: room.name,
        capacity: room.capacity,
        bookedCount: count || 0,
        layout: this.generateLayout(room.capacity),
      };
    }));

    return roomsWithStats;
  },

  // Get seats for a specific room
  async getRoomSeats(roomId: string): Promise<VIPSeat[]> {
    const { data, error } = await supabase
      .from('vip_seats')
      .select('*')
      .eq('room_id', roomId)
      .order('row')
      .order('number');

    if (error) {
      console.error('Error fetching VIP seats:', error);
      return [];
    }

    return (data || []).map((seat: any) => ({
      id: seat.id,
      roomId: seat.room_id,
      row: seat.row,
      number: seat.number,
      isBooked: seat.is_booked,
    }));
  },

  // Create VIP booking
  async createBooking(params: CreateVIPBookingParams): Promise<VIPBookingResult> {
    try {
      // Start transaction
      const { data: booking, error: bookingError } = await supabase
        .from('vip_bookings')
        .insert({
          room_id: params.roomId,
        } as any)
        .select()
        .single();

      if (bookingError || !booking) {
        return { success: false, error: 'Failed to create booking' };
      }

      // Insert booking seats with attendee details
      const bookingSeats = params.attendees.map(attendee => ({
        booking_id: booking.id,
        seat_id: attendee.seatId,
        first_name: attendee.firstName,
        last_name: attendee.lastName,
        email: attendee.email,
        phone: attendee.phone,
        qr_token: generateQRToken(),
      }));

      const { error: seatsError } = await supabase
        .from('vip_booking_seats')
        .insert(bookingSeats);

      if (seatsError) {
        // Rollback: delete booking
        await supabase.from('vip_bookings').delete().eq('id', booking.id);
        return { success: false, error: 'Failed to create booking seats' };
      }

      // Update seats to booked
      const seatIds = params.attendees.map(a => a.seatId);
      const { error: updateError } = await supabase
        .from('vip_seats')
        .update({ is_booked: true })
        .in('id', seatIds);

      if (updateError) {
        console.error('Error updating seat status:', updateError);
      }

      // Send confirmation emails
      await this.sendConfirmationEmails(booking.id, params.attendees);

      // Fetch booking with QR tokens
      const bookingWithTokens = await this.getBookingWithTokens(booking.id);

      return { success: true, bookingId: booking.id, qrTokens: bookingWithTokens };
    } catch (error) {
      console.error('Error creating VIP booking:', error);
      return { success: false, error: 'An unexpected error occurred' };
    }
  },

  // Get booking with QR tokens
  async getBookingWithTokens(bookingId: string): Promise<Record<string, string>> {
    try {
      const { data, error } = await supabase
        .from('vip_booking_seats')
        .select('seat_id, qr_token')
        .eq('booking_id', bookingId);

      if (error || !data) {
        console.error('Error fetching QR tokens:', error);
        return {};
      }

      const tokenMap: Record<string, string> = {};
      data.forEach((item: any) => {
        tokenMap[item.seat_id] = item.qr_token;
      });

      return tokenMap;
    } catch (error) {
      console.error('Error getting booking tokens:', error);
      return {};
    }
  },

  // Send confirmation emails to each attendee
  async sendConfirmationEmails(bookingId: string, attendees: VIPAttendee[]): Promise<void> {
    // Group attendees by email
    const emailGroups = attendees.reduce((acc, attendee) => {
      if (!acc[attendee.email]) {
        acc[attendee.email] = [];
      }
      acc[attendee.email].push(attendee);
      return acc;
    }, {} as Record<string, VIPAttendee[]>);

    // Send email to each unique email address
    for (const [email, attendeeList] of Object.entries(emailGroups)) {
      try {
        // TODO: Implement actual email sending via Supabase Edge Function or external service
        console.log(`Sending confirmation email to ${email} for ${attendeeList.length} seat(s)`);
        
        // Example: Call Supabase Edge Function
        // await supabase.functions.invoke('send-vip-confirmation', {
        //   body: {
        //     email,
        //     attendees: attendeeList,
        //     bookingId,
        //   }
        // });
      } catch (error) {
        console.error(`Error sending email to ${email}:`, error);
      }
    }
  },

  // Generate layout based on capacity
  generateLayout(capacity: number): { rows: number; seatsPerRow: number[] } {
    const layouts: Record<number, { rows: number; seatsPerRow: number[] }> = {
      18: { rows: 3, seatsPerRow: [6, 6, 6] },
      24: { rows: 4, seatsPerRow: [6, 6, 6, 6] },
      25: { rows: 5, seatsPerRow: [5, 5, 5, 5, 5] },
      36: { rows: 6, seatsPerRow: [6, 6, 6, 6, 6, 6] },
    };

    return layouts[capacity] || { rows: 3, seatsPerRow: [6, 6, 6] };
  },
};
