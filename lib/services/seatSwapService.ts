import { supabase } from '../supabase';
import type {
  BookingInfo,
  SeatInfo,
  AvailableSeatsResponse,
  SwapSeatRequest,
  SwapSeatResponse,
  VerifyCodeRequest,
  VerifyCodeResponse,
  SeatSwapHistoryDetailed,
  SeatMapData
} from '../../types/seat-swap';

export const seatSwapService = {
  /**
   * Verify QR token or booking code and get booking information
   */
  async verifyCode(request: VerifyCodeRequest): Promise<VerifyCodeResponse> {
    try {
      const { code } = request;

      // Try to find by QR token first
      const { data: bookingSeat, error } = await supabase
        .from('booking_seats')
        .select(`
          id,
          booking_id,
          first_name,
          last_name,
          qr_token,
          checked_in,
          checked_in_at,
          bookings (
            email,
            phone,
            created_at
          ),
          seats (
            id,
            row,
            number,
            zone_id,
            tier_id,
            is_booked,
            zones (
              id,
              name
            ),
            tiers (
              id,
              name,
              color,
              price
            )
          )
        `)
        .eq('qr_token', code)
        .single();

      if (error || !bookingSeat) {
        return {
          success: false,
          message: 'ไม่พบรหัสนี้ในระบบ กรุณาตรวจสอบอีกครั้ง'
        };
      }

      const booking = (bookingSeat as any).bookings;
      const seat = (bookingSeat as any).seats;
      const bs = bookingSeat as any;

      const bookingInfo: BookingInfo = {
        booking_id: bs.booking_id,
        booking_seat_id: bs.id,
        email: booking.email,
        phone: booking.phone,
        first_name: bs.first_name,
        last_name: bs.last_name,
        qr_token: bs.qr_token,
        checked_in: bs.checked_in || false,
        checked_in_at: bs.checked_in_at,
        current_seat: {
          seat_id: seat.id,
          row: seat.row,
          number: seat.number,
          zone_id: seat.zone_id,
          zone_name: seat.zones?.name || '',
          tier_id: seat.tier_id,
          tier_name: seat.tiers?.name || '',
          tier_color: seat.tiers?.color || '#000',
          tier_price: seat.tiers?.price || 0,
          is_booked: seat.is_booked
        },
        booking_date: booking.created_at
      };

      return {
        success: true,
        message: 'พบข้อมูลการจอง',
        booking_info: bookingInfo
      };
    } catch (error) {
      console.error('Verify code error:', error);
      return {
        success: false,
        message: 'เกิดข้อผิดพลาดในการตรวจสอบรหัส'
      };
    }
  },

  /**
   * Get available seats for swapping (excluding current seat)
   */
  async getAvailableSeats(currentSeatId: string, tierId?: string): Promise<AvailableSeatsResponse> {
    try {
      let query = supabase
        .from('seats')
        .select(`
          id,
          row,
          number,
          zone_id,
          tier_id,
          is_booked,
          zones (
            id,
            name
          ),
          tiers (
            id,
            name,
            color,
            price
          )
        `)
        .eq('is_booked', false)
        .neq('id', currentSeatId)
        .order('tier_id')
        .order('zone_id')
        .order('row')
        .order('number');

      // Filter by tier if specified
      if (tierId) {
        query = query.eq('tier_id', tierId);
      }

      const { data: seats, error } = await query;

      if (error) {
        throw error;
      }

      const seatInfos: SeatInfo[] = (seats || []).map((seat: any) => ({
        seat_id: seat.id,
        row: seat.row,
        number: seat.number,
        zone_id: seat.zone_id,
        zone_name: seat.zones?.name || '',
        tier_id: seat.tier_id,
        tier_name: seat.tiers?.name || '',
        tier_color: seat.tiers?.color || '#000',
        tier_price: seat.tiers?.price || 0,
        is_booked: seat.is_booked
      }));

      // Group by tier
      const byTier = seatInfos.reduce((acc, seat) => {
        const existing = acc.find(t => t.tier_id === seat.tier_id);
        if (existing) {
          existing.available_count++;
        } else {
          acc.push({
            tier_id: seat.tier_id,
            tier_name: seat.tier_name,
            tier_color: seat.tier_color,
            available_count: 1,
            total_count: 0 // Will be calculated separately
          });
        }
        return acc;
      }, [] as AvailableSeatsResponse['by_tier']);

      // Get total counts per tier
      for (const tier of byTier) {
        const { count } = await supabase
          .from('seats')
          .select('*', { count: 'exact', head: true })
          .eq('tier_id', tier.tier_id);
        tier.total_count = count || 0;
      }

      return {
        seats: seatInfos,
        total_available: seatInfos.length,
        by_tier: byTier
      };
    } catch (error) {
      console.error('Get available seats error:', error);
      return {
        seats: [],
        total_available: 0,
        by_tier: []
      };
    }
  },

  /**
   * Get seat map data for visual display
   */
  async getSeatMap(currentSeatId?: string): Promise<SeatMapData> {
    try {
      const { data: seats, error } = await supabase
        .from('seats')
        .select(`
          id,
          row,
          number,
          zone_id,
          tier_id,
          is_booked,
          zones (
            id,
            name,
            tier_id
          ),
          tiers (
            id,
            name,
            color
          )
        `)
        .order('zone_id')
        .order('row')
        .order('number');

      if (error) throw error;

      // Group seats by zone
      const zoneMap = new Map<string, any>();

      (seats || []).forEach((seat: any) => {
        const zoneId = seat.zone_id;
        if (!zoneMap.has(zoneId)) {
          zoneMap.set(zoneId, {
            zone_id: zoneId,
            zone_name: seat.zones?.name || '',
            tier_id: seat.tier_id,
            tier_name: seat.tiers?.name || '',
            tier_color: seat.tiers?.color || '#000',
            seats: []
          });
        }

        zoneMap.get(zoneId).seats.push({
          seat_id: seat.id,
          row: seat.row,
          number: seat.number,
          zone_id: seat.zone_id,
          zone_name: seat.zones?.name || '',
          tier_id: seat.tier_id,
          tier_name: seat.tiers?.name || '',
          tier_color: seat.tiers?.color || '#000',
          tier_price: seat.tiers?.price || 0,
          is_booked: seat.is_booked,
          is_current: currentSeatId === seat.id
        });
      });

      return {
        zones: Array.from(zoneMap.values())
      };
    } catch (error) {
      console.error('Get seat map error:', error);
      return { zones: [] };
    }
  },

  /**
   * Execute seat swap using database function
   */
  async swapSeat(
    request: SwapSeatRequest,
    adminUserId: string,
    adminIp?: string
  ): Promise<SwapSeatResponse> {
    try {
      const { booking_seat_id, new_seat_id, reason, admin_notes } = request;

      // Call the database function for atomic swap
      const { data, error } = await supabase.rpc('swap_seat', {
        p_booking_seat_id: booking_seat_id,
        p_new_seat_id: new_seat_id,
        p_admin_user_id: adminUserId,
        p_reason: reason || null,
        p_admin_notes: admin_notes || null,
        p_admin_ip: adminIp || null
      } as any);

      if (error) {
        console.error('Swap seat RPC error:', error);
        return {
          success: false,
          message: 'เกิดข้อผิดพลาดในการสลับที่นั่ง: ' + error.message
        };
      }

      const result = data ? (data as any)[0] : null;

      if (!result || !result.success) {
        return {
          success: false,
          message: result?.message || 'ไม่สามารถสลับที่นั่งได้'
        };
      }

      // Get updated booking info
      const verifyResult = await this.verifyCode({ 
        code: (await this.getQRToken(booking_seat_id)) || '' 
      });

      return {
        success: true,
        message: 'สลับที่นั่งสำเร็จ',
        swap_history_id: result.swap_history_id,
        booking_info: verifyResult.booking_info
      };
    } catch (error) {
      console.error('Swap seat error:', error);
      return {
        success: false,
        message: 'เกิดข้อผิดพลาดในการสลับที่นั่ง'
      };
    }
  },

  /**
   * Get QR token by booking_seat_id
   */
  async getQRToken(bookingSeatId: string): Promise<string | null> {
    try {
      const { data, error } = await supabase
        .from('booking_seats')
        .select('qr_token')
        .eq('id', bookingSeatId)
        .single();

      if (error || !data) return null;
      return (data as any).qr_token;
    } catch (error) {
      console.error('Get QR token error:', error);
      return null;
    }
  },

  /**
   * Get seat swap history
   */
  async getSwapHistory(limit: number = 50, bookingId?: string): Promise<SeatSwapHistoryDetailed[]> {
    try {
      let query = supabase
        .from('seat_swap_history_detailed')
        .select('*')
        .order('swapped_at', { ascending: false })
        .limit(limit);

      if (bookingId) {
        query = query.eq('booking_id', bookingId);
      }

      const { data, error } = await query;

      if (error) throw error;

      return (data || []) as SeatSwapHistoryDetailed[];
    } catch (error) {
      console.error('Get swap history error:', error);
      return [];
    }
  },

  /**
   * Get swap statistics
   */
  async getSwapStats() {
    try {
      const { data: totalSwaps, error: totalError } = await supabase
        .from('seat_swap_history')
        .select('id', { count: 'exact', head: true })
        .eq('status', 'success');

      const { data: todaySwaps, error: todayError } = await supabase
        .from('seat_swap_history')
        .select('id', { count: 'exact', head: true })
        .eq('status', 'success')
        .gte('swapped_at', new Date().toISOString().split('T')[0]);

      const { data: failedSwaps, error: failedError } = await supabase
        .from('seat_swap_history')
        .select('id', { count: 'exact', head: true })
        .eq('status', 'failed');

      return {
        total_swaps: (totalSwaps as any)?.count || 0,
        today_swaps: (todaySwaps as any)?.count || 0,
        failed_swaps: (failedSwaps as any)?.count || 0
      };
    } catch (error) {
      console.error('Get swap stats error:', error);
      return {
        total_swaps: 0,
        today_swaps: 0,
        failed_swaps: 0
      };
    }
  }
};
