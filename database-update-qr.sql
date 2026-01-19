-- Quick update script to add QR token columns to existing database
-- Run this if you already have database-final-fixed.sql running

-- Add columns if they don't exist
ALTER TABLE booking_seats 
ADD COLUMN IF NOT EXISTS qr_token VARCHAR(255) UNIQUE,
ADD COLUMN IF NOT EXISTS checked_in BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS checked_in_at TIMESTAMP WITH TIME ZONE;

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_booking_seats_qr_token ON booking_seats(qr_token);
CREATE INDEX IF NOT EXISTS idx_booking_seats_checked_in ON booking_seats(checked_in);
CREATE INDEX IF NOT EXISTS idx_bookings_phone ON bookings(phone);

-- Generate QR tokens for existing booking_seats
UPDATE booking_seats 
SET qr_token = encode(gen_random_bytes(32), 'hex')
WHERE qr_token IS NULL;
