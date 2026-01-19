-- ============================================================================
-- Check and Fix Zones - AIA Concert Booking System
-- ============================================================================
-- Step 1: Run this to CHECK current zones
-- Step 2: Run the FIX section if needed
-- ============================================================================

-- ============================================================================
-- STEP 1: CHECK CURRENT ZONES (Run this first to see what's in database)
-- ============================================================================
SELECT 
    z.id,
    z.name as zone_name, 
    z.tier_id,
    t.name as tier_name,
    z.capacity,
    COUNT(s.id) as seat_count
FROM zones z
LEFT JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON s.zone_id = z.id
GROUP BY z.id, z.name, z.tier_id, t.name, z.capacity
ORDER BY z.name;

-- ============================================================================
-- STEP 2: FIX ZONES (Run this after checking above)
-- ============================================================================
-- Uncomment and run the section below after checking:


BEGIN;

-- Delete any duplicate or wrong zones first
DELETE FROM seats WHERE zone_id IN (
    SELECT id FROM zones WHERE tier_id NOT IN (
        '11111111-1111-1111-1111-111111111111',
        '22222222-2222-2222-2222-222222222222',
        '33333333-3333-3333-3333-333333333333',
        '44444444-4444-4444-4444-444444444444'
    )
);

DELETE FROM zones WHERE tier_id NOT IN (
    '11111111-1111-1111-1111-111111111111',
    '22222222-2222-2222-2222-222222222222',
    '33333333-3333-3333-3333-333333333333',
    '44444444-4444-4444-4444-444444444444'
);

-- Insert or update correct zones
INSERT INTO zones (id, name, tier_id, capacity) VALUES
    ('a1111111-1111-1111-1111-111111111111', 'ZONE A1', '11111111-1111-1111-1111-111111111111', 50),
    ('a2222222-2222-2222-2222-222222222222', 'ZONE A2', '11111111-1111-1111-1111-111111111111', 50),
    ('b1111111-1111-1111-1111-111111111111', 'ZONE B1', '22222222-2222-2222-2222-222222222222', 50),
    ('b2222222-2222-2222-2222-222222222222', 'ZONE B2', '22222222-2222-2222-2222-222222222222', 50),
    ('b3333333-3333-3333-3333-333333333333', 'ZONE B3', '22222222-2222-2222-2222-222222222222', 50),
    ('c1111111-1111-1111-1111-111111111111', 'ZONE C1', '44444444-4444-4444-4444-444444444444', 50),
    ('c2222222-2222-2222-2222-222222222222', 'ZONE C2', '44444444-4444-4444-4444-444444444444', 50),
    ('d1111111-1111-1111-1111-111111111111', 'ZONE D1', '33333333-3333-3333-3333-333333333333', 50),
    ('d2222222-2222-2222-2222-222222222222', 'ZONE D2', '33333333-3333-3333-3333-333333333333', 50)
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    tier_id = EXCLUDED.tier_id,
    capacity = EXCLUDED.capacity;

-- Generate seats for zones that don't have seats
DO $$
DECLARE
    zone_record RECORD;
    row_letter CHAR(1);
    seat_count INTEGER;
BEGIN
    FOR zone_record IN SELECT id, tier_id FROM zones LOOP
        -- Check if zone has seats
        SELECT COUNT(*) INTO seat_count FROM seats WHERE zone_id = zone_record.id;
        
        IF seat_count = 0 THEN
            -- Generate seats for this zone
            FOR row_letter IN SELECT CHR(i) FROM generate_series(65, 69) i LOOP -- A to E
                FOR seat_num IN 1..10 LOOP
                    INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
                    VALUES (row_letter, seat_num, zone_record.tier_id, zone_record.id, FALSE);
                END LOOP;
            END LOOP;
        END IF;
    END LOOP;
END $$;

COMMIT;

-- Verify the fix
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

