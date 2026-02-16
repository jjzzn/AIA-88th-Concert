import { supabase } from '../supabase';
import type { Database } from '../database.types';

type AccessCode = Database['public']['Tables']['access_codes']['Row'];
type Tier = Database['public']['Tables']['tiers']['Row'];

export interface CodeValidationResult {
  isValid: boolean;
  tier?: Tier;
  error?: string;
}

export const codeService = {
  async validateCodes(codes: string[]): Promise<CodeValidationResult> {
    try {
      const { data: accessCodes, error: codesError } = await supabase
        .from('access_codes')
        .select('*, tiers(*)')
        .in('code', codes)
        .eq('is_used', false);

      if (codesError) {
        return { isValid: false, error: 'Failed to validate codes' };
      }

      if (!accessCodes || accessCodes.length !== codes.length) {
        return { isValid: false, error: 'Invalid or already used codes' };
      }

      const tierIds = new Set(accessCodes.map(c => c.tier_id));
      
      // Allow PT and GD codes to be mixed (they share the same zones)
      const hasPT = Array.from(tierIds).some(id => id === 'PT');
      const hasGD = Array.from(tierIds).some(id => id === 'GD');
      const isPTGDMix = hasPT && hasGD && tierIds.size === 2;
      
      if (tierIds.size > 1 && !isPTGDMix) {
        return { isValid: false, error: 'All codes must be for the same tier' };
      }

      // For PT/GD mix, use PT tier (higher tier)
      const tier = isPTGDMix 
        ? (accessCodes.find(c => c.tier_id === 'PT') as any)?.tiers 
        : (accessCodes[0] as any).tiers;
      
      return { isValid: true, tier };
    } catch (error) {
      console.error('Code validation error:', error);
      return { isValid: false, error: 'Validation failed' };
    }
  },

  async markCodesAsUsed(codes: string[]): Promise<boolean> {
    try {
      const { error } = await supabase
        .from('access_codes')
        .update({ is_used: true, used_at: new Date().toISOString() })
        .in('code', codes);

      return !error;
    } catch (error) {
      console.error('Failed to mark codes as used:', error);
      return false;
    }
  },

  async getCodesByIds(codes: string[]): Promise<AccessCode[]> {
    try {
      const { data, error } = await supabase
        .from('access_codes')
        .select('*')
        .in('code', codes);

      if (error) throw error;
      return data || [];
    } catch (error) {
      console.error('Failed to get codes:', error);
      return [];
    }
  },
};
