-- Add phone column to booking_seats table for individual attendee phone numbers
-- This allows searching tickets by attendee phone instead of booking phone

-- Add phone column to booking_seats
ALTER TABLE booking_seats 
ADD COLUMN phone VARCHAR(20);

-- Add index for phone lookup on booking_seats
CREATE INDEX idx_booking_seats_phone ON booking_seats(phone);

-- Optional: Backfill phone numbers from bookings table if needed
-- This copies the booking phone to all seats in that booking
-- UPDATE booking_seats bs
-- SET phone = (
--   SELECT b.phone 
--   FROM bookings b 
--   WHERE b.id = bs.booking_id
-- )
-- WHERE phone IS NULL;
