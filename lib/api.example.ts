/**
 * Integration Examples
 * 
 * This file shows how to use the Supabase services and hooks in your components.
 * Delete this file after reviewing the examples.
 */

import { useCodeValidation, useSeats, useBooking } from './hooks';
import { codeService, seatService, bookingService, tierService } from './services';

// ============================================================================
// FRONTEND EXAMPLES (Using React Hooks)
// ============================================================================

/**
 * Example 1: Code Validation in CodeEntry Component
 */
export function CodeEntryExample() {
  const { validateCodes, loading, error } = useCodeValidation();

  const handleSubmit = async (codes: string[]) => {
    const result = await validateCodes(codes);
    
    if (result.isValid && result.tier) {
      console.log('Valid codes for tier:', result.tier.name);
      // Proceed to seat selection with result.tier
    } else {
      console.error('Validation failed:', result.error);
    }
  };

  return { handleSubmit, loading, error };
}

/**
 * Example 2: Seat Selection Component
 */
export function SeatSelectionExample(tierId: string) {
  const { seats, loading, error, refreshSeats } = useSeats(tierId);

  // Seats automatically load when tierId changes
  // Call refreshSeats() to manually refresh available seats

  const handleSeatClick = (seatId: string) => {
    const seat = seats.find(s => s.id === seatId);
    if (seat && !seat.is_booked) {
      console.log('Selected seat:', seat);
    }
  };

  return { seats, loading, error, handleSeatClick, refreshSeats };
}

/**
 * Example 3: Booking Creation in DetailsForm Component
 */
export function BookingExample() {
  const { createBooking, loading, error } = useBooking();

  const handleBookingSubmit = async (
    email: string,
    phone: string,
    codes: string[],
    selectedSeats: Array<{ seatId: string; firstName: string; lastName: string }>,
    tierPrice: number
  ) => {
    const result = await createBooking({
      email,
      phone,
      codes,
      seats: selectedSeats,
      totalAmount: tierPrice * selectedSeats.length,
    });

    if (result.success) {
      console.log('Booking created:', result.bookingId);
      // Show confirmation page
    } else {
      console.error('Booking failed:', result.error);
      // Show error message
    }
  };

  return { handleBookingSubmit, loading, error };
}

// ============================================================================
// BACKEND EXAMPLES (Direct Service Usage)
// ============================================================================

/**
 * Example 4: Server-side or utility functions
 */
export async function backendExamples() {
  // Validate codes without React hooks
  const validation = await codeService.validateCodes(['CODE1', 'CODE2']);
  if (validation.isValid) {
    console.log('Tier:', validation.tier);
  }

  // Get all tiers
  const tiers = await tierService.getAllTiers();
  console.log('Available tiers:', tiers);

  // Get available seats for a tier
  const seats = await seatService.getAvailableSeats('tier-id');
  console.log('Available seats:', seats.length);

  // Check if specific seats are available
  const available = await seatService.checkSeatsAvailability(['seat-1', 'seat-2']);
  console.log('Seats available:', available);

  // Create a booking
  const bookingResult = await bookingService.createBooking({
    email: 'user@example.com',
    phone: '0812345678',
    codes: ['CODE1', 'CODE2'],
    seats: [
      { seatId: 'seat-1', firstName: 'John', lastName: 'Doe' },
      { seatId: 'seat-2', firstName: 'Jane', lastName: 'Doe' },
    ],
    totalAmount: 10000,
  });

  if (bookingResult.success) {
    console.log('Booking ID:', bookingResult.bookingId);
    
    // Retrieve booking details
    const booking = await bookingService.getBooking(bookingResult.bookingId!);
    console.log('Booking details:', booking);
  }
}

// ============================================================================
// INTEGRATION WITH EXISTING COMPONENTS
// ============================================================================

/**
 * Example 5: Update your CodeEntry component
 */
/*
import { useCodeValidation } from './lib/hooks';

const CodeEntry = ({ onSubmit }) => {
  const { validateCodes, loading, error } = useCodeValidation();
  
  const handleSubmit = async (codes: string[]) => {
    const result = await validateCodes(codes);
    if (result.isValid && result.tier) {
      onSubmit(codes, result.tier);
    }
  };

  return (
    <div>
      {error && <div className="error">{error}</div>}
      <button onClick={() => handleSubmit(['CODE1'])} disabled={loading}>
        {loading ? 'Validating...' : 'Submit'}
      </button>
    </div>
  );
};
*/

/**
 * Example 6: Update your SeatSelection component
 */
/*
import { useSeats } from './lib/hooks';

const SeatSelection = ({ tier, onSubmit }) => {
  const { seats, loading, error, refreshSeats } = useSeats(tier.id);
  const [selected, setSelected] = useState<string[]>([]);

  if (loading) return <div>Loading seats...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div>
      <button onClick={refreshSeats}>Refresh Seats</button>
      {seats.map(seat => (
        <button
          key={seat.id}
          onClick={() => setSelected([...selected, seat.id])}
          disabled={seat.is_booked}
        >
          {seat.row}{seat.number}
        </button>
      ))}
      <button onClick={() => onSubmit(seats.filter(s => selected.includes(s.id)))}>
        Continue
      </button>
    </div>
  );
};
*/

/**
 * Example 7: Update your DetailsForm component
 */
/*
import { useBooking } from './lib/hooks';

const DetailsForm = ({ seats, codes, tier, onSuccess }) => {
  const { createBooking, loading, error } = useBooking();
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [attendees, setAttendees] = useState([]);

  const handleSubmit = async () => {
    const result = await createBooking({
      email,
      phone,
      codes,
      seats: attendees.map(a => ({
        seatId: a.seatId,
        firstName: a.firstName,
        lastName: a.lastName,
      })),
      totalAmount: tier.price * seats.length,
    });

    if (result.success) {
      onSuccess(result.bookingId);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      {error && <div className="error">{error}</div>}
      <input value={email} onChange={e => setEmail(e.target.value)} />
      <input value={phone} onChange={e => setPhone(e.target.value)} />
      <button type="submit" disabled={loading}>
        {loading ? 'Creating Booking...' : 'Confirm Booking'}
      </button>
    </form>
  );
};
*/
