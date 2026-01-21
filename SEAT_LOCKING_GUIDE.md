# Seat Locking System Guide

## Overview

The seat locking system prevents race conditions by temporarily reserving seats when users are filling in their booking details. This ensures that multiple users cannot book the same seat simultaneously.

## How It Works

### 1. **Seat Selection**
- User selects seats on the seat map
- Seats are visually marked as "selected"

### 2. **Seat Locking (NEW)**
- When user clicks "Confirm Seats" → seats are **locked** for 10 minutes
- Locked seats cannot be selected by other users
- User's session ID is stored with the lock

### 3. **Fill Details**
- User fills in attendee information
- Lock timer counts down (10:00 → 9:59 → ...)
- If timer expires, user must re-select seats

### 4. **Complete Booking**
- User submits booking
- Seats are marked as `is_booked = true`
- Lock is removed automatically

### 5. **Cancel/Timeout**
- If user cancels or leaves → locks are released
- Expired locks (>10 min) are auto-cleaned

---

## Database Schema

### New Fields in `seats` Table

```sql
ALTER TABLE seats ADD COLUMN:
- locked_until: TIMESTAMP     -- When lock expires
- locked_by: VARCHAR(255)     -- Session ID who locked it
```

### Seat States

| State | `is_booked` | `locked_until` | `locked_by` | Description |
|-------|-------------|----------------|-------------|-------------|
| **Available** | `false` | `NULL` | `NULL` | Can be selected |
| **Locked** | `false` | `future time` | `session-123` | Temporarily reserved |
| **Booked** | `true` | `NULL` | `NULL` | Permanently booked |

---

## Database Functions

### 1. `lock_seats()`
Lock seats for a session
```sql
SELECT * FROM lock_seats(
  ARRAY['seat-id-1', 'seat-id-2'],  -- Seat IDs
  'session-123',                     -- Session ID
  10                                 -- Duration (minutes)
);

-- Returns:
{
  success: true,
  locked_seats: ['seat-id-1', 'seat-id-2'],
  already_locked: [],
  already_booked: []
}
```

### 2. `check_seats_available()`
Check if seats are available
```sql
SELECT * FROM check_seats_available(
  ARRAY['seat-id-1'],
  'session-123'
);

-- Returns:
{
  seat_id: 'seat-id-1',
  is_available: true,
  status: 'available',  -- or 'locked' or 'booked'
  locked_by: null,
  locked_until: null
}
```

### 3. `unlock_seats()`
Manually unlock seats
```sql
SELECT unlock_seats(
  ARRAY['seat-id-1'],
  'session-123'
);

-- Returns: number of unlocked seats
```

### 4. `extend_seat_lock()`
Extend lock duration
```sql
SELECT extend_seat_lock(
  ARRAY['seat-id-1'],
  'session-123',
  5  -- Additional minutes
);
```

### 5. `cleanup_expired_seat_locks()`
Clean up expired locks
```sql
SELECT cleanup_expired_seat_locks();
-- Returns: number of cleaned locks
```

---

## TypeScript Service

### Import
```typescript
import { seatLockService } from '@/lib/services/seatLockService';
```

### Lock Seats
```typescript
const result = await seatLockService.lockSeats(
  ['seat-id-1', 'seat-id-2'],
  10  // minutes
);

if (result.success) {
  console.log('Seats locked!');
} else {
  console.log('Failed:', result.message);
  console.log('Already locked:', result.alreadyLocked);
  console.log('Already booked:', result.alreadyBooked);
}
```

### Check Availability
```typescript
const availability = await seatLockService.checkAvailability(['seat-id-1']);

availability.forEach(seat => {
  console.log(`Seat ${seat.seatId}: ${seat.status}`);
  // status: 'available' | 'locked' | 'booked'
});
```

### Unlock Seats
```typescript
const unlocked = await seatLockService.unlockSeats(['seat-id-1']);
console.log('Unlocked:', unlocked);
```

### Extend Lock
```typescript
const extended = await seatLockService.extendLock(['seat-id-1'], 5);
console.log('Extended:', extended);
```

---

## Implementation Flow

### Step 1: Install Database Migration
```bash
# Run in Supabase SQL Editor
database-add-seat-locks.sql
```

### Step 2: Update Seat Selection Component
```typescript
import { seatLockService } from '@/lib/services/seatLockService';

// When user confirms seat selection
const handleConfirmSeats = async () => {
  const seatIds = selectedSeats.map(s => s.id);
  
  // Lock the seats
  const result = await seatLockService.lockSeats(seatIds, 10);
  
  if (!result.success) {
    alert(result.message);
    // Remove unavailable seats from selection
    const unavailable = [
      ...result.alreadyLocked,
      ...result.alreadyBooked
    ];
    setSelectedSeats(prev => 
      prev.filter(s => !unavailable.includes(s.id))
    );
    return;
  }
  
  // Proceed to details form
  goToDetailsForm();
};
```

