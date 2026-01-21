-- Fix booking_number generation issue

-- Step 1: Check if trigger exists
SELECT '========================================' as info;
SELECT 'STEP 1: Checking trigger' as info;
SELECT '========================================' as info;

SELECT 
  trigger_name,
  event_manipulation,
  action_statement
FROM information_schema.triggers
WHERE event_object_table = 'bookings';

-- Step 2: Recreate the trigger and function
SELECT '========================================' as info;
SELECT 'STEP 2: Recreating booking_number trigger' as info;
SELECT '========================================' as info;

-- Drop existing
DROP TRIGGER IF EXISTS trigger_set_booking_number ON bookings;
DROP FUNCTION IF EXISTS set_booking_number();
DROP FUNCTION IF EXISTS generate_booking_number();

-- Create booking number generator
CREATE OR REPLACE FUNCTION generate_booking_number()
RETURNS TEXT AS $$
DECLARE
    date_part TEXT;
    next_id INTEGER;
    sequence_part TEXT;
BEGIN
    date_part := TO_CHAR(CURRENT_DATE, 'YYYYMMDD');
    
    SELECT COALESCE(MAX(CAST(SUBSTRING(booking_number FROM 12) AS INTEGER)), 0) + 1
    INTO next_id
    FROM bookings
    WHERE booking_number LIKE 'BK-' || date_part || '-%';
    
    sequence_part := LPAD(next_id::TEXT, 4, '0');
    
    RETURN 'BK-' || date_part || '-' || sequence_part;
END;
$$ LANGUAGE plpgsql;

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

-- Step 3: Test the trigger
SELECT '========================================' as info;
SELECT 'STEP 3: Testing booking creation' as info;
SELECT '========================================' as info;

-- Try to insert a test booking
INSERT INTO bookings (email, phone, status)
VALUES ('test@example.com', '0999999999', 'confirmed')
RETURNING id, booking_number, email;

-- Clean up test booking
DELETE FROM bookings WHERE email = 'test@example.com';

SELECT '========================================' as info;
SELECT '✅ Trigger fixed! Try booking again.' as info;
SELECT '========================================' as info;
