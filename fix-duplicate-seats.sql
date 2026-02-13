-- Fix duplicate seat IDs by keeping only one and deleting the rest

-- Step 1: Create a temporary table with unique seats (keep the first occurrence)
CREATE TEMP TABLE unique_seats AS
SELECT DISTINCT ON (id) *
FROM seats
ORDER BY id, created_at;

-- Step 2: Delete all seats
DELETE FROM seats;

-- Step 3: Insert back only unique seats
INSERT INTO seats
SELECT * FROM unique_seats;

-- Step 4: Verify no more duplicates
SELECT 
    'After cleanup' as status,
    COUNT(*) as total_seats,
    COUNT(DISTINCT id) as unique_ids
FROM seats;

-- Step 5: Check if any duplicates remain
SELECT 
    id,
    COUNT(*) as count
FROM seats
GROUP BY id
HAVING COUNT(*) > 1;