### Step 3: Add Lock Timer
```typescript
const [lockTimeRemaining, setLockTimeRemaining] = useState(600); // 10 min

useEffect(() => {
  const timer = setInterval(() => {
    setLockTimeRemaining(prev => {
      if (prev <= 0) {
        // Lock expired!
        alert('Your seat reservation has expired. Please select seats again.');
        goBackToSeatSelection();
        return 0;
      }
      return prev - 1;
    });
  }, 1000);
  
  return () => clearInterval(timer);
}, []);

// Display timer
<div>
  Time remaining: {seatLockService.formatRemainingTime(lockTimeRemaining)}
</div>
```

### Step 4: Unlock on Cancel/Complete
```typescript
// When user cancels
const handleCancel = async () => {
  await seatLockService.unlockSeats(seatIds);
  goBackToSeatSelection();
};

// When booking completes
const handleBookingComplete = async () => {
  // Seats are now booked, locks are automatically released
  seatLockService.clearSession();
};
```

### Step 5: Update Seat Map to Show Locked Seats
```typescript
const loadSeats = async () => {
  const seats = await seatService.getAvailableSeats(tierId);
  
  // Check which seats are locked
  const seatIds = seats.map(s => s.id);
  const availability = await seatLockService.checkAvailability(seatIds);
  
  const seatsWithStatus = seats.map(seat => {
    const avail = availability.find(a => a.seatId === seat.id);
    return {
      ...seat,
      status: avail?.status || 'available'
    };
  });
  
  setSeats(seatsWithStatus);
};

// In seat rendering
<Seat
  disabled={seat.is_booked || seat.status === 'locked'}
  className={
    seat.is_booked ? 'bg-gray-400' :
    seat.status === 'locked' ? 'bg-yellow-400' :
    'bg-green-400'
  }
/>
```

---

## UI/UX Recommendations

### Visual States
- **Available**: Green (can select)
- **Selected**: Blue (user's selection)
- **Locked**: Yellow/Orange (being selected by someone else)
- **Booked**: Gray (permanently unavailable)

### Timer Display
```
⏱️ Time remaining: 09:45
```

### Warning Messages
- **8 minutes left**: "⚠️ 8 minutes remaining"
- **2 minutes left**: "🚨 Only 2 minutes left!"
- **Expired**: "❌ Time expired. Please select seats again."

### Lock Conflicts
```
⚠️ Some seats are currently being selected by another user.
Please choose different seats.

Unavailable seats: A05, A06
```

---

## Cleanup Strategy

### Option 1: Automatic (Database)
```sql
-- Run every 5 minutes via pg_cron
SELECT cron.schedule(
  'cleanup-expired-locks',
  '*/5 * * * *',
  'SELECT cleanup_expired_seat_locks();'
);
```

### Option 2: Application-Level
```typescript
// Run cleanup every 5 minutes
setInterval(async () => {
  const cleaned = await seatLockService.cleanupExpiredLocks();
  console.log(`Cleaned ${cleaned} expired locks`);
}, 5 * 60 * 1000);
```

### Option 3: On-Demand
```typescript
// Clean up before loading seats
await seatLockService.cleanupExpiredLocks();
const seats = await seatService.getAvailableSeats(tierId);
```

---

## Testing

### Test Scenario 1: Normal Flow
1. User A selects seats → locks them
2. User B tries to select same seats → blocked
3. User A completes booking → seats booked
4. User B can now see seats as booked

### Test Scenario 2: Timeout
1. User A selects seats → locks them
2. User A waits 10+ minutes
3. Lock expires automatically
4. User B can now select those seats

### Test Scenario 3: Cancel
1. User A selects seats → locks them
2. User A clicks cancel
3. Locks released immediately
4. User B can select those seats

### Test Scenario 4: Multiple Users
1. User A locks seats 1-5
2. User B locks seats 6-10
3. User C tries to lock seats 5-7
4. Only seat 7 is locked (5,6 unavailable)

---

## Troubleshooting

### Seats stuck in locked state
```sql
-- Manually clean all locks
UPDATE seats 
SET locked_until = NULL, locked_by = NULL 
WHERE locked_until IS NOT NULL;
```

### Check current locks
```sql
SELECT 
  id,
  row,
  number,
  locked_by,
  locked_until,
  EXTRACT(EPOCH FROM (locked_until - NOW())) as seconds_remaining
FROM seats
WHERE locked_until IS NOT NULL
  AND locked_until > NOW()
ORDER BY locked_until;
```

### Session ID issues
```typescript
// Clear and regenerate session
seatLockService.clearSession();
const newSessionId = seatLockService.getSessionId();
```

---

## Performance Considerations

1. **Indexes**: Created on `locked_until` and `locked_by` for fast queries
2. **Cleanup**: Run every 5 minutes to prevent accumulation
3. **Lock Duration**: 10 minutes is reasonable (adjust if needed)
4. **Session Storage**: Uses localStorage (persists across page refresh)

---

## Security Notes

1. Session IDs are client-generated (not cryptographically secure)
2. For production, consider server-side session management
3. Locks can be bypassed by clearing localStorage (acceptable for this use case)
4. Database functions validate all operations server-side

---

## Summary

✅ **Prevents double-booking**
✅ **10-minute lock duration**
✅ **Auto-cleanup expired locks**
✅ **Session-based locking**
✅ **Visual feedback for users**
✅ **Extendable lock duration**
✅ **Manual unlock support**

**Ready to use!** 🚀
