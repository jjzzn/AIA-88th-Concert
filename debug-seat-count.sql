-- Debug: Check seat counts for Zone A1

-- Total seats in Zone A1
SELECT 
    'Total seats in ZONE A1' as check_type,
    COUNT(*) as count
FROM seats
WHERE zone_id = 'ZONE-A1';

-- Seats grouped by row
SELECT 
    row,
    COUNT(*) as seat_count
FROM seats
WHERE zone_id = 'ZONE-A1'
GROUP BY row
ORDER BY row;

-- Check zone capacity
SELECT 
    id,
    name,
    code,
    capacity
FROM zones
WHERE id = 'ZONE-A1';

-- Sample seats from Zone A1
SELECT 
    id,
    code,
    zone_id,
    tier_id,
    row,
    number,
    is_booked
FROM seats
WHERE zone_id = 'ZONE-A1'
ORDER BY row, number
LIMIT 30;
