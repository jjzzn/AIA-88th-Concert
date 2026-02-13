-- AIA 88th Concert - Complete Seating Layout
-- Generated from concert_seating_final_verified.json
-- Run this script in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop the view that depends on seats.row column
DROP VIEW IF EXISTS seat_swap_history_detailed CASCADE;

-- Clear existing data FIRST (in correct order to respect foreign key constraints)
-- This must be done before altering columns to avoid data length constraint issues
DO $$ 
BEGIN
    -- Delete from seat_locks if table exists
    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'seat_locks') THEN
        DELETE FROM seat_locks;
    END IF;
END $$;

DELETE FROM seat_swap_history;
DELETE FROM booking_seats;
DELETE FROM bookings;

-- Use TRUNCATE for more thorough cleanup
TRUNCATE TABLE seats CASCADE;
TRUNCATE TABLE zones CASCADE;

-- Drop and recreate the row column to avoid type constraint issues
ALTER TABLE seats DROP COLUMN IF EXISTS row;
ALTER TABLE seats ADD COLUMN row VARCHAR(10);

-- Add level column to zones if not exists
ALTER TABLE zones ADD COLUMN IF NOT EXISTS level INTEGER DEFAULT 1;

-- Recreate the view after altering the column
CREATE OR REPLACE VIEW seat_swap_history_detailed AS
SELECT 
    ssh.id,
    ssh.booking_seat_id,
    ssh.booking_id,
    ssh.old_seat_id,
    ssh.new_seat_id,
    ssh.swapped_by,
    ssh.swapped_at,
    ssh.reason,
    ssh.admin_notes,
    ssh.admin_ip,
    ssh.status,
    ssh.error_message,
    b.email as booking_email,
    b.phone as booking_phone,
    bs.first_name || ' ' || bs.last_name as attendee_name,
    bs.qr_token,
    os.row as old_row,
    os.number as old_number,
    oz.name as old_zone,
    ot.name as old_tier,
    ns.row as new_row,
    ns.number as new_number,
    nz.name as new_zone,
    nt.name as new_tier,
    b.booking_number
FROM seat_swap_history ssh
LEFT JOIN booking_seats bs ON ssh.booking_seat_id = bs.id
LEFT JOIN bookings b ON ssh.booking_id = b.id
LEFT JOIN seats os ON ssh.old_seat_id = os.id
LEFT JOIN zones oz ON os.zone_id = oz.id
LEFT JOIN tiers ot ON os.tier_id = ot.id
LEFT JOIN seats ns ON ssh.new_seat_id = ns.id
LEFT JOIN zones nz ON ns.zone_id = nz.id
LEFT JOIN tiers nt ON ns.tier_id = nt.id;

