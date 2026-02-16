-- Add booker information to bookings table
-- This allows tracking who made the booking vs who is on the ticket

-- Step 1: Add booker fields to bookings table
ALTER TABLE bookings
ADD COLUMN IF NOT EXISTS booker_first_name VARCHAR(255),
ADD COLUMN IF NOT EXISTS booker_last_name VARCHAR(255);

-- Step 2: Create index for booker name searches
CREATE INDEX IF NOT EXISTS idx_bookings_booker_name 
ON bookings(booker_first_name, booker_last_name);

-- Step 3: Add comment to explain the fields
COMMENT ON COLUMN bookings.booker_first_name IS 'First name of the person who made the booking';
COMMENT ON COLUMN bookings.booker_last_name IS 'Last name of the person who made the booking';
COMMENT ON COLUMN bookings.email IS 'Contact email (can be booker or attendee)';
COMMENT ON COLUMN bookings.phone IS 'Contact phone for ticket retrieval';

-- Step 4: Verify the changes
SELECT column_name, data_type, character_maximum_length, column_default
FROM information_schema.columns
WHERE table_name = 'bookings'
AND column_name IN ('booker_first_name', 'booker_last_name', 'email', 'phone')
ORDER BY ordinal_position;

-- Step 5: Example query to show booker vs attendees
-- SELECT 
--   b.id as booking_id,
--   b.booker_first_name,
--   b.booker_last_name,
--   b.phone as booker_phone,
--   bs.first_name as attendee_first_name,
--   bs.last_name as attendee_last_name,
--   bs.phone as attendee_phone,
--   s.row,
--   s.number
-- FROM bookings b
-- JOIN booking_seats bs ON b.id = bs.booking_id
-- JOIN seats s ON bs.seat_id = s.id
-- WHERE b.phone = '0812345678'
-- ORDER BY b.created_at DESC, s.row, s.number;

SELECT 'Booker information fields added successfully!' as status;
