# 🎫 Supabase Integration - Quick Start

## ✅ Setup Complete

Your Supabase integration is now configured with a clean separation between backend and frontend.

## 📁 Project Structure

```
lib/
├── supabase.ts              # Supabase client configuration
├── database.types.ts        # TypeScript types from database schema
├── services/                # Backend layer - Database operations
│   ├── codeService.ts       # Access code validation & management
│   ├── seatService.ts       # Seat fetching & reservation
│   ├── bookingService.ts    # Booking creation & management
│   ├── tierService.ts       # Tier information
│   └── index.ts             # Service exports
└── hooks/                   # Frontend layer - React hooks
    ├── useCodeValidation.ts # Code validation hook
    ├── useSeats.ts          # Seat fetching hook
    ├── useBooking.ts        # Booking creation hook
    └── index.ts             # Hook exports
```

## 🚀 Next Steps

### 1. Run Database Schema
Copy the contents of `database-schema.sql` and run it in your Supabase SQL Editor:
- Go to https://mzhroupxmegympgtjatc.supabase.co
- Navigate to SQL Editor
- Paste and execute the schema

### 2. Verify Environment Variables
Your `.env.local` is already configured with:
```
VITE_SUPABASE_URL=https://mzhroupxmegympgtjatc.supabase.co
VITE_SUPABASE_ANON_KEY=sb_publishable__5rLEaucqVBgXjQWZo_ZZg_rCR7zZYt
```

### 3. Start Development Server
```bash
npm run dev
```

## 💡 Usage Examples

### In Your Components (Frontend)

```typescript
// Validate access codes
import { useCodeValidation } from './lib/hooks';

const { validateCodes, loading, error } = useCodeValidation();

const handleSubmit = async (codes: string[]) => {
  const result = await validateCodes(codes);
  if (result.isValid && result.tier) {
    // Proceed with booking
  }
};
```

```typescript
// Fetch available seats
import { useSeats } from './lib/hooks';

const { seats, loading, error, refreshSeats } = useSeats(tierId);
// Seats auto-load when tierId changes
```

```typescript
// Create booking
import { useBooking } from './lib/hooks';

const { createBooking, loading, error } = useBooking();

const result = await createBooking({
  email: 'user@example.com',
  phone: '0812345678',
  codes: ['CODE1', 'CODE2'],
  seats: [
    { seatId: 'seat-1', firstName: 'John', lastName: 'Doe' }
  ],
  totalAmount: 5000
});
```

### Direct Service Usage (Backend Logic)

```typescript
import { codeService, seatService, bookingService } from './lib/services';

// Direct service calls without React hooks
const validation = await codeService.validateCodes(['CODE1']);
const seats = await seatService.getAvailableSeats('tier-id');
const result = await bookingService.createBooking({...});
```

## 🔒 Security

- ✅ `.env.local` is gitignored (never commit credentials)
- ✅ Using anon key (safe for frontend)
- ⚠️ Enable Row Level Security (RLS) in Supabase for production
- ⚠️ Add RLS policies to protect sensitive data

## 📚 Full Documentation

See `SUPABASE_SETUP.md` for complete documentation including:
- Detailed API reference
- Error handling
- Security best practices
- Troubleshooting guide

## 🧪 Test Connection

```typescript
import { supabase } from './lib/supabase';

const { data, error } = await supabase.from('tiers').select('*');
console.log('Connection:', error ? 'Failed' : 'Success', data);
```

## 📋 Database Tables

- `tiers` - Ticket tiers (VIP, Premium, Standard)
- `zones` - Seating zones per tier
- `seats` - Individual seats
- `access_codes` - Validation codes
- `bookings` - Booking records
- `booking_seats` - Attendee information
- `booking_codes` - Code-booking links

---

**Need help?** Check `SUPABASE_SETUP.md` for detailed documentation.
