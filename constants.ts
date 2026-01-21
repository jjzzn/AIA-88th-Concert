
import { Tier, Seat, Zone } from './types';

export const TIERS: Tier[] = [
  { id: 'PLATINUM', name: 'PLATINUM', level: 'ELITE', color: '#9f1239', description: 'Exclusive access to Front Row sections' },
  { id: 'GOLD', name: 'GOLD', level: 'PREMIUM', color: '#be123c', description: 'Great views from the middle sections' },
  { id: 'SILVER', name: 'SILVER', level: 'STANDARD', color: '#fb7185', description: 'Balanced view and value' },
  { id: 'CLASSIC', name: 'CLASSIC', level: 'BASIC', color: '#ffe4e6', description: 'Standard arena seating' },
];

export const ZONES: Zone[] = [
  { id: 'P-A1', name: 'ZONE A1', tierId: 'PLATINUM', capacity: 50 },
  { id: 'P-A2', name: 'ZONE A2', tierId: 'PLATINUM', capacity: 50 },
  { id: 'G-B1', name: 'ZONE B1', tierId: 'GOLD', capacity: 50 },
  { id: 'G-B2', name: 'ZONE B2', tierId: 'GOLD', capacity: 50 },
  { id: 'G-B3', name: 'ZONE B3', tierId: 'GOLD', capacity: 50 },
  { id: 'S-C1', name: 'ZONE C1', tierId: 'SILVER', capacity: 50 },
  { id: 'S-C2', name: 'ZONE C2', tierId: 'SILVER', capacity: 50 },
  { id: 'C-D1', name: 'ZONE D1', tierId: 'CLASSIC', capacity: 50 },
  { id: 'C-D2', name: 'ZONE D2', tierId: 'CLASSIC', capacity: 50 },
];

// Helper to generate mock seats
const generateSeats = (): Seat[] => {
  const seats: Seat[] = [];
  const rows = ['A', 'B', 'C', 'D', 'E'];

  ZONES.forEach(zone => {
    rows.forEach(row => {
      for (let i = 1; i <= 10; i++) {
        seats.push({
          id: `${zone.id}-${row}${i}`,
          row,
          number: i,
          tierId: zone.tierId,
          zoneId: zone.id,
          isBooked: Math.random() < 0.2 // 20% already booked
        });
      }
    });
  });
  return seats;
};

export const MOCK_SEATS = generateSeats();

export const getTierFromCode = (code: string): Tier | null => {
  const prefix = code.charAt(0);
  switch (prefix) {
    case '1': return TIERS[0];
    case '2': return TIERS[1];
    case '3': return TIERS[2];
    case '4': 
    case '5': return TIERS[3];
    default: return null;
  }
};
