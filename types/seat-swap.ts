// Types for Seat Swap System

export interface SeatSwapHistory {
  id: string;
  booking_seat_id: string;
  booking_id: string;
  old_seat_id: string;
  new_seat_id: string;
  swapped_by: string;
  swapped_at: string;
  reason?: string;
  admin_notes?: string;
  admin_ip?: string;
  status: 'success' | 'failed' | 'rollback';
  error_message?: string;
  created_at: string;
}

export interface SeatSwapHistoryDetailed extends SeatSwapHistory {
  booking_email: string;
  booking_phone: string;
  attendee_name: string;
  qr_token: string;
  old_row: string;
  old_number: number;
  old_zone: string;
  old_tier: string;
  new_row: string;
  new_number: number;
  new_zone: string;
  new_tier: string;
  admin_name: string;
  admin_username: string;
}

export interface BookingInfo {
  booking_id: string;
  booking_seat_id: string;
  email: string;
  phone: string;
  first_name: string;
  last_name: string;
  qr_token: string;
  checked_in: boolean;
  checked_in_at?: string;
  current_seat: SeatInfo;
  booking_date: string;
}

export interface SeatInfo {
  seat_id: string;
  row: string;
  number: number;
  zone_id: string;
  zone_name: string;
  tier_id: string;
  tier_name: string;
  tier_color: string;
  tier_price: number;
  is_booked: boolean;
}

export interface AvailableSeatsResponse {
  seats: SeatInfo[];
  total_available: number;
  by_tier: {
    tier_id: string;
    tier_name: string;
    tier_color: string;
    available_count: number;
    total_count: number;
  }[];
}

export interface SwapSeatRequest {
  booking_seat_id: string;
  new_seat_id: string;
  reason?: string;
  admin_notes?: string;
}

export interface SwapSeatResponse {
  success: boolean;
  message: string;
  swap_history_id?: string;
  old_seat?: SeatInfo;
  new_seat?: SeatInfo;
  booking_info?: BookingInfo;
}

export interface VerifyCodeRequest {
  code: string; // QR token or booking code
  searchType?: 'qr_code' | 'phone' | 'name' | 'email';
}

export interface VerifyCodeResponse {
  success: boolean;
  message: string;
  booking_info?: BookingInfo;
}

export interface SeatMapData {
  zones: {
    zone_id: string;
    zone_name: string;
    tier_id: string;
    tier_name: string;
    tier_color: string;
    seats: {
      seat_id: string;
      row: string;
      number: number;
      is_booked: boolean;
      is_current?: boolean; // Current user's seat
    }[];
  }[];
}

export interface SwapConfirmationData {
  booking_info: BookingInfo;
  old_seat: SeatInfo;
  new_seat: SeatInfo;
  tier_change: boolean;
  zone_change: boolean;
}
