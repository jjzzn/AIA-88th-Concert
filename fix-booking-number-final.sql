-- Final fix for booking number generation
-- Step 1: Check for duplicates
SELECT booking_number, COUNT(*) as count
FROM bookings
WHERE booking_number IS NOT NULL
GROUP BY booking_number
HAVING COUNT(*) > 1;

-- Step 2: Clean up any NULL or duplicate booking numbers
-- First, let's see what we have
SELECT id, booking_number, created_at, phone
FROM bookings
WHERE booking_number IS NULL OR booking_number = ''
ORDER BY created_at DESC
LIMIT 20;

-- Step 3: Drop existing trigger and functions
DROP TRIGGER IF EXISTS trigger_set_booking_number ON bookings;
DROP FUNCTION IF EXISTS set_booking_number();
DROP FUNCTION IF EXISTS generate_booking_number();
DROP SEQUENCE IF EXISTS booking_number_seq;

-- Step 4: Create a simple, reliable booking number generator using UUID
CREATE OR REPLACE FUNCTION generate_booking_number()
RETURNS TEXT AS $$
DECLARE
    date_part TEXT;
    random_part TEXT;
    new_booking_number TEXT;
BEGIN
    -- Get date part (YYYYMMDD)
    date_part := TO_CHAR(CURRENT_DATE, 'YYYYMMDD');
    
    -- Generate random 6-digit number
    random_part := LPAD(FLOOR(RANDOM() * 1000000)::TEXT, 6, '0');
    
    -- Format: BK-YYYYMMDD-XXXXXX (e.g., BK-20260216-123456)
    new_booking_number := 'BK-' || date_part || '-' || random_part;
    
    -- If by rare chance it exists, try again with different random
    WHILE EXISTS (SELECT 1 FROM bookings WHERE booking_number = new_booking_number) LOOP
        random_part := LPAD(FLOOR(RANDOM() * 1000000)::TEXT, 6, '0');
        new_booking_number := 'BK-' || date_part || '-' || random_part;
    END LOOP;
    
    RETURN new_booking_number;
END;
$$ LANGUAGE plpgsql VOLATILE;

-- Step 5: Create trigger function
CREATE OR REPLACE FUNCTION set_booking_number()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.booking_number IS NULL OR NEW.booking_number = '' THEN
        NEW.booking_number := generate_booking_number();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 6: Create trigger
CREATE TRIGGER trigger_set_booking_number
BEFORE INSERT ON bookings
FOR EACH ROW
EXECUTE FUNCTION set_booking_number();

-- Step 7: Fix any existing NULL booking numbers
UPDATE bookings
SET booking_number = generate_booking_number()
WHERE booking_number IS NULL OR booking_number = '';

-- Step 8: Verify the trigger is active
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement
FROM information_schema.triggers
WHERE trigger_name = 'trigger_set_booking_number';

-- Step 9: Test the function
SELECT generate_booking_number() as test_booking_number;
