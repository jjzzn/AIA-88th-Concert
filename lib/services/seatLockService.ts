import { supabase } from '../supabase';

export interface SeatLockResult {
  success: boolean;
  lockedSeats: string[];
  alreadyLocked: string[];
  alreadyBooked: string[];
  message?: string;
}

export interface SeatAvailability {
  seatId: string;
  isAvailable: boolean;
  status: 'available' | 'locked' | 'booked';
  lockedBy?: string;
  lockedUntil?: string;
}

export const seatLockService = {
  /**
   * Generate a unique session ID for the current user
   */
  generateSessionId(): string {
    const timestamp = Date.now();
    const random = Math.random().toString(36).substring(2, 15);
    return `session-${timestamp}-${random}`;
  },

  /**
   * Get or create session ID from localStorage
   */
  getSessionId(): string {
    let sessionId = localStorage.getItem('seat_lock_session_id');
    if (!sessionId) {
      sessionId = this.generateSessionId();
      localStorage.setItem('seat_lock_session_id', sessionId);
    }
    return sessionId;
  },

  /**
   * Lock seats for the current session (20 minutes by default)
   */
  async lockSeats(
    seatIds: string[],
    durationMinutes: number = 20
  ): Promise<SeatLockResult> {
    try {
      const sessionId = this.getSessionId();

      const { data, error } = await supabase.rpc('lock_seats', {
        p_seat_ids: seatIds,
        p_session_id: sessionId,
        p_lock_duration_minutes: durationMinutes,
      });

      if (error) {
        console.error('Failed to lock seats:', error);
        return {
          success: false,
          lockedSeats: [],
          alreadyLocked: [],
          alreadyBooked: [],
          message: 'Failed to lock seats',
        };
      }

      const result = data[0];
      
      if (!result.success) {
        let message = 'Some seats are unavailable';
        if (result.already_booked?.length > 0) {
          message = 'Some seats have already been booked';
        } else if (result.already_locked?.length > 0) {
          message = 'Some seats are currently being selected by another user';
        }
        
        return {
          success: false,
          lockedSeats: result.locked_seats || [],
          alreadyLocked: result.already_locked || [],
          alreadyBooked: result.already_booked || [],
          message,
        };
      }

      return {
        success: true,
        lockedSeats: result.locked_seats || [],
        alreadyLocked: [],
        alreadyBooked: [],
        message: 'Seats locked successfully',
      };
    } catch (error) {
      console.error('Error locking seats:', error);
      return {
        success: false,
        lockedSeats: [],
        alreadyLocked: [],
        alreadyBooked: [],
        message: 'An error occurred while locking seats',
      };
    }
  },

  /**
   * Unlock seats for the current session
   */
  async unlockSeats(seatIds: string[]): Promise<boolean> {
    try {
      const sessionId = this.getSessionId();

      const { data, error } = await supabase.rpc('unlock_seats', {
        p_seat_ids: seatIds,
        p_session_id: sessionId,
      });

      if (error) {
        console.error('Failed to unlock seats:', error);
        return false;
      }

      return (data as number) > 0;
    } catch (error) {
      console.error('Error unlocking seats:', error);
      return false;
    }
  },

  /**
   * Extend lock duration for seats (useful when user needs more time)
   */
  async extendLock(seatIds: string[], additionalMinutes: number = 20): Promise<boolean> {
    try {
      const sessionId = this.getSessionId();

      const { data, error } = await supabase.rpc('extend_seat_lock', {
        p_seat_ids: seatIds,
        p_session_id: sessionId,
        p_additional_minutes: additionalMinutes,
      });

      if (error) {
        console.error('Failed to extend lock:', error);
        return false;
      }

      return (data as number) > 0;
    } catch (error) {
      console.error('Error extending lock:', error);
      return false;
    }
  },

  /**
   * Check if seats are available (not booked and not locked by others)
   */
  async checkAvailability(seatIds: string[]): Promise<SeatAvailability[]> {
    try {
      const sessionId = this.getSessionId();

      const { data, error } = await supabase.rpc('check_seats_available', {
        p_seat_ids: seatIds,
        p_session_id: sessionId,
      });

      if (error) {
        console.error('Failed to check availability:', error);
        return [];
      }

      return (data || []).map((row: any) => ({
        seatId: row.seat_id,
        isAvailable: row.is_available,
        status: row.status,
        lockedBy: row.locked_by,
        lockedUntil: row.locked_until,
      }));
    } catch (error) {
      console.error('Error checking availability:', error);
      return [];
    }
  },

  /**
   * Clean up expired locks (can be called periodically)
   */
  async cleanupExpiredLocks(): Promise<number> {
    try {
      const { data, error } = await supabase.rpc('cleanup_expired_seat_locks');

      if (error) {
        console.error('Failed to cleanup expired locks:', error);
        return 0;
      }

      return data as number;
    } catch (error) {
      console.error('Error cleaning up expired locks:', error);
      return 0;
    }
  },

  /**
   * Clear session ID (useful when user completes booking or leaves)
   */
  clearSession(): void {
    localStorage.removeItem('seat_lock_session_id');
  },

  /**
   * Get remaining lock time in seconds
   */
  getRemainingLockTime(lockedUntil: string): number {
    const lockTime = new Date(lockedUntil).getTime();
    const now = Date.now();
    const remaining = Math.max(0, Math.floor((lockTime - now) / 1000));
    return remaining;
  },

  /**
   * Format remaining time as MM:SS
   */
  formatRemainingTime(seconds: number): string {
    const minutes = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${minutes}:${secs.toString().padStart(2, '0')}`;
  },
};
