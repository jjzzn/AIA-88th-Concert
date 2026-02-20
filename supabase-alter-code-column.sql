-- ALTER TABLE to change code column from VARCHAR(8) to VARCHAR(10)
-- Run this in Supabase SQL Editor FIRST before generating new codes

-- Step 1: Alter the column length
ALTER TABLE access_codes 
ALTER COLUMN code TYPE VARCHAR(10);

-- Step 2: Verify the change
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'access_codes' AND column_name = 'code';

-- After running this, you can use the generate_access_code function to create 10-digit codes
