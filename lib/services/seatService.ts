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
        .eq('is_booked', false)
        .order('row')
        .order('number');

      if (error) throw error;
      return (data as SeatWithZone[]) || [];
    } catch (error) {
      console.error('Failed to fetch seats:', error);
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
      const { data, error } = await supabase
        .from('zones')
        .select('*')
        .eq('tier_id', tierId);

      if (error) throw error;
      return data || [];
    } catch (error) {
      console.error('Failed to fetch zones:', error);
      return [];
    }
  },
};
