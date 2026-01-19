# Supabase Setup Guide

## 1. Environment Configuration

Create a `.env.local` file in the root directory with your Supabase credentials:

```env
VITE_SUPABASE_URL=https://mzhroupxmegympgtjatc.supabase.co
VITE_SUPABASE_ANON_KEY=sb_publishable__5rLEaucqVBgXjQWZo_ZZg_rCR7zZYt
```

**Important:** Never commit `.env.local` to version control. It's already in `.gitignore`.

## 2. Database Schema

Run the SQL schema in your Supabase SQL Editor to create all necessary tables:
- `tiers` - Concert ticket tiers (VIP, Premium, etc.)
- `zones` - Seating zones within each tier
- `seats` - Individual seats
- `access_codes` - Validation codes for booking
- `bookings` - Booking records
- `booking_seats` - Attendee information per seat
- `booking_codes` - Links bookings to access codes

## 3. Project Structure

### Backend Layer (`lib/services/`)
Business logic and database operations:
- **`codeService.ts`** - Validate and manage access codes
- **`seatService.ts`** - Fetch and reserve seats
- **`bookingService.ts`** - Create and manage bookings
- **`tierService.ts`** - Fetch tier information

### Frontend Layer (`lib/hooks/`)
React hooks for UI components:
- **`useCodeValidation.ts`** - Code validation hook
- **`useSeats.ts`** - Seat fetching hook with auto-refresh
- **`useBooking.ts`** - Booking creation hook

### Configuration
- **`lib/supabase.ts`** - Supabase client instance
- **`lib/database.types.ts`** - TypeScript types from database schema
- **`vite-env.d.ts`** - Environment variable types

## 4. Usage Examples

### Validate Access Codes
```typescript
import { useCodeValidation } from './lib/hooks';

const { validateCodes, loading, error } = useCodeValidation();

const handleSubmit = async (codes: string[]) => {
  const result = await validateCodes(codes);
  if (result.isValid && result.tier) {
    // Proceed with tier
    console.log('Valid tier:', result.tier);
  }
};
```

### Fetch Available Seats
```typescript
import { useSeats } from './lib/hooks';

const { seats, loading, error, refreshSeats } = useSeats(tierId);

// seats will automatically load when tierId changes
// Call refreshSeats() to manually refresh
```

### Create Booking
```typescript
import { useBooking } from './lib/hooks';

const { createBooking, loading, error } = useBooking();

const handleBooking = async () => {
  const result = await createBooking({
    email: 'user@example.com',
    phone: '0812345678',
    codes: ['CODE1', 'CODE2'],
    seats: [
      { seatId: 'seat-1', firstName: 'John', lastName: 'Doe' },
      { seatId: 'seat-2', firstName: 'Jane', lastName: 'Doe' }
    ],
    totalAmount: 5000
  });

  if (result.success) {
    console.log('Booking ID:', result.bookingId);
  }
};
```

## 5. Direct Service Usage (Backend)

If you need direct access without hooks:

```typescript
import { codeService, seatService, bookingService } from './lib/services';

// Validate codes
const validation = await codeService.validateCodes(['CODE1', 'CODE2']);

// Get available seats
const seats = await seatService.getAvailableSeats('tier-id');

// Create booking
const result = await bookingService.createBooking({...});
```

## 6. Security Notes

- The anon key is safe to use in frontend code
- Row Level Security (RLS) should be enabled in Supabase
- Consider adding RLS policies to protect sensitive data
- Never expose service role keys in frontend code

## 7. Testing Connection

To verify your Supabase connection:

```typescript
import { supabase } from './lib/supabase';

const testConnection = async () => {
  const { data, error } = await supabase.from('tiers').select('count');
  console.log('Connection test:', error ? 'Failed' : 'Success');
};
```

## 8. Common Issues

### "Missing Supabase environment variables"
- Ensure `.env.local` exists with correct variable names
- Restart dev server after creating/modifying `.env.local`

### "Failed to fetch data"
- Check Supabase project status
- Verify API keys are correct
- Check browser console for CORS errors

### TypeScript errors
- Run `npm install` to ensure all dependencies are installed
- Restart TypeScript server in your IDE
