-- Add ticket management fields to booking_seats table
-- Allows users to cancel ticket and swap seat once per person

-- Add columns to track cancel and swap operations
ALTER TABLE booking_seats 
ADD COLUMN IF NOT EXISTS is_cancelled BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS cancelled_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS cancel_count INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS swap_count INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS original_seat_id VARCHAR(20) REFERENCES seats(id);

-- Add index for cancelled tickets
CREATE INDEX IF NOT EXISTS idx_booking_seats_is_cancelled ON booking_seats(is_cancelled);

-- Add comment
COMMENT ON COLUMN booking_seats.is_cancelled IS 'Whether this ticket has been cancelled';
COMMENT ON COLUMN booking_seats.cancelled_at IS 'When the ticket was cancelled';
COMMENT ON COLUMN booking_seats.cancel_count IS 'Number of times this person has cancelled (max 1)';
COMMENT ON COLUMN booking_seats.swap_count IS 'Number of times this person has swapped seats (max 1)';
COMMENT ON COLUMN booking_seats.original_seat_id IS 'Original seat ID before swap (for tracking)';

