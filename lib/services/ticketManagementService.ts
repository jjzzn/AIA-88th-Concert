import { supabase } from '../supabase';

interface CancelTicketParams {
  bookingSeatId: string;
  qrToken: string;
}

interface SwapSeatParams {
  bookingSeatId: string;
  currentSeatId: string;
  newSeatId: string;
  qrToken: string;
}

interface CancelTicketResult {
  success: boolean;
  message?: string;
  error?: string;
}

interface SwapSeatResult {
  success: boolean;
  message?: string;
  error?: string;
}

interface AvailableSeatsParams {
  tierId: string;
  zoneId: string;
}

export const ticketManagementService = {
  /**
   * Check if user can cancel ticket (max 1 time)
   */
  async canCancelTicket(bookingSeatId: string): Promise<{ canCancel: boolean; reason?: string }> {
    try {
      const { data, error } = await supabase
        .from('booking_seats')
        .select('cancel_count, is_cancelled')
        .eq('id', bookingSeatId)
        .single();

      if (error || !data) {
        return { canCancel: false, reason: 'ไม่พบข้อมูลตั๋ว' };
      }

      if (data.is_cancelled) {
        return { canCancel: false, reason: 'ตั๋วนี้ถูกยกเลิกแล้ว' };
      }

      if (data.cancel_count >= 1) {
        return { canCancel: false, reason: 'คุณได้ยกเลิกตั๋วไปแล้ว 1 ครั้ง (สูงสุด 1 ครั้ง)' };
      }

      return { canCancel: true };
    } catch (error) {
      console.error('Error checking cancel eligibility:', error);
      return { canCancel: false, reason: 'เกิดข้อผิดพลาดในการตรวจสอบ' };
    }
  },

  /**
   * Check if user can swap seat (max 1 time)
   */
  async canSwapSeat(bookingSeatId: string): Promise<{ canSwap: boolean; reason?: string }> {
    try {
      const { data, error } = await supabase
        .from('booking_seats')
        .select('swap_count, is_cancelled')
        .eq('id', bookingSeatId)
        .single();

      if (error || !data) {
        return { canSwap: false, reason: 'ไม่พบข้อมูลตั๋ว' };
      }

      if (data.is_cancelled) {
        return { canSwap: false, reason: 'ไม่สามารถสลับที่นั่งของตั๋วที่ถูกยกเลิกได้' };
      }

      if (data.swap_count >= 1) {
        return { canSwap: false, reason: 'คุณได้สลับที่นั่งไปแล้ว 1 ครั้ง (สูงสุด 1 ครั้ง)' };
      }

      return { canSwap: true };
    } catch (error) {
      console.error('Error checking swap eligibility:', error);
      return { canSwap: false, reason: 'เกิดข้อผิดพลาดในการตรวจสอบ' };
    }
  },

  /**
   * Cancel a ticket - marks as cancelled and returns seat to available pool
   */
  async cancelTicket(params: CancelTicketParams): Promise<CancelTicketResult> {
    try {
      // Check if can cancel
      const eligibility = await this.canCancelTicket(params.bookingSeatId);
      if (!eligibility.canCancel) {
        return { success: false, error: eligibility.reason };
      }

      // Get booking seat details
      const { data: bookingSeat, error: fetchError } = await supabase
        .from('booking_seats')
        .select('seat_id, cancel_count')
        .eq('id', params.bookingSeatId)
        .eq('qr_token', params.qrToken)
        .single();

      if (fetchError || !bookingSeat) {
        return { success: false, error: 'ไม่พบข้อมูลตั๋ว หรือ QR Token ไม่ถูกต้อง' };
      }

      // Start transaction: Update booking_seat and seat
      const { error: updateError } = await supabase
        .from('booking_seats')
        .update({
          is_cancelled: true,
          cancelled_at: new Date().toISOString(),
          cancel_count: (bookingSeat.cancel_count || 0) + 1,
        })
        .eq('id', params.bookingSeatId);

      if (updateError) {
        console.error('Error updating booking_seat:', updateError);
        return { success: false, error: 'เกิดข้อผิดพลาดในการยกเลิกตั๋ว' };
      }

      // Return seat to available pool
      const { error: seatError } = await supabase
        .from('seats')
        .update({ is_booked: false })
        .eq('id', bookingSeat.seat_id);

      if (seatError) {
        console.error('Error updating seat:', seatError);
        return { success: false, error: 'เกิดข้อผิดพลาดในการคืนที่นั่ง' };
      }

      return { 
        success: true, 
        message: 'ยกเลิกตั๋วเรียบร้อยแล้ว QR Code และโค้ดที่แลกมาจะไม่สามารถใช้งานได้อีกต่อไป' 
      };
    } catch (error) {
      console.error('Error cancelling ticket:', error);
      return { success: false, error: 'เกิดข้อผิดพลาดในการยกเลิกตั๋ว' };
    }
  },

  /**
   * Get available seats in the same zone for swapping
   */
  async getAvailableSeatsForSwap(params: AvailableSeatsParams) {
    try {
      const { data, error } = await supabase
        .from('seats')
        .select(`
          id,
          row,
          number,
          tier_id,
          zone_id,
          is_booked,
          zones (
            id,
            name
          )
        `)
        .eq('tier_id', params.tierId)
        .eq('zone_id', params.zoneId)
        .eq('is_booked', false)
        .order('row')
        .order('number');

      if (error) {
        console.error('Error fetching available seats:', error);
        return [];
      }

      return data || [];
    } catch (error) {
      console.error('Error getting available seats:', error);
      return [];
    }
  },

  /**
   * Swap seat - exchange current seat with a new available seat
   */
  async swapSeat(params: SwapSeatParams): Promise<SwapSeatResult> {
    try {
      // Check if can swap
      const eligibility = await this.canSwapSeat(params.bookingSeatId);
      if (!eligibility.canSwap) {
        return { success: false, error: eligibility.reason };
      }

      // Verify booking seat and QR token
      const { data: bookingSeat, error: fetchError } = await supabase
        .from('booking_seats')
        .select('seat_id, swap_count, original_seat_id')
        .eq('id', params.bookingSeatId)
        .eq('qr_token', params.qrToken)
        .single();

      if (fetchError || !bookingSeat) {
        return { success: false, error: 'ไม่พบข้อมูลตั๋ว หรือ QR Token ไม่ถูกต้อง' };
      }

      // Verify current seat matches
      if (bookingSeat.seat_id !== params.currentSeatId) {
        return { success: false, error: 'ข้อมูลที่นั่งปัจจุบันไม่ถูกต้อง' };
      }

      // Verify new seat is available
      const { data: newSeat, error: newSeatError } = await supabase
        .from('seats')
        .select('id, is_booked, tier_id, zone_id')
        .eq('id', params.newSeatId)
        .single();

      if (newSeatError || !newSeat) {
        return { success: false, error: 'ไม่พบที่นั่งใหม่' };
      }

      if (newSeat.is_booked) {
        return { success: false, error: 'ที่นั่งนี้ถูกจองแล้ว กรุณาเลือกที่นั่งอื่น' };
      }

      // Verify seats are in same tier and zone
      const { data: currentSeat } = await supabase
        .from('seats')
        .select('tier_id, zone_id')
        .eq('id', params.currentSeatId)
        .single();

      if (!currentSeat || currentSeat.tier_id !== newSeat.tier_id || currentSeat.zone_id !== newSeat.zone_id) {
        return { success: false, error: 'ที่นั่งใหม่ต้องอยู่ในโซนเดียวกัน' };
      }

      // Perform swap: Update booking_seat with new seat
      const { error: updateError } = await supabase
        .from('booking_seats')
        .update({
          seat_id: params.newSeatId,
          swap_count: (bookingSeat.swap_count || 0) + 1,
          original_seat_id: bookingSeat.original_seat_id || params.currentSeatId,
        })
        .eq('id', params.bookingSeatId);

      if (updateError) {
        console.error('Error updating booking_seat:', updateError);
        return { success: false, error: 'เกิดข้อผิดพลาดในการสลับที่นั่ง' };
      }

      // Mark old seat as available
      const { error: oldSeatError } = await supabase
        .from('seats')
        .update({ is_booked: false })
        .eq('id', params.currentSeatId);

      if (oldSeatError) {
        console.error('Error updating old seat:', oldSeatError);
        return { success: false, error: 'เกิดข้อผิดพลาดในการคืนที่นั่งเก่า' };
      }

      // Mark new seat as booked
      const { error: newSeatUpdateError } = await supabase
        .from('seats')
        .update({ is_booked: true })
        .eq('id', params.newSeatId);

      if (newSeatUpdateError) {
        console.error('Error updating new seat:', newSeatUpdateError);
        return { success: false, error: 'เกิดข้อผิดพลาดในการจองที่นั่งใหม่' };
      }

      return { 
        success: true, 
        message: 'สลับที่นั่งเรียบร้อยแล้ว' 
      };
    } catch (error) {
      console.error('Error swapping seat:', error);
      return { success: false, error: 'เกิดข้อผิดพลาดในการสลับที่นั่ง' };
    }
  },
};
