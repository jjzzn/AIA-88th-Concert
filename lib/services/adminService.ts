import { supabase } from '../supabase';
import { AdminUser, CheckIn, TicketVerification, CheckInStats, RecentCheckIn } from '../../types/admin';

export const adminService = {
  // Login
  async login(username: string, password: string): Promise<AdminUser | null> {
    try {
      const { data, error } = await supabase
        .from('admin_users')
        .select(`
          *,
          gates (
            id,
            name,
            code,
            description
          )
        `)
        .eq('username', username)
        .eq('is_active', true)
        .single();

      if (error || !data) {
        console.error('Login failed:', error);
        return null;
      }

      // In production, verify password hash properly
      // For now, we'll just check if user exists
      
      // Update last login
      await supabase
        .from('admin_users')
        .update({ last_login: new Date().toISOString() })
        .eq('id', data.id);

      return {
        id: data.id,
        username: data.username,
        full_name: data.full_name,
        gate_id: data.gate_id,
        role: data.role,
        is_active: data.is_active,
        created_at: data.created_at,
        last_login: data.last_login,
        gate: data.gates
      };
    } catch (error) {
      console.error('Login error:', error);
      return null;
    }
  },

  // Verify QR Code
  async verifyTicket(qrToken: string): Promise<TicketVerification> {
    try {
      const { data, error } = await supabase
        .from('booking_seats')
        .select(`
          id,
          first_name,
          last_name,
          qr_token,
          seats (
            id,
            row,
            number,
            zone_id,
            zones (
              name
            ),
            tiers (
              id,
              name,
              color
            )
          ),
          check_ins (
            id,
            checked_in_at
          )
        `)
        .eq('qr_token', qrToken)
        .single();

      if (error || !data) {
        return {
          valid: false,
          error: 'ไม่พบตั๋วนี้ในระบบ'
        };
      }

      const alreadyCheckedIn = data.check_ins && data.check_ins.length > 0;

      return {
        valid: true,
        booking_seat_id: data.id,
        attendee_name: `${data.first_name} ${data.last_name}`,
        tier_name: data.seats?.tiers?.name || 'STANDARD',
        tier_color: data.seats?.tiers?.color || '#E4002B',
        row: data.seats?.row || '',
        seat: data.seats?.number?.toString() || '',
        zone_name: data.seats?.zones?.name || '',
        already_checked_in: alreadyCheckedIn,
        checked_in_at: alreadyCheckedIn ? data.check_ins[0].checked_in_at : undefined
      };
    } catch (error) {
      console.error('Verify ticket error:', error);
      return {
        valid: false,
        error: 'เกิดข้อผิดพลาดในการตรวจสอบตั๋ว'
      };
    }
  },

  // Check-in
  async checkIn(bookingSeatId: string, adminUserId: string, gateId: string, notes?: string): Promise<boolean> {
    try {
      // Check if already checked in
      const { data: existing } = await supabase
        .from('check_ins')
        .select('id')
        .eq('booking_seat_id', bookingSeatId)
        .single();

      if (existing) {
        console.error('Already checked in');
        return false;
      }

      const { error } = await supabase
        .from('check_ins')
        .insert({
          booking_seat_id: bookingSeatId,
          admin_user_id: adminUserId,
          gate_id: gateId,
          notes: notes || null
        });

      if (error) {
        console.error('Check-in error:', error);
        return false;
      }

      // Update booking_seats.checked_in to true
      const { error: updateError } = await supabase
        .from('booking_seats')
        .update({ checked_in: true })
        .eq('id', bookingSeatId);

      if (updateError) {
        console.error('Failed to update checked_in flag:', updateError);
      }

      return true;
    } catch (error) {
      console.error('Check-in error:', error);
      return false;
    }
  },

  // Get check-in statistics
  async getCheckInStats(): Promise<CheckInStats> {
    try {
      // Get total checked in
      const { count: totalCheckedIn } = await supabase
        .from('check_ins')
        .select('*', { count: 'exact', head: true });

      // Get total capacity (all booking_seats)
      const { count: totalCapacity } = await supabase
        .from('booking_seats')
        .select('*', { count: 'exact', head: true });

      // Get by tier
      const { data: tierStats } = await supabase
        .from('check_ins')
        .select(`
          booking_seats (
            seats (
              tiers (
                id,
                name,
                level
              )
            )
          )
        `);

      // Count by tier
      const tierCounts: { [key: string]: { name: string; count: number; level: number } } = {};
      
      tierStats?.forEach((checkIn: any) => {
        const tier = checkIn.booking_seats?.seats?.tiers;
        if (tier) {
          if (!tierCounts[tier.id]) {
            tierCounts[tier.id] = { name: tier.name, count: 0, level: tier.level };
          }
          tierCounts[tier.id].count++;
        }
      });

      // Get total seats per tier
      const { data: totalSeats } = await supabase
        .from('booking_seats')
        .select(`
          seats (
            tier_id,
            tiers (
              id,
              name,
              level
            )
          )
        `);

      const tierTotals: { [key: string]: number } = {};
      totalSeats?.forEach((bs: any) => {
        const tierId = bs.seats?.tier_id;
        if (tierId) {
          tierTotals[tierId] = (tierTotals[tierId] || 0) + 1;
        }
      });

      // Hardcoded tier level mapping for correct sorting
      const getTierLevel = (tierId: string): number => {
        const levelMap: { [key: string]: number } = {
          '11111111-1111-1111-1111-111111111111': 1, // Platinum
          '22222222-2222-2222-2222-222222222222': 2, // Gold
          '66666666-6666-6666-6666-666666666666': 3, // Silver
          '77777777-7777-7777-7777-777777777777': 4, // Classic
        };
        return levelMap[tierId] || 99;
      };

      const byTier = Object.entries(tierCounts)
        .map(([tierId, data]) => ({
          tier_name: data.name,
          checked_in: data.count,
          total: tierTotals[tierId] || 0,
          percentage: tierTotals[tierId] ? Math.round((data.count / tierTotals[tierId]) * 100) : 0,
          level: getTierLevel(tierId)
        }))
        .sort((a, b) => a.level - b.level);

      return {
        total_checked_in: totalCheckedIn || 0,
        total_capacity: totalCapacity || 0,
        percentage: totalCapacity ? Math.round(((totalCheckedIn || 0) / totalCapacity) * 100) : 0,
        by_tier: byTier
      };
    } catch (error) {
      console.error('Get stats error:', error);
      return {
        total_checked_in: 0,
        total_capacity: 0,
        percentage: 0,
        by_tier: []
      };
    }
  },

  // Get recent check-ins
  async getRecentCheckIns(limit: number = 10): Promise<RecentCheckIn[]> {
    try {
      const { data, error } = await supabase
        .from('check_ins')
        .select(`
          id,
          checked_in_at,
          booking_seats (
            first_name,
            last_name,
            seats (
              row,
              number,
              zone_id,
              zones (
                name
              ),
              tiers (
                name
              )
            )
          )
        `)
        .order('checked_in_at', { ascending: false })
        .limit(limit);

      if (error || !data) {
        console.error('Get recent check-ins error:', error);
        return [];
      }

      return data.map((checkIn: any) => {
        const bs = checkIn.booking_seats;
        const seat = bs?.seats;
        const timeAgo = getTimeAgo(new Date(checkIn.checked_in_at));
        const zoneName = seat?.zones?.name || '';
        const row = seat?.row || '';
        const seatNum = seat?.number?.toString().padStart(2, '0') || '';

        return {
          id: checkIn.id,
          attendee_name: `${bs?.first_name || ''} ${bs?.last_name || ''}`,
          tier_name: seat?.tiers?.name || 'STANDARD',
          seat: `${seat?.row || ''}${seat?.number || ''}`,
          zone: zoneName,
          row: row,
          seat_number: seatNum,
          checked_in_at: checkIn.checked_in_at,
          time_ago: timeAgo
        };
      });
    } catch (error) {
      console.error('Get recent check-ins error:', error);
      return [];
    }
  }
};

// Helper function to calculate time ago
function getTimeAgo(date: Date): string {
  const seconds = Math.floor((new Date().getTime() - date.getTime()) / 1000);
  
  if (seconds < 60) return `${seconds} วินาทีที่แล้ว`;
  
  const minutes = Math.floor(seconds / 60);
  if (minutes < 60) return `${minutes} นาทีที่แล้ว`;
  
  const hours = Math.floor(minutes / 60);
  if (hours < 24) return `${hours} ชั่วโมงที่แล้ว`;
  
  const days = Math.floor(hours / 24);
  return `${days} วันที่แล้ว`;
}
