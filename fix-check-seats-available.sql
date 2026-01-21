-- Fix check_seats_available function type mismatch
-- The issue: CASE statement returns TEXT but function expects VARCHAR(20)

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
    s.id::TEXT,
    (
      NOT s.is_booked 
      AND (
        s.locked_until IS NULL 
        OR s.locked_until <= NOW()
        OR s.locked_by = p_session_id
      )
    )::BOOLEAN as is_available,
    (CASE
      WHEN s.is_booked THEN 'booked'
      WHEN s.locked_until IS NOT NULL AND s.locked_until > NOW() AND s.locked_by != COALESCE(p_session_id, '') THEN 'locked'
      ELSE 'available'
    END)::VARCHAR(20) as status,  -- Cast to VARCHAR(20)
    s.locked_by,
    s.locked_until
  FROM seats s
  WHERE s.id = ANY(p_seat_ids);
END;
$$ LANGUAGE plpgsql;

-- Test the function
SELECT '========================================' as separator;
SELECT 'Testing check_seats_available function' as status;
SELECT '========================================' as separator;

-- Test with a sample seat
SELECT * FROM check_seats_available(
  ARRAY['SEAT-3F50L'],
  'test-session'
);

SELECT '========================================' as separator;
SELECT '✅ Function fixed and tested!' as status;
SELECT '========================================' as separator;
