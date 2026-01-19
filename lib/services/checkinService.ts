import { supabase } from '../supabase';

export interface CheckInData {
  bookingId: string;
  attendee: string;
  seat: string;
  tier: string;
  timestamp: number;
  qrToken: string;
}

export interface CheckInResult {
  success: boolean;
  message: string;
  data?: {
    attendeeName: string;
    seat: string;
    tier: string;
    alreadyCheckedIn: boolean;
    checkedInAt?: string;
  };
}

export const checkinService = {
  async checkIn(qrToken: string): Promise<CheckInResult> {
    try {
      // Find booking seat by QR token
      const { data: bookingSeat, error: fetchError } = await supabase
        .from('booking_seats')
        .select(`
          id,
          first_name,
          last_name,
          checked_in,
          checked_in_at,
          seats (
            row,
            number,
            tier_id,
            tiers (
              name,
              level
            )
          )
        `)
        .eq('qr_token', qrToken)
        .single();

      if (fetchError || !bookingSeat) {
        return {
          success: false,
          message: 'QR Code ไม่ถูกต้องหรือไม่พบข้อมูล',
        };
      }

      // Check if already checked in
      if (bookingSeat.checked_in) {
        return {
          success: false,
          message: 'ตั๋วนี้ Check-in แล้ว',
          data: {
            attendeeName: `${bookingSeat.first_name} ${bookingSeat.last_name}`,
            seat: `${bookingSeat.seats.row}${bookingSeat.seats.number}`,
            tier: bookingSeat.seats.tiers.name,
            alreadyCheckedIn: true,
            checkedInAt: bookingSeat.checked_in_at,
          },
        };
      }

      // Perform check-in
      const { error: updateError } = await supabase
        .from('booking_seats')
        .update({
          checked_in: true,
          checked_in_at: new Date().toISOString(),
        })
        .eq('id', bookingSeat.id);

      if (updateError) {
        return {
          success: false,
          message: 'เกิดข้อผิดพลาดในการ Check-in',
        };
      }

      return {
        success: true,
        message: 'Check-in สำเร็จ!',
        data: {
          attendeeName: `${bookingSeat.first_name} ${bookingSeat.last_name}`,
          seat: `${bookingSeat.seats.row}${bookingSeat.seats.number}`,
          tier: bookingSeat.seats.tiers.name,
          alreadyCheckedIn: false,
        },
      };
    } catch (error) {
      console.error('Check-in error:', error);
      return {
        success: false,
        message: 'เกิดข้อผิดพลาดในระบบ',
      };
    }
  },

  async getCheckInStats() {
    try {
      const { data: total, error: totalError } = await supabase
        .from('booking_seats')
        .select('id', { count: 'exact', head: true });

      const { data: checkedIn, error: checkedInError } = await supabase
        .from('booking_seats')
        .select('id', { count: 'exact', head: true })
        .eq('checked_in', true);

      if (totalError || checkedInError) {
        throw new Error('Failed to fetch stats');
      }

      const totalCount = (total as any)?.count || 0;
      const checkedInCount = (checkedIn as any)?.count || 0;
      
      return {
        total: totalCount,
        checkedIn: checkedInCount,
        remaining: totalCount - checkedInCount,
      };
    } catch (error) {
      console.error('Failed to fetch check-in stats:', error);
      return { total: 0, checkedIn: 0, remaining: 0 };
    }
  },
};