-- Insert Zones
INSERT INTO zones (id, name, tier_id, capacity, level) VALUES
    ('z1654900-0000-0000-0000-000000000000', 'A1', '11111111-1111-1111-1111-111111111111', 264, 1),
    ('z1655000-0000-0000-0000-000000000000', 'A2', '11111111-1111-1111-1111-111111111111', 400, 1),
    ('z1655100-0000-0000-0000-000000000000', 'A3', '11111111-1111-1111-1111-111111111111', 400, 1),
    ('z1655200-0000-0000-0000-000000000000', 'A4', '11111111-1111-1111-1111-111111111111', 264, 1),
    ('z1664900-0000-0000-0000-000000000000', 'B1', '11111111-1111-1111-1111-111111111111', 244, 1),
    ('z1665000-0000-0000-0000-000000000000', 'B2', '11111111-1111-1111-1111-111111111111', 492, 1),
    ('z1665100-0000-0000-0000-000000000000', 'B3', '11111111-1111-1111-1111-111111111111', 492, 1),
    ('z1665200-0000-0000-0000-000000000000', 'B4', '11111111-1111-1111-1111-111111111111', 244, 1),
    ('z1707000-0000-0000-0000-000000000000', 'FF', '11111111-1111-1111-1111-111111111111', 91, 1),
    ('z1727200-0000-0000-0000-000000000000', 'HH', '11111111-1111-1111-1111-111111111111', 91, 1),
    ('z1867600-0000-0000-0000-000000000000', 'VL', '11111111-1111-1111-1111-111111111111', 37, 1),
    ('z1868200-0000-0000-0000-000000000000', 'VR', '11111111-1111-1111-1111-111111111111', 37, 1),
    ('z2836600-0000-0000-0000-000000000000', 'SB', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2836700-0000-0000-0000-000000000000', 'SC', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2836800-0000-0000-0000-000000000000', 'SD', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2836900-0000-0000-0000-000000000000', 'SE', '22222222-2222-2222-2222-222222222222', 191, 2),
    ('z2837000-0000-0000-0000-000000000000', 'SF', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2837100-0000-0000-0000-000000000000', 'SG', '22222222-2222-2222-2222-222222222222', 136, 2),
    ('z2837200-0000-0000-0000-000000000000', 'SH', '22222222-2222-2222-2222-222222222222', 152, 2),
    ('z2837300-0000-0000-0000-000000000000', 'SI', '22222222-2222-2222-2222-222222222222', 136, 2),
    ('z2837400-0000-0000-0000-000000000000', 'SJ', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2837500-0000-0000-0000-000000000000', 'SK', '22222222-2222-2222-2222-222222222222', 191, 2),
    ('z2837600-0000-0000-0000-000000000000', 'SL', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2837700-0000-0000-0000-000000000000', 'SM', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z2837800-0000-0000-0000-000000000000', 'SN', '22222222-2222-2222-2222-222222222222', 160, 2),
    ('z3660000-0000-0000-0000-000000000000', 'B', '66666666-6666-6666-6666-666666666666', 297, 3),
    ('z3670000-0000-0000-0000-000000000000', 'C', '66666666-6666-6666-6666-666666666666', 297, 3),
    ('z3680000-0000-0000-0000-000000000000', 'D', '66666666-6666-6666-6666-666666666666', 297, 3),
    ('z3690000-0000-0000-0000-000000000000', 'E', '66666666-6666-6666-6666-666666666666', 306, 3),
    ('z3700000-0000-0000-0000-000000000000', 'F', '66666666-6666-6666-6666-666666666666', 258, 3),
    ('z3710000-0000-0000-0000-000000000000', 'G', '66666666-6666-6666-6666-666666666666', 256, 3),
    ('z3720000-0000-0000-0000-000000000000', 'H', '66666666-6666-6666-6666-666666666666', 276, 3),
    ('z3730000-0000-0000-0000-000000000000', 'I', '66666666-6666-6666-6666-666666666666', 276, 3),
    ('z3740000-0000-0000-0000-000000000000', 'J', '66666666-6666-6666-6666-666666666666', 264, 3),
    ('z3750000-0000-0000-0000-000000000000', 'K', '66666666-6666-6666-6666-666666666666', 198, 3),
    ('z3760000-0000-0000-0000-000000000000', 'L', '66666666-6666-6666-6666-666666666666', 264, 3),
    ('z3770000-0000-0000-0000-000000000000', 'M', '66666666-6666-6666-6666-666666666666', 276, 3),
    ('z3780000-0000-0000-0000-000000000000', 'N', '66666666-6666-6666-6666-666666666666', 276, 3),
    ('z3790000-0000-0000-0000-000000000000', 'O', '66666666-6666-6666-6666-666666666666', 256, 3),
    ('z3800000-0000-0000-0000-000000000000', 'P', '66666666-6666-6666-6666-666666666666', 258, 3),
    ('z3810000-0000-0000-0000-000000000000', 'Q', '66666666-6666-6666-6666-666666666666', 306, 3),
    ('z3820000-0000-0000-0000-000000000000', 'R', '66666666-6666-6666-6666-666666666666', 297, 3),
    ('z3830000-0000-0000-0000-000000000000', 'S', '66666666-6666-6666-6666-666666666666', 297, 3),
    ('z3840000-0000-0000-0000-000000000000', 'T', '66666666-6666-6666-6666-666666666666', 297, 3);

-- Insert Seats by Zone

-- Level 1 - Zone A1: 264 seats
DO $$
DECLARE
    zone_id UUID := 'z1654900-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AB_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AC_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AD_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AE_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AF_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AG_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AH_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AJ_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AK_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AL_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AM_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AN_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AP_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AQ_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AR_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AS_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AT_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AU_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AV_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AW_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AX_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    seat_num INTEGER;
BEGIN
    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AB
    FOREACH seat_num IN ARRAY row_AB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AC
    FOREACH seat_num IN ARRAY row_AC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AD
    FOREACH seat_num IN ARRAY row_AD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AE
    FOREACH seat_num IN ARRAY row_AE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AF
    FOREACH seat_num IN ARRAY row_AF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AG
    FOREACH seat_num IN ARRAY row_AG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AH
    FOREACH seat_num IN ARRAY row_AH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AJ
    FOREACH seat_num IN ARRAY row_AJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AK
    FOREACH seat_num IN ARRAY row_AK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AL
    FOREACH seat_num IN ARRAY row_AL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AM
    FOREACH seat_num IN ARRAY row_AM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AN
    FOREACH seat_num IN ARRAY row_AN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AP
    FOREACH seat_num IN ARRAY row_AP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AQ
    FOREACH seat_num IN ARRAY row_AQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AR
    FOREACH seat_num IN ARRAY row_AR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AS
    FOREACH seat_num IN ARRAY row_AS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AT
    FOREACH seat_num IN ARRAY row_AT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AU
    FOREACH seat_num IN ARRAY row_AU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AV
    FOREACH seat_num IN ARRAY row_AV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AW
    FOREACH seat_num IN ARRAY row_AW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AX
    FOREACH seat_num IN ARRAY row_AX_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AX', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone A2: 400 seats
DO $$
DECLARE
    zone_id UUID := 'z1655000-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_AA_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AB_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AC_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AD_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AE_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AF_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AG_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AH_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AJ_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AK_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AL_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AM_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AN_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AP_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AQ_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AR_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AS_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32];
    row_AT_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_AU_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_AV_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_AW_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_AX_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    seat_num INTEGER;
BEGIN
    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AB
    FOREACH seat_num IN ARRAY row_AB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AC
    FOREACH seat_num IN ARRAY row_AC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AD
    FOREACH seat_num IN ARRAY row_AD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AE
    FOREACH seat_num IN ARRAY row_AE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AF
    FOREACH seat_num IN ARRAY row_AF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AG
    FOREACH seat_num IN ARRAY row_AG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AH
    FOREACH seat_num IN ARRAY row_AH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AJ
    FOREACH seat_num IN ARRAY row_AJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AK
    FOREACH seat_num IN ARRAY row_AK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AL
    FOREACH seat_num IN ARRAY row_AL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AM
    FOREACH seat_num IN ARRAY row_AM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AN
    FOREACH seat_num IN ARRAY row_AN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AP
    FOREACH seat_num IN ARRAY row_AP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AQ
    FOREACH seat_num IN ARRAY row_AQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AR
    FOREACH seat_num IN ARRAY row_AR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AS
    FOREACH seat_num IN ARRAY row_AS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AT
    FOREACH seat_num IN ARRAY row_AT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AU
    FOREACH seat_num IN ARRAY row_AU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AV
    FOREACH seat_num IN ARRAY row_AV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AW
    FOREACH seat_num IN ARRAY row_AW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AX
    FOREACH seat_num IN ARRAY row_AX_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AX', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone A3: 400 seats
DO $$
DECLARE
    zone_id UUID := 'z1655100-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_AA_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AB_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AC_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AD_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AE_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AF_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AG_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AH_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AJ_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AK_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AL_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AM_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AN_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AP_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AQ_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AR_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AS_seats INTEGER[] := ARRAY[44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AT_seats INTEGER[] := ARRAY[52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AU_seats INTEGER[] := ARRAY[52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AV_seats INTEGER[] := ARRAY[52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AW_seats INTEGER[] := ARRAY[52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    row_AX_seats INTEGER[] := ARRAY[52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63];
    seat_num INTEGER;
BEGIN
    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AB
    FOREACH seat_num IN ARRAY row_AB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AC
    FOREACH seat_num IN ARRAY row_AC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AD
    FOREACH seat_num IN ARRAY row_AD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AE
    FOREACH seat_num IN ARRAY row_AE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AF
    FOREACH seat_num IN ARRAY row_AF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AG
    FOREACH seat_num IN ARRAY row_AG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AH
    FOREACH seat_num IN ARRAY row_AH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AJ
    FOREACH seat_num IN ARRAY row_AJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AK
    FOREACH seat_num IN ARRAY row_AK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AL
    FOREACH seat_num IN ARRAY row_AL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AM
    FOREACH seat_num IN ARRAY row_AM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AN
    FOREACH seat_num IN ARRAY row_AN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AP
    FOREACH seat_num IN ARRAY row_AP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AQ
    FOREACH seat_num IN ARRAY row_AQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AR
    FOREACH seat_num IN ARRAY row_AR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AS
    FOREACH seat_num IN ARRAY row_AS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AT
    FOREACH seat_num IN ARRAY row_AT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AU
    FOREACH seat_num IN ARRAY row_AU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AV
    FOREACH seat_num IN ARRAY row_AV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AW
    FOREACH seat_num IN ARRAY row_AW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AX
    FOREACH seat_num IN ARRAY row_AX_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AX', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone A4: 264 seats
DO $$
DECLARE
    zone_id UUID := 'z1655200-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_AA_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AB_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AC_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AD_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AE_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AF_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AG_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AH_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AJ_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AK_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AL_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AM_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AN_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AP_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 91];
    row_AQ_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 91];
    row_AR_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 182];
    row_AS_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AT_seats INTEGER[] := ARRAY[37, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AU_seats INTEGER[] := ARRAY[37, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AV_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 74, 75];
    row_AW_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_AX_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69];
    seat_num INTEGER;
BEGIN
    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AB
    FOREACH seat_num IN ARRAY row_AB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AC
    FOREACH seat_num IN ARRAY row_AC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AD
    FOREACH seat_num IN ARRAY row_AD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AE
    FOREACH seat_num IN ARRAY row_AE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AF
    FOREACH seat_num IN ARRAY row_AF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AG
    FOREACH seat_num IN ARRAY row_AG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AH
    FOREACH seat_num IN ARRAY row_AH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AJ
    FOREACH seat_num IN ARRAY row_AJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AK
    FOREACH seat_num IN ARRAY row_AK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AL
    FOREACH seat_num IN ARRAY row_AL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AM
    FOREACH seat_num IN ARRAY row_AM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AN
    FOREACH seat_num IN ARRAY row_AN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AP
    FOREACH seat_num IN ARRAY row_AP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AQ
    FOREACH seat_num IN ARRAY row_AQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AR
    FOREACH seat_num IN ARRAY row_AR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AS
    FOREACH seat_num IN ARRAY row_AS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AT
    FOREACH seat_num IN ARRAY row_AT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AU
    FOREACH seat_num IN ARRAY row_AU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AV
    FOREACH seat_num IN ARRAY row_AV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AW
    FOREACH seat_num IN ARRAY row_AW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AX
    FOREACH seat_num IN ARRAY row_AX_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AX', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone B1: 244 seats
DO $$
DECLARE
    zone_id UUID := 'z1664900-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_BA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BB_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BC_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BD_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BE_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BF_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BG_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BH_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BJ_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BK_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BL_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BM_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BN_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BP_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BQ_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BR_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BS_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BT_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BU_seats INTEGER[] := ARRAY[3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BV_seats INTEGER[] := ARRAY[3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_BW_seats INTEGER[] := ARRAY[5, 6, 7, 8, 9, 10, 11, 12];
    seat_num INTEGER;
BEGIN
    -- Row BA
    FOREACH seat_num IN ARRAY row_BA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BB
    FOREACH seat_num IN ARRAY row_BB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BC
    FOREACH seat_num IN ARRAY row_BC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BD
    FOREACH seat_num IN ARRAY row_BD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BE
    FOREACH seat_num IN ARRAY row_BE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BF
    FOREACH seat_num IN ARRAY row_BF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BG
    FOREACH seat_num IN ARRAY row_BG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BH
    FOREACH seat_num IN ARRAY row_BH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BJ
    FOREACH seat_num IN ARRAY row_BJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BK
    FOREACH seat_num IN ARRAY row_BK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BL
    FOREACH seat_num IN ARRAY row_BL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BM
    FOREACH seat_num IN ARRAY row_BM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BN
    FOREACH seat_num IN ARRAY row_BN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BP
    FOREACH seat_num IN ARRAY row_BP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BQ
    FOREACH seat_num IN ARRAY row_BQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BR
    FOREACH seat_num IN ARRAY row_BR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BS
    FOREACH seat_num IN ARRAY row_BS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BT
    FOREACH seat_num IN ARRAY row_BT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BU
    FOREACH seat_num IN ARRAY row_BU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BV
    FOREACH seat_num IN ARRAY row_BV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BW
    FOREACH seat_num IN ARRAY row_BW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone B2: 492 seats
DO $$
DECLARE
    zone_id UUID := 'z1665000-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_BA_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_BB_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BC_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BD_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BE_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BF_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BG_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BH_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BJ_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BK_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BL_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BM_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BN_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BP_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BQ_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BR_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BS_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BT_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BU_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BV_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    row_BW_seats INTEGER[] := ARRAY[13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
    seat_num INTEGER;
BEGIN
    -- Row BA
    FOREACH seat_num IN ARRAY row_BA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BB
    FOREACH seat_num IN ARRAY row_BB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BC
    FOREACH seat_num IN ARRAY row_BC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BD
    FOREACH seat_num IN ARRAY row_BD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BE
    FOREACH seat_num IN ARRAY row_BE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BF
    FOREACH seat_num IN ARRAY row_BF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BG
    FOREACH seat_num IN ARRAY row_BG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BH
    FOREACH seat_num IN ARRAY row_BH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BJ
    FOREACH seat_num IN ARRAY row_BJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BK
    FOREACH seat_num IN ARRAY row_BK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BL
    FOREACH seat_num IN ARRAY row_BL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BM
    FOREACH seat_num IN ARRAY row_BM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BN
    FOREACH seat_num IN ARRAY row_BN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BP
    FOREACH seat_num IN ARRAY row_BP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BQ
    FOREACH seat_num IN ARRAY row_BQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BR
    FOREACH seat_num IN ARRAY row_BR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BS
    FOREACH seat_num IN ARRAY row_BS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BT
    FOREACH seat_num IN ARRAY row_BT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BU
    FOREACH seat_num IN ARRAY row_BU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BV
    FOREACH seat_num IN ARRAY row_BV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BW
    FOREACH seat_num IN ARRAY row_BW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone B3: 492 seats
DO $$
DECLARE
    zone_id UUID := 'z1665100-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_BA_seats INTEGER[] := ARRAY[49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BB_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BC_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BD_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BE_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BF_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BG_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BH_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BJ_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BK_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BL_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BM_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BN_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BP_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BQ_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BR_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BS_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BT_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BU_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BV_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    row_BW_seats INTEGER[] := ARRAY[37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60];
    seat_num INTEGER;
BEGIN
    -- Row BA
    FOREACH seat_num IN ARRAY row_BA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BB
    FOREACH seat_num IN ARRAY row_BB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BC
    FOREACH seat_num IN ARRAY row_BC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BD
    FOREACH seat_num IN ARRAY row_BD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BE
    FOREACH seat_num IN ARRAY row_BE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BF
    FOREACH seat_num IN ARRAY row_BF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BG
    FOREACH seat_num IN ARRAY row_BG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BH
    FOREACH seat_num IN ARRAY row_BH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BJ
    FOREACH seat_num IN ARRAY row_BJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BK
    FOREACH seat_num IN ARRAY row_BK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BL
    FOREACH seat_num IN ARRAY row_BL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BM
    FOREACH seat_num IN ARRAY row_BM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BN
    FOREACH seat_num IN ARRAY row_BN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BP
    FOREACH seat_num IN ARRAY row_BP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BQ
    FOREACH seat_num IN ARRAY row_BQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BR
    FOREACH seat_num IN ARRAY row_BR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BS
    FOREACH seat_num IN ARRAY row_BS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BT
    FOREACH seat_num IN ARRAY row_BT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BU
    FOREACH seat_num IN ARRAY row_BU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BV
    FOREACH seat_num IN ARRAY row_BV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BW
    FOREACH seat_num IN ARRAY row_BW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone B4: 244 seats
DO $$
DECLARE
    zone_id UUID := 'z1665200-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_BA_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BB_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BC_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BD_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BE_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BF_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BG_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BH_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BJ_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BK_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BL_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BM_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BN_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BP_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BQ_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BR_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BS_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BT_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75];
    row_BU_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73];
    row_BV_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71, 72, 73];
    row_BW_seats INTEGER[] := ARRAY[64, 65, 66, 67, 68, 69, 70, 71];
    seat_num INTEGER;
