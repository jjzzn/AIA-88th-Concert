-- Add is_booking_for_others field to bookings table
-- This field indicates whether the booker is booking for someone else

-- Step 1: Add the new column to bookings table
ALTER TABLE bookings
ADD COLUMN IF NOT EXISTS is_booking_for_others BOOLEAN DEFAULT FALSE;

-- Step 2: Add comment to explain the field
COMMENT ON COLUMN bookings.is_booking_for_others IS 'Indicates if the booking is made for someone else (true) or for self (false)';

-- Step 3: Verify the column was added
SELECT column_name, data_type, column_default, is_nullable
FROM information_schema.columns
WHERE table_name = 'bookings'
AND column_name = 'is_booking_for_others';

-- Success message
SELECT 'is_booking_for_others field added successfully to bookings table' as status;
