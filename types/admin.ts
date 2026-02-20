export interface Gate {
  id: string;
  name: string;
  code: string;
  description?: string;
  is_active: boolean;
  created_at: string;
}

export interface AdminUser {
  id: string;
  username: string;
  full_name: string;
  gate_id?: string;
  role: 'admin' | 'staff';
  is_active: boolean;
  created_at: string;
  last_login?: string;
  gate?: Gate;
}

export interface CheckIn {
  id: string;
  booking_seat_id: string;
  staff_id: string;
  gate_id: string;
  checked_in_at: string;
  notes?: string;
}

export interface TicketVerification {
  valid: boolean;
  booking_seat_id?: string;
  attendee_name?: string;
  tier_name?: string;
  tier_color?: string;
  row?: string;
  seat?: string;
  zone_name?: string;
  already_checked_in?: boolean;
  checked_in_at?: string;
  error?: string;
}

export interface CheckInStats {
  total_checked_in: number;
  total_capacity: number;
  percentage: number;
  by_tier: {
    tier_name: string;
    checked_in: number;
    total: number;
    percentage: number;
  }[];
}

export interface RecentCheckIn {
  id: string;
  attendee_name: string;
  tier_name: string;
  seat: string;
  zone: string;
  row: string;
  seat_number: string;
  checked_in_at: string;
  time_ago: string;
}
