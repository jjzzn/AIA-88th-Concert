-- Add grantor fields to bookings table for tracking who granted the privilege
ALTER TABLE bookings 
ADD COLUMN IF NOT EXISTS grantor_first_name TEXT,
ADD COLUMN IF NOT EXISTS grantor_last_name TEXT,
ADD COLUMN IF NOT EXISTS grantor_phone TEXT;

-- Add comment for documentation
COMMENT ON COLUMN bookings.grantor_first_name IS 'First name of the person who granted the privilege (when is_booking_for_others is true)';
COMMENT ON COLUMN bookings.grantor_last_name IS 'Last name of the person who granted the privilege (when is_booking_for_others is true)';
COMMENT ON COLUMN bookings.grantor_phone IS 'Phone number of the person who granted the privilege (when is_booking_for_others is true)';
