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

