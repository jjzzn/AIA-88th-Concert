
export type BookingStep = 'CODE_ENTRY' | 'SEAT_SELECTION' | 'DETAILS' | 'CONFIRMATION';

export interface Tier {
  id: string;
  name: string;
  level: string;
  price: number;
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
  tierId: string;
  zoneId: string;
  isBooked: boolean;
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
