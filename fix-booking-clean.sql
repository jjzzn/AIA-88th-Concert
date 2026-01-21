-- Clean up and fix booking_number issue

-- Step 1: Delete test booking that's blocking
SELECT '========================================' as info;
SELECT 'STEP 1: Cleaning up test data' as info;
SELECT '========================================' as info;

DELETE FROM bookings WHERE booking_number = 'BK-20260121-0001';

-- Step 2: Verify trigger exists
SELECT '========================================' as info;
SELECT 'STEP 2: Verifying trigger' as info;
SELECT '========================================' as info;

SELECT 
  trigger_name,
  event_manipulation
FROM information_schema.triggers
WHERE event_object_table = 'bookings'
  AND trigger_name = 'trigger_set_booking_number';

-- If no trigger found, create it
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.triggers 
    WHERE event_object_table = 'bookings' 
    AND trigger_name = 'trigger_set_booking_number'
  ) THEN
    -- Create functions
    CREATE OR REPLACE FUNCTION generate_booking_number()
    RETURNS TEXT AS $func$
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
    $func$ LANGUAGE plpgsql;

    CREATE OR REPLACE FUNCTION set_booking_number()
    RETURNS TRIGGER AS $func$
    BEGIN
        IF NEW.booking_number IS NULL OR NEW.booking_number = '' THEN
            NEW.booking_number := generate_booking_number();
        END IF;
        RETURN NEW;
    END;
    $func$ LANGUAGE plpgsql;

    CREATE TRIGGER trigger_set_booking_number
    BEFORE INSERT ON bookings
    FOR EACH ROW
    EXECUTE FUNCTION set_booking_number();
    
    RAISE NOTICE 'Trigger created successfully';
  ELSE
    RAISE NOTICE 'Trigger already exists';
  END IF;
END $$;

SELECT '========================================' as info;
SELECT '✅ Ready! Try booking now.' as info;
SELECT '========================================' as info;