BEGIN
    -- Row BA
    FOREACH seat_num IN ARRAY row_BA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BB
    FOREACH seat_num IN ARRAY row_BB_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BB', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BC
    FOREACH seat_num IN ARRAY row_BC_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BC', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BD
    FOREACH seat_num IN ARRAY row_BD_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BD', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BE
    FOREACH seat_num IN ARRAY row_BE_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BE', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BF
    FOREACH seat_num IN ARRAY row_BF_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BF', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BG
    FOREACH seat_num IN ARRAY row_BG_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BG', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BH
    FOREACH seat_num IN ARRAY row_BH_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BH', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BJ
    FOREACH seat_num IN ARRAY row_BJ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BJ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BK
    FOREACH seat_num IN ARRAY row_BK_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BK', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BL
    FOREACH seat_num IN ARRAY row_BL_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BL', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BM
    FOREACH seat_num IN ARRAY row_BM_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BM', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BN
    FOREACH seat_num IN ARRAY row_BN_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BN', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BP
    FOREACH seat_num IN ARRAY row_BP_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BP', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BQ
    FOREACH seat_num IN ARRAY row_BQ_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BQ', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BR
    FOREACH seat_num IN ARRAY row_BR_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BR', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BS
    FOREACH seat_num IN ARRAY row_BS_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BS', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BT
    FOREACH seat_num IN ARRAY row_BT_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BT', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BU
    FOREACH seat_num IN ARRAY row_BU_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BU', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BV
    FOREACH seat_num IN ARRAY row_BV_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BV', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row BW
    FOREACH seat_num IN ARRAY row_BW_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('BW', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone FF: 91 seats
DO $$
DECLARE
    zone_id UUID := 'z1707000-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_Row_60_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_61_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_62_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_63_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_64_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_65_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_66_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_67_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_68_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    seat_num INTEGER;
BEGIN
    -- Row Row_60
    FOREACH seat_num IN ARRAY row_Row_60_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_60', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_61
    FOREACH seat_num IN ARRAY row_Row_61_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_61', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_62
    FOREACH seat_num IN ARRAY row_Row_62_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_62', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_63
    FOREACH seat_num IN ARRAY row_Row_63_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_63', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_64
    FOREACH seat_num IN ARRAY row_Row_64_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_64', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_65
    FOREACH seat_num IN ARRAY row_Row_65_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_65', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_66
    FOREACH seat_num IN ARRAY row_Row_66_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_66', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_67
    FOREACH seat_num IN ARRAY row_Row_67_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_67', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_68
    FOREACH seat_num IN ARRAY row_Row_68_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_68', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone HH: 91 seats
DO $$
DECLARE
    zone_id UUID := 'z1727200-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_Row_60_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_61_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_62_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_63_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_64_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_65_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_66_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_67_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_68_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    seat_num INTEGER;
BEGIN
    -- Row Row_60
    FOREACH seat_num IN ARRAY row_Row_60_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_60', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_61
    FOREACH seat_num IN ARRAY row_Row_61_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_61', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_62
    FOREACH seat_num IN ARRAY row_Row_62_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_62', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_63
    FOREACH seat_num IN ARRAY row_Row_63_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_63', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_64
    FOREACH seat_num IN ARRAY row_Row_64_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_64', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_65
    FOREACH seat_num IN ARRAY row_Row_65_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_65', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_66
    FOREACH seat_num IN ARRAY row_Row_66_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_66', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_67
    FOREACH seat_num IN ARRAY row_Row_67_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_67', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_68
    FOREACH seat_num IN ARRAY row_Row_68_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_68', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone VL: 37 seats
DO $$
DECLARE
    zone_id UUID := 'z1867600-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_Row_60_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_62_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_63_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_64_seats INTEGER[] := ARRAY[4, 5, 6, 7, 8, 9, 10];
    seat_num INTEGER;
BEGIN
    -- Row Row_60
    FOREACH seat_num IN ARRAY row_Row_60_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_60', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_62
    FOREACH seat_num IN ARRAY row_Row_62_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_62', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_63
    FOREACH seat_num IN ARRAY row_Row_63_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_63', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_64
    FOREACH seat_num IN ARRAY row_Row_64_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_64', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 1 - Zone VR: 37 seats
DO $$
DECLARE
    zone_id UUID := 'z1868200-0000-0000-0000-000000000000';
    tier_id UUID := '11111111-1111-1111-1111-111111111111';
    row_Row_60_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_62_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_63_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_Row_64_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7];
    seat_num INTEGER;
