-- ============================================================================
-- Complete Zone Fix for AIA Concert Booking System
-- ============================================================================
-- Run this ENTIRE script in Supabase SQL Editor (copy and paste all)
-- This will:
--   1. Fix tier assignments (SILVER → D zones, CLASSIC → C zones)
--   2. Update zone names to match arena map
-- ============================================================================

BEGIN;

-- ============================================================================
-- STEP 1: Fix Tier Assignments
-- ============================================================================

-- Update ZONE C1 and C2 to CLASSIC tier
UPDATE zones 
SET tier_id = '44444444-4444-4444-4444-444444444444' 
WHERE name IN ('ZONE C1', 'ZONE C2', 'ZONE CL-A', 'ZONE CL-B');

-- Update ZONE D1 and D2 to SILVER tier
UPDATE zones 
SET tier_id = '33333333-3333-3333-3333-333333333333' 
WHERE name IN ('ZONE D1', 'ZONE D2', 'ZONE SV-A', 'ZONE SV-B');

-- Update seats in C zones to CLASSIC tier
UPDATE seats 
SET tier_id = '44444444-4444-4444-4444-444444444444' 
WHERE zone_id IN (
    SELECT id FROM zones WHERE name IN ('ZONE C1', 'ZONE C2', 'ZONE CL-A', 'ZONE CL-B')
);

-- Update seats in D zones to SILVER tier
UPDATE seats 
SET tier_id = '33333333-3333-3333-3333-333333333333' 
WHERE zone_id IN (
    SELECT id FROM zones WHERE name IN ('ZONE D1', 'ZONE D2', 'ZONE SV-A', 'ZONE SV-B')
);

-- ============================================================================
-- STEP 2: Update Zone Names
-- ============================================================================

-- PLATINUM zones: PT-A → A1, PT-B → A2
UPDATE zones SET name = 'ZONE A1' 
WHERE tier_id = '11111111-1111-1111-1111-111111111111' 
  AND (name = 'ZONE PT-A' OR name LIKE '%PT-A%' OR name LIKE '%A1%');

UPDATE zones SET name = 'ZONE A2' 
WHERE tier_id = '11111111-1111-1111-1111-111111111111' 
  AND (name = 'ZONE PT-B' OR name LIKE '%PT-B%' OR name LIKE '%A2%');

-- GOLD zones: GD-A → B1, GD-B → B2, GD-C → B3
UPDATE zones SET name = 'ZONE B1' 
WHERE tier_id = '22222222-2222-2222-2222-222222222222' 
  AND (name = 'ZONE GD-A' OR name LIKE '%GD-A%' OR name LIKE '%B1%');

UPDATE zones SET name = 'ZONE B2' 
WHERE tier_id = '22222222-2222-2222-2222-222222222222' 
  AND (name = 'ZONE GD-B' OR name LIKE '%GD-B%' OR name LIKE '%B2%');

UPDATE zones SET name = 'ZONE B3' 
WHERE tier_id = '22222222-2222-2222-2222-222222222222' 
  AND (name = 'ZONE GD-C' OR name LIKE '%GD-C%' OR name LIKE '%B3%');

-- SILVER zones: SV-A → D1, SV-B → D2
UPDATE zones SET name = 'ZONE D1' 
WHERE tier_id = '33333333-3333-3333-3333-333333333333' 
  AND (name = 'ZONE SV-A' OR name LIKE '%SV-A%' OR name LIKE '%D1%');

UPDATE zones SET name = 'ZONE D2' 
WHERE tier_id = '33333333-3333-3333-3333-333333333333' 
  AND (name = 'ZONE SV-B' OR name LIKE '%SV-B%' OR name LIKE '%D2%');

-- CLASSIC zones: CL-A → C1, CL-B → C2
UPDATE zones SET name = 'ZONE C1' 
WHERE tier_id = '44444444-4444-4444-4444-444444444444' 
  AND (name = 'ZONE CL-A' OR name LIKE '%CL-A%' OR name LIKE '%C1%');

UPDATE zones SET name = 'ZONE C2' 
WHERE tier_id = '44444444-4444-4444-4444-444444444444' 
  AND (name = 'ZONE CL-B' OR name LIKE '%CL-B%' OR name LIKE '%C2%');

COMMIT;

-- ============================================================================
-- Verify the changes
-- ============================================================================
SELECT 
    z.name as zone_name, 
    t.name as tier_name,
    z.capacity,
    COUNT(s.id) as seat_count
FROM zones z
JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON s.zone_id = z.id
GROUP BY z.name, t.name, z.capacity
ORDER BY 
    CASE t.name 
        WHEN 'PLATINUM' THEN 1
        WHEN 'GOLD' THEN 2
        WHEN 'SILVER' THEN 3
        WHEN 'CLASSIC' THEN 4
    END,
    z.name;
