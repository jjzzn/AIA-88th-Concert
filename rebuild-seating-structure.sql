-- ============================================
-- REBUILD SEATING STRUCTURE
-- Total: 10,813 seats across 3 levels
-- ============================================

-- Step 1: Clear existing data
DELETE FROM seats;
DELETE FROM zones;

-- Step 2: Create Level 1 Zones (Floor) - 3,636 seats
-- Zone A (Orange - Front) - PLATINUM tier
INSERT INTO zones (id, name, code, tier_id, capacity) VALUES
('ZONE-A1', 'ZONE A1', 'A1', 'PT', 264),
('ZONE-A2', 'ZONE A2', 'A2', 'PT', 400),
('ZONE-A3', 'ZONE A3', 'A3', 'PT', 400),
('ZONE-A4', 'ZONE A4', 'A4', 'PT', 264);

-- Zone B (Red - Middle) - GOLD tier
INSERT INTO zones (id, name, code, tier_id, capacity) VALUES
('ZONE-B1', 'ZONE B1', 'B1', 'GD', 244),
('ZONE-B2', 'ZONE B2', 'B2', 'GD', 492),
('ZONE-B3', 'ZONE B3', 'B3', 'GD', 492),
('ZONE-B4', 'ZONE B4', 'B4', 'GD', 244);

-- Zone Special (Gray - Side/Back) - GOLD tier
INSERT INTO zones (id, name, code, tier_id, capacity) VALUES
('ZONE-VL', 'ZONE VL', 'VL', 'GD', 37),
('ZONE-VR', 'ZONE VR', 'VR', 'GD', 37),
('ZONE-FF', 'ZONE FF', 'FF', 'GD', 91),
('ZONE-HH', 'ZONE HH', 'HH', 'GD', 91);

-- Step 3: Create Level 2 Zones (Middle) - 1,926 seats - SILVER tier
INSERT INTO zones (id, name, code, tier_id, capacity) VALUES
('ZONE-SB', 'ZONE SB', 'SB', 'SV', 160),
('ZONE-SC', 'ZONE SC', 'SC', 'SV', 160),
('ZONE-SD', 'ZONE SD', 'SD', 'SV', 160),
('ZONE-SE', 'ZONE SE', 'SE', 'SV', 191),
('ZONE-SF', 'ZONE SF', 'SF', 'SV', 160),
('ZONE-SG', 'ZONE SG', 'SG', 'SV', 136),
('ZONE-SH', 'ZONE SH', 'SH', 'SV', 152),
('ZONE-SI', 'ZONE SI', 'SI', 'SV', 136),
('ZONE-SJ', 'ZONE SJ', 'SJ', 'SV', 160),
('ZONE-SK', 'ZONE SK', 'SK', 'SV', 191),
('ZONE-SL', 'ZONE SL', 'SL', 'SV', 160),
('ZONE-SM', 'ZONE SM', 'SM', 'SV', 160),
('ZONE-SN', 'ZONE SN', 'SN', 'SV', 160);

-- Step 4: Create Level 3 Zones (Upper) - 5,251 seats
INSERT INTO zones (id, name, code, tier_id, capacity) VALUES
('ZONE-LB', 'ZONE B', 'LB', 'CL', 297),
('ZONE-LC', 'ZONE C', 'LC', 'CL', 297),
('ZONE-LD', 'ZONE D', 'LD', 'CL', 297),
('ZONE-LE', 'ZONE E', 'LE', 'CL', 306),
('ZONE-LF', 'ZONE F', 'LF', 'CL', 258),
('ZONE-LG', 'ZONE G', 'LG', 'CL', 256),
('ZONE-LH', 'ZONE H', 'LH', 'CL', 276),
('ZONE-LI', 'ZONE I', 'LI', 'CL', 276),
('ZONE-LJ', 'ZONE J', 'LJ', 'CL', 264),
('ZONE-LK', 'ZONE K', 'LK', 'CL', 198),
('ZONE-LL', 'ZONE L', 'LL', 'CL', 264),
('ZONE-LM', 'ZONE M', 'LM', 'CL', 276),
('ZONE-LN', 'ZONE N', 'LN', 'CL', 276),
('ZONE-LO', 'ZONE O', 'LO', 'CL', 256),
('ZONE-LP', 'ZONE P', 'LP', 'CL', 258),
('ZONE-LQ', 'ZONE Q', 'LQ', 'CL', 306),
('ZONE-LR', 'ZONE R', 'LR', 'CL', 297),
('ZONE-LS', 'ZONE S', 'LS', 'CL', 297),
('ZONE-LT', 'ZONE T', 'LT', 'CL', 297);

