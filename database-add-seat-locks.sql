-- Add Seat Locking System
-- This adds temporary seat locks when users are filling in their details
-- Locks expire after 10 minutes to prevent seats from being locked forever

-- Add lock fields to seats table
ALTER TABLE seats 
ADD COLUMN IF NOT EXISTS locked_until TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS locked_by VARCHAR(255);

-- Create index for lock queries
CREATE INDEX IF NOT EXISTS idx_seats_locked_until ON seats(locked_until);
CREATE INDEX IF NOT EXISTS idx_seats_locked_by ON seats(locked_by);

-- Function to clean up expired locks
CREATE OR REPLACE FUNCTION cleanup_expired_seat_locks()
RETURNS INTEGER AS $$
DECLARE
  cleaned_count INTEGER;
BEGIN
  UPDATE seats
  SET 
    locked_until = NULL,
    locked_by = NULL
  WHERE 
    locked_until IS NOT NULL 
    AND locked_until < NOW()
    AND is_booked = FALSE;
  
  GET DIAGNOSTICS cleaned_count = ROW_COUNT;
  RETURN cleaned_count;
END;
$$ LANGUAGE plpgsql;

-- Function to lock seats for a session
CREATE OR REPLACE FUNCTION lock_seats(
  p_seat_ids TEXT[],
  p_session_id VARCHAR(255),
  p_lock_duration_minutes INTEGER DEFAULT 5
)
RETURNS TABLE(
  success BOOLEAN,
  locked_seats TEXT[],
  already_locked TEXT[],
  already_booked TEXT[]
) AS $$
DECLARE
  v_seat_id TEXT;
  v_locked_seats TEXT[] := '{}';
  v_already_locked TEXT[] := '{}';
  v_already_booked TEXT[] := '{}';
  v_seat RECORD;
BEGIN
  -- First, clean up expired locks
  PERFORM cleanup_expired_seat_locks();
  
  -- Check each seat
  FOR v_seat_id IN SELECT unnest(p_seat_ids)
  LOOP
    SELECT * INTO v_seat
    FROM seats
    WHERE id = v_seat_id;
    
    IF NOT FOUND THEN
      CONTINUE;
    END IF;
    
    -- Check if already booked
    IF v_seat.is_booked THEN
      v_already_booked := array_append(v_already_booked, v_seat_id);
      CONTINUE;
    END IF;
    
    -- Check if locked by someone else
    IF v_seat.locked_until IS NOT NULL 
       AND v_seat.locked_until > NOW() 
       AND v_seat.locked_by != p_session_id THEN
      v_already_locked := array_append(v_already_locked, v_seat_id);
      CONTINUE;
    END IF;
    
    -- Lock the seat
    UPDATE seats
    SET 
      locked_until = NOW() + (p_lock_duration_minutes || ' minutes')::INTERVAL,
      locked_by = p_session_id
    WHERE id = v_seat_id;
    
    v_locked_seats := array_append(v_locked_seats, v_seat_id);
  END LOOP;
  
  -- Return results
  RETURN QUERY SELECT 
    (array_length(v_already_locked, 1) IS NULL AND array_length(v_already_booked, 1) IS NULL)::BOOLEAN,
    v_locked_seats,
    v_already_locked,
    v_already_booked;
END;
$$ LANGUAGE plpgsql;

-- Function to unlock seats for a session
CREATE OR REPLACE FUNCTION unlock_seats(
  p_seat_ids TEXT[],
  p_session_id VARCHAR(255)
)
RETURNS INTEGER AS $$
DECLARE
  unlocked_count INTEGER;
BEGIN
  UPDATE seats
  SET 
    locked_until = NULL,
    locked_by = NULL
  WHERE 
    id = ANY(p_seat_ids)
    AND locked_by = p_session_id
    AND is_booked = FALSE;
  
  GET DIAGNOSTICS unlocked_count = ROW_COUNT;
  RETURN unlocked_count;
END;
$$ LANGUAGE plpgsql;

-- Function to extend lock duration
CREATE OR REPLACE FUNCTION extend_seat_lock(
  p_seat_ids TEXT[],
  p_session_id VARCHAR(255),
  p_additional_minutes INTEGER DEFAULT 5
)
RETURNS INTEGER AS $$
DECLARE
  extended_count INTEGER;
BEGIN
  UPDATE seats
  SET locked_until = NOW() + (p_additional_minutes || ' minutes')::INTERVAL
  WHERE 
    id = ANY(p_seat_ids)
    AND locked_by = p_session_id
    AND locked_until > NOW()
    AND is_booked = FALSE;
  
  GET DIAGNOSTICS extended_count = ROW_COUNT;
  RETURN extended_count;
END;
$$ LANGUAGE plpgsql;

-- Function to check if seats are available (not booked and not locked)
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
    CASE
      WHEN s.is_booked THEN 'booked'
      WHEN s.locked_until IS NOT NULL AND s.locked_until > NOW() AND s.locked_by != COALESCE(p_session_id, '') THEN 'locked'
      ELSE 'available'
    END as status,
    s.locked_by,
    s.locked_until
  FROM seats s
  WHERE s.id = ANY(p_seat_ids);
END;
$$ LANGUAGE plpgsql;

-- Create a scheduled job to clean up expired locks (if pg_cron is available)
-- If not available, this will be handled by the application
-- SELECT cron.schedule('cleanup-expired-locks', '*/5 * * * *', 'SELECT cleanup_expired_seat_locks();');

-- Verify the changes
SELECT '========================================' as separator;
SELECT 'SEAT LOCKING SYSTEM INSTALLED' as status;
SELECT '========================================' as separator;

-- Show sample seat with new fields
SELECT 
  'Sample Seat Structure' as info,
  column_name,
  data_type,
  is_nullable
FROM information_schema.columns
WHERE table_name = 'seats'
  AND column_name IN ('id', 'is_booked', 'locked_until', 'locked_by')
ORDER BY ordinal_position;

SELECT '========================================' as separator;
SELECT 'AVAILABLE FUNCTIONS' as section;
SELECT '========================================' as separator;

SELECT 
  routine_name as function_name,
  routine_type as type
FROM information_schema.routines
WHERE routine_schema = 'public'
  AND routine_name LIKE '%seat%'
ORDER BY routine_name;

SELECT '========================================' as separator;
SELECT '✅ Seat locking system ready!' as status;
SELECT '========================================' as separator;

-- Usage Examples:
SELECT '========================================' as separator;
SELECT 'USAGE EXAMPLES' as section;
SELECT '========================================' as separator;

SELECT 
  'Lock seats' as action,
  'SELECT * FROM lock_seats(ARRAY[''seat-id-1'', ''seat-id-2''], ''session-123'', 10);' as example
UNION ALL
SELECT 
  'Check availability',
  'SELECT * FROM check_seats_available(ARRAY[''seat-id-1''], ''session-123'');'
UNION ALL
SELECT 
  'Extend lock',
  'SELECT extend_seat_lock(ARRAY[''seat-id-1''], ''session-123'', 5);'
UNION ALL
SELECT 
  'Unlock seats',
  'SELECT unlock_seats(ARRAY[''seat-id-1''], ''session-123'');'
UNION ALL
SELECT 
  'Cleanup expired',
  'SELECT cleanup_expired_seat_locks();';
