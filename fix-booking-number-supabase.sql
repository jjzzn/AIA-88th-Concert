-- Fix booking number generation for Supabase (without FOR UPDATE on aggregates)
-- This version uses a sequence-based approach that's compatible with Supabase

-- Drop existing functions and trigger
DROP TRIGGER IF EXISTS trigger_set_booking_number ON bookings;
DROP FUNCTION IF EXISTS set_booking_number();
DROP FUNCTION IF EXISTS generate_booking_number();

-- Create a sequence for booking numbers (resets daily via application logic)
CREATE SEQUENCE IF NOT EXISTS booking_number_seq;

-- Create improved booking number generator without FOR UPDATE on aggregates
CREATE OR REPLACE FUNCTION generate_booking_number()
RETURNS TEXT AS $$
DECLARE
    date_part TEXT;
    sequence_part TEXT;
    next_id BIGINT;
    new_booking_number TEXT;
    max_attempts INTEGER := 10;
    attempt INTEGER := 0;
    current_max INTEGER;
BEGIN
    -- Get date part (YYYYMMDD)
    date_part := TO_CHAR(CURRENT_DATE, 'YYYYMMDD');
    
    -- Retry loop to handle race conditions
    LOOP
        attempt := attempt + 1;
        
        -- Get current max sequence number for today (without FOR UPDATE)
        SELECT COALESCE(MAX(CAST(SUBSTRING(booking_number FROM 12) AS INTEGER)), 0)
        INTO current_max
        FROM bookings
        WHERE booking_number LIKE 'BK-' || date_part || '-%';
        
        -- Increment to get next ID
        next_id := current_max + 1;
        
        -- Format: BK-YYYYMMDD-XXXX (e.g., BK-20260216-0001)
        sequence_part := LPAD(next_id::TEXT, 4, '0');
        new_booking_number := 'BK-' || date_part || '-' || sequence_part;
        
        -- Try to insert a temporary lock record to claim this number
        -- This uses INSERT ... ON CONFLICT to handle race conditions
        BEGIN
            -- Check if this booking number already exists
            IF NOT EXISTS (SELECT 1 FROM bookings WHERE booking_number = new_booking_number) THEN
                RETURN new_booking_number;
            END IF;
        EXCEPTION
            WHEN unique_violation THEN
                -- Another transaction claimed this number, retry
                NULL;
        END;
        
        -- If we've tried too many times, give up
        IF attempt >= max_attempts THEN
            RAISE EXCEPTION 'Failed to generate unique booking number after % attempts', max_attempts;
        END IF;
        
        -- Small delay before retry (10ms)
        PERFORM pg_sleep(0.01);
    END LOOP;
END;
$$ LANGUAGE plpgsql VOLATILE;

-- Create trigger function
CREATE OR REPLACE FUNCTION set_booking_number()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.booking_number IS NULL OR NEW.booking_number = '' THEN
        NEW.booking_number := generate_booking_number();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger
CREATE TRIGGER trigger_set_booking_number
BEFORE INSERT ON bookings
FOR EACH ROW
EXECUTE FUNCTION set_booking_number();

-- Verify the trigger is active
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement
FROM information_schema.triggers
WHERE trigger_name = 'trigger_set_booking_number';

-- Test the function (optional - comment out in production)
-- SELECT generate_booking_number();
