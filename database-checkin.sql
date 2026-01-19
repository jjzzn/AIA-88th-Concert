-- Add Check-in functionality to existing database
-- Run this after database-final-fixed.sql

-- Add check-in columns to booking_seats table
ALTER TABLE booking_seats 
ADD COLUMN IF NOT EXISTS checked_in BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS checked_in_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS qr_token VARCHAR(255) UNIQUE;

-- Create index for check-in queries
CREATE INDEX IF NOT EXISTS idx_booking_seats_checked_in ON booking_seats(checked_in);
CREATE INDEX IF NOT EXISTS idx_booking_seats_qr_token ON booking_seats(qr_token);

-- Function to generate QR token for each booking seat
CREATE OR REPLACE FUNCTION generate_qr_token() 
RETURNS TRIGGER AS $$
BEGIN
  NEW.qr_token := encode(gen_random_bytes(32), 'hex');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to auto-generate QR token on insert
DROP TRIGGER IF EXISTS generate_qr_token_trigger ON booking_seats;
CREATE TRIGGER generate_qr_token_trigger
  BEFORE INSERT ON booking_seats
  FOR EACH ROW
  EXECUTE FUNCTION generate_qr_token();

-- Update existing booking_seats with QR tokens
UPDATE booking_seats 
SET qr_token = encode(gen_random_bytes(32), 'hex')
WHERE qr_token IS NULL;
