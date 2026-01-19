-- ============================================================================
-- Rename PRESTIGE to SILVER and VIP to CLASSIC
-- ============================================================================
-- This will rename the tier names in the database to match the expected names
-- ============================================================================

BEGIN;

-- Update PRESTIGE tier to SILVER
UPDATE tiers 
SET name = 'SILVER'
WHERE name = 'PRESTIGE';

-- Update VIP tier to CLASSIC
UPDATE tiers 
SET name = 'CLASSIC'
WHERE name = 'VIP';

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
ORDER BY 
    CASE t.name 
        WHEN 'PLATINUM' THEN 1
        WHEN 'GOLD' THEN 2
        WHEN 'SILVER' THEN 3
        WHEN 'CLASSIC' THEN 4
    END,
    z.name;