BEGIN
    -- Row Row_60
    FOREACH seat_num IN ARRAY row_Row_60_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_60', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_62
    FOREACH seat_num IN ARRAY row_Row_62_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_62', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_63
    FOREACH seat_num IN ARRAY row_Row_63_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_63', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Row_64
    FOREACH seat_num IN ARRAY row_Row_64_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Row_64', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SB: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2836600-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 160];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 160];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 191];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 160];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 136];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 152];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 136];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SC: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2836700-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 160];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SD: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2836800-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SE: 191 seats
DO $$
DECLARE
    zone_id UUID := 'z2836900-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SF: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2837000-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SG: 136 seats
DO $$
DECLARE
    zone_id UUID := 'z2837100-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SH: 152 seats
DO $$
DECLARE
    zone_id UUID := 'z2837200-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SI: 136 seats
DO $$
DECLARE
    zone_id UUID := 'z2837300-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SJ: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2837400-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SK: 191 seats
DO $$
DECLARE
    zone_id UUID := 'z2837500-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SL: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2837600-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SM: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2837700-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 2 - Zone SN: 160 seats
DO $$
DECLARE
    zone_id UUID := 'z2837800-0000-0000-0000-000000000000';
    tier_id UUID := '22222222-2222-2222-2222-222222222222';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone B: 297 seats
