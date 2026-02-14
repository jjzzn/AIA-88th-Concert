    ('S005622', 'C-L-06', 'L', 6, false),
    ('S005623', 'C-L-07', 'L', 7, false),
    ('S005624', 'C-L-08', 'L', 8, false),
    ('S005625', 'C-L-09', 'L', 9, false),
    ('S005626', 'C-L-10', 'L', 10, false),
    ('S005627', 'C-L-11', 'L', 11, false),
    ('S005628', 'C-L-12', 'L', 12, false),
    ('S005629', 'C-L-13', 'L', 13, false),
    ('S005630', 'C-L-14', 'L', 14, false),
    ('S005631', 'C-L-15', 'L', 15, false),
    ('S005632', 'C-L-16', 'L', 16, false),
    ('S005633', 'C-L-17', 'L', 17, false),
    ('S005634', 'C-L-18', 'L', 18, false),
    ('S005635', 'C-L-19', 'L', 19, false),
    ('S005636', 'C-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005637', 'C-M-01', 'M', 1, false),
    ('S005638', 'C-M-02', 'M', 2, false),
    ('S005639', 'C-M-03', 'M', 3, false),
    ('S005640', 'C-M-04', 'M', 4, false),
    ('S005641', 'C-M-05', 'M', 5, false),
    ('S005642', 'C-M-06', 'M', 6, false),
    ('S005643', 'C-M-07', 'M', 7, false),
    ('S005644', 'C-M-08', 'M', 8, false),
    ('S005645', 'C-M-09', 'M', 9, false),
    ('S005646', 'C-M-10', 'M', 10, false),
    ('S005647', 'C-M-11', 'M', 11, false),
    ('S005648', 'C-M-12', 'M', 12, false),
    ('S005649', 'C-M-13', 'M', 13, false),
    ('S005650', 'C-M-14', 'M', 14, false),
    ('S005651', 'C-M-15', 'M', 15, false),
    ('S005652', 'C-M-16', 'M', 16, false),
    ('S005653', 'C-M-17', 'M', 17, false),
    ('S005654', 'C-M-18', 'M', 18, false),
    ('S005655', 'C-M-19', 'M', 19, false),
    ('S005656', 'C-M-20', 'M', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005657', 'C-N-01', 'N', 1, false),
    ('S005658', 'C-N-02', 'N', 2, false),
    ('S005659', 'C-N-03', 'N', 3, false),
    ('S005660', 'C-N-04', 'N', 4, false),
    ('S005661', 'C-N-05', 'N', 5, false),
    ('S005662', 'C-N-06', 'N', 6, false),
    ('S005663', 'C-N-07', 'N', 7, false),
    ('S005664', 'C-N-08', 'N', 8, false),
    ('S005665', 'C-N-09', 'N', 9, false),
    ('S005666', 'C-N-10', 'N', 10, false),
    ('S005667', 'C-N-11', 'N', 11, false),
    ('S005668', 'C-N-12', 'N', 12, false),
    ('S005669', 'C-N-13', 'N', 13, false),
    ('S005670', 'C-N-14', 'N', 14, false),
    ('S005671', 'C-N-15', 'N', 15, false),
    ('S005672', 'C-N-16', 'N', 16, false),
    ('S005673', 'C-N-17', 'N', 17, false),
    ('S005674', 'C-N-18', 'N', 18, false),
    ('S005675', 'C-N-19', 'N', 19, false),
    ('S005676', 'C-N-20', 'N', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005677', 'C-O-01', 'O', 1, false),
    ('S005678', 'C-O-02', 'O', 2, false),
    ('S005679', 'C-O-03', 'O', 3, false),
    ('S005680', 'C-O-04', 'O', 4, false),
    ('S005681', 'C-O-05', 'O', 5, false),
    ('S005682', 'C-O-06', 'O', 6, false),
    ('S005683', 'C-O-07', 'O', 7, false),
    ('S005684', 'C-O-08', 'O', 8, false),
    ('S005685', 'C-O-09', 'O', 9, false),
    ('S005686', 'C-O-10', 'O', 10, false),
    ('S005687', 'C-O-11', 'O', 11, false),
    ('S005688', 'C-O-12', 'O', 12, false),
    ('S005689', 'C-O-13', 'O', 13, false),
    ('S005690', 'C-O-14', 'O', 14, false),
    ('S005691', 'C-O-15', 'O', 15, false),
    ('S005692', 'C-O-16', 'O', 16, false),
    ('S005693', 'C-O-17', 'O', 17, false),
    ('S005694', 'C-O-18', 'O', 18, false),
    ('S005695', 'C-O-19', 'O', 19, false),
    ('S005696', 'C-O-20', 'O', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005697', 'C-P-01', 'P', 1, false),
    ('S005698', 'C-P-02', 'P', 2, false),
    ('S005699', 'C-P-03', 'P', 3, false),
    ('S005700', 'C-P-04', 'P', 4, false),
    ('S005701', 'C-P-05', 'P', 5, false),
    ('S005702', 'C-P-06', 'P', 6, false),
    ('S005703', 'C-P-07', 'P', 7, false),
    ('S005704', 'C-P-08', 'P', 8, false),
    ('S005705', 'C-P-09', 'P', 9, false),
    ('S005706', 'C-P-10', 'P', 10, false),
    ('S005707', 'C-P-11', 'P', 11, false),
    ('S005708', 'C-P-12', 'P', 12, false),
    ('S005709', 'C-P-13', 'P', 13, false),
    ('S005710', 'C-P-14', 'P', 14, false),
    ('S005711', 'C-P-15', 'P', 15, false),
    ('S005712', 'C-P-16', 'P', 16, false),
    ('S005713', 'C-P-17', 'P', 17, false),
    ('S005714', 'C-P-18', 'P', 18, false),
    ('S005715', 'C-P-19', 'P', 19, false),
    ('S005716', 'C-P-20', 'P', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005717', 'C-Q-01', 'Q', 1, false),
    ('S005718', 'C-Q-02', 'Q', 2, false),
    ('S005719', 'C-Q-03', 'Q', 3, false),
    ('S005720', 'C-Q-04', 'Q', 4, false),
    ('S005721', 'C-Q-05', 'Q', 5, false),
    ('S005722', 'C-Q-06', 'Q', 6, false),
    ('S005723', 'C-Q-07', 'Q', 7, false),
    ('S005724', 'C-Q-08', 'Q', 8, false),
    ('S005725', 'C-Q-09', 'Q', 9, false),
    ('S005726', 'C-Q-10', 'Q', 10, false),
    ('S005727', 'C-Q-11', 'Q', 11, false),
    ('S005728', 'C-Q-12', 'Q', 12, false),
    ('S005729', 'C-Q-13', 'Q', 13, false),
    ('S005730', 'C-Q-14', 'Q', 14, false),
    ('S005731', 'C-Q-15', 'Q', 15, false),
    ('S005732', 'C-Q-16', 'Q', 16, false),
    ('S005733', 'C-Q-17', 'Q', 17, false),
    ('S005734', 'C-Q-18', 'Q', 18, false),
    ('S005735', 'C-Q-19', 'Q', 19, false),
    ('S005736', 'C-Q-20', 'Q', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE D (297 seats)
-- Row A (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005737', 'D-A-01', 'A', 1, false),
    ('S005738', 'D-A-02', 'A', 2, false),
    ('S005739', 'D-A-03', 'A', 3, false),
    ('S005740', 'D-A-04', 'A', 4, false),
    ('S005741', 'D-A-05', 'A', 5, false),
    ('S005742', 'D-A-06', 'A', 6, false),
    ('S005743', 'D-A-07', 'A', 7, false),
    ('S005744', 'D-A-08', 'A', 8, false),
    ('S005745', 'D-A-09', 'A', 9, false),
    ('S005746', 'D-A-10', 'A', 10, false),
    ('S005747', 'D-A-11', 'A', 11, false),
    ('S005748', 'D-A-12', 'A', 12, false),
    ('S005749', 'D-A-13', 'A', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005750', 'D-AA-01', 'AA', 1, false),
    ('S005751', 'D-AA-02', 'AA', 2, false),
    ('S005752', 'D-AA-03', 'AA', 3, false),
    ('S005753', 'D-AA-04', 'AA', 4, false),
    ('S005754', 'D-AA-05', 'AA', 5, false),
    ('S005755', 'D-AA-06', 'AA', 6, false),
    ('S005756', 'D-AA-07', 'AA', 7, false),
    ('S005757', 'D-AA-08', 'AA', 8, false),
    ('S005758', 'D-AA-09', 'AA', 9, false),
    ('S005759', 'D-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005760', 'D-B-01', 'B', 1, false),
    ('S005761', 'D-B-02', 'B', 2, false),
    ('S005762', 'D-B-03', 'B', 3, false),
    ('S005763', 'D-B-04', 'B', 4, false),
    ('S005764', 'D-B-05', 'B', 5, false),
    ('S005765', 'D-B-06', 'B', 6, false),
    ('S005766', 'D-B-07', 'B', 7, false),
    ('S005767', 'D-B-08', 'B', 8, false),
    ('S005768', 'D-B-09', 'B', 9, false),
    ('S005769', 'D-B-10', 'B', 10, false),
    ('S005770', 'D-B-11', 'B', 11, false),
    ('S005771', 'D-B-12', 'B', 12, false),
    ('S005772', 'D-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005773', 'D-C-01', 'C', 1, false),
    ('S005774', 'D-C-02', 'C', 2, false),
    ('S005775', 'D-C-03', 'C', 3, false),
    ('S005776', 'D-C-04', 'C', 4, false),
    ('S005777', 'D-C-05', 'C', 5, false),
    ('S005778', 'D-C-06', 'C', 6, false),
    ('S005779', 'D-C-07', 'C', 7, false),
    ('S005780', 'D-C-08', 'C', 8, false),
    ('S005781', 'D-C-09', 'C', 9, false),
    ('S005782', 'D-C-10', 'C', 10, false),
    ('S005783', 'D-C-11', 'C', 11, false),
    ('S005784', 'D-C-12', 'C', 12, false),
    ('S005785', 'D-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005786', 'D-D-01', 'D', 1, false),
    ('S005787', 'D-D-02', 'D', 2, false),
    ('S005788', 'D-D-03', 'D', 3, false),
    ('S005789', 'D-D-04', 'D', 4, false),
    ('S005790', 'D-D-05', 'D', 5, false),
    ('S005791', 'D-D-06', 'D', 6, false),
    ('S005792', 'D-D-07', 'D', 7, false),
    ('S005793', 'D-D-08', 'D', 8, false),
    ('S005794', 'D-D-09', 'D', 9, false),
    ('S005795', 'D-D-10', 'D', 10, false),
    ('S005796', 'D-D-11', 'D', 11, false),
    ('S005797', 'D-D-12', 'D', 12, false),
    ('S005798', 'D-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005799', 'D-E-01', 'E', 1, false),
    ('S005800', 'D-E-02', 'E', 2, false),
    ('S005801', 'D-E-03', 'E', 3, false),
    ('S005802', 'D-E-04', 'E', 4, false),
    ('S005803', 'D-E-05', 'E', 5, false),
    ('S005804', 'D-E-06', 'E', 6, false),
    ('S005805', 'D-E-07', 'E', 7, false),
    ('S005806', 'D-E-08', 'E', 8, false),
    ('S005807', 'D-E-09', 'E', 9, false),
    ('S005808', 'D-E-10', 'E', 10, false),
    ('S005809', 'D-E-11', 'E', 11, false),
    ('S005810', 'D-E-12', 'E', 12, false),
    ('S005811', 'D-E-13', 'E', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005812', 'D-F-01', 'F', 1, false),
    ('S005813', 'D-F-02', 'F', 2, false),
    ('S005814', 'D-F-03', 'F', 3, false),
    ('S005815', 'D-F-04', 'F', 4, false),
    ('S005816', 'D-F-05', 'F', 5, false),
    ('S005817', 'D-F-06', 'F', 6, false),
    ('S005818', 'D-F-07', 'F', 7, false),
    ('S005819', 'D-F-08', 'F', 8, false),
    ('S005820', 'D-F-09', 'F', 9, false),
    ('S005821', 'D-F-10', 'F', 10, false),
    ('S005822', 'D-F-11', 'F', 11, false),
    ('S005823', 'D-F-12', 'F', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005824', 'D-G-01', 'G', 1, false),
    ('S005825', 'D-G-02', 'G', 2, false),
    ('S005826', 'D-G-03', 'G', 3, false),
    ('S005827', 'D-G-04', 'G', 4, false),
    ('S005828', 'D-G-05', 'G', 5, false),
    ('S005829', 'D-G-06', 'G', 6, false),
    ('S005830', 'D-G-07', 'G', 7, false),
    ('S005831', 'D-G-08', 'G', 8, false),
    ('S005832', 'D-G-09', 'G', 9, false),
    ('S005833', 'D-G-10', 'G', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005834', 'D-H-01', 'H', 1, false),
    ('S005835', 'D-H-02', 'H', 2, false),
    ('S005836', 'D-H-03', 'H', 3, false),
    ('S005837', 'D-H-04', 'H', 4, false),
    ('S005838', 'D-H-05', 'H', 5, false),
    ('S005839', 'D-H-06', 'H', 6, false),
    ('S005840', 'D-H-07', 'H', 7, false),
    ('S005841', 'D-H-08', 'H', 8, false),
    ('S005842', 'D-H-09', 'H', 9, false),
    ('S005843', 'D-H-10', 'H', 10, false),
    ('S005844', 'D-H-11', 'H', 11, false),
    ('S005845', 'D-H-12', 'H', 12, false),
    ('S005846', 'D-H-13', 'H', 13, false),
    ('S005847', 'D-H-14', 'H', 14, false),
    ('S005848', 'D-H-15', 'H', 15, false),
    ('S005849', 'D-H-16', 'H', 16, false),
    ('S005850', 'D-H-17', 'H', 17, false),
    ('S005851', 'D-H-18', 'H', 18, false),
    ('S005852', 'D-H-19', 'H', 19, false),
    ('S005853', 'D-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005854', 'D-I-01', 'I', 1, false),
    ('S005855', 'D-I-02', 'I', 2, false),
    ('S005856', 'D-I-03', 'I', 3, false),
    ('S005857', 'D-I-04', 'I', 4, false),
    ('S005858', 'D-I-05', 'I', 5, false),
    ('S005859', 'D-I-06', 'I', 6, false),
    ('S005860', 'D-I-07', 'I', 7, false),
    ('S005861', 'D-I-08', 'I', 8, false),
    ('S005862', 'D-I-09', 'I', 9, false),
    ('S005863', 'D-I-10', 'I', 10, false),
    ('S005864', 'D-I-11', 'I', 11, false),
    ('S005865', 'D-I-12', 'I', 12, false),
    ('S005866', 'D-I-13', 'I', 13, false),
    ('S005867', 'D-I-14', 'I', 14, false),
    ('S005868', 'D-I-15', 'I', 15, false),
    ('S005869', 'D-I-16', 'I', 16, false),
    ('S005870', 'D-I-17', 'I', 17, false),
    ('S005871', 'D-I-18', 'I', 18, false),
    ('S005872', 'D-I-19', 'I', 19, false),
    ('S005873', 'D-I-20', 'I', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005874', 'D-J-01', 'J', 1, false),
    ('S005875', 'D-J-02', 'J', 2, false),
    ('S005876', 'D-J-03', 'J', 3, false),
    ('S005877', 'D-J-04', 'J', 4, false),
    ('S005878', 'D-J-05', 'J', 5, false),
    ('S005879', 'D-J-06', 'J', 6, false),
    ('S005880', 'D-J-07', 'J', 7, false),
    ('S005881', 'D-J-08', 'J', 8, false),
    ('S005882', 'D-J-09', 'J', 9, false),
    ('S005883', 'D-J-10', 'J', 10, false),
    ('S005884', 'D-J-11', 'J', 11, false),
    ('S005885', 'D-J-12', 'J', 12, false),
    ('S005886', 'D-J-13', 'J', 13, false),
    ('S005887', 'D-J-14', 'J', 14, false),
    ('S005888', 'D-J-15', 'J', 15, false),
    ('S005889', 'D-J-16', 'J', 16, false),
    ('S005890', 'D-J-17', 'J', 17, false),
    ('S005891', 'D-J-18', 'J', 18, false),
    ('S005892', 'D-J-19', 'J', 19, false),
    ('S005893', 'D-J-20', 'J', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005894', 'D-K-01', 'K', 1, false),
    ('S005895', 'D-K-02', 'K', 2, false),
    ('S005896', 'D-K-03', 'K', 3, false),
    ('S005897', 'D-K-04', 'K', 4, false),
    ('S005898', 'D-K-05', 'K', 5, false),
    ('S005899', 'D-K-06', 'K', 6, false),
    ('S005900', 'D-K-07', 'K', 7, false),
    ('S005901', 'D-K-08', 'K', 8, false),
    ('S005902', 'D-K-09', 'K', 9, false),
    ('S005903', 'D-K-10', 'K', 10, false),
    ('S005904', 'D-K-11', 'K', 11, false),
    ('S005905', 'D-K-12', 'K', 12, false),
    ('S005906', 'D-K-13', 'K', 13, false),
    ('S005907', 'D-K-14', 'K', 14, false),
    ('S005908', 'D-K-15', 'K', 15, false),
    ('S005909', 'D-K-16', 'K', 16, false),
    ('S005910', 'D-K-17', 'K', 17, false),
    ('S005911', 'D-K-18', 'K', 18, false),
    ('S005912', 'D-K-19', 'K', 19, false),
    ('S005913', 'D-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005914', 'D-L-01', 'L', 1, false),
    ('S005915', 'D-L-02', 'L', 2, false),
    ('S005916', 'D-L-03', 'L', 3, false),
    ('S005917', 'D-L-04', 'L', 4, false),
    ('S005918', 'D-L-05', 'L', 5, false),
    ('S005919', 'D-L-06', 'L', 6, false),
    ('S005920', 'D-L-07', 'L', 7, false),
    ('S005921', 'D-L-08', 'L', 8, false),
    ('S005922', 'D-L-09', 'L', 9, false),
    ('S005923', 'D-L-10', 'L', 10, false),
    ('S005924', 'D-L-11', 'L', 11, false),
    ('S005925', 'D-L-12', 'L', 12, false),
    ('S005926', 'D-L-13', 'L', 13, false),
    ('S005927', 'D-L-14', 'L', 14, false),
    ('S005928', 'D-L-15', 'L', 15, false),
    ('S005929', 'D-L-16', 'L', 16, false),
    ('S005930', 'D-L-17', 'L', 17, false),
    ('S005931', 'D-L-18', 'L', 18, false),
    ('S005932', 'D-L-19', 'L', 19, false),
    ('S005933', 'D-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005934', 'D-M-01', 'M', 1, false),
    ('S005935', 'D-M-02', 'M', 2, false),
    ('S005936', 'D-M-03', 'M', 3, false),
    ('S005937', 'D-M-04', 'M', 4, false),
    ('S005938', 'D-M-05', 'M', 5, false),
    ('S005939', 'D-M-06', 'M', 6, false),
    ('S005940', 'D-M-07', 'M', 7, false),
    ('S005941', 'D-M-08', 'M', 8, false),
    ('S005942', 'D-M-09', 'M', 9, false),
    ('S005943', 'D-M-10', 'M', 10, false),
    ('S005944', 'D-M-11', 'M', 11, false),
    ('S005945', 'D-M-12', 'M', 12, false),
    ('S005946', 'D-M-13', 'M', 13, false),
    ('S005947', 'D-M-14', 'M', 14, false),
    ('S005948', 'D-M-15', 'M', 15, false),
    ('S005949', 'D-M-16', 'M', 16, false),
    ('S005950', 'D-M-17', 'M', 17, false),
    ('S005951', 'D-M-18', 'M', 18, false),
    ('S005952', 'D-M-19', 'M', 19, false),
    ('S005953', 'D-M-20', 'M', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005954', 'D-N-01', 'N', 1, false),
    ('S005955', 'D-N-02', 'N', 2, false),
    ('S005956', 'D-N-03', 'N', 3, false),
    ('S005957', 'D-N-04', 'N', 4, false),
    ('S005958', 'D-N-05', 'N', 5, false),
    ('S005959', 'D-N-06', 'N', 6, false),
    ('S005960', 'D-N-07', 'N', 7, false),
    ('S005961', 'D-N-08', 'N', 8, false),
    ('S005962', 'D-N-09', 'N', 9, false),
    ('S005963', 'D-N-10', 'N', 10, false),
    ('S005964', 'D-N-11', 'N', 11, false),
    ('S005965', 'D-N-12', 'N', 12, false),
    ('S005966', 'D-N-13', 'N', 13, false),
    ('S005967', 'D-N-14', 'N', 14, false),
    ('S005968', 'D-N-15', 'N', 15, false),
    ('S005969', 'D-N-16', 'N', 16, false),
    ('S005970', 'D-N-17', 'N', 17, false),
    ('S005971', 'D-N-18', 'N', 18, false),
    ('S005972', 'D-N-19', 'N', 19, false),
    ('S005973', 'D-N-20', 'N', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005974', 'D-O-01', 'O', 1, false),
    ('S005975', 'D-O-02', 'O', 2, false),
    ('S005976', 'D-O-03', 'O', 3, false),
    ('S005977', 'D-O-04', 'O', 4, false),
    ('S005978', 'D-O-05', 'O', 5, false),
    ('S005979', 'D-O-06', 'O', 6, false),
    ('S005980', 'D-O-07', 'O', 7, false),
    ('S005981', 'D-O-08', 'O', 8, false),
    ('S005982', 'D-O-09', 'O', 9, false),
    ('S005983', 'D-O-10', 'O', 10, false),
    ('S005984', 'D-O-11', 'O', 11, false),
    ('S005985', 'D-O-12', 'O', 12, false),
    ('S005986', 'D-O-13', 'O', 13, false),
    ('S005987', 'D-O-14', 'O', 14, false),
    ('S005988', 'D-O-15', 'O', 15, false),
    ('S005989', 'D-O-16', 'O', 16, false),
    ('S005990', 'D-O-17', 'O', 17, false),
    ('S005991', 'D-O-18', 'O', 18, false),
    ('S005992', 'D-O-19', 'O', 19, false),
    ('S005993', 'D-O-20', 'O', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005994', 'D-P-01', 'P', 1, false),
    ('S005995', 'D-P-02', 'P', 2, false),
    ('S005996', 'D-P-03', 'P', 3, false),
    ('S005997', 'D-P-04', 'P', 4, false),
    ('S005998', 'D-P-05', 'P', 5, false),
    ('S005999', 'D-P-06', 'P', 6, false),
    ('S006000', 'D-P-07', 'P', 7, false),
    ('S006001', 'D-P-08', 'P', 8, false),
    ('S006002', 'D-P-09', 'P', 9, false),
    ('S006003', 'D-P-10', 'P', 10, false),
    ('S006004', 'D-P-11', 'P', 11, false),
    ('S006005', 'D-P-12', 'P', 12, false),
    ('S006006', 'D-P-13', 'P', 13, false),
    ('S006007', 'D-P-14', 'P', 14, false),
    ('S006008', 'D-P-15', 'P', 15, false),
    ('S006009', 'D-P-16', 'P', 16, false),
    ('S006010', 'D-P-17', 'P', 17, false),
    ('S006011', 'D-P-18', 'P', 18, false),
    ('S006012', 'D-P-19', 'P', 19, false),
    ('S006013', 'D-P-20', 'P', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006014', 'D-Q-01', 'Q', 1, false),
    ('S006015', 'D-Q-02', 'Q', 2, false),
    ('S006016', 'D-Q-03', 'Q', 3, false),
    ('S006017', 'D-Q-04', 'Q', 4, false),
    ('S006018', 'D-Q-05', 'Q', 5, false),
    ('S006019', 'D-Q-06', 'Q', 6, false),
    ('S006020', 'D-Q-07', 'Q', 7, false),
    ('S006021', 'D-Q-08', 'Q', 8, false),
    ('S006022', 'D-Q-09', 'Q', 9, false),
    ('S006023', 'D-Q-10', 'Q', 10, false),
    ('S006024', 'D-Q-11', 'Q', 11, false),
    ('S006025', 'D-Q-12', 'Q', 12, false),
    ('S006026', 'D-Q-13', 'Q', 13, false),
    ('S006027', 'D-Q-14', 'Q', 14, false),
    ('S006028', 'D-Q-15', 'Q', 15, false),
    ('S006029', 'D-Q-16', 'Q', 16, false),
    ('S006030', 'D-Q-17', 'Q', 17, false),
    ('S006031', 'D-Q-18', 'Q', 18, false),
    ('S006032', 'D-Q-19', 'Q', 19, false),
    ('S006033', 'D-Q-20', 'Q', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE D'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE E (306 seats)
-- Row A (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006034', 'E-A-01', 'A', 1, false),
    ('S006035', 'E-A-02', 'A', 2, false),
    ('S006036', 'E-A-03', 'A', 3, false),
    ('S006037', 'E-A-04', 'A', 4, false),
    ('S006038', 'E-A-05', 'A', 5, false),
    ('S006039', 'E-A-06', 'A', 6, false),
    ('S006040', 'E-A-07', 'A', 7, false),
    ('S006041', 'E-A-08', 'A', 8, false),
    ('S006042', 'E-A-09', 'A', 9, false),
    ('S006043', 'E-A-10', 'A', 10, false),
    ('S006044', 'E-A-11', 'A', 11, false),
    ('S006045', 'E-A-12', 'A', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006046', 'E-AA-01', 'AA', 1, false),
    ('S006047', 'E-AA-02', 'AA', 2, false),
    ('S006048', 'E-AA-03', 'AA', 3, false),
    ('S006049', 'E-AA-04', 'AA', 4, false),
    ('S006050', 'E-AA-05', 'AA', 5, false),
    ('S006051', 'E-AA-06', 'AA', 6, false),
    ('S006052', 'E-AA-07', 'AA', 7, false),
    ('S006053', 'E-AA-08', 'AA', 8, false),
    ('S006054', 'E-AA-09', 'AA', 9, false),
    ('S006055', 'E-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006056', 'E-B-01', 'B', 1, false),
    ('S006057', 'E-B-02', 'B', 2, false),
    ('S006058', 'E-B-03', 'B', 3, false),
    ('S006059', 'E-B-04', 'B', 4, false),
    ('S006060', 'E-B-05', 'B', 5, false),
    ('S006061', 'E-B-06', 'B', 6, false),
    ('S006062', 'E-B-07', 'B', 7, false),
    ('S006063', 'E-B-08', 'B', 8, false),
    ('S006064', 'E-B-09', 'B', 9, false),
    ('S006065', 'E-B-10', 'B', 10, false),
    ('S006066', 'E-B-11', 'B', 11, false),
    ('S006067', 'E-B-12', 'B', 12, false),
    ('S006068', 'E-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006069', 'E-C-01', 'C', 1, false),
    ('S006070', 'E-C-02', 'C', 2, false),
    ('S006071', 'E-C-03', 'C', 3, false),
    ('S006072', 'E-C-04', 'C', 4, false),
    ('S006073', 'E-C-05', 'C', 5, false),
    ('S006074', 'E-C-06', 'C', 6, false),
    ('S006075', 'E-C-07', 'C', 7, false),
    ('S006076', 'E-C-08', 'C', 8, false),
    ('S006077', 'E-C-09', 'C', 9, false),
    ('S006078', 'E-C-10', 'C', 10, false),
    ('S006079', 'E-C-11', 'C', 11, false),
    ('S006080', 'E-C-12', 'C', 12, false),
    ('S006081', 'E-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006082', 'E-D-01', 'D', 1, false),
    ('S006083', 'E-D-02', 'D', 2, false),
    ('S006084', 'E-D-03', 'D', 3, false),
    ('S006085', 'E-D-04', 'D', 4, false),
    ('S006086', 'E-D-05', 'D', 5, false),
    ('S006087', 'E-D-06', 'D', 6, false),
    ('S006088', 'E-D-07', 'D', 7, false),
    ('S006089', 'E-D-08', 'D', 8, false),
    ('S006090', 'E-D-09', 'D', 9, false),
    ('S006091', 'E-D-10', 'D', 10, false),
    ('S006092', 'E-D-11', 'D', 11, false),
    ('S006093', 'E-D-12', 'D', 12, false),
    ('S006094', 'E-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (14 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006095', 'E-E-01', 'E', 1, false),
    ('S006096', 'E-E-02', 'E', 2, false),
    ('S006097', 'E-E-03', 'E', 3, false),
    ('S006098', 'E-E-04', 'E', 4, false),
    ('S006099', 'E-E-05', 'E', 5, false),
    ('S006100', 'E-E-06', 'E', 6, false),
    ('S006101', 'E-E-07', 'E', 7, false),
    ('S006102', 'E-E-08', 'E', 8, false),
    ('S006103', 'E-E-09', 'E', 9, false),
    ('S006104', 'E-E-10', 'E', 10, false),
    ('S006105', 'E-E-11', 'E', 11, false),
    ('S006106', 'E-E-12', 'E', 12, false),
    ('S006107', 'E-E-13', 'E', 13, false),
    ('S006108', 'E-E-14', 'E', 14, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006109', 'E-F-01', 'F', 1, false),
    ('S006110', 'E-F-02', 'F', 2, false),
    ('S006111', 'E-F-03', 'F', 3, false),
    ('S006112', 'E-F-04', 'F', 4, false),
    ('S006113', 'E-F-05', 'F', 5, false),
    ('S006114', 'E-F-06', 'F', 6, false),
    ('S006115', 'E-F-07', 'F', 7, false),
    ('S006116', 'E-F-08', 'F', 8, false),
    ('S006117', 'E-F-09', 'F', 9, false),
    ('S006118', 'E-F-10', 'F', 10, false),
    ('S006119', 'E-F-11', 'F', 11, false),
    ('S006120', 'E-F-12', 'F', 12, false),
    ('S006121', 'E-F-13', 'F', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006122', 'E-G-01', 'G', 1, false),
    ('S006123', 'E-G-02', 'G', 2, false),
    ('S006124', 'E-G-03', 'G', 3, false),
    ('S006125', 'E-G-04', 'G', 4, false),
    ('S006126', 'E-G-05', 'G', 5, false),
    ('S006127', 'E-G-06', 'G', 6, false),
    ('S006128', 'E-G-07', 'G', 7, false),
    ('S006129', 'E-G-08', 'G', 8, false),
    ('S006130', 'E-G-09', 'G', 9, false),
    ('S006131', 'E-G-10', 'G', 10, false),
    ('S006132', 'E-G-11', 'G', 11, false),
    ('S006133', 'E-G-12', 'G', 12, false),
    ('S006134', 'E-G-13', 'G', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006135', 'E-H-01', 'H', 1, false),
    ('S006136', 'E-H-02', 'H', 2, false),
    ('S006137', 'E-H-03', 'H', 3, false),
    ('S006138', 'E-H-04', 'H', 4, false),
    ('S006139', 'E-H-05', 'H', 5, false),
    ('S006140', 'E-H-06', 'H', 6, false),
    ('S006141', 'E-H-07', 'H', 7, false),
    ('S006142', 'E-H-08', 'H', 8, false),
    ('S006143', 'E-H-09', 'H', 9, false),
    ('S006144', 'E-H-10', 'H', 10, false),
    ('S006145', 'E-H-11', 'H', 11, false),
    ('S006146', 'E-H-12', 'H', 12, false),
    ('S006147', 'E-H-13', 'H', 13, false),
    ('S006148', 'E-H-14', 'H', 14, false),
    ('S006149', 'E-H-15', 'H', 15, false),
    ('S006150', 'E-H-16', 'H', 16, false),
    ('S006151', 'E-H-17', 'H', 17, false),
    ('S006152', 'E-H-18', 'H', 18, false),
    ('S006153', 'E-H-19', 'H', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006154', 'E-I-01', 'I', 1, false),
    ('S006155', 'E-I-02', 'I', 2, false),
    ('S006156', 'E-I-03', 'I', 3, false),
    ('S006157', 'E-I-04', 'I', 4, false),
    ('S006158', 'E-I-05', 'I', 5, false),
    ('S006159', 'E-I-06', 'I', 6, false),
    ('S006160', 'E-I-07', 'I', 7, false),
    ('S006161', 'E-I-08', 'I', 8, false),
    ('S006162', 'E-I-09', 'I', 9, false),
    ('S006163', 'E-I-10', 'I', 10, false),
    ('S006164', 'E-I-11', 'I', 11, false),
    ('S006165', 'E-I-12', 'I', 12, false),
    ('S006166', 'E-I-13', 'I', 13, false),
    ('S006167', 'E-I-14', 'I', 14, false),
    ('S006168', 'E-I-15', 'I', 15, false),
    ('S006169', 'E-I-16', 'I', 16, false),
    ('S006170', 'E-I-17', 'I', 17, false),
    ('S006171', 'E-I-18', 'I', 18, false),
    ('S006172', 'E-I-19', 'I', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006173', 'E-J-01', 'J', 1, false),
    ('S006174', 'E-J-02', 'J', 2, false),
    ('S006175', 'E-J-03', 'J', 3, false),
    ('S006176', 'E-J-04', 'J', 4, false),
    ('S006177', 'E-J-05', 'J', 5, false),
    ('S006178', 'E-J-06', 'J', 6, false),
    ('S006179', 'E-J-07', 'J', 7, false),
    ('S006180', 'E-J-08', 'J', 8, false),
    ('S006181', 'E-J-09', 'J', 9, false),
    ('S006182', 'E-J-10', 'J', 10, false),
    ('S006183', 'E-J-11', 'J', 11, false),
    ('S006184', 'E-J-12', 'J', 12, false),
    ('S006185', 'E-J-13', 'J', 13, false),
    ('S006186', 'E-J-14', 'J', 14, false),
    ('S006187', 'E-J-15', 'J', 15, false),
    ('S006188', 'E-J-16', 'J', 16, false),
    ('S006189', 'E-J-17', 'J', 17, false),
    ('S006190', 'E-J-18', 'J', 18, false),
    ('S006191', 'E-J-19', 'J', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006192', 'E-K-01', 'K', 1, false),
    ('S006193', 'E-K-02', 'K', 2, false),
    ('S006194', 'E-K-03', 'K', 3, false),
    ('S006195', 'E-K-04', 'K', 4, false),
    ('S006196', 'E-K-05', 'K', 5, false),
    ('S006197', 'E-K-06', 'K', 6, false),
    ('S006198', 'E-K-07', 'K', 7, false),
    ('S006199', 'E-K-08', 'K', 8, false),
    ('S006200', 'E-K-09', 'K', 9, false),
    ('S006201', 'E-K-10', 'K', 10, false),
    ('S006202', 'E-K-11', 'K', 11, false),
    ('S006203', 'E-K-12', 'K', 12, false),
    ('S006204', 'E-K-13', 'K', 13, false),
    ('S006205', 'E-K-14', 'K', 14, false),
    ('S006206', 'E-K-15', 'K', 15, false),
    ('S006207', 'E-K-16', 'K', 16, false),
    ('S006208', 'E-K-17', 'K', 17, false),
    ('S006209', 'E-K-18', 'K', 18, false),
    ('S006210', 'E-K-19', 'K', 19, false),
    ('S006211', 'E-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006212', 'E-L-01', 'L', 1, false),
    ('S006213', 'E-L-02', 'L', 2, false),
    ('S006214', 'E-L-03', 'L', 3, false),
    ('S006215', 'E-L-04', 'L', 4, false),
    ('S006216', 'E-L-05', 'L', 5, false),
    ('S006217', 'E-L-06', 'L', 6, false),
    ('S006218', 'E-L-07', 'L', 7, false),
    ('S006219', 'E-L-08', 'L', 8, false),
    ('S006220', 'E-L-09', 'L', 9, false),
    ('S006221', 'E-L-10', 'L', 10, false),
    ('S006222', 'E-L-11', 'L', 11, false),
    ('S006223', 'E-L-12', 'L', 12, false),
    ('S006224', 'E-L-13', 'L', 13, false),
    ('S006225', 'E-L-14', 'L', 14, false),
    ('S006226', 'E-L-15', 'L', 15, false),
    ('S006227', 'E-L-16', 'L', 16, false),
    ('S006228', 'E-L-17', 'L', 17, false),
    ('S006229', 'E-L-18', 'L', 18, false),
    ('S006230', 'E-L-19', 'L', 19, false),
    ('S006231', 'E-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006232', 'E-M-01', 'M', 1, false),
    ('S006233', 'E-M-02', 'M', 2, false),
    ('S006234', 'E-M-03', 'M', 3, false),
    ('S006235', 'E-M-04', 'M', 4, false),
    ('S006236', 'E-M-05', 'M', 5, false),
    ('S006237', 'E-M-06', 'M', 6, false),
    ('S006238', 'E-M-07', 'M', 7, false),
    ('S006239', 'E-M-08', 'M', 8, false),
    ('S006240', 'E-M-09', 'M', 9, false),
    ('S006241', 'E-M-10', 'M', 10, false),
    ('S006242', 'E-M-11', 'M', 11, false),
    ('S006243', 'E-M-12', 'M', 12, false),
    ('S006244', 'E-M-13', 'M', 13, false),
    ('S006245', 'E-M-14', 'M', 14, false),
    ('S006246', 'E-M-15', 'M', 15, false),
    ('S006247', 'E-M-16', 'M', 16, false),
    ('S006248', 'E-M-17', 'M', 17, false),
    ('S006249', 'E-M-18', 'M', 18, false),
    ('S006250', 'E-M-19', 'M', 19, false),
    ('S006251', 'E-M-20', 'M', 20, false),
    ('S006252', 'E-M-21', 'M', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006253', 'E-N-01', 'N', 1, false),
    ('S006254', 'E-N-02', 'N', 2, false),
    ('S006255', 'E-N-03', 'N', 3, false),
    ('S006256', 'E-N-04', 'N', 4, false),
    ('S006257', 'E-N-05', 'N', 5, false),
    ('S006258', 'E-N-06', 'N', 6, false),
    ('S006259', 'E-N-07', 'N', 7, false),
    ('S006260', 'E-N-08', 'N', 8, false),
    ('S006261', 'E-N-09', 'N', 9, false),
    ('S006262', 'E-N-10', 'N', 10, false),
    ('S006263', 'E-N-11', 'N', 11, false),
    ('S006264', 'E-N-12', 'N', 12, false),
    ('S006265', 'E-N-13', 'N', 13, false),
    ('S006266', 'E-N-14', 'N', 14, false),
    ('S006267', 'E-N-15', 'N', 15, false),
    ('S006268', 'E-N-16', 'N', 16, false),
    ('S006269', 'E-N-17', 'N', 17, false),
    ('S006270', 'E-N-18', 'N', 18, false),
    ('S006271', 'E-N-19', 'N', 19, false),
    ('S006272', 'E-N-20', 'N', 20, false),
    ('S006273', 'E-N-21', 'N', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006274', 'E-O-01', 'O', 1, false),
    ('S006275', 'E-O-02', 'O', 2, false),
    ('S006276', 'E-O-03', 'O', 3, false),
    ('S006277', 'E-O-04', 'O', 4, false),
    ('S006278', 'E-O-05', 'O', 5, false),
    ('S006279', 'E-O-06', 'O', 6, false),
    ('S006280', 'E-O-07', 'O', 7, false),
    ('S006281', 'E-O-08', 'O', 8, false),
    ('S006282', 'E-O-09', 'O', 9, false),
    ('S006283', 'E-O-10', 'O', 10, false),
    ('S006284', 'E-O-11', 'O', 11, false),
    ('S006285', 'E-O-12', 'O', 12, false),
    ('S006286', 'E-O-13', 'O', 13, false),
    ('S006287', 'E-O-14', 'O', 14, false),
    ('S006288', 'E-O-15', 'O', 15, false),
    ('S006289', 'E-O-16', 'O', 16, false),
    ('S006290', 'E-O-17', 'O', 17, false),
    ('S006291', 'E-O-18', 'O', 18, false),
    ('S006292', 'E-O-19', 'O', 19, false),
    ('S006293', 'E-O-20', 'O', 20, false),
    ('S006294', 'E-O-21', 'O', 21, false),
    ('S006295', 'E-O-22', 'O', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006296', 'E-P-01', 'P', 1, false),
    ('S006297', 'E-P-02', 'P', 2, false),
    ('S006298', 'E-P-03', 'P', 3, false),
    ('S006299', 'E-P-04', 'P', 4, false),
    ('S006300', 'E-P-05', 'P', 5, false),
    ('S006301', 'E-P-06', 'P', 6, false),
    ('S006302', 'E-P-07', 'P', 7, false),
    ('S006303', 'E-P-08', 'P', 8, false),
    ('S006304', 'E-P-09', 'P', 9, false),
    ('S006305', 'E-P-10', 'P', 10, false),
    ('S006306', 'E-P-11', 'P', 11, false),
    ('S006307', 'E-P-12', 'P', 12, false),
    ('S006308', 'E-P-13', 'P', 13, false),
    ('S006309', 'E-P-14', 'P', 14, false),
    ('S006310', 'E-P-15', 'P', 15, false),
    ('S006311', 'E-P-16', 'P', 16, false),
    ('S006312', 'E-P-17', 'P', 17, false),
    ('S006313', 'E-P-18', 'P', 18, false),
    ('S006314', 'E-P-19', 'P', 19, false),
    ('S006315', 'E-P-20', 'P', 20, false),
    ('S006316', 'E-P-21', 'P', 21, false),
    ('S006317', 'E-P-22', 'P', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006318', 'E-Q-01', 'Q', 1, false),
    ('S006319', 'E-Q-02', 'Q', 2, false),
    ('S006320', 'E-Q-03', 'Q', 3, false),
    ('S006321', 'E-Q-04', 'Q', 4, false),
    ('S006322', 'E-Q-05', 'Q', 5, false),
    ('S006323', 'E-Q-06', 'Q', 6, false),
    ('S006324', 'E-Q-07', 'Q', 7, false),
    ('S006325', 'E-Q-08', 'Q', 8, false),
    ('S006326', 'E-Q-09', 'Q', 9, false),
    ('S006327', 'E-Q-10', 'Q', 10, false),
    ('S006328', 'E-Q-11', 'Q', 11, false),
    ('S006329', 'E-Q-12', 'Q', 12, false),
    ('S006330', 'E-Q-13', 'Q', 13, false),
    ('S006331', 'E-Q-14', 'Q', 14, false),
    ('S006332', 'E-Q-15', 'Q', 15, false),
    ('S006333', 'E-Q-16', 'Q', 16, false),
    ('S006334', 'E-Q-17', 'Q', 17, false),
    ('S006335', 'E-Q-18', 'Q', 18, false),
    ('S006336', 'E-Q-19', 'Q', 19, false),
    ('S006337', 'E-Q-20', 'Q', 20, false),
    ('S006338', 'E-Q-21', 'Q', 21, false),
    ('S006339', 'E-Q-22', 'Q', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE E'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE F (258 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006340', 'F-A-01', 'A', 1, false),
    ('S006341', 'F-A-02', 'A', 2, false),
    ('S006342', 'F-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006343', 'F-B-01', 'B', 1, false),
    ('S006344', 'F-B-02', 'B', 2, false),
    ('S006345', 'F-B-03', 'B', 3, false),
    ('S006346', 'F-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006347', 'F-C-01', 'C', 1, false),
    ('S006348', 'F-C-02', 'C', 2, false),
    ('S006349', 'F-C-03', 'C', 3, false),
    ('S006350', 'F-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006351', 'F-D-01', 'D', 1, false),
    ('S006352', 'F-D-02', 'D', 2, false),
    ('S006353', 'F-D-03', 'D', 3, false),
    ('S006354', 'F-D-04', 'D', 4, false),
    ('S006355', 'F-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006356', 'F-E-01', 'E', 1, false),
    ('S006357', 'F-E-02', 'E', 2, false),
    ('S006358', 'F-E-03', 'E', 3, false),
    ('S006359', 'F-E-04', 'E', 4, false),
    ('S006360', 'F-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006361', 'F-F-01', 'F', 1, false),
    ('S006362', 'F-F-02', 'F', 2, false),
    ('S006363', 'F-F-03', 'F', 3, false),
    ('S006364', 'F-F-04', 'F', 4, false),
    ('S006365', 'F-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006366', 'F-G-01', 'G', 1, false),
    ('S006367', 'F-G-02', 'G', 2, false),
    ('S006368', 'F-G-03', 'G', 3, false),
    ('S006369', 'F-G-04', 'G', 4, false),
    ('S006370', 'F-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006371', 'F-H-01', 'H', 1, false),
    ('S006372', 'F-H-02', 'H', 2, false),
    ('S006373', 'F-H-03', 'H', 3, false),
    ('S006374', 'F-H-04', 'H', 4, false),
    ('S006375', 'F-H-05', 'H', 5, false),
    ('S006376', 'F-H-06', 'H', 6, false),
    ('S006377', 'F-H-07', 'H', 7, false),
    ('S006378', 'F-H-08', 'H', 8, false),
    ('S006379', 'F-H-09', 'H', 9, false),
    ('S006380', 'F-H-10', 'H', 10, false),
    ('S006381', 'F-H-11', 'H', 11, false),
    ('S006382', 'F-H-12', 'H', 12, false),
    ('S006383', 'F-H-13', 'H', 13, false),
    ('S006384', 'F-H-14', 'H', 14, false),
    ('S006385', 'F-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006386', 'F-I-01', 'I', 1, false),
    ('S006387', 'F-I-02', 'I', 2, false),
    ('S006388', 'F-I-03', 'I', 3, false),
    ('S006389', 'F-I-04', 'I', 4, false),
    ('S006390', 'F-I-05', 'I', 5, false),
    ('S006391', 'F-I-06', 'I', 6, false),
    ('S006392', 'F-I-07', 'I', 7, false),
    ('S006393', 'F-I-08', 'I', 8, false),
    ('S006394', 'F-I-09', 'I', 9, false),
    ('S006395', 'F-I-10', 'I', 10, false),
    ('S006396', 'F-I-11', 'I', 11, false),
    ('S006397', 'F-I-12', 'I', 12, false),
    ('S006398', 'F-I-13', 'I', 13, false),
    ('S006399', 'F-I-14', 'I', 14, false),
    ('S006400', 'F-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006401', 'F-J-01', 'J', 1, false),
    ('S006402', 'F-J-02', 'J', 2, false),
    ('S006403', 'F-J-03', 'J', 3, false),
    ('S006404', 'F-J-04', 'J', 4, false),
    ('S006405', 'F-J-05', 'J', 5, false),
    ('S006406', 'F-J-06', 'J', 6, false),
    ('S006407', 'F-J-07', 'J', 7, false),
    ('S006408', 'F-J-08', 'J', 8, false),
    ('S006409', 'F-J-09', 'J', 9, false),
    ('S006410', 'F-J-10', 'J', 10, false),
    ('S006411', 'F-J-11', 'J', 11, false),
    ('S006412', 'F-J-12', 'J', 12, false),
    ('S006413', 'F-J-13', 'J', 13, false),
    ('S006414', 'F-J-14', 'J', 14, false),
    ('S006415', 'F-J-15', 'J', 15, false),
    ('S006416', 'F-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006417', 'F-K-01', 'K', 1, false),
    ('S006418', 'F-K-02', 'K', 2, false),
    ('S006419', 'F-K-03', 'K', 3, false),
    ('S006420', 'F-K-04', 'K', 4, false),
    ('S006421', 'F-K-05', 'K', 5, false),
    ('S006422', 'F-K-06', 'K', 6, false),
    ('S006423', 'F-K-07', 'K', 7, false),
    ('S006424', 'F-K-08', 'K', 8, false),
    ('S006425', 'F-K-09', 'K', 9, false),
    ('S006426', 'F-K-10', 'K', 10, false),
    ('S006427', 'F-K-11', 'K', 11, false),
    ('S006428', 'F-K-12', 'K', 12, false),
    ('S006429', 'F-K-13', 'K', 13, false),
    ('S006430', 'F-K-14', 'K', 14, false),
    ('S006431', 'F-K-15', 'K', 15, false),
    ('S006432', 'F-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006433', 'F-L-01', 'L', 1, false),
    ('S006434', 'F-L-02', 'L', 2, false),
    ('S006435', 'F-L-03', 'L', 3, false),
    ('S006436', 'F-L-04', 'L', 4, false),
    ('S006437', 'F-L-05', 'L', 5, false),
    ('S006438', 'F-L-06', 'L', 6, false),
    ('S006439', 'F-L-07', 'L', 7, false),
    ('S006440', 'F-L-08', 'L', 8, false),
    ('S006441', 'F-L-09', 'L', 9, false),
    ('S006442', 'F-L-10', 'L', 10, false),
    ('S006443', 'F-L-11', 'L', 11, false),
    ('S006444', 'F-L-12', 'L', 12, false),
    ('S006445', 'F-L-13', 'L', 13, false),
    ('S006446', 'F-L-14', 'L', 14, false),
    ('S006447', 'F-L-15', 'L', 15, false),
    ('S006448', 'F-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006449', 'F-M-01', 'M', 1, false),
    ('S006450', 'F-M-02', 'M', 2, false),
    ('S006451', 'F-M-03', 'M', 3, false),
    ('S006452', 'F-M-04', 'M', 4, false),
    ('S006453', 'F-M-05', 'M', 5, false),
    ('S006454', 'F-M-06', 'M', 6, false),
    ('S006455', 'F-M-07', 'M', 7, false),
    ('S006456', 'F-M-08', 'M', 8, false),
    ('S006457', 'F-M-09', 'M', 9, false),
    ('S006458', 'F-M-10', 'M', 10, false),
    ('S006459', 'F-M-11', 'M', 11, false),
    ('S006460', 'F-M-12', 'M', 12, false),
    ('S006461', 'F-M-13', 'M', 13, false),
    ('S006462', 'F-M-14', 'M', 14, false),
    ('S006463', 'F-M-15', 'M', 15, false),
    ('S006464', 'F-M-16', 'M', 16, false),
    ('S006465', 'F-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006466', 'F-N-01', 'N', 1, false),
    ('S006467', 'F-N-02', 'N', 2, false),
    ('S006468', 'F-N-03', 'N', 3, false),
    ('S006469', 'F-N-04', 'N', 4, false),
    ('S006470', 'F-N-05', 'N', 5, false),
    ('S006471', 'F-N-06', 'N', 6, false),
    ('S006472', 'F-N-07', 'N', 7, false),
    ('S006473', 'F-N-08', 'N', 8, false),
    ('S006474', 'F-N-09', 'N', 9, false),
    ('S006475', 'F-N-10', 'N', 10, false),
    ('S006476', 'F-N-11', 'N', 11, false),
    ('S006477', 'F-N-12', 'N', 12, false),
    ('S006478', 'F-N-13', 'N', 13, false),
    ('S006479', 'F-N-14', 'N', 14, false),
    ('S006480', 'F-N-15', 'N', 15, false),
    ('S006481', 'F-N-16', 'N', 16, false),
    ('S006482', 'F-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006483', 'F-O-01', 'O', 1, false),
    ('S006484', 'F-O-02', 'O', 2, false),
    ('S006485', 'F-O-03', 'O', 3, false),
    ('S006486', 'F-O-04', 'O', 4, false),
    ('S006487', 'F-O-05', 'O', 5, false),
    ('S006488', 'F-O-06', 'O', 6, false),
    ('S006489', 'F-O-07', 'O', 7, false),
    ('S006490', 'F-O-08', 'O', 8, false),
    ('S006491', 'F-O-09', 'O', 9, false),
    ('S006492', 'F-O-10', 'O', 10, false),
    ('S006493', 'F-O-11', 'O', 11, false),
    ('S006494', 'F-O-12', 'O', 12, false),
    ('S006495', 'F-O-13', 'O', 13, false),
    ('S006496', 'F-O-14', 'O', 14, false),
    ('S006497', 'F-O-15', 'O', 15, false),
    ('S006498', 'F-O-16', 'O', 16, false),
    ('S006499', 'F-O-17', 'O', 17, false),
    ('S006500', 'F-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006501', 'F-P-01', 'P', 1, false),
    ('S006502', 'F-P-02', 'P', 2, false),
    ('S006503', 'F-P-03', 'P', 3, false),
    ('S006504', 'F-P-04', 'P', 4, false),
    ('S006505', 'F-P-05', 'P', 5, false),
    ('S006506', 'F-P-06', 'P', 6, false),
    ('S006507', 'F-P-07', 'P', 7, false),
    ('S006508', 'F-P-08', 'P', 8, false),
    ('S006509', 'F-P-09', 'P', 9, false),
    ('S006510', 'F-P-10', 'P', 10, false),
    ('S006511', 'F-P-11', 'P', 11, false),
    ('S006512', 'F-P-12', 'P', 12, false),
    ('S006513', 'F-P-13', 'P', 13, false),
    ('S006514', 'F-P-14', 'P', 14, false),
    ('S006515', 'F-P-15', 'P', 15, false),
    ('S006516', 'F-P-16', 'P', 16, false),
    ('S006517', 'F-P-17', 'P', 17, false),
    ('S006518', 'F-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006519', 'F-Q-01', 'Q', 1, false),
    ('S006520', 'F-Q-02', 'Q', 2, false),
    ('S006521', 'F-Q-03', 'Q', 3, false),
    ('S006522', 'F-Q-04', 'Q', 4, false),
    ('S006523', 'F-Q-05', 'Q', 5, false),
    ('S006524', 'F-Q-06', 'Q', 6, false),
    ('S006525', 'F-Q-07', 'Q', 7, false),
    ('S006526', 'F-Q-08', 'Q', 8, false),
    ('S006527', 'F-Q-09', 'Q', 9, false),
    ('S006528', 'F-Q-10', 'Q', 10, false),
    ('S006529', 'F-Q-11', 'Q', 11, false),
    ('S006530', 'F-Q-12', 'Q', 12, false),
    ('S006531', 'F-Q-13', 'Q', 13, false),
    ('S006532', 'F-Q-14', 'Q', 14, false),
    ('S006533', 'F-Q-15', 'Q', 15, false),
    ('S006534', 'F-Q-16', 'Q', 16, false),
    ('S006535', 'F-Q-17', 'Q', 17, false),
    ('S006536', 'F-Q-18', 'Q', 18, false),
    ('S006537', 'F-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006538', 'F-R-01', 'R', 1, false),
    ('S006539', 'F-R-02', 'R', 2, false),
    ('S006540', 'F-R-03', 'R', 3, false),
    ('S006541', 'F-R-04', 'R', 4, false),
    ('S006542', 'F-R-05', 'R', 5, false),
    ('S006543', 'F-R-06', 'R', 6, false),
    ('S006544', 'F-R-07', 'R', 7, false),
    ('S006545', 'F-R-08', 'R', 8, false),
    ('S006546', 'F-R-09', 'R', 9, false),
    ('S006547', 'F-R-10', 'R', 10, false),
    ('S006548', 'F-R-11', 'R', 11, false),
    ('S006549', 'F-R-12', 'R', 12, false),
    ('S006550', 'F-R-13', 'R', 13, false),
    ('S006551', 'F-R-14', 'R', 14, false),
    ('S006552', 'F-R-15', 'R', 15, false),
    ('S006553', 'F-R-16', 'R', 16, false),
    ('S006554', 'F-R-17', 'R', 17, false),
    ('S006555', 'F-R-18', 'R', 18, false),
    ('S006556', 'F-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006557', 'F-S-01', 'S', 1, false),
    ('S006558', 'F-S-02', 'S', 2, false),
    ('S006559', 'F-S-03', 'S', 3, false),
    ('S006560', 'F-S-04', 'S', 4, false),
    ('S006561', 'F-S-05', 'S', 5, false),
    ('S006562', 'F-S-06', 'S', 6, false),
    ('S006563', 'F-S-07', 'S', 7, false),
    ('S006564', 'F-S-08', 'S', 8, false),
    ('S006565', 'F-S-09', 'S', 9, false),
    ('S006566', 'F-S-10', 'S', 10, false),
    ('S006567', 'F-S-11', 'S', 11, false),
    ('S006568', 'F-S-12', 'S', 12, false),
    ('S006569', 'F-S-13', 'S', 13, false),
    ('S006570', 'F-S-14', 'S', 14, false),
    ('S006571', 'F-S-15', 'S', 15, false),
    ('S006572', 'F-S-16', 'S', 16, false),
    ('S006573', 'F-S-17', 'S', 17, false),
    ('S006574', 'F-S-18', 'S', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006575', 'F-T-01', 'T', 1, false),
    ('S006576', 'F-T-02', 'T', 2, false),
    ('S006577', 'F-T-03', 'T', 3, false),
    ('S006578', 'F-T-04', 'T', 4, false),
    ('S006579', 'F-T-05', 'T', 5, false),
    ('S006580', 'F-T-06', 'T', 6, false),
    ('S006581', 'F-T-07', 'T', 7, false),
    ('S006582', 'F-T-08', 'T', 8, false),
    ('S006583', 'F-T-09', 'T', 9, false),
    ('S006584', 'F-T-10', 'T', 10, false),
    ('S006585', 'F-T-11', 'T', 11, false),
    ('S006586', 'F-T-12', 'T', 12, false),
    ('S006587', 'F-T-13', 'T', 13, false),
    ('S006588', 'F-T-14', 'T', 14, false),
    ('S006589', 'F-T-15', 'T', 15, false),
    ('S006590', 'F-T-16', 'T', 16, false),
    ('S006591', 'F-T-17', 'T', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (6 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006592', 'F-U-01', 'U', 1, false),
    ('S006593', 'F-U-02', 'U', 2, false),
    ('S006594', 'F-U-03', 'U', 3, false),
    ('S006595', 'F-U-04', 'U', 4, false),
    ('S006596', 'F-U-05', 'U', 5, false),
    ('S006597', 'F-U-06', 'U', 6, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE F'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE G (256 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006598', 'G-A-01', 'A', 1, false),
    ('S006599', 'G-A-02', 'A', 2, false),
    ('S006600', 'G-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006601', 'G-B-01', 'B', 1, false),
    ('S006602', 'G-B-02', 'B', 2, false),
    ('S006603', 'G-B-03', 'B', 3, false),
    ('S006604', 'G-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006605', 'G-C-01', 'C', 1, false),
    ('S006606', 'G-C-02', 'C', 2, false),
    ('S006607', 'G-C-03', 'C', 3, false),
    ('S006608', 'G-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006609', 'G-D-01', 'D', 1, false),
    ('S006610', 'G-D-02', 'D', 2, false),
    ('S006611', 'G-D-03', 'D', 3, false),
    ('S006612', 'G-D-04', 'D', 4, false),
    ('S006613', 'G-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006614', 'G-E-01', 'E', 1, false),
    ('S006615', 'G-E-02', 'E', 2, false),
    ('S006616', 'G-E-03', 'E', 3, false),
    ('S006617', 'G-E-04', 'E', 4, false),
    ('S006618', 'G-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006619', 'G-F-01', 'F', 1, false),
    ('S006620', 'G-F-02', 'F', 2, false),
    ('S006621', 'G-F-03', 'F', 3, false),
    ('S006622', 'G-F-04', 'F', 4, false),
    ('S006623', 'G-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006624', 'G-G-01', 'G', 1, false),
    ('S006625', 'G-G-02', 'G', 2, false),
    ('S006626', 'G-G-03', 'G', 3, false),
    ('S006627', 'G-G-04', 'G', 4, false),
    ('S006628', 'G-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006629', 'G-H-01', 'H', 1, false),
    ('S006630', 'G-H-02', 'H', 2, false),
    ('S006631', 'G-H-03', 'H', 3, false),
    ('S006632', 'G-H-04', 'H', 4, false),
    ('S006633', 'G-H-05', 'H', 5, false),
    ('S006634', 'G-H-06', 'H', 6, false),
    ('S006635', 'G-H-07', 'H', 7, false),
    ('S006636', 'G-H-08', 'H', 8, false),
    ('S006637', 'G-H-09', 'H', 9, false),
    ('S006638', 'G-H-10', 'H', 10, false),
    ('S006639', 'G-H-11', 'H', 11, false),
    ('S006640', 'G-H-12', 'H', 12, false),
    ('S006641', 'G-H-13', 'H', 13, false),
    ('S006642', 'G-H-14', 'H', 14, false),
    ('S006643', 'G-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006644', 'G-I-01', 'I', 1, false),
    ('S006645', 'G-I-02', 'I', 2, false),
    ('S006646', 'G-I-03', 'I', 3, false),
    ('S006647', 'G-I-04', 'I', 4, false),
    ('S006648', 'G-I-05', 'I', 5, false),
    ('S006649', 'G-I-06', 'I', 6, false),
    ('S006650', 'G-I-07', 'I', 7, false),
    ('S006651', 'G-I-08', 'I', 8, false),
    ('S006652', 'G-I-09', 'I', 9, false),
    ('S006653', 'G-I-10', 'I', 10, false),
    ('S006654', 'G-I-11', 'I', 11, false),
    ('S006655', 'G-I-12', 'I', 12, false),
    ('S006656', 'G-I-13', 'I', 13, false),
    ('S006657', 'G-I-14', 'I', 14, false),
    ('S006658', 'G-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006659', 'G-J-01', 'J', 1, false),
    ('S006660', 'G-J-02', 'J', 2, false),
    ('S006661', 'G-J-03', 'J', 3, false),
    ('S006662', 'G-J-04', 'J', 4, false),
    ('S006663', 'G-J-05', 'J', 5, false),
    ('S006664', 'G-J-06', 'J', 6, false),
    ('S006665', 'G-J-07', 'J', 7, false),
    ('S006666', 'G-J-08', 'J', 8, false),
    ('S006667', 'G-J-09', 'J', 9, false),
    ('S006668', 'G-J-10', 'J', 10, false),
    ('S006669', 'G-J-11', 'J', 11, false),
    ('S006670', 'G-J-12', 'J', 12, false),
    ('S006671', 'G-J-13', 'J', 13, false),
    ('S006672', 'G-J-14', 'J', 14, false),
    ('S006673', 'G-J-15', 'J', 15, false),
    ('S006674', 'G-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006675', 'G-K-01', 'K', 1, false),
    ('S006676', 'G-K-02', 'K', 2, false),
    ('S006677', 'G-K-03', 'K', 3, false),
    ('S006678', 'G-K-04', 'K', 4, false),
    ('S006679', 'G-K-05', 'K', 5, false),
    ('S006680', 'G-K-06', 'K', 6, false),
    ('S006681', 'G-K-07', 'K', 7, false),
    ('S006682', 'G-K-08', 'K', 8, false),
    ('S006683', 'G-K-09', 'K', 9, false),
    ('S006684', 'G-K-10', 'K', 10, false),
    ('S006685', 'G-K-11', 'K', 11, false),
    ('S006686', 'G-K-12', 'K', 12, false),
    ('S006687', 'G-K-13', 'K', 13, false),
    ('S006688', 'G-K-14', 'K', 14, false),
    ('S006689', 'G-K-15', 'K', 15, false),
    ('S006690', 'G-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006691', 'G-L-01', 'L', 1, false),
    ('S006692', 'G-L-02', 'L', 2, false),
    ('S006693', 'G-L-03', 'L', 3, false),
    ('S006694', 'G-L-04', 'L', 4, false),
    ('S006695', 'G-L-05', 'L', 5, false),
    ('S006696', 'G-L-06', 'L', 6, false),
    ('S006697', 'G-L-07', 'L', 7, false),
    ('S006698', 'G-L-08', 'L', 8, false),
    ('S006699', 'G-L-09', 'L', 9, false),
    ('S006700', 'G-L-10', 'L', 10, false),
    ('S006701', 'G-L-11', 'L', 11, false),
    ('S006702', 'G-L-12', 'L', 12, false),
    ('S006703', 'G-L-13', 'L', 13, false),
    ('S006704', 'G-L-14', 'L', 14, false),
    ('S006705', 'G-L-15', 'L', 15, false),
    ('S006706', 'G-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006707', 'G-M-01', 'M', 1, false),
    ('S006708', 'G-M-02', 'M', 2, false),
    ('S006709', 'G-M-03', 'M', 3, false),
    ('S006710', 'G-M-04', 'M', 4, false),
    ('S006711', 'G-M-05', 'M', 5, false),
    ('S006712', 'G-M-06', 'M', 6, false),
    ('S006713', 'G-M-07', 'M', 7, false),
    ('S006714', 'G-M-08', 'M', 8, false),
    ('S006715', 'G-M-09', 'M', 9, false),
    ('S006716', 'G-M-10', 'M', 10, false),
    ('S006717', 'G-M-11', 'M', 11, false),
    ('S006718', 'G-M-12', 'M', 12, false),
    ('S006719', 'G-M-13', 'M', 13, false),
    ('S006720', 'G-M-14', 'M', 14, false),
    ('S006721', 'G-M-15', 'M', 15, false),
    ('S006722', 'G-M-16', 'M', 16, false),
    ('S006723', 'G-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006724', 'G-N-01', 'N', 1, false),
    ('S006725', 'G-N-02', 'N', 2, false),
    ('S006726', 'G-N-03', 'N', 3, false),
    ('S006727', 'G-N-04', 'N', 4, false),
    ('S006728', 'G-N-05', 'N', 5, false),
    ('S006729', 'G-N-06', 'N', 6, false),
    ('S006730', 'G-N-07', 'N', 7, false),
    ('S006731', 'G-N-08', 'N', 8, false),
    ('S006732', 'G-N-09', 'N', 9, false),
    ('S006733', 'G-N-10', 'N', 10, false),
    ('S006734', 'G-N-11', 'N', 11, false),
    ('S006735', 'G-N-12', 'N', 12, false),
    ('S006736', 'G-N-13', 'N', 13, false),
    ('S006737', 'G-N-14', 'N', 14, false),
    ('S006738', 'G-N-15', 'N', 15, false),
    ('S006739', 'G-N-16', 'N', 16, false),
    ('S006740', 'G-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006741', 'G-O-01', 'O', 1, false),
    ('S006742', 'G-O-02', 'O', 2, false),
    ('S006743', 'G-O-03', 'O', 3, false),
    ('S006744', 'G-O-04', 'O', 4, false),
    ('S006745', 'G-O-05', 'O', 5, false),
    ('S006746', 'G-O-06', 'O', 6, false),
    ('S006747', 'G-O-07', 'O', 7, false),
    ('S006748', 'G-O-08', 'O', 8, false),
    ('S006749', 'G-O-09', 'O', 9, false),
    ('S006750', 'G-O-10', 'O', 10, false),
    ('S006751', 'G-O-11', 'O', 11, false),
    ('S006752', 'G-O-12', 'O', 12, false),
    ('S006753', 'G-O-13', 'O', 13, false),
    ('S006754', 'G-O-14', 'O', 14, false),
    ('S006755', 'G-O-15', 'O', 15, false),
    ('S006756', 'G-O-16', 'O', 16, false),
    ('S006757', 'G-O-17', 'O', 17, false),
    ('S006758', 'G-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006759', 'G-P-01', 'P', 1, false),
    ('S006760', 'G-P-02', 'P', 2, false),
    ('S006761', 'G-P-03', 'P', 3, false),
    ('S006762', 'G-P-04', 'P', 4, false),
    ('S006763', 'G-P-05', 'P', 5, false),
    ('S006764', 'G-P-06', 'P', 6, false),
    ('S006765', 'G-P-07', 'P', 7, false),
    ('S006766', 'G-P-08', 'P', 8, false),
    ('S006767', 'G-P-09', 'P', 9, false),
    ('S006768', 'G-P-10', 'P', 10, false),
    ('S006769', 'G-P-11', 'P', 11, false),
    ('S006770', 'G-P-12', 'P', 12, false),
    ('S006771', 'G-P-13', 'P', 13, false),
    ('S006772', 'G-P-14', 'P', 14, false),
    ('S006773', 'G-P-15', 'P', 15, false),
    ('S006774', 'G-P-16', 'P', 16, false),
    ('S006775', 'G-P-17', 'P', 17, false),
    ('S006776', 'G-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006777', 'G-Q-01', 'Q', 1, false),
    ('S006778', 'G-Q-02', 'Q', 2, false),
    ('S006779', 'G-Q-03', 'Q', 3, false),
    ('S006780', 'G-Q-04', 'Q', 4, false),
    ('S006781', 'G-Q-05', 'Q', 5, false),
    ('S006782', 'G-Q-06', 'Q', 6, false),
    ('S006783', 'G-Q-07', 'Q', 7, false),
    ('S006784', 'G-Q-08', 'Q', 8, false),
    ('S006785', 'G-Q-09', 'Q', 9, false),
    ('S006786', 'G-Q-10', 'Q', 10, false),
    ('S006787', 'G-Q-11', 'Q', 11, false),
    ('S006788', 'G-Q-12', 'Q', 12, false),
    ('S006789', 'G-Q-13', 'Q', 13, false),
    ('S006790', 'G-Q-14', 'Q', 14, false),
    ('S006791', 'G-Q-15', 'Q', 15, false),
    ('S006792', 'G-Q-16', 'Q', 16, false),
    ('S006793', 'G-Q-17', 'Q', 17, false),
    ('S006794', 'G-Q-18', 'Q', 18, false),
    ('S006795', 'G-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006796', 'G-R-01', 'R', 1, false),
    ('S006797', 'G-R-02', 'R', 2, false),
    ('S006798', 'G-R-03', 'R', 3, false),
    ('S006799', 'G-R-04', 'R', 4, false),
    ('S006800', 'G-R-05', 'R', 5, false),
    ('S006801', 'G-R-06', 'R', 6, false),
    ('S006802', 'G-R-07', 'R', 7, false),
    ('S006803', 'G-R-08', 'R', 8, false),
    ('S006804', 'G-R-09', 'R', 9, false),
    ('S006805', 'G-R-10', 'R', 10, false),
    ('S006806', 'G-R-11', 'R', 11, false),
    ('S006807', 'G-R-12', 'R', 12, false),
    ('S006808', 'G-R-13', 'R', 13, false),
    ('S006809', 'G-R-14', 'R', 14, false),
    ('S006810', 'G-R-15', 'R', 15, false),
    ('S006811', 'G-R-16', 'R', 16, false),
    ('S006812', 'G-R-17', 'R', 17, false),
    ('S006813', 'G-R-18', 'R', 18, false),
    ('S006814', 'G-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006815', 'G-S-01', 'S', 1, false),
    ('S006816', 'G-S-02', 'S', 2, false),
    ('S006817', 'G-S-03', 'S', 3, false),
    ('S006818', 'G-S-04', 'S', 4, false),
    ('S006819', 'G-S-05', 'S', 5, false),
    ('S006820', 'G-S-06', 'S', 6, false),
    ('S006821', 'G-S-07', 'S', 7, false),
    ('S006822', 'G-S-08', 'S', 8, false),
    ('S006823', 'G-S-09', 'S', 9, false),
    ('S006824', 'G-S-10', 'S', 10, false),
    ('S006825', 'G-S-11', 'S', 11, false),
    ('S006826', 'G-S-12', 'S', 12, false),
    ('S006827', 'G-S-13', 'S', 13, false),
    ('S006828', 'G-S-14', 'S', 14, false),
    ('S006829', 'G-S-15', 'S', 15, false),
    ('S006830', 'G-S-16', 'S', 16, false),
    ('S006831', 'G-S-17', 'S', 17, false),
    ('S006832', 'G-S-18', 'S', 18, false),
    ('S006833', 'G-S-19', 'S', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006834', 'G-T-01', 'T', 1, false),
    ('S006835', 'G-T-02', 'T', 2, false),
    ('S006836', 'G-T-03', 'T', 3, false),
    ('S006837', 'G-T-04', 'T', 4, false),
    ('S006838', 'G-T-05', 'T', 5, false),
    ('S006839', 'G-T-06', 'T', 6, false),
    ('S006840', 'G-T-07', 'T', 7, false),
    ('S006841', 'G-T-08', 'T', 8, false),
    ('S006842', 'G-T-09', 'T', 9, false),
    ('S006843', 'G-T-10', 'T', 10, false),
    ('S006844', 'G-T-11', 'T', 11, false),
    ('S006845', 'G-T-12', 'T', 12, false),
    ('S006846', 'G-T-13', 'T', 13, false),
    ('S006847', 'G-T-14', 'T', 14, false),
    ('S006848', 'G-T-15', 'T', 15, false),
    ('S006849', 'G-T-16', 'T', 16, false),
    ('S006850', 'G-T-17', 'T', 17, false),
    ('S006851', 'G-T-18', 'T', 18, false),
    ('S006852', 'G-T-19', 'T', 19, false),
    ('S006853', 'G-T-20', 'T', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE G'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE H (276 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006854', 'H-A-01', 'A', 1, false),
    ('S006855', 'H-A-02', 'A', 2, false),
    ('S006856', 'H-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006857', 'H-B-01', 'B', 1, false),
    ('S006858', 'H-B-02', 'B', 2, false),
    ('S006859', 'H-B-03', 'B', 3, false),
    ('S006860', 'H-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006861', 'H-C-01', 'C', 1, false),
    ('S006862', 'H-C-02', 'C', 2, false),
    ('S006863', 'H-C-03', 'C', 3, false),
    ('S006864', 'H-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006865', 'H-D-01', 'D', 1, false),
    ('S006866', 'H-D-02', 'D', 2, false),
    ('S006867', 'H-D-03', 'D', 3, false),
    ('S006868', 'H-D-04', 'D', 4, false),
    ('S006869', 'H-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006870', 'H-E-01', 'E', 1, false),
    ('S006871', 'H-E-02', 'E', 2, false),
    ('S006872', 'H-E-03', 'E', 3, false),
    ('S006873', 'H-E-04', 'E', 4, false),
    ('S006874', 'H-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006875', 'H-F-01', 'F', 1, false),
    ('S006876', 'H-F-02', 'F', 2, false),
    ('S006877', 'H-F-03', 'F', 3, false),
    ('S006878', 'H-F-04', 'F', 4, false),
    ('S006879', 'H-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006880', 'H-G-01', 'G', 1, false),
    ('S006881', 'H-G-02', 'G', 2, false),
    ('S006882', 'H-G-03', 'G', 3, false),
    ('S006883', 'H-G-04', 'G', 4, false),
    ('S006884', 'H-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006885', 'H-H-01', 'H', 1, false),
    ('S006886', 'H-H-02', 'H', 2, false),
    ('S006887', 'H-H-03', 'H', 3, false),
    ('S006888', 'H-H-04', 'H', 4, false),
    ('S006889', 'H-H-05', 'H', 5, false),
    ('S006890', 'H-H-06', 'H', 6, false),
    ('S006891', 'H-H-07', 'H', 7, false),
    ('S006892', 'H-H-08', 'H', 8, false),
    ('S006893', 'H-H-09', 'H', 9, false),
    ('S006894', 'H-H-10', 'H', 10, false),
    ('S006895', 'H-H-11', 'H', 11, false),
    ('S006896', 'H-H-12', 'H', 12, false),
    ('S006897', 'H-H-13', 'H', 13, false),
    ('S006898', 'H-H-14', 'H', 14, false),
    ('S006899', 'H-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006900', 'H-I-01', 'I', 1, false),
    ('S006901', 'H-I-02', 'I', 2, false),
    ('S006902', 'H-I-03', 'I', 3, false),
    ('S006903', 'H-I-04', 'I', 4, false),
    ('S006904', 'H-I-05', 'I', 5, false),
    ('S006905', 'H-I-06', 'I', 6, false),
    ('S006906', 'H-I-07', 'I', 7, false),
    ('S006907', 'H-I-08', 'I', 8, false),
    ('S006908', 'H-I-09', 'I', 9, false),
    ('S006909', 'H-I-10', 'I', 10, false),
    ('S006910', 'H-I-11', 'I', 11, false),
    ('S006911', 'H-I-12', 'I', 12, false),
    ('S006912', 'H-I-13', 'I', 13, false),
    ('S006913', 'H-I-14', 'I', 14, false),
    ('S006914', 'H-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006915', 'H-J-01', 'J', 1, false),
    ('S006916', 'H-J-02', 'J', 2, false),
    ('S006917', 'H-J-03', 'J', 3, false),
    ('S006918', 'H-J-04', 'J', 4, false),
    ('S006919', 'H-J-05', 'J', 5, false),
    ('S006920', 'H-J-06', 'J', 6, false),
    ('S006921', 'H-J-07', 'J', 7, false),
    ('S006922', 'H-J-08', 'J', 8, false),
    ('S006923', 'H-J-09', 'J', 9, false),
    ('S006924', 'H-J-10', 'J', 10, false),
    ('S006925', 'H-J-11', 'J', 11, false),
    ('S006926', 'H-J-12', 'J', 12, false),
    ('S006927', 'H-J-13', 'J', 13, false),
    ('S006928', 'H-J-14', 'J', 14, false),
    ('S006929', 'H-J-15', 'J', 15, false),
    ('S006930', 'H-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006931', 'H-K-01', 'K', 1, false),
    ('S006932', 'H-K-02', 'K', 2, false),
    ('S006933', 'H-K-03', 'K', 3, false),
    ('S006934', 'H-K-04', 'K', 4, false),
    ('S006935', 'H-K-05', 'K', 5, false),
    ('S006936', 'H-K-06', 'K', 6, false),
    ('S006937', 'H-K-07', 'K', 7, false),
    ('S006938', 'H-K-08', 'K', 8, false),
    ('S006939', 'H-K-09', 'K', 9, false),
    ('S006940', 'H-K-10', 'K', 10, false),
    ('S006941', 'H-K-11', 'K', 11, false),
    ('S006942', 'H-K-12', 'K', 12, false),
    ('S006943', 'H-K-13', 'K', 13, false),
    ('S006944', 'H-K-14', 'K', 14, false),
    ('S006945', 'H-K-15', 'K', 15, false),
    ('S006946', 'H-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006947', 'H-L-01', 'L', 1, false),
    ('S006948', 'H-L-02', 'L', 2, false),
    ('S006949', 'H-L-03', 'L', 3, false),
    ('S006950', 'H-L-04', 'L', 4, false),
    ('S006951', 'H-L-05', 'L', 5, false),
    ('S006952', 'H-L-06', 'L', 6, false),
    ('S006953', 'H-L-07', 'L', 7, false),
    ('S006954', 'H-L-08', 'L', 8, false),
    ('S006955', 'H-L-09', 'L', 9, false),
    ('S006956', 'H-L-10', 'L', 10, false),
    ('S006957', 'H-L-11', 'L', 11, false),
    ('S006958', 'H-L-12', 'L', 12, false),
    ('S006959', 'H-L-13', 'L', 13, false),
    ('S006960', 'H-L-14', 'L', 14, false),
    ('S006961', 'H-L-15', 'L', 15, false),
    ('S006962', 'H-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006963', 'H-M-01', 'M', 1, false),
    ('S006964', 'H-M-02', 'M', 2, false),
    ('S006965', 'H-M-03', 'M', 3, false),
    ('S006966', 'H-M-04', 'M', 4, false),
    ('S006967', 'H-M-05', 'M', 5, false),
    ('S006968', 'H-M-06', 'M', 6, false),
    ('S006969', 'H-M-07', 'M', 7, false),
    ('S006970', 'H-M-08', 'M', 8, false),
    ('S006971', 'H-M-09', 'M', 9, false),
    ('S006972', 'H-M-10', 'M', 10, false),
    ('S006973', 'H-M-11', 'M', 11, false),
    ('S006974', 'H-M-12', 'M', 12, false),
    ('S006975', 'H-M-13', 'M', 13, false),
    ('S006976', 'H-M-14', 'M', 14, false),
    ('S006977', 'H-M-15', 'M', 15, false),
    ('S006978', 'H-M-16', 'M', 16, false),
    ('S006979', 'H-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006980', 'H-N-01', 'N', 1, false),
    ('S006981', 'H-N-02', 'N', 2, false),
    ('S006982', 'H-N-03', 'N', 3, false),
    ('S006983', 'H-N-04', 'N', 4, false),
    ('S006984', 'H-N-05', 'N', 5, false),
    ('S006985', 'H-N-06', 'N', 6, false),
    ('S006986', 'H-N-07', 'N', 7, false),
    ('S006987', 'H-N-08', 'N', 8, false),
    ('S006988', 'H-N-09', 'N', 9, false),
    ('S006989', 'H-N-10', 'N', 10, false),
    ('S006990', 'H-N-11', 'N', 11, false),
    ('S006991', 'H-N-12', 'N', 12, false),
    ('S006992', 'H-N-13', 'N', 13, false),
    ('S006993', 'H-N-14', 'N', 14, false),
    ('S006994', 'H-N-15', 'N', 15, false),
    ('S006995', 'H-N-16', 'N', 16, false),
    ('S006996', 'H-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S006997', 'H-O-01', 'O', 1, false),
    ('S006998', 'H-O-02', 'O', 2, false),
    ('S006999', 'H-O-03', 'O', 3, false),
    ('S007000', 'H-O-04', 'O', 4, false),
    ('S007001', 'H-O-05', 'O', 5, false),
    ('S007002', 'H-O-06', 'O', 6, false),
    ('S007003', 'H-O-07', 'O', 7, false),
    ('S007004', 'H-O-08', 'O', 8, false),
    ('S007005', 'H-O-09', 'O', 9, false),
    ('S007006', 'H-O-10', 'O', 10, false),
    ('S007007', 'H-O-11', 'O', 11, false),
    ('S007008', 'H-O-12', 'O', 12, false),
    ('S007009', 'H-O-13', 'O', 13, false),
    ('S007010', 'H-O-14', 'O', 14, false),
    ('S007011', 'H-O-15', 'O', 15, false),
    ('S007012', 'H-O-16', 'O', 16, false),
    ('S007013', 'H-O-17', 'O', 17, false),
    ('S007014', 'H-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007015', 'H-P-01', 'P', 1, false),
    ('S007016', 'H-P-02', 'P', 2, false),
    ('S007017', 'H-P-03', 'P', 3, false),
    ('S007018', 'H-P-04', 'P', 4, false),
    ('S007019', 'H-P-05', 'P', 5, false),
    ('S007020', 'H-P-06', 'P', 6, false),
    ('S007021', 'H-P-07', 'P', 7, false),
    ('S007022', 'H-P-08', 'P', 8, false),
    ('S007023', 'H-P-09', 'P', 9, false),
    ('S007024', 'H-P-10', 'P', 10, false),
    ('S007025', 'H-P-11', 'P', 11, false),
    ('S007026', 'H-P-12', 'P', 12, false),
    ('S007027', 'H-P-13', 'P', 13, false),
    ('S007028', 'H-P-14', 'P', 14, false),
    ('S007029', 'H-P-15', 'P', 15, false),
    ('S007030', 'H-P-16', 'P', 16, false),
    ('S007031', 'H-P-17', 'P', 17, false),
    ('S007032', 'H-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007033', 'H-Q-01', 'Q', 1, false),
    ('S007034', 'H-Q-02', 'Q', 2, false),
    ('S007035', 'H-Q-03', 'Q', 3, false),
    ('S007036', 'H-Q-04', 'Q', 4, false),
    ('S007037', 'H-Q-05', 'Q', 5, false),
    ('S007038', 'H-Q-06', 'Q', 6, false),
    ('S007039', 'H-Q-07', 'Q', 7, false),
    ('S007040', 'H-Q-08', 'Q', 8, false),
    ('S007041', 'H-Q-09', 'Q', 9, false),
    ('S007042', 'H-Q-10', 'Q', 10, false),
    ('S007043', 'H-Q-11', 'Q', 11, false),
    ('S007044', 'H-Q-12', 'Q', 12, false),
    ('S007045', 'H-Q-13', 'Q', 13, false),
    ('S007046', 'H-Q-14', 'Q', 14, false),
    ('S007047', 'H-Q-15', 'Q', 15, false),
    ('S007048', 'H-Q-16', 'Q', 16, false),
    ('S007049', 'H-Q-17', 'Q', 17, false),
    ('S007050', 'H-Q-18', 'Q', 18, false),
    ('S007051', 'H-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007052', 'H-R-01', 'R', 1, false),
    ('S007053', 'H-R-02', 'R', 2, false),
    ('S007054', 'H-R-03', 'R', 3, false),
    ('S007055', 'H-R-04', 'R', 4, false),
    ('S007056', 'H-R-05', 'R', 5, false),
    ('S007057', 'H-R-06', 'R', 6, false),
    ('S007058', 'H-R-07', 'R', 7, false),
    ('S007059', 'H-R-08', 'R', 8, false),
    ('S007060', 'H-R-09', 'R', 9, false),
    ('S007061', 'H-R-10', 'R', 10, false),
    ('S007062', 'H-R-11', 'R', 11, false),
    ('S007063', 'H-R-12', 'R', 12, false),
    ('S007064', 'H-R-13', 'R', 13, false),
    ('S007065', 'H-R-14', 'R', 14, false),
    ('S007066', 'H-R-15', 'R', 15, false),
    ('S007067', 'H-R-16', 'R', 16, false),
    ('S007068', 'H-R-17', 'R', 17, false),
    ('S007069', 'H-R-18', 'R', 18, false),
    ('S007070', 'H-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007071', 'H-S-01', 'S', 1, false),
    ('S007072', 'H-S-02', 'S', 2, false),
    ('S007073', 'H-S-03', 'S', 3, false),
    ('S007074', 'H-S-04', 'S', 4, false),
    ('S007075', 'H-S-05', 'S', 5, false),
    ('S007076', 'H-S-06', 'S', 6, false),
    ('S007077', 'H-S-07', 'S', 7, false),
    ('S007078', 'H-S-08', 'S', 8, false),
    ('S007079', 'H-S-09', 'S', 9, false),
    ('S007080', 'H-S-10', 'S', 10, false),
    ('S007081', 'H-S-11', 'S', 11, false),
    ('S007082', 'H-S-12', 'S', 12, false),
    ('S007083', 'H-S-13', 'S', 13, false),
    ('S007084', 'H-S-14', 'S', 14, false),
    ('S007085', 'H-S-15', 'S', 15, false),
    ('S007086', 'H-S-16', 'S', 16, false),
    ('S007087', 'H-S-17', 'S', 17, false),
    ('S007088', 'H-S-18', 'S', 18, false),
    ('S007089', 'H-S-19', 'S', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007090', 'H-T-01', 'T', 1, false),
    ('S007091', 'H-T-02', 'T', 2, false),
    ('S007092', 'H-T-03', 'T', 3, false),
    ('S007093', 'H-T-04', 'T', 4, false),
    ('S007094', 'H-T-05', 'T', 5, false),
    ('S007095', 'H-T-06', 'T', 6, false),
    ('S007096', 'H-T-07', 'T', 7, false),
    ('S007097', 'H-T-08', 'T', 8, false),
    ('S007098', 'H-T-09', 'T', 9, false),
    ('S007099', 'H-T-10', 'T', 10, false),
    ('S007100', 'H-T-11', 'T', 11, false),
    ('S007101', 'H-T-12', 'T', 12, false),
    ('S007102', 'H-T-13', 'T', 13, false),
    ('S007103', 'H-T-14', 'T', 14, false),
    ('S007104', 'H-T-15', 'T', 15, false),
    ('S007105', 'H-T-16', 'T', 16, false),
    ('S007106', 'H-T-17', 'T', 17, false),
    ('S007107', 'H-T-18', 'T', 18, false),
    ('S007108', 'H-T-19', 'T', 19, false),
    ('S007109', 'H-T-20', 'T', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007110', 'H-U-01', 'U', 1, false),
    ('S007111', 'H-U-02', 'U', 2, false),
    ('S007112', 'H-U-03', 'U', 3, false),
    ('S007113', 'H-U-04', 'U', 4, false),
    ('S007114', 'H-U-05', 'U', 5, false),
    ('S007115', 'H-U-06', 'U', 6, false),
    ('S007116', 'H-U-07', 'U', 7, false),
    ('S007117', 'H-U-08', 'U', 8, false),
    ('S007118', 'H-U-09', 'U', 9, false),
    ('S007119', 'H-U-10', 'U', 10, false),
    ('S007120', 'H-U-11', 'U', 11, false),
    ('S007121', 'H-U-12', 'U', 12, false),
    ('S007122', 'H-U-13', 'U', 13, false),
    ('S007123', 'H-U-14', 'U', 14, false),
    ('S007124', 'H-U-15', 'U', 15, false),
    ('S007125', 'H-U-16', 'U', 16, false),
    ('S007126', 'H-U-17', 'U', 17, false),
    ('S007127', 'H-U-18', 'U', 18, false),
    ('S007128', 'H-U-19', 'U', 19, false),
    ('S007129', 'H-U-20', 'U', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE H'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE I (276 seats)
-- Row A (3 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007130', 'I-A-01', 'A', 1, false),
    ('S007131', 'I-A-02', 'A', 2, false),
    ('S007132', 'I-A-03', 'A', 3, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007133', 'I-B-01', 'B', 1, false),
    ('S007134', 'I-B-02', 'B', 2, false),
    ('S007135', 'I-B-03', 'B', 3, false),
    ('S007136', 'I-B-04', 'B', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (4 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007137', 'I-C-01', 'C', 1, false),
    ('S007138', 'I-C-02', 'C', 2, false),
    ('S007139', 'I-C-03', 'C', 3, false),
    ('S007140', 'I-C-04', 'C', 4, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007141', 'I-D-01', 'D', 1, false),
    ('S007142', 'I-D-02', 'D', 2, false),
    ('S007143', 'I-D-03', 'D', 3, false),
    ('S007144', 'I-D-04', 'D', 4, false),
    ('S007145', 'I-D-05', 'D', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007146', 'I-E-01', 'E', 1, false),
    ('S007147', 'I-E-02', 'E', 2, false),
    ('S007148', 'I-E-03', 'E', 3, false),
    ('S007149', 'I-E-04', 'E', 4, false),
    ('S007150', 'I-E-05', 'E', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007151', 'I-F-01', 'F', 1, false),
    ('S007152', 'I-F-02', 'F', 2, false),
    ('S007153', 'I-F-03', 'F', 3, false),
    ('S007154', 'I-F-04', 'F', 4, false),
    ('S007155', 'I-F-05', 'F', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (5 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007156', 'I-G-01', 'G', 1, false),
    ('S007157', 'I-G-02', 'G', 2, false),
    ('S007158', 'I-G-03', 'G', 3, false),
    ('S007159', 'I-G-04', 'G', 4, false),
    ('S007160', 'I-G-05', 'G', 5, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007161', 'I-H-01', 'H', 1, false),
    ('S007162', 'I-H-02', 'H', 2, false),
    ('S007163', 'I-H-03', 'H', 3, false),
    ('S007164', 'I-H-04', 'H', 4, false),
    ('S007165', 'I-H-05', 'H', 5, false),
    ('S007166', 'I-H-06', 'H', 6, false),
    ('S007167', 'I-H-07', 'H', 7, false),
    ('S007168', 'I-H-08', 'H', 8, false),
    ('S007169', 'I-H-09', 'H', 9, false),
    ('S007170', 'I-H-10', 'H', 10, false),
    ('S007171', 'I-H-11', 'H', 11, false),
    ('S007172', 'I-H-12', 'H', 12, false),
    ('S007173', 'I-H-13', 'H', 13, false),
    ('S007174', 'I-H-14', 'H', 14, false),
    ('S007175', 'I-H-15', 'H', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007176', 'I-I-01', 'I', 1, false),
    ('S007177', 'I-I-02', 'I', 2, false),
    ('S007178', 'I-I-03', 'I', 3, false),
    ('S007179', 'I-I-04', 'I', 4, false),
    ('S007180', 'I-I-05', 'I', 5, false),
    ('S007181', 'I-I-06', 'I', 6, false),
    ('S007182', 'I-I-07', 'I', 7, false),
    ('S007183', 'I-I-08', 'I', 8, false),
    ('S007184', 'I-I-09', 'I', 9, false),
    ('S007185', 'I-I-10', 'I', 10, false),
    ('S007186', 'I-I-11', 'I', 11, false),
    ('S007187', 'I-I-12', 'I', 12, false),
    ('S007188', 'I-I-13', 'I', 13, false),
    ('S007189', 'I-I-14', 'I', 14, false),
    ('S007190', 'I-I-15', 'I', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007191', 'I-J-01', 'J', 1, false),
    ('S007192', 'I-J-02', 'J', 2, false),
    ('S007193', 'I-J-03', 'J', 3, false),
    ('S007194', 'I-J-04', 'J', 4, false),
    ('S007195', 'I-J-05', 'J', 5, false),
    ('S007196', 'I-J-06', 'J', 6, false),
    ('S007197', 'I-J-07', 'J', 7, false),
    ('S007198', 'I-J-08', 'J', 8, false),
    ('S007199', 'I-J-09', 'J', 9, false),
    ('S007200', 'I-J-10', 'J', 10, false),
    ('S007201', 'I-J-11', 'J', 11, false),
    ('S007202', 'I-J-12', 'J', 12, false),
    ('S007203', 'I-J-13', 'J', 13, false),
    ('S007204', 'I-J-14', 'J', 14, false),
    ('S007205', 'I-J-15', 'J', 15, false),
    ('S007206', 'I-J-16', 'J', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007207', 'I-K-01', 'K', 1, false),
    ('S007208', 'I-K-02', 'K', 2, false),
    ('S007209', 'I-K-03', 'K', 3, false),
    ('S007210', 'I-K-04', 'K', 4, false),
    ('S007211', 'I-K-05', 'K', 5, false),
    ('S007212', 'I-K-06', 'K', 6, false),
    ('S007213', 'I-K-07', 'K', 7, false),
    ('S007214', 'I-K-08', 'K', 8, false),
    ('S007215', 'I-K-09', 'K', 9, false),
    ('S007216', 'I-K-10', 'K', 10, false),
    ('S007217', 'I-K-11', 'K', 11, false),
    ('S007218', 'I-K-12', 'K', 12, false),
    ('S007219', 'I-K-13', 'K', 13, false),
    ('S007220', 'I-K-14', 'K', 14, false),
    ('S007221', 'I-K-15', 'K', 15, false),
    ('S007222', 'I-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007223', 'I-L-01', 'L', 1, false),
    ('S007224', 'I-L-02', 'L', 2, false),
    ('S007225', 'I-L-03', 'L', 3, false),
    ('S007226', 'I-L-04', 'L', 4, false),
    ('S007227', 'I-L-05', 'L', 5, false),
    ('S007228', 'I-L-06', 'L', 6, false),
    ('S007229', 'I-L-07', 'L', 7, false),
    ('S007230', 'I-L-08', 'L', 8, false),
    ('S007231', 'I-L-09', 'L', 9, false),
    ('S007232', 'I-L-10', 'L', 10, false),
    ('S007233', 'I-L-11', 'L', 11, false),
    ('S007234', 'I-L-12', 'L', 12, false),
    ('S007235', 'I-L-13', 'L', 13, false),
    ('S007236', 'I-L-14', 'L', 14, false),
    ('S007237', 'I-L-15', 'L', 15, false),
    ('S007238', 'I-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007239', 'I-M-01', 'M', 1, false),
    ('S007240', 'I-M-02', 'M', 2, false),
    ('S007241', 'I-M-03', 'M', 3, false),
    ('S007242', 'I-M-04', 'M', 4, false),
    ('S007243', 'I-M-05', 'M', 5, false),
    ('S007244', 'I-M-06', 'M', 6, false),
    ('S007245', 'I-M-07', 'M', 7, false),
    ('S007246', 'I-M-08', 'M', 8, false),
    ('S007247', 'I-M-09', 'M', 9, false),
    ('S007248', 'I-M-10', 'M', 10, false),
    ('S007249', 'I-M-11', 'M', 11, false),
    ('S007250', 'I-M-12', 'M', 12, false),
    ('S007251', 'I-M-13', 'M', 13, false),
    ('S007252', 'I-M-14', 'M', 14, false),
    ('S007253', 'I-M-15', 'M', 15, false),
    ('S007254', 'I-M-16', 'M', 16, false),
    ('S007255', 'I-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007256', 'I-N-01', 'N', 1, false),
    ('S007257', 'I-N-02', 'N', 2, false),
    ('S007258', 'I-N-03', 'N', 3, false),
    ('S007259', 'I-N-04', 'N', 4, false),
    ('S007260', 'I-N-05', 'N', 5, false),
    ('S007261', 'I-N-06', 'N', 6, false),
    ('S007262', 'I-N-07', 'N', 7, false),
    ('S007263', 'I-N-08', 'N', 8, false),
    ('S007264', 'I-N-09', 'N', 9, false),
    ('S007265', 'I-N-10', 'N', 10, false),
    ('S007266', 'I-N-11', 'N', 11, false),
    ('S007267', 'I-N-12', 'N', 12, false),
    ('S007268', 'I-N-13', 'N', 13, false),
    ('S007269', 'I-N-14', 'N', 14, false),
    ('S007270', 'I-N-15', 'N', 15, false),
    ('S007271', 'I-N-16', 'N', 16, false),
    ('S007272', 'I-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007273', 'I-O-01', 'O', 1, false),
    ('S007274', 'I-O-02', 'O', 2, false),
    ('S007275', 'I-O-03', 'O', 3, false),
    ('S007276', 'I-O-04', 'O', 4, false),
    ('S007277', 'I-O-05', 'O', 5, false),
    ('S007278', 'I-O-06', 'O', 6, false),
    ('S007279', 'I-O-07', 'O', 7, false),
    ('S007280', 'I-O-08', 'O', 8, false),
    ('S007281', 'I-O-09', 'O', 9, false),
    ('S007282', 'I-O-10', 'O', 10, false),
    ('S007283', 'I-O-11', 'O', 11, false),
    ('S007284', 'I-O-12', 'O', 12, false),
    ('S007285', 'I-O-13', 'O', 13, false),
    ('S007286', 'I-O-14', 'O', 14, false),
    ('S007287', 'I-O-15', 'O', 15, false),
    ('S007288', 'I-O-16', 'O', 16, false),
    ('S007289', 'I-O-17', 'O', 17, false),
    ('S007290', 'I-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007291', 'I-P-01', 'P', 1, false),
    ('S007292', 'I-P-02', 'P', 2, false),
    ('S007293', 'I-P-03', 'P', 3, false),
    ('S007294', 'I-P-04', 'P', 4, false),
    ('S007295', 'I-P-05', 'P', 5, false),
    ('S007296', 'I-P-06', 'P', 6, false),
    ('S007297', 'I-P-07', 'P', 7, false),
    ('S007298', 'I-P-08', 'P', 8, false),
    ('S007299', 'I-P-09', 'P', 9, false),
    ('S007300', 'I-P-10', 'P', 10, false),
    ('S007301', 'I-P-11', 'P', 11, false),
    ('S007302', 'I-P-12', 'P', 12, false),
    ('S007303', 'I-P-13', 'P', 13, false),
    ('S007304', 'I-P-14', 'P', 14, false),
    ('S007305', 'I-P-15', 'P', 15, false),
    ('S007306', 'I-P-16', 'P', 16, false),
    ('S007307', 'I-P-17', 'P', 17, false),
    ('S007308', 'I-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007309', 'I-Q-01', 'Q', 1, false),
    ('S007310', 'I-Q-02', 'Q', 2, false),
    ('S007311', 'I-Q-03', 'Q', 3, false),
    ('S007312', 'I-Q-04', 'Q', 4, false),
    ('S007313', 'I-Q-05', 'Q', 5, false),
    ('S007314', 'I-Q-06', 'Q', 6, false),
    ('S007315', 'I-Q-07', 'Q', 7, false),
    ('S007316', 'I-Q-08', 'Q', 8, false),
    ('S007317', 'I-Q-09', 'Q', 9, false),
    ('S007318', 'I-Q-10', 'Q', 10, false),
    ('S007319', 'I-Q-11', 'Q', 11, false),
    ('S007320', 'I-Q-12', 'Q', 12, false),
    ('S007321', 'I-Q-13', 'Q', 13, false),
    ('S007322', 'I-Q-14', 'Q', 14, false),
    ('S007323', 'I-Q-15', 'Q', 15, false),
    ('S007324', 'I-Q-16', 'Q', 16, false),
    ('S007325', 'I-Q-17', 'Q', 17, false),
    ('S007326', 'I-Q-18', 'Q', 18, false),
    ('S007327', 'I-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007328', 'I-R-01', 'R', 1, false),
    ('S007329', 'I-R-02', 'R', 2, false),
    ('S007330', 'I-R-03', 'R', 3, false),
    ('S007331', 'I-R-04', 'R', 4, false),
    ('S007332', 'I-R-05', 'R', 5, false),
    ('S007333', 'I-R-06', 'R', 6, false),
    ('S007334', 'I-R-07', 'R', 7, false),
    ('S007335', 'I-R-08', 'R', 8, false),
    ('S007336', 'I-R-09', 'R', 9, false),
    ('S007337', 'I-R-10', 'R', 10, false),
    ('S007338', 'I-R-11', 'R', 11, false),
    ('S007339', 'I-R-12', 'R', 12, false),
    ('S007340', 'I-R-13', 'R', 13, false),
    ('S007341', 'I-R-14', 'R', 14, false),
    ('S007342', 'I-R-15', 'R', 15, false),
    ('S007343', 'I-R-16', 'R', 16, false),
    ('S007344', 'I-R-17', 'R', 17, false),
    ('S007345', 'I-R-18', 'R', 18, false),
    ('S007346', 'I-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007347', 'I-S-01', 'S', 1, false),
    ('S007348', 'I-S-02', 'S', 2, false),
    ('S007349', 'I-S-03', 'S', 3, false),
    ('S007350', 'I-S-04', 'S', 4, false),
    ('S007351', 'I-S-05', 'S', 5, false),
    ('S007352', 'I-S-06', 'S', 6, false),
    ('S007353', 'I-S-07', 'S', 7, false),
    ('S007354', 'I-S-08', 'S', 8, false),
    ('S007355', 'I-S-09', 'S', 9, false),
    ('S007356', 'I-S-10', 'S', 10, false),
    ('S007357', 'I-S-11', 'S', 11, false),
    ('S007358', 'I-S-12', 'S', 12, false),
    ('S007359', 'I-S-13', 'S', 13, false),
    ('S007360', 'I-S-14', 'S', 14, false),
    ('S007361', 'I-S-15', 'S', 15, false),
    ('S007362', 'I-S-16', 'S', 16, false),
    ('S007363', 'I-S-17', 'S', 17, false),
    ('S007364', 'I-S-18', 'S', 18, false),
    ('S007365', 'I-S-19', 'S', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE I'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S007366', 'I-T-01', 'T', 1, false),
    ('S007367', 'I-T-02', 'T', 2, false),
    ('S007368', 'I-T-03', 'T', 3, false),
    ('S007369', 'I-T-04', 'T', 4, false),
    ('S007370', 'I-T-05', 'T', 5, false),
    ('S007371', 'I-T-06', 'T', 6, false),
    ('S007372', 'I-T-07', 'T', 7, false),
    ('S007373', 'I-T-08', 'T', 8, false),
    ('S007374', 'I-T-09', 'T', 9, false),
    ('S007375', 'I-T-10', 'T', 10, false),
    ('S007376', 'I-T-11', 'T', 11, false),
    ('S007377', 'I-T-12', 'T', 12, false),
    ('S007378', 'I-T-13', 'T', 13, false),
    ('S007379', 'I-T-14', 'T', 14, false),