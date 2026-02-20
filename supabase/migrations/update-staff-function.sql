-- Rename generate_admin_id to generate_staff_id and update to work with staff table
-- This fixes the error when adding new staff members

-- Step 1: Remove default value first to avoid dependency error
ALTER TABLE staff ALTER COLUMN id DROP DEFAULT;

-- Step 2: Drop old function
DROP FUNCTION IF EXISTS generate_admin_id();

-- Step 3: Create new function with staff naming
CREATE OR REPLACE FUNCTION generate_staff_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
    id_exists BOOLEAN;
    counter INTEGER := 1;
    max_attempts INTEGER := 100;
BEGIN
    LOOP
        -- Generate ID in format: STAFF-XXXXX (5 digits)
        new_id := 'STAFF-' || LPAD(counter::TEXT, 5, '0');
        
        -- Check if ID exists in staff table
        SELECT EXISTS(SELECT 1 FROM staff WHERE id = new_id) INTO id_exists;
        
        IF NOT id_exists THEN
            RETURN new_id;
        END IF;
        
        counter := counter + 1;
        
        IF counter > max_attempts THEN
            RAISE EXCEPTION 'Could not generate unique staff ID after % attempts', max_attempts;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Step 4: Update the default value for staff.id column to use the new function
ALTER TABLE staff ALTER COLUMN id SET DEFAULT generate_staff_id();

-- Verify
SELECT 'Function updated successfully to reference staff table' as status;
