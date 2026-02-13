-- Check for duplicate seat IDs

-- Find duplicate seat IDs
SELECT 
    id,
    COUNT(*) as duplicate_count
FROM seats
GROUP BY id
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Show details of duplicate seats
SELECT 
    s1.id,
    s1.code,
    s1.zone_id,
    s1.row,
    s1.number
FROM seats s1
WHERE s1.id IN (
    SELECT id
    FROM seats
    GROUP BY id
    HAVING COUNT(*) > 1
)
ORDER BY s1.id, s1.zone_id, s1.row, s1.number;

-- Count total duplicates
SELECT 
    'Total duplicate seat IDs' as check_type,
    COUNT(DISTINCT id) as duplicate_ids,
    SUM(cnt - 1) as extra_rows
FROM (
    SELECT id, COUNT(*) as cnt
    FROM seats
    GROUP BY id
    HAVING COUNT(*) > 1
) duplicates;
