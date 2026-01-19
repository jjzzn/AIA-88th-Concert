-- ============================================================================
-- Fix Zone Assignments for AIA Concert Booking System
-- ============================================================================
-- Run this script in Supabase SQL Editor to update zone assignments
--
-- Current (WRONG):
--   PLATINUM → A1, A2 ✓
--   GOLD → B1, B2, B3 ✓
--   SILVER → C1, C2 ✗
--   CLASSIC → D1, D2 ✗
--
-- Target (CORRECT):
--   PLATINUM → A1, A2
--   GOLD → B1, B2, B3
--   SILVER → D1, D2
--   CLASSIC → C1, C2
-- ============================================================================

BEGIN;

-- Step 1: Update ZONE C1 and C2 to CLASSIC tier (44444444-4444-4444-4444-444444444444)
UPDATE zones 
SET tier_id = '44444444-4444-4444-4444-444444444444' 
WHERE name IN ('ZONE C1', 'ZONE C2');

-- Step 2: Update ZONE D1 and D2 to SILVER tier (33333333-3333-3333-3333-333333333333)
UPDATE zones 
SET tier_id = '33333333-3333-3333-3333-333333333333' 
WHERE name IN ('ZONE D1', 'ZONE D2');

-- Step 3: Update seats in C1 and C2 zones to CLASSIC tier
UPDATE seats 
SET tier_id = '44444444-4444-4444-4444-444444444444' 
WHERE zone_id IN (
    SELECT id FROM zones WHERE name IN ('ZONE C1', 'ZONE C2')
);

-- Step 4: Update seats in D1 and D2 zones to SILVER tier
UPDATE seats 
SET tier_id = '33333333-3333-3333-3333-333333333333' 
WHERE zone_id IN (
    SELECT id FROM zones WHERE name IN ('ZONE D1', 'ZONE D2')
);

COMMIT;

-- Verify the changes
SELECT 
    z.name as zone_name, 
    t.name as tier_name,
    COUNT(s.id) as seat_count
FROM zones z
JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON s.zone_id = z.id
GROUP BY z.name, t.name
ORDER BY z.name;
