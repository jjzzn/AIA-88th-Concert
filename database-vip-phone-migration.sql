-- Add phone field to vip_bookings table (if not exists)
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'vip_bookings' AND column_name = 'phone'
  ) THEN
    ALTER TABLE vip_bookings ADD COLUMN phone VARCHAR(20);
  END IF;
END $$;

-- Add index for phone lookup (if not exists)
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes 
    WHERE tablename = 'vip_bookings' AND indexname = 'idx_vip_bookings_phone'
  ) THEN
    CREATE INDEX idx_vip_bookings_phone ON vip_bookings(phone);
  END IF;
END $$;

-- Update existing VIP bookings with phone from first attendee
UPDATE vip_bookings vb
SET phone = (
  SELECT vbs.phone 
  FROM vip_booking_seats vbs 
  WHERE vbs.booking_id = vb.id 
  LIMIT 1
)
WHERE phone IS NULL;
