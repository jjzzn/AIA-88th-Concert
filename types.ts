
export type BookingStep = 'USER_TYPE_SELECTION' | 'AGENT_CODE_ENTRY' | 'AGENT_TIER_SELECTION' | 'CODE_ENTRY' | 'SEAT_SELECTION' | 'DETAILS' | 'CONFIRMATION';

export type UserType = 'SELF' | 'AGENT';

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
  email?: string;
  phone?: string;
}

export interface ContactInfo {
  email: string;
  phone: string;
}

export interface AgentInfo {
  agentCode: string;
  agentName: string;
}

export interface BookingState {
  userType: UserType | null;
  agentInfo: AgentInfo | null;
  codes: string[];
  selectedTier: Tier | null;
  selectedSeats: Seat[];
  attendees: Attendee[];
  contact: ContactInfo;
}
