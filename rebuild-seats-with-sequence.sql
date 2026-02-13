-- Rebuild all seats with sequence-based IDs to avoid duplicates

-- Step 1: Delete all existing seats
DELETE FROM seats;

-- Step 2: Create sequence for seat IDs
CREATE SEQUENCE IF NOT EXISTS seat_id_seq START 1;

-- Step 3: Create improved function with sequence-based IDs
CREATE OR REPLACE FUNCTION generate_seats_for_zone_v2(
    p_zone_id VARCHAR(20),
    p_zone_code VARCHAR(10),
    p_tier_id VARCHAR(2),
    p_capacity INTEGER
) RETURNS VOID AS $$
DECLARE
    v_seats_per_row INTEGER := 20;
    v_num_rows INTEGER;
    v_row_letter VARCHAR(2);
    v_seat_num INTEGER;
    v_seat_count INTEGER := 0;
    v_seat_id VARCHAR(20);
BEGIN
    v_num_rows := CEIL(p_capacity::NUMERIC / v_seats_per_row);
    
    FOR i IN 1..v_num_rows LOOP
        IF i <= 26 THEN
            v_row_letter := CHR(64 + i);
        ELSE
            v_row_letter := CHR(64 + ((i-1) / 26)) || CHR(64 + ((i-1) % 26) + 1);
        END IF;
        
        FOR j IN 1..v_seats_per_row LOOP
            EXIT WHEN v_seat_count >= p_capacity;
            
            v_seat_num := j;
            v_seat_count := v_seat_count + 1;
            
            -- Generate unique ID using sequence
            v_seat_id := 'SEAT-' || LPAD(nextval('seat_id_seq')::TEXT, 5, '0');
            
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

-- Step 4: Generate all seats using new function
-- Level 1
SELECT generate_seats_for_zone_v2('ZONE-A1', 'A1', 'PT', 264);
SELECT generate_seats_for_zone_v2('ZONE-A2', 'A2', 'PT', 400);
SELECT generate_seats_for_zone_v2('ZONE-A3', 'A3', 'PT', 400);
SELECT generate_seats_for_zone_v2('ZONE-A4', 'A4', 'PT', 264);

SELECT generate_seats_for_zone_v2('ZONE-B1', 'B1', 'GD', 244);
SELECT generate_seats_for_zone_v2('ZONE-B2', 'B2', 'GD', 492);
SELECT generate_seats_for_zone_v2('ZONE-B3', 'B3', 'GD', 492);
SELECT generate_seats_for_zone_v2('ZONE-B4', 'B4', 'GD', 244);

SELECT generate_seats_for_zone_v2('ZONE-VL', 'VL', 'GD', 37);
SELECT generate_seats_for_zone_v2('ZONE-VR', 'VR', 'GD', 37);
SELECT generate_seats_for_zone_v2('ZONE-FF', 'FF', 'GD', 91);
SELECT generate_seats_for_zone_v2('ZONE-HH', 'HH', 'GD', 91);

-- Level 2
SELECT generate_seats_for_zone_v2('ZONE-SB', 'SB', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SC', 'SC', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SD', 'SD', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SE', 'SE', 'SV', 191);
SELECT generate_seats_for_zone_v2('ZONE-SF', 'SF', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SG', 'SG', 'SV', 136);
SELECT generate_seats_for_zone_v2('ZONE-SH', 'SH', 'SV', 152);
SELECT generate_seats_for_zone_v2('ZONE-SI', 'SI', 'SV', 136);
SELECT generate_seats_for_zone_v2('ZONE-SJ', 'SJ', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SK', 'SK', 'SV', 191);
SELECT generate_seats_for_zone_v2('ZONE-SL', 'SL', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SM', 'SM', 'SV', 160);
SELECT generate_seats_for_zone_v2('ZONE-SN', 'SN', 'SV', 160);

-- Level 3
SELECT generate_seats_for_zone_v2('ZONE-LB', 'LB', 'CL', 297);
SELECT generate_seats_for_zone_v2('ZONE-LC', 'LC', 'CL', 297);
SELECT generate_seats_for_zone_v2('ZONE-LD', 'LD', 'CL', 297);
SELECT generate_seats_for_zone_v2('ZONE-LE', 'LE', 'CL', 306);
SELECT generate_seats_for_zone_v2('ZONE-LF', 'LF', 'CL', 258);
SELECT generate_seats_for_zone_v2('ZONE-LG', 'LG', 'CL', 256);
SELECT generate_seats_for_zone_v2('ZONE-LH', 'LH', 'CL', 276);
SELECT generate_seats_for_zone_v2('ZONE-LI', 'LI', 'CL', 276);
SELECT generate_seats_for_zone_v2('ZONE-LJ', 'LJ', 'CL', 264);
SELECT generate_seats_for_zone_v2('ZONE-LK', 'LK', 'CL', 198);
SELECT generate_seats_for_zone_v2('ZONE-LL', 'LL', 'CL', 264);
SELECT generate_seats_for_zone_v2('ZONE-LM', 'LM', 'CL', 276);
SELECT generate_seats_for_zone_v2('ZONE-LN', 'LN', 'CL', 276);
SELECT generate_seats_for_zone_v2('ZONE-LO', 'LO', 'CL', 256);
SELECT generate_seats_for_zone_v2('ZONE-LP', 'LP', 'CL', 258);
SELECT generate_seats_for_zone_v2('ZONE-LQ', 'LQ', 'CL', 306);
SELECT generate_seats_for_zone_v2('ZONE-LR', 'LR', 'CL', 297);
SELECT generate_seats_for_zone_v2('ZONE-LS', 'LS', 'CL', 297);
SELECT generate_seats_for_zone_v2('ZONE-LT', 'LT', 'CL', 297);

-- Step 5: Verify no duplicates
SELECT 
    'Total seats' as check_type,
    COUNT(*) as total,
    COUNT(DISTINCT id) as unique_ids
FROM seats;

-- Check for any duplicates (should return 0 rows)
SELECT id, COUNT(*) as count
FROM seats
GROUP BY id
HAVING COUNT(*) > 1;

-- Cleanup
DROP FUNCTION IF EXISTS generate_seats_for_zone_v2(VARCHAR, VARCHAR, VARCHAR, INTEGER);

SELECT '✅ Seats rebuilt successfully with unique IDs!' as status;
