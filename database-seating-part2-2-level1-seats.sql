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

