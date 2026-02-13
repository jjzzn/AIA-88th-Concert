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
