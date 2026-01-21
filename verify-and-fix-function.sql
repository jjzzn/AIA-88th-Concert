-- Verify and fix check_seats_available function
-- Run this to ensure the function is correct

-- Step 1: Check current function definition
SELECT '========================================' as info;
SELECT 'STEP 1: Checking current function' as info;
SELECT '========================================' as info;

SELECT 
  proname as function_name,
  pg_get_functiondef(oid) as definition
FROM pg_proc
WHERE proname = 'check_seats_available';

-- Step 2: Drop and recreate with correct logic
SELECT '========================================' as info;
SELECT 'STEP 2: Recreating function with fix' as info;
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

-- Step 3: Test with SEAT-JFS0L (A02)
SELECT '========================================' as info;
SELECT 'STEP 3: Testing with SEAT-JFS0L (A02)' as info;
SELECT '========================================' as info;

SELECT * FROM check_seats_available(
  ARRAY['SEAT-JFS0L'],
  'different-session-test'
);

-- Should show:
-- seat_id: SEAT-JFS0L
-- status: 'locked' (if still locked)
-- locked_by: session-xxx

-- Step 4: Show all currently locked seats
SELECT '========================================' as info;
SELECT 'STEP 4: All locked seats in database' as info;
SELECT '========================================' as info;

SELECT 
  id,
  row || number::text as seat_label,
  locked_by,
  locked_until,
  CASE 
    WHEN locked_until > NOW() THEN '🔒 ACTIVE'
    ELSE '⏰ EXPIRED'
  END as status,
  ROUND(EXTRACT(EPOCH FROM (locked_until - NOW()))) as seconds_remaining
FROM seats
WHERE locked_until IS NOT NULL
ORDER BY locked_until DESC;

SELECT '========================================' as info;
SELECT '✅ Function updated and tested!' as info;
SELECT '========================================' as info;

SELECT 'Next: Refresh browser and check Console' as next_step;
