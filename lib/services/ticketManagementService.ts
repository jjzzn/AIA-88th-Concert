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
   * Get allowed zones for swapping based on user's tier
   */
  async getAllowedZonesForSwap(tierId: string): Promise<string[]> {
    try {
      console.log('getAllowedZonesForSwap called for tier:', tierId);
      
      // PLATINUM and GOLD: Can swap to ALL zones (Level 1, 2, 3)
      if (tierId === 'PT' || tierId === 'GD') {
        console.log('Fetching ALL zones for PLATINUM/GOLD');
        
        const { data, error } = await supabase
          .from('zones')
          .select('id, name, tier_id');
        
        if (error) {
          console.error('Error fetching zones:', error);
          throw error;
        }
        
        console.log('Zones fetched from database:', data?.length, 'zones');
        const zoneIds = data?.map(z => z.id) || [];
        console.log('Zone IDs to use:', zoneIds.length, 'zones');
        
        return zoneIds;
      }
      
      // SILVER: Can swap to Level 2 (S*) and Level 3 (L*) zones only
      if (tierId === 'SV') {
        const { data, error } = await supabase
          .from('zones')
          .select('id, code')
          .in('tier_id', ['SV', 'CL']); // SV = Level 2, CL = Level 3
        
        if (error) throw error;
        
        // Filter to only S* and L* zones
        return data?.filter(z => {
          const code = z.code || z.id;
          return code.startsWith('S') || code.startsWith('L');
        }).map(z => z.id) || [];
      }
      
      // Other tiers: Only same tier
      const { data, error } = await supabase
        .from('zones')
        .select('id')
        .eq('tier_id', tierId);
      
      if (error) throw error;
      return data?.map(z => z.id) || [];
    } catch (error) {
      console.error('Error getting allowed zones:', error);
      return [];
    }
  },

  /**
   * Get available seats for swapping based on allowed zones (not tier)
   */
  async getAvailableSeatsForSwap(params: AvailableSeatsParams) {
    try {
      console.log('getAvailableSeatsForSwap called with:', params);
      
      // Get all zones that user can swap to based on their tier
      const allowedZones = await this.getAllowedZonesForSwap(params.tierId);
      console.log('Allowed zones for tier', params.tierId, ':', allowedZones);
      
      if (allowedZones.length === 0) {
        console.log('No allowed zones found');
        return [];
      }
      
      // Check if seats exist in allowed zones (debug)
      console.log('Querying seats with zone_id IN:', allowedZones);
      
      const { data: allSeatsInZones, error: debugError } = await supabase
        .from('seats')
        .select('zone_id, is_booked')
        .in('zone_id', allowedZones);
      
      if (debugError) {
        console.error('Error fetching zone stats:', debugError);
      }
      
      console.log('Total seats found in query:', allSeatsInZones?.length || 0);
      
      if (allSeatsInZones) {
        const zoneStats = allSeatsInZones.reduce((acc, s) => {
          if (!acc[s.zone_id]) acc[s.zone_id] = { total: 0, available: 0 };
          acc[s.zone_id].total++;
          if (!s.is_booked) acc[s.zone_id].available++;
          return acc;
        }, {} as Record<string, {total: number, available: number}>);
        console.log('Zone statistics:', zoneStats);
        console.log('Zones with available seats:', Object.keys(zoneStats).filter(z => zoneStats[z].available > 0));
      }
      
      // Fetch seats from allowed zones with pagination (to bypass 1000 row limit)
      let allSeats: any[] = [];
      let from = 0;
      const pageSize = 1000;
      let hasMore = true;

      while (hasMore) {
        const { data, error, count } = await supabase
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
          `, { count: 'exact' })
          .in('zone_id', allowedZones)
          .order('zone_id')
          .order('row')
          .order('number')
          .range(from, from + pageSize - 1);

        if (error) {
          console.error('Error fetching available seats:', error);
          return [];
        }

        if (data && data.length > 0) {
          allSeats = [...allSeats, ...data];
          from += pageSize;
          
          console.log(`Fetched ${allSeats.length} seats so far (page size: ${data.length})...`);
          
          // Check if we've fetched all seats
          if (count && allSeats.length >= count) {
            hasMore = false;
          } else if (data.length < pageSize) {
            hasMore = false;
          }
        } else {
          hasMore = false;
        }
      }

      const data = allSeats;

      console.log('getAvailableSeatsForSwap result:', data?.length || 0, 'seats found');
      if (data && data.length > 0) {
        const uniqueZones = [...new Set(data.map(s => s.zone_id))];
        console.log('Zones in results:', [...new Set(data.map(s => s.zones?.name))]);
        console.log('Zone IDs in results:', uniqueZones);
        console.log('Tier IDs in results:', [...new Set(data.map(s => s.tier_id))]);
        
        // Count seats per zone
        const zoneCounts = data.reduce((acc, s) => {
          acc[s.zone_id] = (acc[s.zone_id] || 0) + 1;
          return acc;
        }, {} as Record<string, number>);
        console.log('Seats per zone:', zoneCounts);
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

      // Verify swap is allowed based on user's tier
      const { data: currentSeat } = await supabase
        .from('seats')
        .select('tier_id, zone_id')
        .eq('id', params.currentSeatId)
        .single();

      if (!currentSeat) {
        return { success: false, error: 'ไม่พบข้อมูลที่นั่งปัจจุบัน' };
      }

      // PLATINUM and GOLD: Can swap to ANY zone (no tier restriction)
      const isPlatinumOrGold = currentSeat.tier_id === 'PT' || currentSeat.tier_id === 'GD';
      
      if (!isPlatinumOrGold) {
        // For other tiers (SILVER, etc.): Must be same tier
        if (currentSeat.tier_id !== newSeat.tier_id) {
          return { success: false, error: 'ที่นั่งใหม่ต้องอยู่ใน tier เดียวกัน' };
        }
      }
      
      // If PLATINUM or GOLD, allow any tier (no validation needed)

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