DO $$
DECLARE
    zone_id UUID := 'z3660000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 198];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone C: 297 seats
DO $$
DECLARE
    zone_id UUID := 'z3670000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone D: 297 seats
DO $$
DECLARE
    zone_id UUID := 'z3680000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone E: 306 seats
DO $$
DECLARE
    zone_id UUID := 'z3690000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone F: 258 seats
DO $$
DECLARE
    zone_id UUID := 'z3700000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone G: 256 seats
DO $$
DECLARE
    zone_id UUID := 'z3710000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone H: 276 seats
DO $$
DECLARE
    zone_id UUID := 'z3720000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone I: 276 seats
DO $$
DECLARE
    zone_id UUID := 'z3730000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone J: 264 seats
DO $$
DECLARE
    zone_id UUID := 'z3740000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone K: 198 seats
DO $$
DECLARE
    zone_id UUID := 'z3750000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone L: 264 seats
DO $$
DECLARE
    zone_id UUID := 'z3760000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone M: 276 seats
DO $$
DECLARE
    zone_id UUID := 'z3770000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone N: 276 seats
DO $$
DECLARE
    zone_id UUID := 'z3780000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone O: 256 seats
DO $$
DECLARE
    zone_id UUID := 'z3790000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone P: 258 seats
DO $$
DECLARE
    zone_id UUID := 'z3800000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_R_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_S_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    row_T_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    row_U_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row R
    FOREACH seat_num IN ARRAY row_R_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('R', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row S
    FOREACH seat_num IN ARRAY row_S_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('S', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row T
    FOREACH seat_num IN ARRAY row_T_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('T', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row U
    FOREACH seat_num IN ARRAY row_U_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('U', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone Q: 306 seats
DO $$
DECLARE
    zone_id UUID := 'z3810000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone R: 297 seats
DO $$
DECLARE
    zone_id UUID := 'z3820000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone S: 297 seats
DO $$
DECLARE
    zone_id UUID := 'z3830000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;

-- Level 3 - Zone T: 297 seats
DO $$
DECLARE
    zone_id UUID := 'z3840000-0000-0000-0000-000000000000';
    tier_id UUID := '66666666-6666-6666-6666-666666666666';
    row_A_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_AA_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_B_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_C_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_D_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_E_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    row_F_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    row_G_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    row_H_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_I_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_J_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_K_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_L_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_M_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_N_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_O_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_P_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    row_Q_seats INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    seat_num INTEGER;
BEGIN
    -- Row A
    FOREACH seat_num IN ARRAY row_A_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('A', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row AA
    FOREACH seat_num IN ARRAY row_AA_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('AA', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row B
    FOREACH seat_num IN ARRAY row_B_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('B', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row C
    FOREACH seat_num IN ARRAY row_C_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('C', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row D
    FOREACH seat_num IN ARRAY row_D_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('D', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row E
    FOREACH seat_num IN ARRAY row_E_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('E', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row F
    FOREACH seat_num IN ARRAY row_F_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('F', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row G
    FOREACH seat_num IN ARRAY row_G_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('G', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row H
    FOREACH seat_num IN ARRAY row_H_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('H', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row I
    FOREACH seat_num IN ARRAY row_I_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('I', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row J
    FOREACH seat_num IN ARRAY row_J_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('J', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row K
    FOREACH seat_num IN ARRAY row_K_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('K', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row L
    FOREACH seat_num IN ARRAY row_L_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('L', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row M
    FOREACH seat_num IN ARRAY row_M_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('M', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row N
    FOREACH seat_num IN ARRAY row_N_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('N', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row O
    FOREACH seat_num IN ARRAY row_O_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('O', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row P
    FOREACH seat_num IN ARRAY row_P_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('P', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

    -- Row Q
    FOREACH seat_num IN ARRAY row_Q_seats LOOP
        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
        VALUES ('Q', seat_num, tier_id, zone_id, FALSE);
    END LOOP;

END $$;


-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Verify seat counts per zone
SELECT 'ZONE SEAT COUNTS' as info;
SELECT 
    z.level,
    z.name as zone,
    COUNT(s.id) as seat_count,
    z.capacity as expected_capacity,
    CASE 
        WHEN COUNT(s.id) = z.capacity THEN '✓ CORRECT'
        ELSE '✗ MISMATCH'
    END as status
FROM zones z
LEFT JOIN seats s ON z.id = s.zone_id
GROUP BY z.level, z.name, z.capacity
ORDER BY z.level, z.name;

-- Total seats by level
SELECT 'TOTAL SEATS BY LEVEL' as info;
SELECT 
    z.level,
    COUNT(s.id) as total_seats
FROM zones z
LEFT JOIN seats s ON z.id = s.zone_id
GROUP BY z.level
ORDER BY z.level;

-- Grand total
SELECT 'GRAND TOTAL' as info;
SELECT COUNT(*) as total_seats FROM seats;