-- Step 5: Generate seats for all zones
-- This uses a helper function to generate seats efficiently

-- Function to generate seats for a zone
CREATE OR REPLACE FUNCTION generate_seats_for_zone(
    p_zone_id VARCHAR(20),
    p_zone_code VARCHAR(10),
    p_tier_id VARCHAR(2),
    p_capacity INTEGER
) RETURNS VOID AS $$
DECLARE
    v_seats_per_row INTEGER := 20; -- Average seats per row
    v_num_rows INTEGER;
    v_row_letter VARCHAR(2);
    v_seat_num INTEGER;
    v_seat_count INTEGER := 0;
    v_seat_id VARCHAR(20);
    v_id_exists BOOLEAN;
BEGIN
    -- Calculate number of rows needed
    v_num_rows := CEIL(p_capacity::NUMERIC / v_seats_per_row);
    
    -- Generate seats
    FOR i IN 1..v_num_rows LOOP
        -- Convert row number to letter (A, B, C, ...)
        IF i <= 26 THEN
            v_row_letter := CHR(64 + i); -- A-Z
        ELSE
            v_row_letter := CHR(64 + ((i-1) / 26)) || CHR(64 + ((i-1) % 26) + 1); -- AA, AB, etc
        END IF;
        
        -- Generate seats for this row
        FOR j IN 1..v_seats_per_row LOOP
            EXIT WHEN v_seat_count >= p_capacity;
            
            v_seat_num := j;
            v_seat_count := v_seat_count + 1;
            
            -- Generate unique seat ID
            LOOP
                v_seat_id := 'SEAT-' || UPPER(SUBSTRING(MD5(RANDOM()::TEXT) FROM 1 FOR 5));
                SELECT EXISTS(SELECT 1 FROM seats WHERE id = v_seat_id) INTO v_id_exists;
                EXIT WHEN NOT v_id_exists;
            END LOOP;
            
            INSERT INTO seats (
                id,
                code,
                zone_id,
                tier_id,
                row,
                number,
                is_booked
            ) VALUES (
                v_seat_id,
                p_zone_code || '-' || v_row_letter || LPAD(v_seat_num::TEXT, 2, '0'),
                p_zone_id,
                p_tier_id,
                v_row_letter,
                v_seat_num,
                FALSE
            );
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Step 6: Generate seats for Level 1 (Floor)
SELECT generate_seats_for_zone('ZONE-A1', 'A1', 'PT', 264);
SELECT generate_seats_for_zone('ZONE-A2', 'A2', 'PT', 400);
SELECT generate_seats_for_zone('ZONE-A3', 'A3', 'PT', 400);
SELECT generate_seats_for_zone('ZONE-A4', 'A4', 'PT', 264);

SELECT generate_seats_for_zone('ZONE-B1', 'B1', 'GD', 244);
SELECT generate_seats_for_zone('ZONE-B2', 'B2', 'GD', 492);
SELECT generate_seats_for_zone('ZONE-B3', 'B3', 'GD', 492);
SELECT generate_seats_for_zone('ZONE-B4', 'B4', 'GD', 244);

SELECT generate_seats_for_zone('ZONE-VL', 'VL', 'GD', 37);
SELECT generate_seats_for_zone('ZONE-VR', 'VR', 'GD', 37);
SELECT generate_seats_for_zone('ZONE-FF', 'FF', 'GD', 91);
SELECT generate_seats_for_zone('ZONE-HH', 'HH', 'GD', 91);

