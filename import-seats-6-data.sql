    ('S007380', 'I-T-15', 'T', 15, false),
    ('S007381', 'I-T-16', 'T', 16, false),
    ('S007382', 'I-T-17', 'T', 17, false),
    ('S007383', 'I-T-18', 'T', 18, false),
    ('S007384', 'I-T-19', 'T', 19, false),
    ('S007385', 'I-T-20', 'T', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007386', 'I-U-01', 'U', 1, false),
    ('S007387', 'I-U-02', 'U', 2, false),
    ('S007388', 'I-U-03', 'U', 3, false),
    ('S007389', 'I-U-04', 'U', 4, false),
    ('S007390', 'I-U-05', 'U', 5, false),
    ('S007391', 'I-U-06', 'U', 6, false),
    ('S007392', 'I-U-07', 'U', 7, false),
    ('S007393', 'I-U-08', 'U', 8, false),
    ('S007394', 'I-U-09', 'U', 9, false),
    ('S007395', 'I-U-10', 'U', 10, false),
    ('S007396', 'I-U-11', 'U', 11, false),
    ('S007397', 'I-U-12', 'U', 12, false),
    ('S007398', 'I-U-13', 'U', 13, false),
    ('S007399', 'I-U-14', 'U', 14, false),
    ('S007400', 'I-U-15', 'U', 15, false),
    ('S007401', 'I-U-16', 'U', 16, false),
    ('S007402', 'I-U-17', 'U', 17, false),
    ('S007403', 'I-U-18', 'U', 18, false),
    ('S007404', 'I-U-19', 'U', 19, false),
    ('S007405', 'I-U-20', 'U', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE J (264 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007406', 'J-A-01', 'A', 1, false),
    ('S007407', 'J-A-02', 'A', 2, false),
    ('S007408', 'J-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007409', 'J-B-01', 'B', 1, false),
    ('S007410', 'J-B-02', 'B', 2, false),
    ('S007411', 'J-B-03', 'B', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007412', 'J-C-01', 'C', 1, false),
    ('S007413', 'J-C-02', 'C', 2, false),
    ('S007414', 'J-C-03', 'C', 3, false),
    ('S007415', 'J-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007416', 'J-D-01', 'D', 1, false),
    ('S007417', 'J-D-02', 'D', 2, false),
    ('S007418', 'J-D-03', 'D', 3, false),
    ('S007419', 'J-D-04', 'D', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007420', 'J-E-01', 'E', 1, false),
    ('S007421', 'J-E-02', 'E', 2, false),
    ('S007422', 'J-E-03', 'E', 3, false),
    ('S007423', 'J-E-04', 'E', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007424', 'J-F-01', 'F', 1, false),
    ('S007425', 'J-F-02', 'F', 2, false),
    ('S007426', 'J-F-03', 'F', 3, false),
    ('S007427', 'J-F-04', 'F', 4, false),
    ('S007428', 'J-F-05', 'F', 5, false),
    ('S007429', 'J-F-06', 'F', 6, false),
    ('S007430', 'J-F-07', 'F', 7, false),
    ('S007431', 'J-F-08', 'F', 8, false),
    ('S007432', 'J-F-09', 'F', 9, false),
    ('S007433', 'J-F-10', 'F', 10, false),
    ('S007434', 'J-F-11', 'F', 11, false),
    ('S007435', 'J-F-12', 'F', 12, false),
    ('S007436', 'J-F-13', 'F', 13, false),
    ('S007437', 'J-F-14', 'F', 14, false),
    ('S007438', 'J-F-15', 'F', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007439', 'J-G-01', 'G', 1, false),
    ('S007440', 'J-G-02', 'G', 2, false),
    ('S007441', 'J-G-03', 'G', 3, false),
    ('S007442', 'J-G-04', 'G', 4, false),
    ('S007443', 'J-G-05', 'G', 5, false),
    ('S007444', 'J-G-06', 'G', 6, false),
    ('S007445', 'J-G-07', 'G', 7, false),
    ('S007446', 'J-G-08', 'G', 8, false),
    ('S007447', 'J-G-09', 'G', 9, false),
    ('S007448', 'J-G-10', 'G', 10, false),
    ('S007449', 'J-G-11', 'G', 11, false),
    ('S007450', 'J-G-12', 'G', 12, false),
    ('S007451', 'J-G-13', 'G', 13, false),
    ('S007452', 'J-G-14', 'G', 14, false),
    ('S007453', 'J-G-15', 'G', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007454', 'J-H-01', 'H', 1, false),
    ('S007455', 'J-H-02', 'H', 2, false),
    ('S007456', 'J-H-03', 'H', 3, false),
    ('S007457', 'J-H-04', 'H', 4, false),
    ('S007458', 'J-H-05', 'H', 5, false),
    ('S007459', 'J-H-06', 'H', 6, false),
    ('S007460', 'J-H-07', 'H', 7, false),
    ('S007461', 'J-H-08', 'H', 8, false),
    ('S007462', 'J-H-09', 'H', 9, false),
    ('S007463', 'J-H-10', 'H', 10, false),
    ('S007464', 'J-H-11', 'H', 11, false),
    ('S007465', 'J-H-12', 'H', 12, false),
    ('S007466', 'J-H-13', 'H', 13, false),
    ('S007467', 'J-H-14', 'H', 14, false),
    ('S007468', 'J-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007469', 'J-I-01', 'I', 1, false),
    ('S007470', 'J-I-02', 'I', 2, false),
    ('S007471', 'J-I-03', 'I', 3, false),
    ('S007472', 'J-I-04', 'I', 4, false),
    ('S007473', 'J-I-05', 'I', 5, false),
    ('S007474', 'J-I-06', 'I', 6, false),
    ('S007475', 'J-I-07', 'I', 7, false),
    ('S007476', 'J-I-08', 'I', 8, false),
    ('S007477', 'J-I-09', 'I', 9, false),
    ('S007478', 'J-I-10', 'I', 10, false),
    ('S007479', 'J-I-11', 'I', 11, false),
    ('S007480', 'J-I-12', 'I', 12, false),
    ('S007481', 'J-I-13', 'I', 13, false),
    ('S007482', 'J-I-14', 'I', 14, false),
    ('S007483', 'J-I-15', 'I', 15, false),
    ('S007484', 'J-I-16', 'I', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007485', 'J-J-01', 'J', 1, false),
    ('S007486', 'J-J-02', 'J', 2, false),
    ('S007487', 'J-J-03', 'J', 3, false),
    ('S007488', 'J-J-04', 'J', 4, false),
    ('S007489', 'J-J-05', 'J', 5, false),
    ('S007490', 'J-J-06', 'J', 6, false),
    ('S007491', 'J-J-07', 'J', 7, false),
    ('S007492', 'J-J-08', 'J', 8, false),
    ('S007493', 'J-J-09', 'J', 9, false),
    ('S007494', 'J-J-10', 'J', 10, false),
    ('S007495', 'J-J-11', 'J', 11, false),
    ('S007496', 'J-J-12', 'J', 12, false),
    ('S007497', 'J-J-13', 'J', 13, false),
    ('S007498', 'J-J-14', 'J', 14, false),
    ('S007499', 'J-J-15', 'J', 15, false),
    ('S007500', 'J-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007501', 'J-K-01', 'K', 1, false),
    ('S007502', 'J-K-02', 'K', 2, false),
    ('S007503', 'J-K-03', 'K', 3, false),
    ('S007504', 'J-K-04', 'K', 4, false),
    ('S007505', 'J-K-05', 'K', 5, false),
    ('S007506', 'J-K-06', 'K', 6, false),
    ('S007507', 'J-K-07', 'K', 7, false),
    ('S007508', 'J-K-08', 'K', 8, false),
    ('S007509', 'J-K-09', 'K', 9, false),
    ('S007510', 'J-K-10', 'K', 10, false),
    ('S007511', 'J-K-11', 'K', 11, false),
    ('S007512', 'J-K-12', 'K', 12, false),
    ('S007513', 'J-K-13', 'K', 13, false),
    ('S007514', 'J-K-14', 'K', 14, false),
    ('S007515', 'J-K-15', 'K', 15, false),
    ('S007516', 'J-K-16', 'K', 16, false),
    ('S007517', 'J-K-17', 'K', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007518', 'J-L-01', 'L', 1, false),
    ('S007519', 'J-L-02', 'L', 2, false),
    ('S007520', 'J-L-03', 'L', 3, false),
    ('S007521', 'J-L-04', 'L', 4, false),
    ('S007522', 'J-L-05', 'L', 5, false),
    ('S007523', 'J-L-06', 'L', 6, false),
    ('S007524', 'J-L-07', 'L', 7, false),
    ('S007525', 'J-L-08', 'L', 8, false),
    ('S007526', 'J-L-09', 'L', 9, false),
    ('S007527', 'J-L-10', 'L', 10, false),
    ('S007528', 'J-L-11', 'L', 11, false),
    ('S007529', 'J-L-12', 'L', 12, false),
    ('S007530', 'J-L-13', 'L', 13, false),
    ('S007531', 'J-L-14', 'L', 14, false),
    ('S007532', 'J-L-15', 'L', 15, false),
    ('S007533', 'J-L-16', 'L', 16, false),
    ('S007534', 'J-L-17', 'L', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007535', 'J-M-01', 'M', 1, false),
    ('S007536', 'J-M-02', 'M', 2, false),
    ('S007537', 'J-M-03', 'M', 3, false),
    ('S007538', 'J-M-04', 'M', 4, false),
    ('S007539', 'J-M-05', 'M', 5, false),
    ('S007540', 'J-M-06', 'M', 6, false),
    ('S007541', 'J-M-07', 'M', 7, false),
    ('S007542', 'J-M-08', 'M', 8, false),
    ('S007543', 'J-M-09', 'M', 9, false),
    ('S007544', 'J-M-10', 'M', 10, false),
    ('S007545', 'J-M-11', 'M', 11, false),
    ('S007546', 'J-M-12', 'M', 12, false),
    ('S007547', 'J-M-13', 'M', 13, false),
    ('S007548', 'J-M-14', 'M', 14, false),
    ('S007549', 'J-M-15', 'M', 15, false),
    ('S007550', 'J-M-16', 'M', 16, false),
    ('S007551', 'J-M-17', 'M', 17, false),
    ('S007552', 'J-M-18', 'M', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007553', 'J-N-01', 'N', 1, false),
    ('S007554', 'J-N-02', 'N', 2, false),
    ('S007555', 'J-N-03', 'N', 3, false),
    ('S007556', 'J-N-04', 'N', 4, false),
    ('S007557', 'J-N-05', 'N', 5, false),
    ('S007558', 'J-N-06', 'N', 6, false),
    ('S007559', 'J-N-07', 'N', 7, false),
    ('S007560', 'J-N-08', 'N', 8, false),
    ('S007561', 'J-N-09', 'N', 9, false),
    ('S007562', 'J-N-10', 'N', 10, false),
    ('S007563', 'J-N-11', 'N', 11, false),
    ('S007564', 'J-N-12', 'N', 12, false),
    ('S007565', 'J-N-13', 'N', 13, false),
    ('S007566', 'J-N-14', 'N', 14, false),
    ('S007567', 'J-N-15', 'N', 15, false),
    ('S007568', 'J-N-16', 'N', 16, false),
    ('S007569', 'J-N-17', 'N', 17, false),
    ('S007570', 'J-N-18', 'N', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007571', 'J-O-01', 'O', 1, false),
    ('S007572', 'J-O-02', 'O', 2, false),
    ('S007573', 'J-O-03', 'O', 3, false),
    ('S007574', 'J-O-04', 'O', 4, false),
    ('S007575', 'J-O-05', 'O', 5, false),
    ('S007576', 'J-O-06', 'O', 6, false),
    ('S007577', 'J-O-07', 'O', 7, false),
    ('S007578', 'J-O-08', 'O', 8, false),
    ('S007579', 'J-O-09', 'O', 9, false),
    ('S007580', 'J-O-10', 'O', 10, false),
    ('S007581', 'J-O-11', 'O', 11, false),
    ('S007582', 'J-O-12', 'O', 12, false),
    ('S007583', 'J-O-13', 'O', 13, false),
    ('S007584', 'J-O-14', 'O', 14, false),
    ('S007585', 'J-O-15', 'O', 15, false),
    ('S007586', 'J-O-16', 'O', 16, false),
    ('S007587', 'J-O-17', 'O', 17, false),
    ('S007588', 'J-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007589', 'J-P-01', 'P', 1, false),
    ('S007590', 'J-P-02', 'P', 2, false),
    ('S007591', 'J-P-03', 'P', 3, false),
    ('S007592', 'J-P-04', 'P', 4, false),
    ('S007593', 'J-P-05', 'P', 5, false),
    ('S007594', 'J-P-06', 'P', 6, false),
    ('S007595', 'J-P-07', 'P', 7, false),
    ('S007596', 'J-P-08', 'P', 8, false),
    ('S007597', 'J-P-09', 'P', 9, false),
    ('S007598', 'J-P-10', 'P', 10, false),
    ('S007599', 'J-P-11', 'P', 11, false),
    ('S007600', 'J-P-12', 'P', 12, false),
    ('S007601', 'J-P-13', 'P', 13, false),
    ('S007602', 'J-P-14', 'P', 14, false),
    ('S007603', 'J-P-15', 'P', 15, false),
    ('S007604', 'J-P-16', 'P', 16, false),
    ('S007605', 'J-P-17', 'P', 17, false),
    ('S007606', 'J-P-18', 'P', 18, false),
    ('S007607', 'J-P-19', 'P', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (9 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007608', 'J-Q-01', 'Q', 1, false),
    ('S007609', 'J-Q-02', 'Q', 2, false),
    ('S007610', 'J-Q-03', 'Q', 3, false),
    ('S007611', 'J-Q-04', 'Q', 4, false),
    ('S007612', 'J-Q-05', 'Q', 5, false),
    ('S007613', 'J-Q-06', 'Q', 6, false),
    ('S007614', 'J-Q-07', 'Q', 7, false),
    ('S007615', 'J-Q-08', 'Q', 8, false),
    ('S007616', 'J-Q-09', 'Q', 9, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007617', 'J-R-01', 'R', 1, false),
    ('S007618', 'J-R-02', 'R', 2, false),
    ('S007619', 'J-R-03', 'R', 3, false),
    ('S007620', 'J-R-04', 'R', 4, false),
    ('S007621', 'J-R-05', 'R', 5, false),
    ('S007622', 'J-R-06', 'R', 6, false),
    ('S007623', 'J-R-07', 'R', 7, false),
    ('S007624', 'J-R-08', 'R', 8, false),
    ('S007625', 'J-R-09', 'R', 9, false),
    ('S007626', 'J-R-10', 'R', 10, false),
    ('S007627', 'J-R-11', 'R', 11, false),
    ('S007628', 'J-R-12', 'R', 12, false),
    ('S007629', 'J-R-13', 'R', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007630', 'J-S-01', 'S', 1, false),
    ('S007631', 'J-S-02', 'S', 2, false),
    ('S007632', 'J-S-03', 'S', 3, false),
    ('S007633', 'J-S-04', 'S', 4, false),
    ('S007634', 'J-S-05', 'S', 5, false),
    ('S007635', 'J-S-06', 'S', 6, false),
    ('S007636', 'J-S-07', 'S', 7, false),
    ('S007637', 'J-S-08', 'S', 8, false),
    ('S007638', 'J-S-09', 'S', 9, false),
    ('S007639', 'J-S-10', 'S', 10, false),
    ('S007640', 'J-S-11', 'S', 11, false),
    ('S007641', 'J-S-12', 'S', 12, false),
    ('S007642', 'J-S-13', 'S', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007643', 'J-T-01', 'T', 1, false),
    ('S007644', 'J-T-02', 'T', 2, false),
    ('S007645', 'J-T-03', 'T', 3, false),
    ('S007646', 'J-T-04', 'T', 4, false),
    ('S007647', 'J-T-05', 'T', 5, false),
    ('S007648', 'J-T-06', 'T', 6, false),
    ('S007649', 'J-T-07', 'T', 7, false),
    ('S007650', 'J-T-08', 'T', 8, false),
    ('S007651', 'J-T-09', 'T', 9, false),
    ('S007652', 'J-T-10', 'T', 10, false),
    ('S007653', 'J-T-11', 'T', 11, false),
    ('S007654', 'J-T-12', 'T', 12, false),
    ('S007655', 'J-T-13', 'T', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (14 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007656', 'J-U-01', 'U', 1, false),
    ('S007657', 'J-U-02', 'U', 2, false),
    ('S007658', 'J-U-03', 'U', 3, false),
    ('S007659', 'J-U-04', 'U', 4, false),
    ('S007660', 'J-U-05', 'U', 5, false),
    ('S007661', 'J-U-06', 'U', 6, false),
    ('S007662', 'J-U-07', 'U', 7, false),
    ('S007663', 'J-U-08', 'U', 8, false),
    ('S007664', 'J-U-09', 'U', 9, false),
    ('S007665', 'J-U-10', 'U', 10, false),
    ('S007666', 'J-U-11', 'U', 11, false),
    ('S007667', 'J-U-12', 'U', 12, false),
    ('S007668', 'J-U-13', 'U', 13, false),
    ('S007669', 'J-U-14', 'U', 14, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE J'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE K (198 seats)
-- Row A (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007670', 'K-A-01', 'A', 1, false),
    ('S007671', 'K-A-02', 'A', 2, false),
    ('S007672', 'K-A-03', 'A', 3, false),
    ('S007673', 'K-A-04', 'A', 4, false),
    ('S007674', 'K-A-05', 'A', 5, false),
    ('S007675', 'K-A-06', 'A', 6, false),
    ('S007676', 'K-A-07', 'A', 7, false),
    ('S007677', 'K-A-08', 'A', 8, false),
    ('S007678', 'K-A-09', 'A', 9, false),
    ('S007679', 'K-A-10', 'A', 10, false),
    ('S007680', 'K-A-11', 'A', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (9 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007681', 'K-AA-01', 'AA', 1, false),
    ('S007682', 'K-AA-02', 'AA', 2, false),
    ('S007683', 'K-AA-03', 'AA', 3, false),
    ('S007684', 'K-AA-04', 'AA', 4, false),
    ('S007685', 'K-AA-05', 'AA', 5, false),
    ('S007686', 'K-AA-06', 'AA', 6, false),
    ('S007687', 'K-AA-07', 'AA', 7, false),
    ('S007688', 'K-AA-08', 'AA', 8, false),
    ('S007689', 'K-AA-09', 'AA', 9, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007690', 'K-B-01', 'B', 1, false),
    ('S007691', 'K-B-02', 'B', 2, false),
    ('S007692', 'K-B-03', 'B', 3, false),
    ('S007693', 'K-B-04', 'B', 4, false),
    ('S007694', 'K-B-05', 'B', 5, false),
    ('S007695', 'K-B-06', 'B', 6, false),
    ('S007696', 'K-B-07', 'B', 7, false),
    ('S007697', 'K-B-08', 'B', 8, false),
    ('S007698', 'K-B-09', 'B', 9, false),
    ('S007699', 'K-B-10', 'B', 10, false),
    ('S007700', 'K-B-11', 'B', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007701', 'K-C-01', 'C', 1, false),
    ('S007702', 'K-C-02', 'C', 2, false),
    ('S007703', 'K-C-03', 'C', 3, false),
    ('S007704', 'K-C-04', 'C', 4, false),
    ('S007705', 'K-C-05', 'C', 5, false),
    ('S007706', 'K-C-06', 'C', 6, false),
    ('S007707', 'K-C-07', 'C', 7, false),
    ('S007708', 'K-C-08', 'C', 8, false),
    ('S007709', 'K-C-09', 'C', 9, false),
    ('S007710', 'K-C-10', 'C', 10, false),
    ('S007711', 'K-C-11', 'C', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007712', 'K-D-01', 'D', 1, false),
    ('S007713', 'K-D-02', 'D', 2, false),
    ('S007714', 'K-D-03', 'D', 3, false),
    ('S007715', 'K-D-04', 'D', 4, false),
    ('S007716', 'K-D-05', 'D', 5, false),
    ('S007717', 'K-D-06', 'D', 6, false),
    ('S007718', 'K-D-07', 'D', 7, false),
    ('S007719', 'K-D-08', 'D', 8, false),
    ('S007720', 'K-D-09', 'D', 9, false),
    ('S007721', 'K-D-10', 'D', 10, false),
    ('S007722', 'K-D-11', 'D', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007723', 'K-E-01', 'E', 1, false),
    ('S007724', 'K-E-02', 'E', 2, false),
    ('S007725', 'K-E-03', 'E', 3, false),
    ('S007726', 'K-E-04', 'E', 4, false),
    ('S007727', 'K-E-05', 'E', 5, false),
    ('S007728', 'K-E-06', 'E', 6, false),
    ('S007729', 'K-E-07', 'E', 7, false),
    ('S007730', 'K-E-08', 'E', 8, false),
    ('S007731', 'K-E-09', 'E', 9, false),
    ('S007732', 'K-E-10', 'E', 10, false),
    ('S007733', 'K-E-11', 'E', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007734', 'K-F-01', 'F', 1, false),
    ('S007735', 'K-F-02', 'F', 2, false),
    ('S007736', 'K-F-03', 'F', 3, false),
    ('S007737', 'K-F-04', 'F', 4, false),
    ('S007738', 'K-F-05', 'F', 5, false),
    ('S007739', 'K-F-06', 'F', 6, false),
    ('S007740', 'K-F-07', 'F', 7, false),
    ('S007741', 'K-F-08', 'F', 8, false),
    ('S007742', 'K-F-09', 'F', 9, false),
    ('S007743', 'K-F-10', 'F', 10, false),
    ('S007744', 'K-F-11', 'F', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007745', 'K-G-01', 'G', 1, false),
    ('S007746', 'K-G-02', 'G', 2, false),
    ('S007747', 'K-G-03', 'G', 3, false),
    ('S007748', 'K-G-04', 'G', 4, false),
    ('S007749', 'K-G-05', 'G', 5, false),
    ('S007750', 'K-G-06', 'G', 6, false),
    ('S007751', 'K-G-07', 'G', 7, false),
    ('S007752', 'K-G-08', 'G', 8, false),
    ('S007753', 'K-G-09', 'G', 9, false),
    ('S007754', 'K-G-10', 'G', 10, false),
    ('S007755', 'K-G-11', 'G', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007756', 'K-H-01', 'H', 1, false),
    ('S007757', 'K-H-02', 'H', 2, false),
    ('S007758', 'K-H-03', 'H', 3, false),
    ('S007759', 'K-H-04', 'H', 4, false),
    ('S007760', 'K-H-05', 'H', 5, false),
    ('S007761', 'K-H-06', 'H', 6, false),
    ('S007762', 'K-H-07', 'H', 7, false),
    ('S007763', 'K-H-08', 'H', 8, false),
    ('S007764', 'K-H-09', 'H', 9, false),
    ('S007765', 'K-H-10', 'H', 10, false),
    ('S007766', 'K-H-11', 'H', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007767', 'K-I-01', 'I', 1, false),
    ('S007768', 'K-I-02', 'I', 2, false),
    ('S007769', 'K-I-03', 'I', 3, false),
    ('S007770', 'K-I-04', 'I', 4, false),
    ('S007771', 'K-I-05', 'I', 5, false),
    ('S007772', 'K-I-06', 'I', 6, false),
    ('S007773', 'K-I-07', 'I', 7, false),
    ('S007774', 'K-I-08', 'I', 8, false),
    ('S007775', 'K-I-09', 'I', 9, false),
    ('S007776', 'K-I-10', 'I', 10, false),
    ('S007777', 'K-I-11', 'I', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007778', 'K-J-01', 'J', 1, false),
    ('S007779', 'K-J-02', 'J', 2, false),
    ('S007780', 'K-J-03', 'J', 3, false),
    ('S007781', 'K-J-04', 'J', 4, false),
    ('S007782', 'K-J-05', 'J', 5, false),
    ('S007783', 'K-J-06', 'J', 6, false),
    ('S007784', 'K-J-07', 'J', 7, false),
    ('S007785', 'K-J-08', 'J', 8, false),
    ('S007786', 'K-J-09', 'J', 9, false),
    ('S007787', 'K-J-10', 'J', 10, false),
    ('S007788', 'K-J-11', 'J', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007789', 'K-K-01', 'K', 1, false),
    ('S007790', 'K-K-02', 'K', 2, false),
    ('S007791', 'K-K-03', 'K', 3, false),
    ('S007792', 'K-K-04', 'K', 4, false),
    ('S007793', 'K-K-05', 'K', 5, false),
    ('S007794', 'K-K-06', 'K', 6, false),
    ('S007795', 'K-K-07', 'K', 7, false),
    ('S007796', 'K-K-08', 'K', 8, false),
    ('S007797', 'K-K-09', 'K', 9, false),
    ('S007798', 'K-K-10', 'K', 10, false),
    ('S007799', 'K-K-11', 'K', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007800', 'K-L-01', 'L', 1, false),
    ('S007801', 'K-L-02', 'L', 2, false),
    ('S007802', 'K-L-03', 'L', 3, false),
    ('S007803', 'K-L-04', 'L', 4, false),
    ('S007804', 'K-L-05', 'L', 5, false),
    ('S007805', 'K-L-06', 'L', 6, false),
    ('S007806', 'K-L-07', 'L', 7, false),
    ('S007807', 'K-L-08', 'L', 8, false),
    ('S007808', 'K-L-09', 'L', 9, false),
    ('S007809', 'K-L-10', 'L', 10, false),
    ('S007810', 'K-L-11', 'L', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007811', 'K-M-01', 'M', 1, false),
    ('S007812', 'K-M-02', 'M', 2, false),
    ('S007813', 'K-M-03', 'M', 3, false),
    ('S007814', 'K-M-04', 'M', 4, false),
    ('S007815', 'K-M-05', 'M', 5, false),
    ('S007816', 'K-M-06', 'M', 6, false),
    ('S007817', 'K-M-07', 'M', 7, false),
    ('S007818', 'K-M-08', 'M', 8, false),
    ('S007819', 'K-M-09', 'M', 9, false),
    ('S007820', 'K-M-10', 'M', 10, false),
    ('S007821', 'K-M-11', 'M', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007822', 'K-N-01', 'N', 1, false),
    ('S007823', 'K-N-02', 'N', 2, false),
    ('S007824', 'K-N-03', 'N', 3, false),
    ('S007825', 'K-N-04', 'N', 4, false),
    ('S007826', 'K-N-05', 'N', 5, false),
    ('S007827', 'K-N-06', 'N', 6, false),
    ('S007828', 'K-N-07', 'N', 7, false),
    ('S007829', 'K-N-08', 'N', 8, false),
    ('S007830', 'K-N-09', 'N', 9, false),
    ('S007831', 'K-N-10', 'N', 10, false),
    ('S007832', 'K-N-11', 'N', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007833', 'K-O-01', 'O', 1, false),
    ('S007834', 'K-O-02', 'O', 2, false),
    ('S007835', 'K-O-03', 'O', 3, false),
    ('S007836', 'K-O-04', 'O', 4, false),
    ('S007837', 'K-O-05', 'O', 5, false),
    ('S007838', 'K-O-06', 'O', 6, false),
    ('S007839', 'K-O-07', 'O', 7, false),
    ('S007840', 'K-O-08', 'O', 8, false),
    ('S007841', 'K-O-09', 'O', 9, false),
    ('S007842', 'K-O-10', 'O', 10, false),
    ('S007843', 'K-O-11', 'O', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007844', 'K-P-01', 'P', 1, false),
    ('S007845', 'K-P-02', 'P', 2, false),
    ('S007846', 'K-P-03', 'P', 3, false),
    ('S007847', 'K-P-04', 'P', 4, false),
    ('S007848', 'K-P-05', 'P', 5, false),
    ('S007849', 'K-P-06', 'P', 6, false),
    ('S007850', 'K-P-07', 'P', 7, false),
    ('S007851', 'K-P-08', 'P', 8, false),
    ('S007852', 'K-P-09', 'P', 9, false),
    ('S007853', 'K-P-10', 'P', 10, false),
    ('S007854', 'K-P-11', 'P', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007855', 'K-Q-01', 'Q', 1, false),
    ('S007856', 'K-Q-02', 'Q', 2, false),
    ('S007857', 'K-Q-03', 'Q', 3, false),
    ('S007858', 'K-Q-04', 'Q', 4, false),
    ('S007859', 'K-Q-05', 'Q', 5, false),
    ('S007860', 'K-Q-06', 'Q', 6, false),
    ('S007861', 'K-Q-07', 'Q', 7, false),
    ('S007862', 'K-Q-08', 'Q', 8, false),
    ('S007863', 'K-Q-09', 'Q', 9, false),
    ('S007864', 'K-Q-10', 'Q', 10, false),
    ('S007865', 'K-Q-11', 'Q', 11, false),
    ('S007866', 'K-Q-12', 'Q', 12, false),
    ('S007867', 'K-Q-13', 'Q', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE K'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE L (264 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007868', 'L-A-01', 'A', 1, false),
    ('S007869', 'L-A-02', 'A', 2, false),
    ('S007870', 'L-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007871', 'L-B-01', 'B', 1, false),
    ('S007872', 'L-B-02', 'B', 2, false),
    ('S007873', 'L-B-03', 'B', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007874', 'L-C-01', 'C', 1, false),
    ('S007875', 'L-C-02', 'C', 2, false),
    ('S007876', 'L-C-03', 'C', 3, false),
    ('S007877', 'L-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007878', 'L-D-01', 'D', 1, false),
    ('S007879', 'L-D-02', 'D', 2, false),
    ('S007880', 'L-D-03', 'D', 3, false),
    ('S007881', 'L-D-04', 'D', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007882', 'L-E-01', 'E', 1, false),
    ('S007883', 'L-E-02', 'E', 2, false),
    ('S007884', 'L-E-03', 'E', 3, false),
    ('S007885', 'L-E-04', 'E', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007886', 'L-F-01', 'F', 1, false),
    ('S007887', 'L-F-02', 'F', 2, false),
    ('S007888', 'L-F-03', 'F', 3, false),
    ('S007889', 'L-F-04', 'F', 4, false),
    ('S007890', 'L-F-05', 'F', 5, false),
    ('S007891', 'L-F-06', 'F', 6, false),
    ('S007892', 'L-F-07', 'F', 7, false),
    ('S007893', 'L-F-08', 'F', 8, false),
    ('S007894', 'L-F-09', 'F', 9, false),
    ('S007895', 'L-F-10', 'F', 10, false),
    ('S007896', 'L-F-11', 'F', 11, false),
    ('S007897', 'L-F-12', 'F', 12, false),
    ('S007898', 'L-F-13', 'F', 13, false),
    ('S007899', 'L-F-14', 'F', 14, false),
    ('S007900', 'L-F-15', 'F', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007901', 'L-G-01', 'G', 1, false),
    ('S007902', 'L-G-02', 'G', 2, false),
    ('S007903', 'L-G-03', 'G', 3, false),
    ('S007904', 'L-G-04', 'G', 4, false),
    ('S007905', 'L-G-05', 'G', 5, false),
    ('S007906', 'L-G-06', 'G', 6, false),
    ('S007907', 'L-G-07', 'G', 7, false),
    ('S007908', 'L-G-08', 'G', 8, false),
    ('S007909', 'L-G-09', 'G', 9, false),
    ('S007910', 'L-G-10', 'G', 10, false),
    ('S007911', 'L-G-11', 'G', 11, false),
    ('S007912', 'L-G-12', 'G', 12, false),
    ('S007913', 'L-G-13', 'G', 13, false),
    ('S007914', 'L-G-14', 'G', 14, false),
    ('S007915', 'L-G-15', 'G', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007916', 'L-H-01', 'H', 1, false),
    ('S007917', 'L-H-02', 'H', 2, false),
    ('S007918', 'L-H-03', 'H', 3, false),
    ('S007919', 'L-H-04', 'H', 4, false),
    ('S007920', 'L-H-05', 'H', 5, false),
    ('S007921', 'L-H-06', 'H', 6, false),
    ('S007922', 'L-H-07', 'H', 7, false),
    ('S007923', 'L-H-08', 'H', 8, false),
    ('S007924', 'L-H-09', 'H', 9, false),
    ('S007925', 'L-H-10', 'H', 10, false),
    ('S007926', 'L-H-11', 'H', 11, false),
    ('S007927', 'L-H-12', 'H', 12, false),
    ('S007928', 'L-H-13', 'H', 13, false),
    ('S007929', 'L-H-14', 'H', 14, false),
    ('S007930', 'L-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007931', 'L-I-01', 'I', 1, false),
    ('S007932', 'L-I-02', 'I', 2, false),
    ('S007933', 'L-I-03', 'I', 3, false),
    ('S007934', 'L-I-04', 'I', 4, false),
    ('S007935', 'L-I-05', 'I', 5, false),
    ('S007936', 'L-I-06', 'I', 6, false),
    ('S007937', 'L-I-07', 'I', 7, false),
    ('S007938', 'L-I-08', 'I', 8, false),
    ('S007939', 'L-I-09', 'I', 9, false),
    ('S007940', 'L-I-10', 'I', 10, false),
    ('S007941', 'L-I-11', 'I', 11, false),
    ('S007942', 'L-I-12', 'I', 12, false),
    ('S007943', 'L-I-13', 'I', 13, false),
    ('S007944', 'L-I-14', 'I', 14, false),
    ('S007945', 'L-I-15', 'I', 15, false),
    ('S007946', 'L-I-16', 'I', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007947', 'L-J-01', 'J', 1, false),
    ('S007948', 'L-J-02', 'J', 2, false),
    ('S007949', 'L-J-03', 'J', 3, false),
    ('S007950', 'L-J-04', 'J', 4, false),
    ('S007951', 'L-J-05', 'J', 5, false),
    ('S007952', 'L-J-06', 'J', 6, false),
    ('S007953', 'L-J-07', 'J', 7, false),
    ('S007954', 'L-J-08', 'J', 8, false),
    ('S007955', 'L-J-09', 'J', 9, false),
    ('S007956', 'L-J-10', 'J', 10, false),
    ('S007957', 'L-J-11', 'J', 11, false),
    ('S007958', 'L-J-12', 'J', 12, false),
    ('S007959', 'L-J-13', 'J', 13, false),
    ('S007960', 'L-J-14', 'J', 14, false),
    ('S007961', 'L-J-15', 'J', 15, false),
    ('S007962', 'L-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007963', 'L-K-01', 'K', 1, false),
    ('S007964', 'L-K-02', 'K', 2, false),
    ('S007965', 'L-K-03', 'K', 3, false),
    ('S007966', 'L-K-04', 'K', 4, false),
    ('S007967', 'L-K-05', 'K', 5, false),
    ('S007968', 'L-K-06', 'K', 6, false),
    ('S007969', 'L-K-07', 'K', 7, false),
    ('S007970', 'L-K-08', 'K', 8, false),
    ('S007971', 'L-K-09', 'K', 9, false),
    ('S007972', 'L-K-10', 'K', 10, false),
    ('S007973', 'L-K-11', 'K', 11, false),
    ('S007974', 'L-K-12', 'K', 12, false),
    ('S007975', 'L-K-13', 'K', 13, false),
    ('S007976', 'L-K-14', 'K', 14, false),
    ('S007977', 'L-K-15', 'K', 15, false),
    ('S007978', 'L-K-16', 'K', 16, false),
    ('S007979', 'L-K-17', 'K', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007980', 'L-L-01', 'L', 1, false),
    ('S007981', 'L-L-02', 'L', 2, false),
    ('S007982', 'L-L-03', 'L', 3, false),
    ('S007983', 'L-L-04', 'L', 4, false),
    ('S007984', 'L-L-05', 'L', 5, false),
    ('S007985', 'L-L-06', 'L', 6, false),
    ('S007986', 'L-L-07', 'L', 7, false),
    ('S007987', 'L-L-08', 'L', 8, false),
    ('S007988', 'L-L-09', 'L', 9, false),
    ('S007989', 'L-L-10', 'L', 10, false),
    ('S007990', 'L-L-11', 'L', 11, false),
    ('S007991', 'L-L-12', 'L', 12, false),
    ('S007992', 'L-L-13', 'L', 13, false),
    ('S007993', 'L-L-14', 'L', 14, false),
    ('S007994', 'L-L-15', 'L', 15, false),
    ('S007995', 'L-L-16', 'L', 16, false),
    ('S007996', 'L-L-17', 'L', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007997', 'L-M-01', 'M', 1, false),
    ('S007998', 'L-M-02', 'M', 2, false),
    ('S007999', 'L-M-03', 'M', 3, false),
    ('S008000', 'L-M-04', 'M', 4, false),
    ('S008001', 'L-M-05', 'M', 5, false),
    ('S008002', 'L-M-06', 'M', 6, false),
    ('S008003', 'L-M-07', 'M', 7, false),
    ('S008004', 'L-M-08', 'M', 8, false),
    ('S008005', 'L-M-09', 'M', 9, false),
    ('S008006', 'L-M-10', 'M', 10, false),
    ('S008007', 'L-M-11', 'M', 11, false),
    ('S008008', 'L-M-12', 'M', 12, false),
    ('S008009', 'L-M-13', 'M', 13, false),
    ('S008010', 'L-M-14', 'M', 14, false),
    ('S008011', 'L-M-15', 'M', 15, false),
    ('S008012', 'L-M-16', 'M', 16, false),
    ('S008013', 'L-M-17', 'M', 17, false),
    ('S008014', 'L-M-18', 'M', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008015', 'L-N-01', 'N', 1, false),
    ('S008016', 'L-N-02', 'N', 2, false),
    ('S008017', 'L-N-03', 'N', 3, false),
    ('S008018', 'L-N-04', 'N', 4, false),
    ('S008019', 'L-N-05', 'N', 5, false),
    ('S008020', 'L-N-06', 'N', 6, false),
    ('S008021', 'L-N-07', 'N', 7, false),
    ('S008022', 'L-N-08', 'N', 8, false),
    ('S008023', 'L-N-09', 'N', 9, false),
    ('S008024', 'L-N-10', 'N', 10, false),
    ('S008025', 'L-N-11', 'N', 11, false),
    ('S008026', 'L-N-12', 'N', 12, false),
    ('S008027', 'L-N-13', 'N', 13, false),
    ('S008028', 'L-N-14', 'N', 14, false),
    ('S008029', 'L-N-15', 'N', 15, false),
    ('S008030', 'L-N-16', 'N', 16, false),
    ('S008031', 'L-N-17', 'N', 17, false),
    ('S008032', 'L-N-18', 'N', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008033', 'L-O-01', 'O', 1, false),
    ('S008034', 'L-O-02', 'O', 2, false),
    ('S008035', 'L-O-03', 'O', 3, false),
    ('S008036', 'L-O-04', 'O', 4, false),
    ('S008037', 'L-O-05', 'O', 5, false),
    ('S008038', 'L-O-06', 'O', 6, false),
    ('S008039', 'L-O-07', 'O', 7, false),
    ('S008040', 'L-O-08', 'O', 8, false),
    ('S008041', 'L-O-09', 'O', 9, false),
    ('S008042', 'L-O-10', 'O', 10, false),
    ('S008043', 'L-O-11', 'O', 11, false),
    ('S008044', 'L-O-12', 'O', 12, false),
    ('S008045', 'L-O-13', 'O', 13, false),
    ('S008046', 'L-O-14', 'O', 14, false),
    ('S008047', 'L-O-15', 'O', 15, false),
    ('S008048', 'L-O-16', 'O', 16, false),
    ('S008049', 'L-O-17', 'O', 17, false),
    ('S008050', 'L-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008051', 'L-P-01', 'P', 1, false),
    ('S008052', 'L-P-02', 'P', 2, false),
    ('S008053', 'L-P-03', 'P', 3, false),
    ('S008054', 'L-P-04', 'P', 4, false),
    ('S008055', 'L-P-05', 'P', 5, false),
    ('S008056', 'L-P-06', 'P', 6, false),
    ('S008057', 'L-P-07', 'P', 7, false),
    ('S008058', 'L-P-08', 'P', 8, false),
    ('S008059', 'L-P-09', 'P', 9, false),
    ('S008060', 'L-P-10', 'P', 10, false),
    ('S008061', 'L-P-11', 'P', 11, false),
    ('S008062', 'L-P-12', 'P', 12, false),
    ('S008063', 'L-P-13', 'P', 13, false),
    ('S008064', 'L-P-14', 'P', 14, false),
    ('S008065', 'L-P-15', 'P', 15, false),
    ('S008066', 'L-P-16', 'P', 16, false),
    ('S008067', 'L-P-17', 'P', 17, false),
    ('S008068', 'L-P-18', 'P', 18, false),
    ('S008069', 'L-P-19', 'P', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (9 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008070', 'L-Q-01', 'Q', 1, false),
    ('S008071', 'L-Q-02', 'Q', 2, false),
    ('S008072', 'L-Q-03', 'Q', 3, false),
    ('S008073', 'L-Q-04', 'Q', 4, false),
    ('S008074', 'L-Q-05', 'Q', 5, false),
    ('S008075', 'L-Q-06', 'Q', 6, false),
    ('S008076', 'L-Q-07', 'Q', 7, false),
    ('S008077', 'L-Q-08', 'Q', 8, false),
    ('S008078', 'L-Q-09', 'Q', 9, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008079', 'L-R-01', 'R', 1, false),
    ('S008080', 'L-R-02', 'R', 2, false),
    ('S008081', 'L-R-03', 'R', 3, false),
    ('S008082', 'L-R-04', 'R', 4, false),
    ('S008083', 'L-R-05', 'R', 5, false),
    ('S008084', 'L-R-06', 'R', 6, false),
    ('S008085', 'L-R-07', 'R', 7, false),
    ('S008086', 'L-R-08', 'R', 8, false),
    ('S008087', 'L-R-09', 'R', 9, false),
    ('S008088', 'L-R-10', 'R', 10, false),
    ('S008089', 'L-R-11', 'R', 11, false),
    ('S008090', 'L-R-12', 'R', 12, false),
    ('S008091', 'L-R-13', 'R', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008092', 'L-S-01', 'S', 1, false),
    ('S008093', 'L-S-02', 'S', 2, false),
    ('S008094', 'L-S-03', 'S', 3, false),
    ('S008095', 'L-S-04', 'S', 4, false),
    ('S008096', 'L-S-05', 'S', 5, false),
    ('S008097', 'L-S-06', 'S', 6, false),
    ('S008098', 'L-S-07', 'S', 7, false),
    ('S008099', 'L-S-08', 'S', 8, false),
    ('S008100', 'L-S-09', 'S', 9, false),
    ('S008101', 'L-S-10', 'S', 10, false),
    ('S008102', 'L-S-11', 'S', 11, false),
    ('S008103', 'L-S-12', 'S', 12, false),
    ('S008104', 'L-S-13', 'S', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008105', 'L-T-01', 'T', 1, false),
    ('S008106', 'L-T-02', 'T', 2, false),
    ('S008107', 'L-T-03', 'T', 3, false),
    ('S008108', 'L-T-04', 'T', 4, false),
    ('S008109', 'L-T-05', 'T', 5, false),
    ('S008110', 'L-T-06', 'T', 6, false),
    ('S008111', 'L-T-07', 'T', 7, false),
    ('S008112', 'L-T-08', 'T', 8, false),
    ('S008113', 'L-T-09', 'T', 9, false),
    ('S008114', 'L-T-10', 'T', 10, false),
    ('S008115', 'L-T-11', 'T', 11, false),
    ('S008116', 'L-T-12', 'T', 12, false),
    ('S008117', 'L-T-13', 'T', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (14 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008118', 'L-U-01', 'U', 1, false),
    ('S008119', 'L-U-02', 'U', 2, false),
    ('S008120', 'L-U-03', 'U', 3, false),
    ('S008121', 'L-U-04', 'U', 4, false),
    ('S008122', 'L-U-05', 'U', 5, false),
    ('S008123', 'L-U-06', 'U', 6, false),
    ('S008124', 'L-U-07', 'U', 7, false),
    ('S008125', 'L-U-08', 'U', 8, false),
    ('S008126', 'L-U-09', 'U', 9, false),
    ('S008127', 'L-U-10', 'U', 10, false),
    ('S008128', 'L-U-11', 'U', 11, false),
    ('S008129', 'L-U-12', 'U', 12, false),
    ('S008130', 'L-U-13', 'U', 13, false),
    ('S008131', 'L-U-14', 'U', 14, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE L'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE M (276 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008132', 'M-A-01', 'A', 1, false),
    ('S008133', 'M-A-02', 'A', 2, false),
    ('S008134', 'M-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008135', 'M-B-01', 'B', 1, false),
    ('S008136', 'M-B-02', 'B', 2, false),
    ('S008137', 'M-B-03', 'B', 3, false),
    ('S008138', 'M-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008139', 'M-C-01', 'C', 1, false),
    ('S008140', 'M-C-02', 'C', 2, false),
    ('S008141', 'M-C-03', 'C', 3, false),
    ('S008142', 'M-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008143', 'M-D-01', 'D', 1, false),
    ('S008144', 'M-D-02', 'D', 2, false),
    ('S008145', 'M-D-03', 'D', 3, false),
    ('S008146', 'M-D-04', 'D', 4, false),
    ('S008147', 'M-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008148', 'M-E-01', 'E', 1, false),
    ('S008149', 'M-E-02', 'E', 2, false),
    ('S008150', 'M-E-03', 'E', 3, false),
    ('S008151', 'M-E-04', 'E', 4, false),
    ('S008152', 'M-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008153', 'M-F-01', 'F', 1, false),
    ('S008154', 'M-F-02', 'F', 2, false),
    ('S008155', 'M-F-03', 'F', 3, false),
    ('S008156', 'M-F-04', 'F', 4, false),
    ('S008157', 'M-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008158', 'M-G-01', 'G', 1, false),
    ('S008159', 'M-G-02', 'G', 2, false),
    ('S008160', 'M-G-03', 'G', 3, false),
    ('S008161', 'M-G-04', 'G', 4, false),
    ('S008162', 'M-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008163', 'M-H-01', 'H', 1, false),
    ('S008164', 'M-H-02', 'H', 2, false),
    ('S008165', 'M-H-03', 'H', 3, false),
    ('S008166', 'M-H-04', 'H', 4, false),
    ('S008167', 'M-H-05', 'H', 5, false),
    ('S008168', 'M-H-06', 'H', 6, false),
    ('S008169', 'M-H-07', 'H', 7, false),
    ('S008170', 'M-H-08', 'H', 8, false),
    ('S008171', 'M-H-09', 'H', 9, false),
    ('S008172', 'M-H-10', 'H', 10, false),
    ('S008173', 'M-H-11', 'H', 11, false),
    ('S008174', 'M-H-12', 'H', 12, false),
    ('S008175', 'M-H-13', 'H', 13, false),
    ('S008176', 'M-H-14', 'H', 14, false),
    ('S008177', 'M-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008178', 'M-I-01', 'I', 1, false),
    ('S008179', 'M-I-02', 'I', 2, false),
    ('S008180', 'M-I-03', 'I', 3, false),
    ('S008181', 'M-I-04', 'I', 4, false),
    ('S008182', 'M-I-05', 'I', 5, false),
    ('S008183', 'M-I-06', 'I', 6, false),
    ('S008184', 'M-I-07', 'I', 7, false),
    ('S008185', 'M-I-08', 'I', 8, false),
    ('S008186', 'M-I-09', 'I', 9, false),
    ('S008187', 'M-I-10', 'I', 10, false),
    ('S008188', 'M-I-11', 'I', 11, false),
    ('S008189', 'M-I-12', 'I', 12, false),
    ('S008190', 'M-I-13', 'I', 13, false),
    ('S008191', 'M-I-14', 'I', 14, false),
    ('S008192', 'M-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008193', 'M-J-01', 'J', 1, false),
    ('S008194', 'M-J-02', 'J', 2, false),
    ('S008195', 'M-J-03', 'J', 3, false),
    ('S008196', 'M-J-04', 'J', 4, false),
    ('S008197', 'M-J-05', 'J', 5, false),
    ('S008198', 'M-J-06', 'J', 6, false),
    ('S008199', 'M-J-07', 'J', 7, false),
    ('S008200', 'M-J-08', 'J', 8, false),
    ('S008201', 'M-J-09', 'J', 9, false),
    ('S008202', 'M-J-10', 'J', 10, false),
    ('S008203', 'M-J-11', 'J', 11, false),
    ('S008204', 'M-J-12', 'J', 12, false),
    ('S008205', 'M-J-13', 'J', 13, false),
    ('S008206', 'M-J-14', 'J', 14, false),
    ('S008207', 'M-J-15', 'J', 15, false),
    ('S008208', 'M-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008209', 'M-K-01', 'K', 1, false),
    ('S008210', 'M-K-02', 'K', 2, false),
    ('S008211', 'M-K-03', 'K', 3, false),
    ('S008212', 'M-K-04', 'K', 4, false),
    ('S008213', 'M-K-05', 'K', 5, false),
    ('S008214', 'M-K-06', 'K', 6, false),
    ('S008215', 'M-K-07', 'K', 7, false),
    ('S008216', 'M-K-08', 'K', 8, false),
    ('S008217', 'M-K-09', 'K', 9, false),
    ('S008218', 'M-K-10', 'K', 10, false),
    ('S008219', 'M-K-11', 'K', 11, false),
    ('S008220', 'M-K-12', 'K', 12, false),
    ('S008221', 'M-K-13', 'K', 13, false),
    ('S008222', 'M-K-14', 'K', 14, false),
    ('S008223', 'M-K-15', 'K', 15, false),
    ('S008224', 'M-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008225', 'M-L-01', 'L', 1, false),
    ('S008226', 'M-L-02', 'L', 2, false),
    ('S008227', 'M-L-03', 'L', 3, false),
    ('S008228', 'M-L-04', 'L', 4, false),
    ('S008229', 'M-L-05', 'L', 5, false),
    ('S008230', 'M-L-06', 'L', 6, false),
    ('S008231', 'M-L-07', 'L', 7, false),
    ('S008232', 'M-L-08', 'L', 8, false),
    ('S008233', 'M-L-09', 'L', 9, false),
    ('S008234', 'M-L-10', 'L', 10, false),
    ('S008235', 'M-L-11', 'L', 11, false),
    ('S008236', 'M-L-12', 'L', 12, false),
    ('S008237', 'M-L-13', 'L', 13, false),
    ('S008238', 'M-L-14', 'L', 14, false),
    ('S008239', 'M-L-15', 'L', 15, false),
    ('S008240', 'M-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008241', 'M-M-01', 'M', 1, false),
    ('S008242', 'M-M-02', 'M', 2, false),
    ('S008243', 'M-M-03', 'M', 3, false),
    ('S008244', 'M-M-04', 'M', 4, false),
    ('S008245', 'M-M-05', 'M', 5, false),
    ('S008246', 'M-M-06', 'M', 6, false),
    ('S008247', 'M-M-07', 'M', 7, false),
    ('S008248', 'M-M-08', 'M', 8, false),
    ('S008249', 'M-M-09', 'M', 9, false),
    ('S008250', 'M-M-10', 'M', 10, false),
    ('S008251', 'M-M-11', 'M', 11, false),
    ('S008252', 'M-M-12', 'M', 12, false),
    ('S008253', 'M-M-13', 'M', 13, false),
    ('S008254', 'M-M-14', 'M', 14, false),
    ('S008255', 'M-M-15', 'M', 15, false),
    ('S008256', 'M-M-16', 'M', 16, false),
    ('S008257', 'M-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008258', 'M-N-01', 'N', 1, false),
    ('S008259', 'M-N-02', 'N', 2, false),
    ('S008260', 'M-N-03', 'N', 3, false),
    ('S008261', 'M-N-04', 'N', 4, false),
    ('S008262', 'M-N-05', 'N', 5, false),
    ('S008263', 'M-N-06', 'N', 6, false),
    ('S008264', 'M-N-07', 'N', 7, false),
    ('S008265', 'M-N-08', 'N', 8, false),
    ('S008266', 'M-N-09', 'N', 9, false),
    ('S008267', 'M-N-10', 'N', 10, false),
    ('S008268', 'M-N-11', 'N', 11, false),
    ('S008269', 'M-N-12', 'N', 12, false),
    ('S008270', 'M-N-13', 'N', 13, false),
    ('S008271', 'M-N-14', 'N', 14, false),
    ('S008272', 'M-N-15', 'N', 15, false),
    ('S008273', 'M-N-16', 'N', 16, false),
    ('S008274', 'M-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008275', 'M-O-01', 'O', 1, false),
    ('S008276', 'M-O-02', 'O', 2, false),
    ('S008277', 'M-O-03', 'O', 3, false),
    ('S008278', 'M-O-04', 'O', 4, false),
    ('S008279', 'M-O-05', 'O', 5, false),
    ('S008280', 'M-O-06', 'O', 6, false),
    ('S008281', 'M-O-07', 'O', 7, false),
    ('S008282', 'M-O-08', 'O', 8, false),
    ('S008283', 'M-O-09', 'O', 9, false),
    ('S008284', 'M-O-10', 'O', 10, false),
    ('S008285', 'M-O-11', 'O', 11, false),
    ('S008286', 'M-O-12', 'O', 12, false),
    ('S008287', 'M-O-13', 'O', 13, false),
    ('S008288', 'M-O-14', 'O', 14, false),
    ('S008289', 'M-O-15', 'O', 15, false),
    ('S008290', 'M-O-16', 'O', 16, false),
    ('S008291', 'M-O-17', 'O', 17, false),
    ('S008292', 'M-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008293', 'M-P-01', 'P', 1, false),
    ('S008294', 'M-P-02', 'P', 2, false),
    ('S008295', 'M-P-03', 'P', 3, false),
    ('S008296', 'M-P-04', 'P', 4, false),
    ('S008297', 'M-P-05', 'P', 5, false),
    ('S008298', 'M-P-06', 'P', 6, false),
    ('S008299', 'M-P-07', 'P', 7, false),
    ('S008300', 'M-P-08', 'P', 8, false),
    ('S008301', 'M-P-09', 'P', 9, false),
    ('S008302', 'M-P-10', 'P', 10, false),
    ('S008303', 'M-P-11', 'P', 11, false),
    ('S008304', 'M-P-12', 'P', 12, false),
    ('S008305', 'M-P-13', 'P', 13, false),
    ('S008306', 'M-P-14', 'P', 14, false),
    ('S008307', 'M-P-15', 'P', 15, false),
    ('S008308', 'M-P-16', 'P', 16, false),
    ('S008309', 'M-P-17', 'P', 17, false),
    ('S008310', 'M-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008311', 'M-Q-01', 'Q', 1, false),
    ('S008312', 'M-Q-02', 'Q', 2, false),
    ('S008313', 'M-Q-03', 'Q', 3, false),
    ('S008314', 'M-Q-04', 'Q', 4, false),
    ('S008315', 'M-Q-05', 'Q', 5, false),
    ('S008316', 'M-Q-06', 'Q', 6, false),
    ('S008317', 'M-Q-07', 'Q', 7, false),
    ('S008318', 'M-Q-08', 'Q', 8, false),
    ('S008319', 'M-Q-09', 'Q', 9, false),
    ('S008320', 'M-Q-10', 'Q', 10, false),
    ('S008321', 'M-Q-11', 'Q', 11, false),
    ('S008322', 'M-Q-12', 'Q', 12, false),
    ('S008323', 'M-Q-13', 'Q', 13, false),
    ('S008324', 'M-Q-14', 'Q', 14, false),
    ('S008325', 'M-Q-15', 'Q', 15, false),
    ('S008326', 'M-Q-16', 'Q', 16, false),
    ('S008327', 'M-Q-17', 'Q', 17, false),
    ('S008328', 'M-Q-18', 'Q', 18, false),
    ('S008329', 'M-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008330', 'M-R-01', 'R', 1, false),
    ('S008331', 'M-R-02', 'R', 2, false),
    ('S008332', 'M-R-03', 'R', 3, false),
    ('S008333', 'M-R-04', 'R', 4, false),
    ('S008334', 'M-R-05', 'R', 5, false),
    ('S008335', 'M-R-06', 'R', 6, false),
    ('S008336', 'M-R-07', 'R', 7, false),
    ('S008337', 'M-R-08', 'R', 8, false),
    ('S008338', 'M-R-09', 'R', 9, false),
    ('S008339', 'M-R-10', 'R', 10, false),
    ('S008340', 'M-R-11', 'R', 11, false),
    ('S008341', 'M-R-12', 'R', 12, false),
    ('S008342', 'M-R-13', 'R', 13, false),
    ('S008343', 'M-R-14', 'R', 14, false),
    ('S008344', 'M-R-15', 'R', 15, false),
    ('S008345', 'M-R-16', 'R', 16, false),
    ('S008346', 'M-R-17', 'R', 17, false),
    ('S008347', 'M-R-18', 'R', 18, false),
    ('S008348', 'M-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008349', 'M-S-01', 'S', 1, false),
    ('S008350', 'M-S-02', 'S', 2, false),
    ('S008351', 'M-S-03', 'S', 3, false),
    ('S008352', 'M-S-04', 'S', 4, false),
    ('S008353', 'M-S-05', 'S', 5, false),
    ('S008354', 'M-S-06', 'S', 6, false),
    ('S008355', 'M-S-07', 'S', 7, false),
    ('S008356', 'M-S-08', 'S', 8, false),
    ('S008357', 'M-S-09', 'S', 9, false),
    ('S008358', 'M-S-10', 'S', 10, false),
    ('S008359', 'M-S-11', 'S', 11, false),
    ('S008360', 'M-S-12', 'S', 12, false),
    ('S008361', 'M-S-13', 'S', 13, false),
    ('S008362', 'M-S-14', 'S', 14, false),
    ('S008363', 'M-S-15', 'S', 15, false),
    ('S008364', 'M-S-16', 'S', 16, false),
    ('S008365', 'M-S-17', 'S', 17, false),
    ('S008366', 'M-S-18', 'S', 18, false),
    ('S008367', 'M-S-19', 'S', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008368', 'M-T-01', 'T', 1, false),
    ('S008369', 'M-T-02', 'T', 2, false),
    ('S008370', 'M-T-03', 'T', 3, false),
    ('S008371', 'M-T-04', 'T', 4, false),
    ('S008372', 'M-T-05', 'T', 5, false),
    ('S008373', 'M-T-06', 'T', 6, false),
    ('S008374', 'M-T-07', 'T', 7, false),
    ('S008375', 'M-T-08', 'T', 8, false),
    ('S008376', 'M-T-09', 'T', 9, false),
    ('S008377', 'M-T-10', 'T', 10, false),
    ('S008378', 'M-T-11', 'T', 11, false),
    ('S008379', 'M-T-12', 'T', 12, false),
    ('S008380', 'M-T-13', 'T', 13, false),
    ('S008381', 'M-T-14', 'T', 14, false),
    ('S008382', 'M-T-15', 'T', 15, false),
    ('S008383', 'M-T-16', 'T', 16, false),
    ('S008384', 'M-T-17', 'T', 17, false),
    ('S008385', 'M-T-18', 'T', 18, false),
    ('S008386', 'M-T-19', 'T', 19, false),
    ('S008387', 'M-T-20', 'T', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008388', 'M-U-01', 'U', 1, false),
    ('S008389', 'M-U-02', 'U', 2, false),
    ('S008390', 'M-U-03', 'U', 3, false),
    ('S008391', 'M-U-04', 'U', 4, false),
    ('S008392', 'M-U-05', 'U', 5, false),
    ('S008393', 'M-U-06', 'U', 6, false),
    ('S008394', 'M-U-07', 'U', 7, false),
    ('S008395', 'M-U-08', 'U', 8, false),
    ('S008396', 'M-U-09', 'U', 9, false),
    ('S008397', 'M-U-10', 'U', 10, false),
    ('S008398', 'M-U-11', 'U', 11, false),
    ('S008399', 'M-U-12', 'U', 12, false),
    ('S008400', 'M-U-13', 'U', 13, false),
    ('S008401', 'M-U-14', 'U', 14, false),
    ('S008402', 'M-U-15', 'U', 15, false),
    ('S008403', 'M-U-16', 'U', 16, false),
    ('S008404', 'M-U-17', 'U', 17, false),
    ('S008405', 'M-U-18', 'U', 18, false),
    ('S008406', 'M-U-19', 'U', 19, false),
    ('S008407', 'M-U-20', 'U', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE M'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE N (276 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008408', 'N-A-01', 'A', 1, false),
    ('S008409', 'N-A-02', 'A', 2, false),
    ('S008410', 'N-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008411', 'N-B-01', 'B', 1, false),
    ('S008412', 'N-B-02', 'B', 2, false),
    ('S008413', 'N-B-03', 'B', 3, false),
    ('S008414', 'N-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008415', 'N-C-01', 'C', 1, false),
    ('S008416', 'N-C-02', 'C', 2, false),
    ('S008417', 'N-C-03', 'C', 3, false),
    ('S008418', 'N-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008419', 'N-D-01', 'D', 1, false),
    ('S008420', 'N-D-02', 'D', 2, false),
    ('S008421', 'N-D-03', 'D', 3, false),
    ('S008422', 'N-D-04', 'D', 4, false),
    ('S008423', 'N-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008424', 'N-E-01', 'E', 1, false),
    ('S008425', 'N-E-02', 'E', 2, false),
    ('S008426', 'N-E-03', 'E', 3, false),
    ('S008427', 'N-E-04', 'E', 4, false),
    ('S008428', 'N-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008429', 'N-F-01', 'F', 1, false),
    ('S008430', 'N-F-02', 'F', 2, false),
    ('S008431', 'N-F-03', 'F', 3, false),
    ('S008432', 'N-F-04', 'F', 4, false),
    ('S008433', 'N-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008434', 'N-G-01', 'G', 1, false),
    ('S008435', 'N-G-02', 'G', 2, false),
    ('S008436', 'N-G-03', 'G', 3, false),
    ('S008437', 'N-G-04', 'G', 4, false),
    ('S008438', 'N-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008439', 'N-H-01', 'H', 1, false),
    ('S008440', 'N-H-02', 'H', 2, false),
    ('S008441', 'N-H-03', 'H', 3, false),
    ('S008442', 'N-H-04', 'H', 4, false),
    ('S008443', 'N-H-05', 'H', 5, false),
    ('S008444', 'N-H-06', 'H', 6, false),
    ('S008445', 'N-H-07', 'H', 7, false),
    ('S008446', 'N-H-08', 'H', 8, false),
    ('S008447', 'N-H-09', 'H', 9, false),
    ('S008448', 'N-H-10', 'H', 10, false),
    ('S008449', 'N-H-11', 'H', 11, false),
    ('S008450', 'N-H-12', 'H', 12, false),
    ('S008451', 'N-H-13', 'H', 13, false),
    ('S008452', 'N-H-14', 'H', 14, false),
    ('S008453', 'N-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008454', 'N-I-01', 'I', 1, false),
    ('S008455', 'N-I-02', 'I', 2, false),
    ('S008456', 'N-I-03', 'I', 3, false),
    ('S008457', 'N-I-04', 'I', 4, false),
    ('S008458', 'N-I-05', 'I', 5, false),
    ('S008459', 'N-I-06', 'I', 6, false),
    ('S008460', 'N-I-07', 'I', 7, false),
    ('S008461', 'N-I-08', 'I', 8, false),
    ('S008462', 'N-I-09', 'I', 9, false),
    ('S008463', 'N-I-10', 'I', 10, false),
    ('S008464', 'N-I-11', 'I', 11, false),
    ('S008465', 'N-I-12', 'I', 12, false),
    ('S008466', 'N-I-13', 'I', 13, false),
    ('S008467', 'N-I-14', 'I', 14, false),
    ('S008468', 'N-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008469', 'N-J-01', 'J', 1, false),
    ('S008470', 'N-J-02', 'J', 2, false),
    ('S008471', 'N-J-03', 'J', 3, false),
    ('S008472', 'N-J-04', 'J', 4, false),
    ('S008473', 'N-J-05', 'J', 5, false),
    ('S008474', 'N-J-06', 'J', 6, false),
    ('S008475', 'N-J-07', 'J', 7, false),
    ('S008476', 'N-J-08', 'J', 8, false),
    ('S008477', 'N-J-09', 'J', 9, false),
    ('S008478', 'N-J-10', 'J', 10, false),
    ('S008479', 'N-J-11', 'J', 11, false),
    ('S008480', 'N-J-12', 'J', 12, false),
    ('S008481', 'N-J-13', 'J', 13, false),
    ('S008482', 'N-J-14', 'J', 14, false),
    ('S008483', 'N-J-15', 'J', 15, false),
    ('S008484', 'N-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008485', 'N-K-01', 'K', 1, false),
    ('S008486', 'N-K-02', 'K', 2, false),
    ('S008487', 'N-K-03', 'K', 3, false),
    ('S008488', 'N-K-04', 'K', 4, false),
    ('S008489', 'N-K-05', 'K', 5, false),
    ('S008490', 'N-K-06', 'K', 6, false),
    ('S008491', 'N-K-07', 'K', 7, false),
    ('S008492', 'N-K-08', 'K', 8, false),
    ('S008493', 'N-K-09', 'K', 9, false),
    ('S008494', 'N-K-10', 'K', 10, false),
    ('S008495', 'N-K-11', 'K', 11, false),
    ('S008496', 'N-K-12', 'K', 12, false),
    ('S008497', 'N-K-13', 'K', 13, false),
    ('S008498', 'N-K-14', 'K', 14, false),
    ('S008499', 'N-K-15', 'K', 15, false),
    ('S008500', 'N-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008501', 'N-L-01', 'L', 1, false),
    ('S008502', 'N-L-02', 'L', 2, false),
    ('S008503', 'N-L-03', 'L', 3, false),
    ('S008504', 'N-L-04', 'L', 4, false),
    ('S008505', 'N-L-05', 'L', 5, false),
    ('S008506', 'N-L-06', 'L', 6, false),
    ('S008507', 'N-L-07', 'L', 7, false),
    ('S008508', 'N-L-08', 'L', 8, false),
    ('S008509', 'N-L-09', 'L', 9, false),
    ('S008510', 'N-L-10', 'L', 10, false),
    ('S008511', 'N-L-11', 'L', 11, false),
    ('S008512', 'N-L-12', 'L', 12, false),
    ('S008513', 'N-L-13', 'L', 13, false),
    ('S008514', 'N-L-14', 'L', 14, false),
    ('S008515', 'N-L-15', 'L', 15, false),
    ('S008516', 'N-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008517', 'N-M-01', 'M', 1, false),
    ('S008518', 'N-M-02', 'M', 2, false),
    ('S008519', 'N-M-03', 'M', 3, false),
    ('S008520', 'N-M-04', 'M', 4, false),
    ('S008521', 'N-M-05', 'M', 5, false),
    ('S008522', 'N-M-06', 'M', 6, false),
    ('S008523', 'N-M-07', 'M', 7, false),
    ('S008524', 'N-M-08', 'M', 8, false),
    ('S008525', 'N-M-09', 'M', 9, false),
    ('S008526', 'N-M-10', 'M', 10, false),
    ('S008527', 'N-M-11', 'M', 11, false),
    ('S008528', 'N-M-12', 'M', 12, false),
    ('S008529', 'N-M-13', 'M', 13, false),
    ('S008530', 'N-M-14', 'M', 14, false),
    ('S008531', 'N-M-15', 'M', 15, false),
    ('S008532', 'N-M-16', 'M', 16, false),
    ('S008533', 'N-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008534', 'N-N-01', 'N', 1, false),
    ('S008535', 'N-N-02', 'N', 2, false),
    ('S008536', 'N-N-03', 'N', 3, false),
    ('S008537', 'N-N-04', 'N', 4, false),
    ('S008538', 'N-N-05', 'N', 5, false),
    ('S008539', 'N-N-06', 'N', 6, false),
    ('S008540', 'N-N-07', 'N', 7, false),
    ('S008541', 'N-N-08', 'N', 8, false),
    ('S008542', 'N-N-09', 'N', 9, false),
    ('S008543', 'N-N-10', 'N', 10, false),
    ('S008544', 'N-N-11', 'N', 11, false),
    ('S008545', 'N-N-12', 'N', 12, false),
    ('S008546', 'N-N-13', 'N', 13, false),
    ('S008547', 'N-N-14', 'N', 14, false),
    ('S008548', 'N-N-15', 'N', 15, false),
    ('S008549', 'N-N-16', 'N', 16, false),
    ('S008550', 'N-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008551', 'N-O-01', 'O', 1, false),
    ('S008552', 'N-O-02', 'O', 2, false),
    ('S008553', 'N-O-03', 'O', 3, false),
    ('S008554', 'N-O-04', 'O', 4, false),
    ('S008555', 'N-O-05', 'O', 5, false),
    ('S008556', 'N-O-06', 'O', 6, false),
    ('S008557', 'N-O-07', 'O', 7, false),
    ('S008558', 'N-O-08', 'O', 8, false),
    ('S008559', 'N-O-09', 'O', 9, false),
    ('S008560', 'N-O-10', 'O', 10, false),
    ('S008561', 'N-O-11', 'O', 11, false),
    ('S008562', 'N-O-12', 'O', 12, false),
    ('S008563', 'N-O-13', 'O', 13, false),
    ('S008564', 'N-O-14', 'O', 14, false),
    ('S008565', 'N-O-15', 'O', 15, false),
    ('S008566', 'N-O-16', 'O', 16, false),
    ('S008567', 'N-O-17', 'O', 17, false),
    ('S008568', 'N-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008569', 'N-P-01', 'P', 1, false),
    ('S008570', 'N-P-02', 'P', 2, false),
    ('S008571', 'N-P-03', 'P', 3, false),
    ('S008572', 'N-P-04', 'P', 4, false),
    ('S008573', 'N-P-05', 'P', 5, false),
    ('S008574', 'N-P-06', 'P', 6, false),
    ('S008575', 'N-P-07', 'P', 7, false),
    ('S008576', 'N-P-08', 'P', 8, false),
    ('S008577', 'N-P-09', 'P', 9, false),
    ('S008578', 'N-P-10', 'P', 10, false),
    ('S008579', 'N-P-11', 'P', 11, false),
    ('S008580', 'N-P-12', 'P', 12, false),
    ('S008581', 'N-P-13', 'P', 13, false),
    ('S008582', 'N-P-14', 'P', 14, false),
    ('S008583', 'N-P-15', 'P', 15, false),
    ('S008584', 'N-P-16', 'P', 16, false),
    ('S008585', 'N-P-17', 'P', 17, false),
    ('S008586', 'N-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008587', 'N-Q-01', 'Q', 1, false),
    ('S008588', 'N-Q-02', 'Q', 2, false),
    ('S008589', 'N-Q-03', 'Q', 3, false),
    ('S008590', 'N-Q-04', 'Q', 4, false),
    ('S008591', 'N-Q-05', 'Q', 5, false),
    ('S008592', 'N-Q-06', 'Q', 6, false),
    ('S008593', 'N-Q-07', 'Q', 7, false),
    ('S008594', 'N-Q-08', 'Q', 8, false),
    ('S008595', 'N-Q-09', 'Q', 9, false),
    ('S008596', 'N-Q-10', 'Q', 10, false),
    ('S008597', 'N-Q-11', 'Q', 11, false),
    ('S008598', 'N-Q-12', 'Q', 12, false),
    ('S008599', 'N-Q-13', 'Q', 13, false),
    ('S008600', 'N-Q-14', 'Q', 14, false),
    ('S008601', 'N-Q-15', 'Q', 15, false),
    ('S008602', 'N-Q-16', 'Q', 16, false),
    ('S008603', 'N-Q-17', 'Q', 17, false),
    ('S008604', 'N-Q-18', 'Q', 18, false),
    ('S008605', 'N-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008606', 'N-R-01', 'R', 1, false),
    ('S008607', 'N-R-02', 'R', 2, false),
    ('S008608', 'N-R-03', 'R', 3, false),
    ('S008609', 'N-R-04', 'R', 4, false),
    ('S008610', 'N-R-05', 'R', 5, false),
    ('S008611', 'N-R-06', 'R', 6, false),
    ('S008612', 'N-R-07', 'R', 7, false),
    ('S008613', 'N-R-08', 'R', 8, false),
    ('S008614', 'N-R-09', 'R', 9, false),
    ('S008615', 'N-R-10', 'R', 10, false),
    ('S008616', 'N-R-11', 'R', 11, false),
    ('S008617', 'N-R-12', 'R', 12, false),
    ('S008618', 'N-R-13', 'R', 13, false),
    ('S008619', 'N-R-14', 'R', 14, false),
    ('S008620', 'N-R-15', 'R', 15, false),
    ('S008621', 'N-R-16', 'R', 16, false),
    ('S008622', 'N-R-17', 'R', 17, false),
    ('S008623', 'N-R-18', 'R', 18, false),
    ('S008624', 'N-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008625', 'N-S-01', 'S', 1, false),
    ('S008626', 'N-S-02', 'S', 2, false),
    ('S008627', 'N-S-03', 'S', 3, false),
    ('S008628', 'N-S-04', 'S', 4, false),
    ('S008629', 'N-S-05', 'S', 5, false),
    ('S008630', 'N-S-06', 'S', 6, false),
    ('S008631', 'N-S-07', 'S', 7, false),
    ('S008632', 'N-S-08', 'S', 8, false),
    ('S008633', 'N-S-09', 'S', 9, false),
    ('S008634', 'N-S-10', 'S', 10, false),
    ('S008635', 'N-S-11', 'S', 11, false),
    ('S008636', 'N-S-12', 'S', 12, false),
    ('S008637', 'N-S-13', 'S', 13, false),
    ('S008638', 'N-S-14', 'S', 14, false),
    ('S008639', 'N-S-15', 'S', 15, false),
    ('S008640', 'N-S-16', 'S', 16, false),
    ('S008641', 'N-S-17', 'S', 17, false),
    ('S008642', 'N-S-18', 'S', 18, false),
    ('S008643', 'N-S-19', 'S', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008644', 'N-T-01', 'T', 1, false),
    ('S008645', 'N-T-02', 'T', 2, false),
    ('S008646', 'N-T-03', 'T', 3, false),
    ('S008647', 'N-T-04', 'T', 4, false),
    ('S008648', 'N-T-05', 'T', 5, false),
    ('S008649', 'N-T-06', 'T', 6, false),
    ('S008650', 'N-T-07', 'T', 7, false),
    ('S008651', 'N-T-08', 'T', 8, false),
    ('S008652', 'N-T-09', 'T', 9, false),
    ('S008653', 'N-T-10', 'T', 10, false),
    ('S008654', 'N-T-11', 'T', 11, false),
    ('S008655', 'N-T-12', 'T', 12, false),
    ('S008656', 'N-T-13', 'T', 13, false),
    ('S008657', 'N-T-14', 'T', 14, false),
    ('S008658', 'N-T-15', 'T', 15, false),
    ('S008659', 'N-T-16', 'T', 16, false),
    ('S008660', 'N-T-17', 'T', 17, false),
    ('S008661', 'N-T-18', 'T', 18, false),
    ('S008662', 'N-T-19', 'T', 19, false),
    ('S008663', 'N-T-20', 'T', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008664', 'N-U-01', 'U', 1, false),
    ('S008665', 'N-U-02', 'U', 2, false),
    ('S008666', 'N-U-03', 'U', 3, false),
    ('S008667', 'N-U-04', 'U', 4, false),
    ('S008668', 'N-U-05', 'U', 5, false),
    ('S008669', 'N-U-06', 'U', 6, false),
    ('S008670', 'N-U-07', 'U', 7, false),
    ('S008671', 'N-U-08', 'U', 8, false),
    ('S008672', 'N-U-09', 'U', 9, false),
    ('S008673', 'N-U-10', 'U', 10, false),
    ('S008674', 'N-U-11', 'U', 11, false),
    ('S008675', 'N-U-12', 'U', 12, false),
    ('S008676', 'N-U-13', 'U', 13, false),
    ('S008677', 'N-U-14', 'U', 14, false),
    ('S008678', 'N-U-15', 'U', 15, false),
    ('S008679', 'N-U-16', 'U', 16, false),
    ('S008680', 'N-U-17', 'U', 17, false),
    ('S008681', 'N-U-18', 'U', 18, false),
    ('S008682', 'N-U-19', 'U', 19, false),
    ('S008683', 'N-U-20', 'U', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE N'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE O (256 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008684', 'O-A-01', 'A', 1, false),
    ('S008685', 'O-A-02', 'A', 2, false),
    ('S008686', 'O-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008687', 'O-B-01', 'B', 1, false),
    ('S008688', 'O-B-02', 'B', 2, false),
    ('S008689', 'O-B-03', 'B', 3, false),
    ('S008690', 'O-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008691', 'O-C-01', 'C', 1, false),
    ('S008692', 'O-C-02', 'C', 2, false),
    ('S008693', 'O-C-03', 'C', 3, false),
    ('S008694', 'O-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008695', 'O-D-01', 'D', 1, false),
    ('S008696', 'O-D-02', 'D', 2, false),
    ('S008697', 'O-D-03', 'D', 3, false),
    ('S008698', 'O-D-04', 'D', 4, false),
    ('S008699', 'O-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008700', 'O-E-01', 'E', 1, false),
    ('S008701', 'O-E-02', 'E', 2, false),
    ('S008702', 'O-E-03', 'E', 3, false),
    ('S008703', 'O-E-04', 'E', 4, false),
    ('S008704', 'O-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008705', 'O-F-01', 'F', 1, false),
    ('S008706', 'O-F-02', 'F', 2, false),
    ('S008707', 'O-F-03', 'F', 3, false),
    ('S008708', 'O-F-04', 'F', 4, false),
    ('S008709', 'O-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008710', 'O-G-01', 'G', 1, false),
    ('S008711', 'O-G-02', 'G', 2, false),
    ('S008712', 'O-G-03', 'G', 3, false),
    ('S008713', 'O-G-04', 'G', 4, false),
    ('S008714', 'O-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008715', 'O-H-01', 'H', 1, false),
    ('S008716', 'O-H-02', 'H', 2, false),
    ('S008717', 'O-H-03', 'H', 3, false),
    ('S008718', 'O-H-04', 'H', 4, false),
    ('S008719', 'O-H-05', 'H', 5, false),
    ('S008720', 'O-H-06', 'H', 6, false),
    ('S008721', 'O-H-07', 'H', 7, false),
    ('S008722', 'O-H-08', 'H', 8, false),
    ('S008723', 'O-H-09', 'H', 9, false),
    ('S008724', 'O-H-10', 'H', 10, false),
    ('S008725', 'O-H-11', 'H', 11, false),
    ('S008726', 'O-H-12', 'H', 12, false),
    ('S008727', 'O-H-13', 'H', 13, false),
    ('S008728', 'O-H-14', 'H', 14, false),
    ('S008729', 'O-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008730', 'O-I-01', 'I', 1, false),
    ('S008731', 'O-I-02', 'I', 2, false),
    ('S008732', 'O-I-03', 'I', 3, false),
    ('S008733', 'O-I-04', 'I', 4, false),
    ('S008734', 'O-I-05', 'I', 5, false),
    ('S008735', 'O-I-06', 'I', 6, false),
    ('S008736', 'O-I-07', 'I', 7, false),
    ('S008737', 'O-I-08', 'I', 8, false),
    ('S008738', 'O-I-09', 'I', 9, false),
    ('S008739', 'O-I-10', 'I', 10, false),
    ('S008740', 'O-I-11', 'I', 11, false),
    ('S008741', 'O-I-12', 'I', 12, false),
    ('S008742', 'O-I-13', 'I', 13, false),
    ('S008743', 'O-I-14', 'I', 14, false),
    ('S008744', 'O-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008745', 'O-J-01', 'J', 1, false),
    ('S008746', 'O-J-02', 'J', 2, false),
    ('S008747', 'O-J-03', 'J', 3, false),
    ('S008748', 'O-J-04', 'J', 4, false),
    ('S008749', 'O-J-05', 'J', 5, false),
    ('S008750', 'O-J-06', 'J', 6, false),
    ('S008751', 'O-J-07', 'J', 7, false),
    ('S008752', 'O-J-08', 'J', 8, false),
    ('S008753', 'O-J-09', 'J', 9, false),
    ('S008754', 'O-J-10', 'J', 10, false),
    ('S008755', 'O-J-11', 'J', 11, false),
    ('S008756', 'O-J-12', 'J', 12, false),
    ('S008757', 'O-J-13', 'J', 13, false),
    ('S008758', 'O-J-14', 'J', 14, false),
    ('S008759', 'O-J-15', 'J', 15, false),
    ('S008760', 'O-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008761', 'O-K-01', 'K', 1, false),
    ('S008762', 'O-K-02', 'K', 2, false),
    ('S008763', 'O-K-03', 'K', 3, false),
    ('S008764', 'O-K-04', 'K', 4, false),
    ('S008765', 'O-K-05', 'K', 5, false),
    ('S008766', 'O-K-06', 'K', 6, false),
    ('S008767', 'O-K-07', 'K', 7, false),
    ('S008768', 'O-K-08', 'K', 8, false),
    ('S008769', 'O-K-09', 'K', 9, false),
    ('S008770', 'O-K-10', 'K', 10, false),
    ('S008771', 'O-K-11', 'K', 11, false),
    ('S008772', 'O-K-12', 'K', 12, false),
    ('S008773', 'O-K-13', 'K', 13, false),
    ('S008774', 'O-K-14', 'K', 14, false),
    ('S008775', 'O-K-15', 'K', 15, false),
    ('S008776', 'O-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008777', 'O-L-01', 'L', 1, false),
    ('S008778', 'O-L-02', 'L', 2, false),
    ('S008779', 'O-L-03', 'L', 3, false),
    ('S008780', 'O-L-04', 'L', 4, false),
    ('S008781', 'O-L-05', 'L', 5, false),
    ('S008782', 'O-L-06', 'L', 6, false),
    ('S008783', 'O-L-07', 'L', 7, false),
    ('S008784', 'O-L-08', 'L', 8, false),
    ('S008785', 'O-L-09', 'L', 9, false),
    ('S008786', 'O-L-10', 'L', 10, false),
    ('S008787', 'O-L-11', 'L', 11, false),
    ('S008788', 'O-L-12', 'L', 12, false),
    ('S008789', 'O-L-13', 'L', 13, false),
    ('S008790', 'O-L-14', 'L', 14, false),
    ('S008791', 'O-L-15', 'L', 15, false),
    ('S008792', 'O-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008793', 'O-M-01', 'M', 1, false),
    ('S008794', 'O-M-02', 'M', 2, false),
    ('S008795', 'O-M-03', 'M', 3, false),
    ('S008796', 'O-M-04', 'M', 4, false),
    ('S008797', 'O-M-05', 'M', 5, false),
    ('S008798', 'O-M-06', 'M', 6, false),
    ('S008799', 'O-M-07', 'M', 7, false),
    ('S008800', 'O-M-08', 'M', 8, false),
    ('S008801', 'O-M-09', 'M', 9, false),
    ('S008802', 'O-M-10', 'M', 10, false),
    ('S008803', 'O-M-11', 'M', 11, false),
    ('S008804', 'O-M-12', 'M', 12, false),
    ('S008805', 'O-M-13', 'M', 13, false),
    ('S008806', 'O-M-14', 'M', 14, false),
    ('S008807', 'O-M-15', 'M', 15, false),
    ('S008808', 'O-M-16', 'M', 16, false),
    ('S008809', 'O-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008810', 'O-N-01', 'N', 1, false),
    ('S008811', 'O-N-02', 'N', 2, false),
    ('S008812', 'O-N-03', 'N', 3, false),
    ('S008813', 'O-N-04', 'N', 4, false),
    ('S008814', 'O-N-05', 'N', 5, false),
    ('S008815', 'O-N-06', 'N', 6, false),
    ('S008816', 'O-N-07', 'N', 7, false),
    ('S008817', 'O-N-08', 'N', 8, false),
    ('S008818', 'O-N-09', 'N', 9, false),
    ('S008819', 'O-N-10', 'N', 10, false),
    ('S008820', 'O-N-11', 'N', 11, false),
    ('S008821', 'O-N-12', 'N', 12, false),
    ('S008822', 'O-N-13', 'N', 13, false),
    ('S008823', 'O-N-14', 'N', 14, false),
    ('S008824', 'O-N-15', 'N', 15, false),
    ('S008825', 'O-N-16', 'N', 16, false),
    ('S008826', 'O-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008827', 'O-O-01', 'O', 1, false),
    ('S008828', 'O-O-02', 'O', 2, false),
    ('S008829', 'O-O-03', 'O', 3, false),
    ('S008830', 'O-O-04', 'O', 4, false),
    ('S008831', 'O-O-05', 'O', 5, false),
    ('S008832', 'O-O-06', 'O', 6, false),
    ('S008833', 'O-O-07', 'O', 7, false),
    ('S008834', 'O-O-08', 'O', 8, false),
    ('S008835', 'O-O-09', 'O', 9, false),
    ('S008836', 'O-O-10', 'O', 10, false),
    ('S008837', 'O-O-11', 'O', 11, false),
    ('S008838', 'O-O-12', 'O', 12, false),
    ('S008839', 'O-O-13', 'O', 13, false),
    ('S008840', 'O-O-14', 'O', 14, false),
    ('S008841', 'O-O-15', 'O', 15, false),
    ('S008842', 'O-O-16', 'O', 16, false),
    ('S008843', 'O-O-17', 'O', 17, false),
    ('S008844', 'O-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008845', 'O-P-01', 'P', 1, false),
    ('S008846', 'O-P-02', 'P', 2, false),
    ('S008847', 'O-P-03', 'P', 3, false),
    ('S008848', 'O-P-04', 'P', 4, false),
    ('S008849', 'O-P-05', 'P', 5, false),
    ('S008850', 'O-P-06', 'P', 6, false),
    ('S008851', 'O-P-07', 'P', 7, false),
    ('S008852', 'O-P-08', 'P', 8, false),
    ('S008853', 'O-P-09', 'P', 9, false),
    ('S008854', 'O-P-10', 'P', 10, false),
    ('S008855', 'O-P-11', 'P', 11, false),
    ('S008856', 'O-P-12', 'P', 12, false),
    ('S008857', 'O-P-13', 'P', 13, false),
    ('S008858', 'O-P-14', 'P', 14, false),
    ('S008859', 'O-P-15', 'P', 15, false),
    ('S008860', 'O-P-16', 'P', 16, false),
    ('S008861', 'O-P-17', 'P', 17, false),
    ('S008862', 'O-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008863', 'O-Q-01', 'Q', 1, false),
    ('S008864', 'O-Q-02', 'Q', 2, false),
    ('S008865', 'O-Q-03', 'Q', 3, false),
    ('S008866', 'O-Q-04', 'Q', 4, false),
    ('S008867', 'O-Q-05', 'Q', 5, false),
    ('S008868', 'O-Q-06', 'Q', 6, false),
    ('S008869', 'O-Q-07', 'Q', 7, false),
    ('S008870', 'O-Q-08', 'Q', 8, false),
    ('S008871', 'O-Q-09', 'Q', 9, false),
    ('S008872', 'O-Q-10', 'Q', 10, false),
    ('S008873', 'O-Q-11', 'Q', 11, false),
    ('S008874', 'O-Q-12', 'Q', 12, false),
    ('S008875', 'O-Q-13', 'Q', 13, false),
    ('S008876', 'O-Q-14', 'Q', 14, false),
    ('S008877', 'O-Q-15', 'Q', 15, false),
    ('S008878', 'O-Q-16', 'Q', 16, false),
    ('S008879', 'O-Q-17', 'Q', 17, false),
    ('S008880', 'O-Q-18', 'Q', 18, false),
    ('S008881', 'O-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008882', 'O-R-01', 'R', 1, false),
    ('S008883', 'O-R-02', 'R', 2, false),
    ('S008884', 'O-R-03', 'R', 3, false),
    ('S008885', 'O-R-04', 'R', 4, false),
    ('S008886', 'O-R-05', 'R', 5, false),
    ('S008887', 'O-R-06', 'R', 6, false),
    ('S008888', 'O-R-07', 'R', 7, false),
    ('S008889', 'O-R-08', 'R', 8, false),
    ('S008890', 'O-R-09', 'R', 9, false),
    ('S008891', 'O-R-10', 'R', 10, false),
    ('S008892', 'O-R-11', 'R', 11, false),
    ('S008893', 'O-R-12', 'R', 12, false),
    ('S008894', 'O-R-13', 'R', 13, false),
    ('S008895', 'O-R-14', 'R', 14, false),
    ('S008896', 'O-R-15', 'R', 15, false),
    ('S008897', 'O-R-16', 'R', 16, false),
    ('S008898', 'O-R-17', 'R', 17, false),
    ('S008899', 'O-R-18', 'R', 18, false),
    ('S008900', 'O-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008901', 'O-S-01', 'S', 1, false),
    ('S008902', 'O-S-02', 'S', 2, false),
    ('S008903', 'O-S-03', 'S', 3, false),
    ('S008904', 'O-S-04', 'S', 4, false),
    ('S008905', 'O-S-05', 'S', 5, false),
    ('S008906', 'O-S-06', 'S', 6, false),
    ('S008907', 'O-S-07', 'S', 7, false),
    ('S008908', 'O-S-08', 'S', 8, false),
    ('S008909', 'O-S-09', 'S', 9, false),
    ('S008910', 'O-S-10', 'S', 10, false),
    ('S008911', 'O-S-11', 'S', 11, false),
    ('S008912', 'O-S-12', 'S', 12, false),
    ('S008913', 'O-S-13', 'S', 13, false),
    ('S008914', 'O-S-14', 'S', 14, false),
    ('S008915', 'O-S-15', 'S', 15, false),
    ('S008916', 'O-S-16', 'S', 16, false),
    ('S008917', 'O-S-17', 'S', 17, false),
    ('S008918', 'O-S-18', 'S', 18, false),
    ('S008919', 'O-S-19', 'S', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008920', 'O-T-01', 'T', 1, false),
    ('S008921', 'O-T-02', 'T', 2, false),
    ('S008922', 'O-T-03', 'T', 3, false),
    ('S008923', 'O-T-04', 'T', 4, false),
    ('S008924', 'O-T-05', 'T', 5, false),
    ('S008925', 'O-T-06', 'T', 6, false),
    ('S008926', 'O-T-07', 'T', 7, false),
    ('S008927', 'O-T-08', 'T', 8, false),
    ('S008928', 'O-T-09', 'T', 9, false),
    ('S008929', 'O-T-10', 'T', 10, false),
    ('S008930', 'O-T-11', 'T', 11, false),
    ('S008931', 'O-T-12', 'T', 12, false),
    ('S008932', 'O-T-13', 'T', 13, false),
    ('S008933', 'O-T-14', 'T', 14, false),
    ('S008934', 'O-T-15', 'T', 15, false),
    ('S008935', 'O-T-16', 'T', 16, false),
    ('S008936', 'O-T-17', 'T', 17, false),
    ('S008937', 'O-T-18', 'T', 18, false),
    ('S008938', 'O-T-19', 'T', 19, false),
    ('S008939', 'O-T-20', 'T', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE O'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE P (258 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008940', 'P-A-01', 'A', 1, false),
    ('S008941', 'P-A-02', 'A', 2, false),
    ('S008942', 'P-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008943', 'P-B-01', 'B', 1, false),
    ('S008944', 'P-B-02', 'B', 2, false),
    ('S008945', 'P-B-03', 'B', 3, false),
    ('S008946', 'P-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008947', 'P-C-01', 'C', 1, false),
    ('S008948', 'P-C-02', 'C', 2, false),
    ('S008949', 'P-C-03', 'C', 3, false),
    ('S008950', 'P-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008951', 'P-D-01', 'D', 1, false),
    ('S008952', 'P-D-02', 'D', 2, false),
    ('S008953', 'P-D-03', 'D', 3, false),
    ('S008954', 'P-D-04', 'D', 4, false),
    ('S008955', 'P-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008956', 'P-E-01', 'E', 1, false),
    ('S008957', 'P-E-02', 'E', 2, false),
    ('S008958', 'P-E-03', 'E', 3, false),
    ('S008959', 'P-E-04', 'E', 4, false),
    ('S008960', 'P-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008961', 'P-F-01', 'F', 1, false),
    ('S008962', 'P-F-02', 'F', 2, false),
    ('S008963', 'P-F-03', 'F', 3, false),
    ('S008964', 'P-F-04', 'F', 4, false),
    ('S008965', 'P-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008966', 'P-G-01', 'G', 1, false),
    ('S008967', 'P-G-02', 'G', 2, false),
    ('S008968', 'P-G-03', 'G', 3, false),
    ('S008969', 'P-G-04', 'G', 4, false),
    ('S008970', 'P-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008971', 'P-H-01', 'H', 1, false),
    ('S008972', 'P-H-02', 'H', 2, false),
    ('S008973', 'P-H-03', 'H', 3, false),
    ('S008974', 'P-H-04', 'H', 4, false),
    ('S008975', 'P-H-05', 'H', 5, false),
    ('S008976', 'P-H-06', 'H', 6, false),
    ('S008977', 'P-H-07', 'H', 7, false),
    ('S008978', 'P-H-08', 'H', 8, false),
    ('S008979', 'P-H-09', 'H', 9, false),
    ('S008980', 'P-H-10', 'H', 10, false),
    ('S008981', 'P-H-11', 'H', 11, false),
    ('S008982', 'P-H-12', 'H', 12, false),
    ('S008983', 'P-H-13', 'H', 13, false),
    ('S008984', 'P-H-14', 'H', 14, false),
    ('S008985', 'P-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S008986', 'P-I-01', 'I', 1, false),
    ('S008987', 'P-I-02', 'I', 2, false),
    ('S008988', 'P-I-03', 'I', 3, false),
    ('S008989', 'P-I-04', 'I', 4, false),
    ('S008990', 'P-I-05', 'I', 5, false),
    ('S008991', 'P-I-06', 'I', 6, false),
    ('S008992', 'P-I-07', 'I', 7, false),
    ('S008993', 'P-I-08', 'I', 8, false),
    ('S008994', 'P-I-09', 'I', 9, false),
    ('S008995', 'P-I-10', 'I', 10, false),
    ('S008996', 'P-I-11', 'I', 11, false),
    ('S008997', 'P-I-12', 'I', 12, false),
    ('S008998', 'P-I-13', 'I', 13, false),
    ('S008999', 'P-I-14', 'I', 14, false),
    ('S009000', 'P-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009001', 'P-J-01', 'J', 1, false),
    ('S009002', 'P-J-02', 'J', 2, false),
    ('S009003', 'P-J-03', 'J', 3, false),
    ('S009004', 'P-J-04', 'J', 4, false),
    ('S009005', 'P-J-05', 'J', 5, false),
    ('S009006', 'P-J-06', 'J', 6, false),
    ('S009007', 'P-J-07', 'J', 7, false),
    ('S009008', 'P-J-08', 'J', 8, false),
    ('S009009', 'P-J-09', 'J', 9, false),
    ('S009010', 'P-J-10', 'J', 10, false),
    ('S009011', 'P-J-11', 'J', 11, false),
    ('S009012', 'P-J-12', 'J', 12, false),
    ('S009013', 'P-J-13', 'J', 13, false),
    ('S009014', 'P-J-14', 'J', 14, false),
    ('S009015', 'P-J-15', 'J', 15, false),
    ('S009016', 'P-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009017', 'P-K-01', 'K', 1, false),
    ('S009018', 'P-K-02', 'K', 2, false),
    ('S009019', 'P-K-03', 'K', 3, false),
    ('S009020', 'P-K-04', 'K', 4, false),
    ('S009021', 'P-K-05', 'K', 5, false),
    ('S009022', 'P-K-06', 'K', 6, false),
    ('S009023', 'P-K-07', 'K', 7, false),
    ('S009024', 'P-K-08', 'K', 8, false),
    ('S009025', 'P-K-09', 'K', 9, false),