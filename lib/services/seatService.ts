import { supabase } from '../supabase';
import type { Database } from '../database.types';

type Seat = Database['public']['Tables']['seats']['Row'];
type Zone = Database['public']['Tables']['zones']['Row'];

export interface SeatWithZone extends Seat {
  zones?: Zone;
}

export const seatService = {
  async getAvailableSeats(tierId: string): Promise<SeatWithZone[]> {
    try {
      console.log('🔍 Fetching seats for tier:', tierId);

      // Fetch all seats using pagination to bypass 1000 row limit
      let allSeats: SeatWithZone[] = [];
      let from = 0;
      const pageSize = 1000;
      let hasMore = true;

      while (hasMore) {
        const { data, error, count } = await supabase
          .from('seats')
          .select('*, zones(*)', { count: 'exact' })
          .eq('tier_id', tierId)
          .order('row')
          .order('number')
          .range(from, from + pageSize - 1);

        if (error) throw error;

        if (data && data.length > 0) {
          allSeats = [...allSeats, ...(data as SeatWithZone[])];
          from += pageSize;
          
          // Check if we've fetched all seats
          if (count && allSeats.length >= count) {
            hasMore = false;
          } else if (data.length < pageSize) {
            hasMore = false;
          }
        } else {
          hasMore = false;
        }

        console.log(`📊 Fetched ${allSeats.length} seats so far...`);
      }

      console.log('✅ Total seats fetched:', allSeats.length);
      return allSeats;
    } catch (error) {
      console.error('Failed to fetch seats:', error);
      return [];
    }
  },

  async getSeatsByZones(zoneIds: string[]): Promise<SeatWithZone[]> {
    try {
      if (zoneIds.length === 0) return [];

      console.log('🔍 Fetching seats for zones:', zoneIds);

      // Fetch all seats using pagination to bypass 1000 row limit
      let allSeats: SeatWithZone[] = [];
      let from = 0;
      const pageSize = 1000;
      let hasMore = true;

      while (hasMore) {
        const { data, error, count } = await supabase
          .from('seats')
          .select('*, zones(*)', { count: 'exact' })
          .in('zone_id', zoneIds)
          .order('row')
          .order('number')
          .range(from, from + pageSize - 1);

        if (error) throw error;

        if (data && data.length > 0) {
          allSeats = [...allSeats, ...(data as SeatWithZone[])];
          from += pageSize;
          
          // Check if we've fetched all seats
          if (count && allSeats.length >= count) {
            hasMore = false;
          } else if (data.length < pageSize) {
            hasMore = false;
          }
        } else {
          hasMore = false;
        }

        console.log(`📊 Fetched ${allSeats.length} seats so far...`);
      }

      console.log('✅ Total seats fetched:', allSeats.length);
      return allSeats;
    } catch (error) {
      console.error('Failed to fetch seats by zones:', error);
      return [];
    }
  },

  async reserveSeats(seatIds: string[]): Promise<boolean> {
    try {
      const { error } = await supabase
        .from('seats')
        .update({ is_booked: true })
        .in('id', seatIds)
        .eq('is_booked', false);

      return !error;
    } catch (error) {
      console.error('Failed to reserve seats:', error);
      return false;
    }
  },

  async checkSeatsAvailability(seatIds: string[]): Promise<boolean> {
    try {
      const { data, error } = await supabase
        .from('seats')
        .select('id, is_booked')
        .in('id', seatIds);

      if (error) throw error;
      return data?.every(seat => !seat.is_booked) || false;
    } catch (error) {
      console.error('Failed to check seat availability:', error);
      return false;
    }
  },

  async getZonesByTier(tierId: string): Promise<Zone[]> {
    try {
      // PLATINUM and GOLD can select ANY zone
      if (tierId === 'PT' || tierId === 'GD') {
        const { data, error } = await supabase
          .from('zones')
          .select('*')
          .order('code');

        if (error) throw error;
        return data || [];
      }

      // Other tiers can only select zones from their tier
      const { data, error } = await supabase
        .from('zones')
        .select('*')
        .eq('tier_id', tierId)
        .order('code');

      if (error) throw error;
      return data || [];
    } catch (error) {
      console.error('Failed to fetch zones:', error);
      return [];
    }
  },
};
