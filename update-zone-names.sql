-- ============================================================================
-- Update Zone Names to Match Arena Map
-- ============================================================================
-- Run this script in Supabase SQL Editor to update zone names
--
-- Target zone names:
--   PLATINUM → ZONE A1, ZONE A2
--   GOLD → ZONE B1, ZONE B2, ZONE B3
--   SILVER → ZONE D1, ZONE D2
--   CLASSIC → ZONE C1, ZONE C2
-- ============================================================================

BEGIN;

-- Update zone names to match the arena map exactly
-- This handles both old naming (SV-A, SV-B) and ensures correct names

-- PLATINUM zones: PT-A → A1, PT-B → A2
UPDATE zones SET name = 'ZONE A1' 
WHERE tier_id = '11111111-1111-1111-1111-111111111111' 
  AND (name = 'ZONE PT-A' OR name LIKE '%A1%' OR name LIKE '%PT-A%');

UPDATE zones SET name = 'ZONE A2' 
WHERE tier_id = '11111111-1111-1111-1111-111111111111' 
  AND (name = 'ZONE PT-B' OR name LIKE '%A2%' OR name LIKE '%PT-B%');

-- GOLD zones: GD-A → B1, GD-B → B2, GD-C → B3
UPDATE zones SET name = 'ZONE B1' 
WHERE tier_id = '22222222-2222-2222-2222-222222222222' 
  AND (name = 'ZONE GD-A' OR name LIKE '%B1%' OR name LIKE '%GD-A%');

UPDATE zones SET name = 'ZONE B2' 
WHERE tier_id = '22222222-2222-2222-2222-222222222222' 
  AND (name = 'ZONE GD-B' OR name LIKE '%B2%' OR name LIKE '%GD-B%');

UPDATE zones SET name = 'ZONE B3' 
WHERE tier_id = '22222222-2222-2222-2222-222222222222' 
  AND (name = 'ZONE GD-C' OR name LIKE '%B3%' OR name LIKE '%GD-C%');

-- SILVER zones: SV-A → D1, SV-B → D2
UPDATE zones SET name = 'ZONE D1' 
WHERE tier_id = '33333333-3333-3333-3333-333333333333' 
  AND (name = 'ZONE SV-A' OR name LIKE '%D1%' OR name LIKE '%SV-A%');

UPDATE zones SET name = 'ZONE D2' 
WHERE tier_id = '33333333-3333-3333-3333-333333333333' 
  AND (name = 'ZONE SV-B' OR name LIKE '%D2%' OR name LIKE '%SV-B%');

-- CLASSIC zones: CL-A → C1, CL-B → C2
UPDATE zones SET name = 'ZONE C1' 
WHERE tier_id = '44444444-4444-4444-4444-444444444444' 
  AND (name = 'ZONE CL-A' OR name LIKE '%C1%' OR name LIKE '%CL-A%');

UPDATE zones SET name = 'ZONE C2' 
WHERE tier_id = '44444444-4444-4444-4444-444444444444' 
  AND (name = 'ZONE CL-B' OR name LIKE '%C2%' OR name LIKE '%CL-B%');

COMMIT;

-- Verify the changes
SELECT 
    z.name as zone_name, 
    t.name as tier_name,
    z.capacity,
    COUNT(s.id) as seat_count
FROM zones z
JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON s.zone_id = z.id
GROUP BY z.name, t.name, z.capacity
ORDER BY t.price DESC, z.name;
