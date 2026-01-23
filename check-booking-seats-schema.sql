-- Check booking_seats table schema

SELECT 
  column_name,
  data_type,
  character_maximum_length,
  is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'booking_seats'
ORDER BY ordinal_position;

-- Check sample data
SELECT 
  id,
  booking_id,
  seat_id,
  qr_token
FROM booking_seats
LIMIT 5;
