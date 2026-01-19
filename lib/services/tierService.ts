import { supabase } from '../supabase';
import type { Database } from '../database.types';

type Tier = Database['public']['Tables']['tiers']['Row'];

export const tierService = {
  async getAllTiers(): Promise<Tier[]> {
    try {
      const { data, error } = await supabase
        .from('tiers')
        .select('*')
        .order('price', { ascending: false });

      if (error) throw error;
      return data || [];
    } catch (error) {
      console.error('Failed to fetch tiers:', error);
      return [];
    }
  },

  async getTierById(tierId: string): Promise<Tier | null> {
    try {
      const { data, error } = await supabase
        .from('tiers')
        .select('*')
        .eq('id', tierId)
        .single();

      if (error) throw error;
      return data;
    } catch (error) {
      console.error('Failed to fetch tier:', error);
      return null;
    }
  },
};
