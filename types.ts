
export type BookingStep = 'CODE_ENTRY' | 'SEAT_SELECTION' | 'DETAILS' | 'CONFIRMATION';

export interface Tier {
  id: string;
  name: string;
  level: string;
  color: string;
  description: string;
}

export interface Zone {
  id: string;
  name: string;
  tierId: string;
  capacity: number;
}

export interface Seat {
  id: string;
  row: string;
  number: number;
  tierId?: string;
  tier_id?: string;
  zoneId?: string;
  zone_id?: string;
  isBooked?: boolean;
  is_booked?: boolean;
}

export interface Attendee {
  firstName: string;
  lastName: string;
  seatId: string;
}

export interface ContactInfo {
  email: string;
  phone: string;
}

export interface BookingState {
  codes: string[];
  selectedTier: Tier | null;
  selectedSeats: Seat[];
  attendees: Attendee[];
  contact: ContactInfo;
}
