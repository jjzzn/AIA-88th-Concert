-- Debug: Check what's in the database right now

-- 1. Check all tiers
SELECT 'TIERS:' as section;
SELECT id, name, level, price FROM tiers ORDER BY price DESC;

-- 2. Check all zones
SELECT 'ZONES:' as section;
SELECT z.id, z.name, z.tier_id, t.name as tier_name, z.capacity 
FROM zones z
LEFT JOIN tiers t ON z.tier_id = t.id
ORDER BY z.name;

-- 3. Check seat counts per zone
SELECT 'SEAT COUNTS:' as section;
SELECT z.name as zone_name, t.name as tier_name, COUNT(s.id) as seat_count
FROM zones z
LEFT JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON s.zone_id = z.id
GROUP BY z.name, t.name
ORDER BY z.name;

-- 4. Check if SILVER tier has zones
SELECT 'SILVER ZONES:' as section;
SELECT z.* 
FROM zones z
WHERE z.tier_id = '33333333-3333-3333-3333-333333333333';

-- 5. Check if CLASSIC tier has zones
SELECT 'CLASSIC ZONES:' as section;
SELECT z.* 
FROM zones z
WHERE z.tier_id = '44444444-4444-4444-4444-444444444444';
