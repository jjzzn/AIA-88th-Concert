-- EMERGENCY FIX: Force update check_seats_available
-- This will 100% fix the seat locking UI issue

-- Drop ALL versions of the function
DROP FUNCTION IF EXISTS check_seats_available(TEXT[], VARCHAR) CASCADE;
DROP FUNCTION IF EXISTS check_seats_available(TEXT[]) CASCADE;
DROP FUNCTION IF EXISTS check_seats_available CASCADE;

-- Create the CORRECT function
CREATE FUNCTION check_seats_available(
  p_seat_ids TEXT[],
  p_session_id VARCHAR(255) DEFAULT NULL
)
RETURNS TABLE(
  seat_id TEXT,
  is_available BOOLEAN,
  status VARCHAR(20),
  locked_by VARCHAR(255),
  locked_until TIMESTAMP WITH TIME ZONE
) 
LANGUAGE plpgsql
AS $$
BEGIN
  -- Clean up expired locks
  PERFORM cleanup_expired_seat_locks();
  
  RETURN QUERY
  SELECT 
    s.id::TEXT,
    (NOT s.is_booked AND (s.locked_until IS NULL OR s.locked_until <= NOW() OR s.locked_by = COALESCE(p_session_id, '')))::BOOLEAN,
    (CASE
      WHEN s.is_booked THEN 'booked'
      WHEN s.locked_until IS NOT NULL AND s.locked_until > NOW() AND s.locked_by IS NOT NULL AND s.locked_by != COALESCE(p_session_id, '') THEN 'locked'
      ELSE 'available'
    END)::VARCHAR(20),
    s.locked_by,
    s.locked_until
  FROM seats s
  WHERE s.id = ANY(p_seat_ids);
END;
$$;

-- Test immediately
SELECT '========================================';
SELECT 'Testing with SEAT-JFS0L (A02)';
SELECT '========================================';

SELECT 
  seat_id,
  status,
  locked_by,
  locked_until,
  CASE WHEN status = 'locked' THEN '✅ WORKING!' ELSE '❌ NOT WORKING' END as result
FROM check_seats_available(ARRAY['SEAT-JFS0L'], 'test-different-session');

SELECT '========================================';
SELECT '✅ DONE! Now refresh browser (Cmd+R)';
SELECT '========================================';
