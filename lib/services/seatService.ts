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
      const { data, error } = await supabase
        .from('seats')
        .select('*, zones(*)')
        .eq('tier_id', tierId)
        .order('row')
        .order('number');

      if (error) throw error;
      return (data as SeatWithZone[]) || [];
    } catch (error) {
      console.error('Failed to fetch seats:', error);
      return [];
    }
  },

  async getSeatsByZones(zoneIds: string[]): Promise<SeatWithZone[]> {
    try {
      if (zoneIds.length === 0) return [];

      const { data, error } = await supabase
        .from('seats')
        .select('*, zones(*)')
        .in('zone_id', zoneIds)
        .order('row')
        .order('number');

      if (error) throw error;
      return (data as SeatWithZone[]) || [];
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
      // Define tier access rules
      const tierAccessRules: { [key: string]: string[] } = {
        'PT': ['ZONE A1', 'ZONE A2'], // PLATINUM
        'GD': ['ZONE B1', 'ZONE B2', 'ZONE B3'], // GOLD
        'SV': ['ZONE D1', 'ZONE D2'], // SILVER
        'CL': ['ZONE C1', 'ZONE C2'], // CLASSIC
        'AG': ['ZONE A1', 'ZONE A2', 'ZONE B1', 'ZONE B2', 'ZONE B3'], // AGENCY
        'PR': ['ZONE B1', 'ZONE B2', 'ZONE B3'], // PRESTIGE
        'OT': ['ZONE B1', 'ZONE B2', 'ZONE B3'], // OTHER
        'VP': ['ZONE VIP'], // VIP
      };

      const allowedZoneNames = tierAccessRules[tierId] || [];

      if (allowedZoneNames.length === 0) {
        // Fallback: if tier not in rules, get zones by tier_id (original behavior)
        const { data, error } = await supabase
          .from('zones')
          .select('*')
          .eq('tier_id', tierId);

        if (error) throw error;
        return data || [];
      }

      // Get zones by allowed zone names
      const { data, error } = await supabase
        .from('zones')
        .select('*')
        .in('name', allowedZoneNames);

      if (error) throw error;
      return data || [];
    } catch (error) {
      console.error('Failed to fetch zones:', error);
      return [];
    }
  },
};
