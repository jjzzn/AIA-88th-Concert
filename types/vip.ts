export interface VIPRoom {
  id: string;
  roomNumber: number;
  name: string;
  capacity: number;
  bookedCount?: number;
  layout: SeatLayout;
}

export interface SeatLayout {
  rows: number;
  seatsPerRow: number[];
}

export interface VIPSeat {
  id: string;
  roomId: string;
  row: string;
  number: number;
  isBooked: boolean;
}

export interface VIPAttendee {
  seatId: string;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
}

export interface VIPBookingState {
  selectedRoom: VIPRoom | null;
  selectedSeats: VIPSeat[];
  attendees: VIPAttendee[];
}

export type VIPBookingStep = 'ROOM_SELECTION' | 'SEAT_SELECTION' | 'ATTENDEE_DETAILS' | 'CONFIRMATION';

export const VIP_ROOMS: VIPRoom[] = [
  {
    id: 'room-14',
    roomNumber: 14,
    name: 'VIP Room 14',
    capacity: 18,
    layout: { rows: 3, seatsPerRow: [6, 6, 6] }
  },
  {
    id: 'room-15',
    roomNumber: 15,
    name: 'VIP Room 15',
    capacity: 25,
    layout: { rows: 5, seatsPerRow: [5, 5, 5, 5, 5] }
  },
  {
    id: 'room-16',
    roomNumber: 16,
    name: 'VIP Room 16',
    capacity: 25,
    layout: { rows: 5, seatsPerRow: [5, 5, 5, 5, 5] }
  },
  {
    id: 'room-17',
    roomNumber: 17,
    name: 'VIP Room 17',
    capacity: 25,
    layout: { rows: 5, seatsPerRow: [5, 5, 5, 5, 5] }
  },
  {
    id: 'room-18',
    roomNumber: 18,
    name: 'VIP Room 18',
    capacity: 24,
    layout: { rows: 4, seatsPerRow: [6, 6, 6, 6] }
  },
  {
    id: 'room-19',
    roomNumber: 19,
    name: 'VIP Room 19',
    capacity: 36,
    layout: { rows: 6, seatsPerRow: [6, 6, 6, 6, 6, 6] }
  },
  {
    id: 'room-20',
    roomNumber: 20,
    name: 'VIP Room 20',
    capacity: 18,
    layout: { rows: 3, seatsPerRow: [6, 6, 6] }
  },
  {
    id: 'room-21',
    roomNumber: 21,
    name: 'VIP Room 21',
    capacity: 18,
    layout: { rows: 3, seatsPerRow: [6, 6, 6] }
  },
  {
    id: 'room-22',
    roomNumber: 22,
    name: 'VIP Room 22',
    capacity: 18,
    layout: { rows: 3, seatsPerRow: [6, 6, 6] }
  },
  {
    id: 'room-23',
    roomNumber: 23,
    name: 'VIP Room 23',
    capacity: 18,
    layout: { rows: 3, seatsPerRow: [6, 6, 6] }
  }
];
