-- FINAL FIX: Complete seat locking system
-- This fixes all issues with seat locking

-- Step 1: Check current locked seats
SELECT '========================================' as info;
SELECT 'STEP 1: Current locked seats' as info;
SELECT '========================================' as info;

SELECT 
  id, row, number, 
  locked_by, 
  locked_until,
  CASE 
    WHEN locked_until > NOW() THEN 'ACTIVE'
    WHEN locked_until <= NOW() THEN 'EXPIRED'
    ELSE 'NOT LOCKED'
  END as lock_status,
  EXTRACT(EPOCH FROM (locked_until - NOW())) as seconds_remaining
FROM seats
WHERE locked_until IS NOT NULL
ORDER BY locked_until DESC;

-- Step 2: Clean up expired locks
SELECT '========================================' as info;
SELECT 'STEP 2: Cleaning expired locks' as info;
SELECT '========================================' as info;

SELECT cleanup_expired_seat_locks() as cleaned_count;

-- Step 3: Fix check_seats_available function
SELECT '========================================' as info;
SELECT 'STEP 3: Fixing check_seats_available function' as info;
SELECT '========================================' as info;

DROP FUNCTION IF EXISTS check_seats_available(TEXT[], VARCHAR);

CREATE OR REPLACE FUNCTION check_seats_available(
  p_seat_ids TEXT[],
  p_session_id VARCHAR(255) DEFAULT NULL
)
RETURNS TABLE(
  seat_id TEXT,
  is_available BOOLEAN,
  status VARCHAR(20),
  locked_by VARCHAR(255),
  locked_until TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
  -- Clean up expired locks first
  PERFORM cleanup_expired_seat_locks();
  
  RETURN QUERY
  SELECT 
    s.id::TEXT as seat_id,
    (
      NOT s.is_booked 
      AND (
        s.locked_until IS NULL 
        OR s.locked_until <= NOW()
        OR s.locked_by = COALESCE(p_session_id, '')
      )
    )::BOOLEAN as is_available,
    (CASE
      WHEN s.is_booked THEN 'booked'
      WHEN s.locked_until IS NOT NULL 
           AND s.locked_until > NOW() 
           AND s.locked_by IS NOT NULL
           AND s.locked_by != COALESCE(p_session_id, '') THEN 'locked'
      ELSE 'available'
    END)::VARCHAR(20) as status,
    s.locked_by,
    s.locked_until
  FROM seats s
  WHERE s.id = ANY(p_seat_ids);
END;
$$ LANGUAGE plpgsql;

-- Step 4: Test the function
SELECT '========================================' as info;
SELECT 'STEP 4: Testing check_seats_available' as info;
SELECT '========================================' as info;

-- First, lock a test seat
SELECT * FROM lock_seats(
  ARRAY['SEAT-RC42D'],
  'test-session-final',
  5
);

-- Then check if it shows as locked
SELECT * FROM check_seats_available(
  ARRAY['SEAT-RC42D'],
  'different-session'
);

-- Should show status='locked'

SELECT '========================================' as info;
SELECT '✅ FINAL FIX COMPLETE!' as info;
SELECT '========================================' as info;

SELECT 'Next steps:' as info
UNION ALL
SELECT '1. Refresh your browser (Cmd+R)'
UNION ALL
SELECT '2. Select a zone and seats'
UNION ALL
SELECT '3. Click "Confirm Seats"'
UNION ALL
SELECT '4. Open another tab and view same zone'
UNION ALL
SELECT '5. Locked seats should be YELLOW 🟡';