-- Step 7: Generate seats for Level 2 (Middle)
SELECT generate_seats_for_zone('ZONE-SB', 'SB', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SC', 'SC', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SD', 'SD', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SE', 'SE', 'SV', 191);
SELECT generate_seats_for_zone('ZONE-SF', 'SF', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SG', 'SG', 'SV', 136);
SELECT generate_seats_for_zone('ZONE-SH', 'SH', 'SV', 152);
SELECT generate_seats_for_zone('ZONE-SI', 'SI', 'SV', 136);
SELECT generate_seats_for_zone('ZONE-SJ', 'SJ', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SK', 'SK', 'SV', 191);
SELECT generate_seats_for_zone('ZONE-SL', 'SL', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SM', 'SM', 'SV', 160);
SELECT generate_seats_for_zone('ZONE-SN', 'SN', 'SV', 160);

-- Step 8: Generate seats for Level 3 (Upper)
SELECT generate_seats_for_zone('ZONE-LB', 'LB', 'CL', 297);
SELECT generate_seats_for_zone('ZONE-LC', 'LC', 'CL', 297);
SELECT generate_seats_for_zone('ZONE-LD', 'LD', 'CL', 297);
SELECT generate_seats_for_zone('ZONE-LE', 'LE', 'CL', 306);
SELECT generate_seats_for_zone('ZONE-LF', 'LF', 'CL', 258);
SELECT generate_seats_for_zone('ZONE-LG', 'LG', 'CL', 256);
SELECT generate_seats_for_zone('ZONE-LH', 'LH', 'CL', 276);
SELECT generate_seats_for_zone('ZONE-LI', 'LI', 'CL', 276);
SELECT generate_seats_for_zone('ZONE-LJ', 'LJ', 'CL', 264);
SELECT generate_seats_for_zone('ZONE-LK', 'LK', 'CL', 198);
SELECT generate_seats_for_zone('ZONE-LL', 'LL', 'CL', 264);
SELECT generate_seats_for_zone('ZONE-LM', 'LM', 'CL', 276);
SELECT generate_seats_for_zone('ZONE-LN', 'LN', 'CL', 276);
SELECT generate_seats_for_zone('ZONE-LO', 'LO', 'CL', 256);
SELECT generate_seats_for_zone('ZONE-LP', 'LP', 'CL', 258);
SELECT generate_seats_for_zone('ZONE-LQ', 'LQ', 'CL', 306);
SELECT generate_seats_for_zone('ZONE-LR', 'LR', 'CL', 297);
SELECT generate_seats_for_zone('ZONE-LS', 'LS', 'CL', 297);
SELECT generate_seats_for_zone('ZONE-LT', 'LT', 'CL', 297);

-- Step 9: Verification
SELECT 
    'Level 1 (Floor)' as level,
    COUNT(*) as total_seats,
    COUNT(DISTINCT zone_id) as total_zones
FROM seats
WHERE tier_id IN ('PT', 'GD')
UNION ALL
SELECT 
    'Level 2 (Middle)' as level,
    COUNT(*) as total_seats,
    COUNT(DISTINCT zone_id) as total_zones
FROM seats
WHERE tier_id = 'SV'
UNION ALL
SELECT 
    'Level 3 (Upper)' as level,
    COUNT(*) as total_seats,
    COUNT(DISTINCT zone_id) as total_zones
FROM seats
WHERE tier_id = 'CL'
UNION ALL
SELECT 
    'TOTAL' as level,
    COUNT(*) as total_seats,
    COUNT(DISTINCT zone_id) as total_zones
FROM seats;

-- Show zones summary
SELECT 
    z.name,
    z.code,
    t.name as tier_name,
    z.capacity,
    COUNT(s.id) as actual_seats
FROM zones z
LEFT JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON z.id = s.zone_id
GROUP BY z.id, z.name, z.code, t.name, z.capacity
ORDER BY z.code;

-- Cleanup
DROP FUNCTION IF EXISTS generate_seats_for_zone(VARCHAR, VARCHAR, VARCHAR, INTEGER);

SELECT '✅ Seating structure rebuilt successfully!' as status;
