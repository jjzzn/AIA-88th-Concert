-- Add email and phone fields to booking_seats table for individual attendee contact info

ALTER TABLE booking_seats
ADD COLUMN IF NOT EXISTS email VARCHAR(255),
ADD COLUMN IF NOT EXISTS phone VARCHAR(20);

-- Create index for email lookups
CREATE INDEX IF NOT EXISTS idx_booking_seats_email ON booking_seats(email);

-- Verify the changes
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'booking_seats'
ORDER BY ordinal_position;
