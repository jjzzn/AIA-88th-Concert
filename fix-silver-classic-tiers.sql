-- ============================================================================
-- Fix SILVER and CLASSIC Tiers with Correct IDs and Access Codes
-- ============================================================================
-- SILVER → ZONE D1, D2 with codes starting with SV (tier_id: 66666666...)
-- CLASSIC → ZONE C1, C2 with codes starting with CL (tier_id: 77777777...)
-- ============================================================================

BEGIN;

-- Step 1: Create or update SILVER tier (66666666-6666-6666-6666-666666666666)
INSERT INTO tiers (id, name, level, price, color, description) VALUES
    ('66666666-6666-6666-6666-666666666666', 'SILVER', 3, 1500, '#C0C0C0', 'Silver Premium - Comfortable seating with good view')
ON CONFLICT (id) DO UPDATE SET
    name = 'SILVER',
    level = 3,
    price = 1500,
    color = '#C0C0C0',
    description = 'Silver Premium - Comfortable seating with good view';

-- Step 2: Create or update CLASSIC tier (77777777-7777-7777-7777-777777777777)
INSERT INTO tiers (id, name, level, price, color, description) VALUES
    ('77777777-7777-7777-7777-777777777777', 'CLASSIC', 4, 1000, '#8B4513', 'Classic Section - Traditional concert experience')
ON CONFLICT (id) DO UPDATE SET
    name = 'CLASSIC',
    level = 4,
    price = 1000,
    color = '#8B4513',
    description = 'Classic Section - Traditional concert experience';

-- Step 3: Update ZONE D1 and D2 to SILVER tier
UPDATE zones 
SET tier_id = '66666666-6666-6666-6666-666666666666'
WHERE name IN ('ZONE D1', 'ZONE D2');

-- Step 4: Update ZONE C1 and C2 to CLASSIC tier
UPDATE zones 
SET tier_id = '77777777-7777-7777-7777-777777777777'
WHERE name IN ('ZONE C1', 'ZONE C2');

-- Step 5: Update seats in D1 and D2 zones to SILVER tier
UPDATE seats 
SET tier_id = '66666666-6666-6666-6666-666666666666'
WHERE zone_id IN (
    SELECT id FROM zones WHERE name IN ('ZONE D1', 'ZONE D2')
);

-- Step 6: Update seats in C1 and C2 zones to CLASSIC tier
UPDATE seats 
SET tier_id = '77777777-7777-7777-7777-777777777777'
WHERE zone_id IN (
    SELECT id FROM zones WHERE name IN ('ZONE C1', 'ZONE C2')
);

-- Step 7: Update access codes for SILVER (codes starting with SV)
UPDATE access_codes 
SET tier_id = '66666666-6666-6666-6666-666666666666'
WHERE code LIKE 'SV%';

-- Step 8: Update access codes for CLASSIC (codes starting with CL)
UPDATE access_codes 
SET tier_id = '77777777-7777-7777-7777-777777777777'
WHERE code LIKE 'CL%';

COMMIT;

-- Verify the changes
SELECT '=== TIERS ===' as section;
SELECT id, name, level, price FROM tiers ORDER BY level;

SELECT '=== ZONES ===' as section;
SELECT z.name as zone_name, t.name as tier_name, z.capacity
FROM zones z
JOIN tiers t ON z.tier_id = t.id
ORDER BY t.level, z.name;

SELECT '=== ACCESS CODES ===' as section;
SELECT LEFT(code, 2) as code_prefix, t.name as tier_name, COUNT(*) as code_count
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
GROUP BY LEFT(code, 2), t.name
ORDER BY t.level;

SELECT '=== SEAT COUNTS ===' as section;
SELECT z.name as zone_name, t.name as tier_name, COUNT(s.id) as seat_count
FROM zones z
JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON s.zone_id = z.id
GROUP BY z.name, t.name
ORDER BY t.level, z.name;
