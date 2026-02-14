    ('S003684', 'SE-G-10', 'G', 10, false),
    ('S003685', 'SE-G-11', 'G', 11, false),
    ('S003686', 'SE-G-12', 'G', 12, false),
    ('S003687', 'SE-G-13', 'G', 13, false),
    ('S003688', 'SE-G-14', 'G', 14, false),
    ('S003689', 'SE-G-15', 'G', 15, false),
    ('S003690', 'SE-G-16', 'G', 16, false),
    ('S003691', 'SE-G-17', 'G', 17, false),
    ('S003692', 'SE-G-18', 'G', 18, false),
    ('S003693', 'SE-G-19', 'G', 19, false),
    ('S003694', 'SE-G-20', 'G', 20, false),
    ('S003695', 'SE-G-21', 'G', 21, false),
    ('S003696', 'SE-G-22', 'G', 22, false),
    ('S003697', 'SE-G-23', 'G', 23, false),
    ('S003698', 'SE-G-24', 'G', 24, false),
    ('S003699', 'SE-G-25', 'G', 25, false),
    ('S003700', 'SE-G-26', 'G', 26, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (27 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003701', 'SE-H-01', 'H', 1, false),
    ('S003702', 'SE-H-02', 'H', 2, false),
    ('S003703', 'SE-H-03', 'H', 3, false),
    ('S003704', 'SE-H-04', 'H', 4, false),
    ('S003705', 'SE-H-05', 'H', 5, false),
    ('S003706', 'SE-H-06', 'H', 6, false),
    ('S003707', 'SE-H-07', 'H', 7, false),
    ('S003708', 'SE-H-08', 'H', 8, false),
    ('S003709', 'SE-H-09', 'H', 9, false),
    ('S003710', 'SE-H-10', 'H', 10, false),
    ('S003711', 'SE-H-11', 'H', 11, false),
    ('S003712', 'SE-H-12', 'H', 12, false),
    ('S003713', 'SE-H-13', 'H', 13, false),
    ('S003714', 'SE-H-14', 'H', 14, false),
    ('S003715', 'SE-H-15', 'H', 15, false),
    ('S003716', 'SE-H-16', 'H', 16, false),
    ('S003717', 'SE-H-17', 'H', 17, false),
    ('S003718', 'SE-H-18', 'H', 18, false),
    ('S003719', 'SE-H-19', 'H', 19, false),
    ('S003720', 'SE-H-20', 'H', 20, false),
    ('S003721', 'SE-H-21', 'H', 21, false),
    ('S003722', 'SE-H-22', 'H', 22, false),
    ('S003723', 'SE-H-23', 'H', 23, false),
    ('S003724', 'SE-H-24', 'H', 24, false),
    ('S003725', 'SE-H-25', 'H', 25, false),
    ('S003726', 'SE-H-26', 'H', 26, false),
    ('S003727', 'SE-H-27', 'H', 27, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SF (160 seats)
-- Row A (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003728', 'SF-A-01', 'A', 1, false),
    ('S003729', 'SF-A-02', 'A', 2, false),
    ('S003730', 'SF-A-03', 'A', 3, false),
    ('S003731', 'SF-A-04', 'A', 4, false),
    ('S003732', 'SF-A-05', 'A', 5, false),
    ('S003733', 'SF-A-06', 'A', 6, false),
    ('S003734', 'SF-A-07', 'A', 7, false),
    ('S003735', 'SF-A-08', 'A', 8, false),
    ('S003736', 'SF-A-09', 'A', 9, false),
    ('S003737', 'SF-A-10', 'A', 10, false),
    ('S003738', 'SF-A-11', 'A', 11, false),
    ('S003739', 'SF-A-12', 'A', 12, false),
    ('S003740', 'SF-A-13', 'A', 13, false),
    ('S003741', 'SF-A-14', 'A', 14, false),
    ('S003742', 'SF-A-15', 'A', 15, false),
    ('S003743', 'SF-A-16', 'A', 16, false),
    ('S003744', 'SF-A-17', 'A', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003745', 'SF-B-01', 'B', 1, false),
    ('S003746', 'SF-B-02', 'B', 2, false),
    ('S003747', 'SF-B-03', 'B', 3, false),
    ('S003748', 'SF-B-04', 'B', 4, false),
    ('S003749', 'SF-B-05', 'B', 5, false),
    ('S003750', 'SF-B-06', 'B', 6, false),
    ('S003751', 'SF-B-07', 'B', 7, false),
    ('S003752', 'SF-B-08', 'B', 8, false),
    ('S003753', 'SF-B-09', 'B', 9, false),
    ('S003754', 'SF-B-10', 'B', 10, false),
    ('S003755', 'SF-B-11', 'B', 11, false),
    ('S003756', 'SF-B-12', 'B', 12, false),
    ('S003757', 'SF-B-13', 'B', 13, false),
    ('S003758', 'SF-B-14', 'B', 14, false),
    ('S003759', 'SF-B-15', 'B', 15, false),
    ('S003760', 'SF-B-16', 'B', 16, false),
    ('S003761', 'SF-B-17', 'B', 17, false),
    ('S003762', 'SF-B-18', 'B', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003763', 'SF-C-01', 'C', 1, false),
    ('S003764', 'SF-C-02', 'C', 2, false),
    ('S003765', 'SF-C-03', 'C', 3, false),
    ('S003766', 'SF-C-04', 'C', 4, false),
    ('S003767', 'SF-C-05', 'C', 5, false),
    ('S003768', 'SF-C-06', 'C', 6, false),
    ('S003769', 'SF-C-07', 'C', 7, false),
    ('S003770', 'SF-C-08', 'C', 8, false),
    ('S003771', 'SF-C-09', 'C', 9, false),
    ('S003772', 'SF-C-10', 'C', 10, false),
    ('S003773', 'SF-C-11', 'C', 11, false),
    ('S003774', 'SF-C-12', 'C', 12, false),
    ('S003775', 'SF-C-13', 'C', 13, false),
    ('S003776', 'SF-C-14', 'C', 14, false),
    ('S003777', 'SF-C-15', 'C', 15, false),
    ('S003778', 'SF-C-16', 'C', 16, false),
    ('S003779', 'SF-C-17', 'C', 17, false),
    ('S003780', 'SF-C-18', 'C', 18, false),
    ('S003781', 'SF-C-19', 'C', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003782', 'SF-D-01', 'D', 1, false),
    ('S003783', 'SF-D-02', 'D', 2, false),
    ('S003784', 'SF-D-03', 'D', 3, false),
    ('S003785', 'SF-D-04', 'D', 4, false),
    ('S003786', 'SF-D-05', 'D', 5, false),
    ('S003787', 'SF-D-06', 'D', 6, false),
    ('S003788', 'SF-D-07', 'D', 7, false),
    ('S003789', 'SF-D-08', 'D', 8, false),
    ('S003790', 'SF-D-09', 'D', 9, false),
    ('S003791', 'SF-D-10', 'D', 10, false),
    ('S003792', 'SF-D-11', 'D', 11, false),
    ('S003793', 'SF-D-12', 'D', 12, false),
    ('S003794', 'SF-D-13', 'D', 13, false),
    ('S003795', 'SF-D-14', 'D', 14, false),
    ('S003796', 'SF-D-15', 'D', 15, false),
    ('S003797', 'SF-D-16', 'D', 16, false),
    ('S003798', 'SF-D-17', 'D', 17, false),
    ('S003799', 'SF-D-18', 'D', 18, false),
    ('S003800', 'SF-D-19', 'D', 19, false),
    ('S003801', 'SF-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003802', 'SF-E-01', 'E', 1, false),
    ('S003803', 'SF-E-02', 'E', 2, false),
    ('S003804', 'SF-E-03', 'E', 3, false),
    ('S003805', 'SF-E-04', 'E', 4, false),
    ('S003806', 'SF-E-05', 'E', 5, false),
    ('S003807', 'SF-E-06', 'E', 6, false),
    ('S003808', 'SF-E-07', 'E', 7, false),
    ('S003809', 'SF-E-08', 'E', 8, false),
    ('S003810', 'SF-E-09', 'E', 9, false),
    ('S003811', 'SF-E-10', 'E', 10, false),
    ('S003812', 'SF-E-11', 'E', 11, false),
    ('S003813', 'SF-E-12', 'E', 12, false),
    ('S003814', 'SF-E-13', 'E', 13, false),
    ('S003815', 'SF-E-14', 'E', 14, false),
    ('S003816', 'SF-E-15', 'E', 15, false),
    ('S003817', 'SF-E-16', 'E', 16, false),
    ('S003818', 'SF-E-17', 'E', 17, false),
    ('S003819', 'SF-E-18', 'E', 18, false),
    ('S003820', 'SF-E-19', 'E', 19, false),
    ('S003821', 'SF-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003822', 'SF-F-01', 'F', 1, false),
    ('S003823', 'SF-F-02', 'F', 2, false),
    ('S003824', 'SF-F-03', 'F', 3, false),
    ('S003825', 'SF-F-04', 'F', 4, false),
    ('S003826', 'SF-F-05', 'F', 5, false),
    ('S003827', 'SF-F-06', 'F', 6, false),
    ('S003828', 'SF-F-07', 'F', 7, false),
    ('S003829', 'SF-F-08', 'F', 8, false),
    ('S003830', 'SF-F-09', 'F', 9, false),
    ('S003831', 'SF-F-10', 'F', 10, false),
    ('S003832', 'SF-F-11', 'F', 11, false),
    ('S003833', 'SF-F-12', 'F', 12, false),
    ('S003834', 'SF-F-13', 'F', 13, false),
    ('S003835', 'SF-F-14', 'F', 14, false),
    ('S003836', 'SF-F-15', 'F', 15, false),
    ('S003837', 'SF-F-16', 'F', 16, false),
    ('S003838', 'SF-F-17', 'F', 17, false),
    ('S003839', 'SF-F-18', 'F', 18, false),
    ('S003840', 'SF-F-19', 'F', 19, false),
    ('S003841', 'SF-F-20', 'F', 20, false),
    ('S003842', 'SF-F-21', 'F', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003843', 'SF-G-01', 'G', 1, false),
    ('S003844', 'SF-G-02', 'G', 2, false),
    ('S003845', 'SF-G-03', 'G', 3, false),
    ('S003846', 'SF-G-04', 'G', 4, false),
    ('S003847', 'SF-G-05', 'G', 5, false),
    ('S003848', 'SF-G-06', 'G', 6, false),
    ('S003849', 'SF-G-07', 'G', 7, false),
    ('S003850', 'SF-G-08', 'G', 8, false),
    ('S003851', 'SF-G-09', 'G', 9, false),
    ('S003852', 'SF-G-10', 'G', 10, false),
    ('S003853', 'SF-G-11', 'G', 11, false),
    ('S003854', 'SF-G-12', 'G', 12, false),
    ('S003855', 'SF-G-13', 'G', 13, false),
    ('S003856', 'SF-G-14', 'G', 14, false),
    ('S003857', 'SF-G-15', 'G', 15, false),
    ('S003858', 'SF-G-16', 'G', 16, false),
    ('S003859', 'SF-G-17', 'G', 17, false),
    ('S003860', 'SF-G-18', 'G', 18, false),
    ('S003861', 'SF-G-19', 'G', 19, false),
    ('S003862', 'SF-G-20', 'G', 20, false),
    ('S003863', 'SF-G-21', 'G', 21, false),
    ('S003864', 'SF-G-22', 'G', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (23 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003865', 'SF-H-01', 'H', 1, false),
    ('S003866', 'SF-H-02', 'H', 2, false),
    ('S003867', 'SF-H-03', 'H', 3, false),
    ('S003868', 'SF-H-04', 'H', 4, false),
    ('S003869', 'SF-H-05', 'H', 5, false),
    ('S003870', 'SF-H-06', 'H', 6, false),
    ('S003871', 'SF-H-07', 'H', 7, false),
    ('S003872', 'SF-H-08', 'H', 8, false),
    ('S003873', 'SF-H-09', 'H', 9, false),
    ('S003874', 'SF-H-10', 'H', 10, false),
    ('S003875', 'SF-H-11', 'H', 11, false),
    ('S003876', 'SF-H-12', 'H', 12, false),
    ('S003877', 'SF-H-13', 'H', 13, false),
    ('S003878', 'SF-H-14', 'H', 14, false),
    ('S003879', 'SF-H-15', 'H', 15, false),
    ('S003880', 'SF-H-16', 'H', 16, false),
    ('S003881', 'SF-H-17', 'H', 17, false),
    ('S003882', 'SF-H-18', 'H', 18, false),
    ('S003883', 'SF-H-19', 'H', 19, false),
    ('S003884', 'SF-H-20', 'H', 20, false),
    ('S003885', 'SF-H-21', 'H', 21, false),
    ('S003886', 'SF-H-22', 'H', 22, false),
    ('S003887', 'SF-H-23', 'H', 23, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SG (136 seats)
-- Row A (14 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003888', 'SG-A-01', 'A', 1, false),
    ('S003889', 'SG-A-02', 'A', 2, false),
    ('S003890', 'SG-A-03', 'A', 3, false),
    ('S003891', 'SG-A-04', 'A', 4, false),
    ('S003892', 'SG-A-05', 'A', 5, false),
    ('S003893', 'SG-A-06', 'A', 6, false),
    ('S003894', 'SG-A-07', 'A', 7, false),
    ('S003895', 'SG-A-08', 'A', 8, false),
    ('S003896', 'SG-A-09', 'A', 9, false),
    ('S003897', 'SG-A-10', 'A', 10, false),
    ('S003898', 'SG-A-11', 'A', 11, false),
    ('S003899', 'SG-A-12', 'A', 12, false),
    ('S003900', 'SG-A-13', 'A', 13, false),
    ('S003901', 'SG-A-14', 'A', 14, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003902', 'SG-B-01', 'B', 1, false),
    ('S003903', 'SG-B-02', 'B', 2, false),
    ('S003904', 'SG-B-03', 'B', 3, false),
    ('S003905', 'SG-B-04', 'B', 4, false),
    ('S003906', 'SG-B-05', 'B', 5, false),
    ('S003907', 'SG-B-06', 'B', 6, false),
    ('S003908', 'SG-B-07', 'B', 7, false),
    ('S003909', 'SG-B-08', 'B', 8, false),
    ('S003910', 'SG-B-09', 'B', 9, false),
    ('S003911', 'SG-B-10', 'B', 10, false),
    ('S003912', 'SG-B-11', 'B', 11, false),
    ('S003913', 'SG-B-12', 'B', 12, false),
    ('S003914', 'SG-B-13', 'B', 13, false),
    ('S003915', 'SG-B-14', 'B', 14, false),
    ('S003916', 'SG-B-15', 'B', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003917', 'SG-C-01', 'C', 1, false),
    ('S003918', 'SG-C-02', 'C', 2, false),
    ('S003919', 'SG-C-03', 'C', 3, false),
    ('S003920', 'SG-C-04', 'C', 4, false),
    ('S003921', 'SG-C-05', 'C', 5, false),
    ('S003922', 'SG-C-06', 'C', 6, false),
    ('S003923', 'SG-C-07', 'C', 7, false),
    ('S003924', 'SG-C-08', 'C', 8, false),
    ('S003925', 'SG-C-09', 'C', 9, false),
    ('S003926', 'SG-C-10', 'C', 10, false),
    ('S003927', 'SG-C-11', 'C', 11, false),
    ('S003928', 'SG-C-12', 'C', 12, false),
    ('S003929', 'SG-C-13', 'C', 13, false),
    ('S003930', 'SG-C-14', 'C', 14, false),
    ('S003931', 'SG-C-15', 'C', 15, false),
    ('S003932', 'SG-C-16', 'C', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003933', 'SG-D-01', 'D', 1, false),
    ('S003934', 'SG-D-02', 'D', 2, false),
    ('S003935', 'SG-D-03', 'D', 3, false),
    ('S003936', 'SG-D-04', 'D', 4, false),
    ('S003937', 'SG-D-05', 'D', 5, false),
    ('S003938', 'SG-D-06', 'D', 6, false),
    ('S003939', 'SG-D-07', 'D', 7, false),
    ('S003940', 'SG-D-08', 'D', 8, false),
    ('S003941', 'SG-D-09', 'D', 9, false),
    ('S003942', 'SG-D-10', 'D', 10, false),
    ('S003943', 'SG-D-11', 'D', 11, false),
    ('S003944', 'SG-D-12', 'D', 12, false),
    ('S003945', 'SG-D-13', 'D', 13, false),
    ('S003946', 'SG-D-14', 'D', 14, false),
    ('S003947', 'SG-D-15', 'D', 15, false),
    ('S003948', 'SG-D-16', 'D', 16, false),
    ('S003949', 'SG-D-17', 'D', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003950', 'SG-E-01', 'E', 1, false),
    ('S003951', 'SG-E-02', 'E', 2, false),
    ('S003952', 'SG-E-03', 'E', 3, false),
    ('S003953', 'SG-E-04', 'E', 4, false),
    ('S003954', 'SG-E-05', 'E', 5, false),
    ('S003955', 'SG-E-06', 'E', 6, false),
    ('S003956', 'SG-E-07', 'E', 7, false),
    ('S003957', 'SG-E-08', 'E', 8, false),
    ('S003958', 'SG-E-09', 'E', 9, false),
    ('S003959', 'SG-E-10', 'E', 10, false),
    ('S003960', 'SG-E-11', 'E', 11, false),
    ('S003961', 'SG-E-12', 'E', 12, false),
    ('S003962', 'SG-E-13', 'E', 13, false),
    ('S003963', 'SG-E-14', 'E', 14, false),
    ('S003964', 'SG-E-15', 'E', 15, false),
    ('S003965', 'SG-E-16', 'E', 16, false),
    ('S003966', 'SG-E-17', 'E', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003967', 'SG-F-01', 'F', 1, false),
    ('S003968', 'SG-F-02', 'F', 2, false),
    ('S003969', 'SG-F-03', 'F', 3, false),
    ('S003970', 'SG-F-04', 'F', 4, false),
    ('S003971', 'SG-F-05', 'F', 5, false),
    ('S003972', 'SG-F-06', 'F', 6, false),
    ('S003973', 'SG-F-07', 'F', 7, false),
    ('S003974', 'SG-F-08', 'F', 8, false),
    ('S003975', 'SG-F-09', 'F', 9, false),
    ('S003976', 'SG-F-10', 'F', 10, false),
    ('S003977', 'SG-F-11', 'F', 11, false),
    ('S003978', 'SG-F-12', 'F', 12, false),
    ('S003979', 'SG-F-13', 'F', 13, false),
    ('S003980', 'SG-F-14', 'F', 14, false),
    ('S003981', 'SG-F-15', 'F', 15, false),
    ('S003982', 'SG-F-16', 'F', 16, false),
    ('S003983', 'SG-F-17', 'F', 17, false),
    ('S003984', 'SG-F-18', 'F', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003985', 'SG-G-01', 'G', 1, false),
    ('S003986', 'SG-G-02', 'G', 2, false),
    ('S003987', 'SG-G-03', 'G', 3, false),
    ('S003988', 'SG-G-04', 'G', 4, false),
    ('S003989', 'SG-G-05', 'G', 5, false),
    ('S003990', 'SG-G-06', 'G', 6, false),
    ('S003991', 'SG-G-07', 'G', 7, false),
    ('S003992', 'SG-G-08', 'G', 8, false),
    ('S003993', 'SG-G-09', 'G', 9, false),
    ('S003994', 'SG-G-10', 'G', 10, false),
    ('S003995', 'SG-G-11', 'G', 11, false),
    ('S003996', 'SG-G-12', 'G', 12, false),
    ('S003997', 'SG-G-13', 'G', 13, false),
    ('S003998', 'SG-G-14', 'G', 14, false),
    ('S003999', 'SG-G-15', 'G', 15, false),
    ('S004000', 'SG-G-16', 'G', 16, false),
    ('S004001', 'SG-G-17', 'G', 17, false),
    ('S004002', 'SG-G-18', 'G', 18, false),
    ('S004003', 'SG-G-19', 'G', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004004', 'SG-H-01', 'H', 1, false),
    ('S004005', 'SG-H-02', 'H', 2, false),
    ('S004006', 'SG-H-03', 'H', 3, false),
    ('S004007', 'SG-H-04', 'H', 4, false),
    ('S004008', 'SG-H-05', 'H', 5, false),
    ('S004009', 'SG-H-06', 'H', 6, false),
    ('S004010', 'SG-H-07', 'H', 7, false),
    ('S004011', 'SG-H-08', 'H', 8, false),
    ('S004012', 'SG-H-09', 'H', 9, false),
    ('S004013', 'SG-H-10', 'H', 10, false),
    ('S004014', 'SG-H-11', 'H', 11, false),
    ('S004015', 'SG-H-12', 'H', 12, false),
    ('S004016', 'SG-H-13', 'H', 13, false),
    ('S004017', 'SG-H-14', 'H', 14, false),
    ('S004018', 'SG-H-15', 'H', 15, false),
    ('S004019', 'SG-H-16', 'H', 16, false),
    ('S004020', 'SG-H-17', 'H', 17, false),
    ('S004021', 'SG-H-18', 'H', 18, false),
    ('S004022', 'SG-H-19', 'H', 19, false),
    ('S004023', 'SG-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SG'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SH (152 seats)
-- Row A (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004024', 'SH-A-01', 'A', 1, false),
    ('S004025', 'SH-A-02', 'A', 2, false),
    ('S004026', 'SH-A-03', 'A', 3, false),
    ('S004027', 'SH-A-04', 'A', 4, false),
    ('S004028', 'SH-A-05', 'A', 5, false),
    ('S004029', 'SH-A-06', 'A', 6, false),
    ('S004030', 'SH-A-07', 'A', 7, false),
    ('S004031', 'SH-A-08', 'A', 8, false),
    ('S004032', 'SH-A-09', 'A', 9, false),
    ('S004033', 'SH-A-10', 'A', 10, false),
    ('S004034', 'SH-A-11', 'A', 11, false),
    ('S004035', 'SH-A-12', 'A', 12, false),
    ('S004036', 'SH-A-13', 'A', 13, false),
    ('S004037', 'SH-A-14', 'A', 14, false),
    ('S004038', 'SH-A-15', 'A', 15, false),
    ('S004039', 'SH-A-16', 'A', 16, false),
    ('S004040', 'SH-A-17', 'A', 17, false),
    ('S004041', 'SH-A-18', 'A', 18, false),
    ('S004042', 'SH-A-19', 'A', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004043', 'SH-B-01', 'B', 1, false),
    ('S004044', 'SH-B-02', 'B', 2, false),
    ('S004045', 'SH-B-03', 'B', 3, false),
    ('S004046', 'SH-B-04', 'B', 4, false),
    ('S004047', 'SH-B-05', 'B', 5, false),
    ('S004048', 'SH-B-06', 'B', 6, false),
    ('S004049', 'SH-B-07', 'B', 7, false),
    ('S004050', 'SH-B-08', 'B', 8, false),
    ('S004051', 'SH-B-09', 'B', 9, false),
    ('S004052', 'SH-B-10', 'B', 10, false),
    ('S004053', 'SH-B-11', 'B', 11, false),
    ('S004054', 'SH-B-12', 'B', 12, false),
    ('S004055', 'SH-B-13', 'B', 13, false),
    ('S004056', 'SH-B-14', 'B', 14, false),
    ('S004057', 'SH-B-15', 'B', 15, false),
    ('S004058', 'SH-B-16', 'B', 16, false),
    ('S004059', 'SH-B-17', 'B', 17, false),
    ('S004060', 'SH-B-18', 'B', 18, false),
    ('S004061', 'SH-B-19', 'B', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004062', 'SH-C-01', 'C', 1, false),
    ('S004063', 'SH-C-02', 'C', 2, false),
    ('S004064', 'SH-C-03', 'C', 3, false),
    ('S004065', 'SH-C-04', 'C', 4, false),
    ('S004066', 'SH-C-05', 'C', 5, false),
    ('S004067', 'SH-C-06', 'C', 6, false),
    ('S004068', 'SH-C-07', 'C', 7, false),
    ('S004069', 'SH-C-08', 'C', 8, false),
    ('S004070', 'SH-C-09', 'C', 9, false),
    ('S004071', 'SH-C-10', 'C', 10, false),
    ('S004072', 'SH-C-11', 'C', 11, false),
    ('S004073', 'SH-C-12', 'C', 12, false),
    ('S004074', 'SH-C-13', 'C', 13, false),
    ('S004075', 'SH-C-14', 'C', 14, false),
    ('S004076', 'SH-C-15', 'C', 15, false),
    ('S004077', 'SH-C-16', 'C', 16, false),
    ('S004078', 'SH-C-17', 'C', 17, false),
    ('S004079', 'SH-C-18', 'C', 18, false),
    ('S004080', 'SH-C-19', 'C', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004081', 'SH-D-01', 'D', 1, false),
    ('S004082', 'SH-D-02', 'D', 2, false),
    ('S004083', 'SH-D-03', 'D', 3, false),
    ('S004084', 'SH-D-04', 'D', 4, false),
    ('S004085', 'SH-D-05', 'D', 5, false),
    ('S004086', 'SH-D-06', 'D', 6, false),
    ('S004087', 'SH-D-07', 'D', 7, false),
    ('S004088', 'SH-D-08', 'D', 8, false),
    ('S004089', 'SH-D-09', 'D', 9, false),
    ('S004090', 'SH-D-10', 'D', 10, false),
    ('S004091', 'SH-D-11', 'D', 11, false),
    ('S004092', 'SH-D-12', 'D', 12, false),
    ('S004093', 'SH-D-13', 'D', 13, false),
    ('S004094', 'SH-D-14', 'D', 14, false),
    ('S004095', 'SH-D-15', 'D', 15, false),
    ('S004096', 'SH-D-16', 'D', 16, false),
    ('S004097', 'SH-D-17', 'D', 17, false),
    ('S004098', 'SH-D-18', 'D', 18, false),
    ('S004099', 'SH-D-19', 'D', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004100', 'SH-E-01', 'E', 1, false),
    ('S004101', 'SH-E-02', 'E', 2, false),
    ('S004102', 'SH-E-03', 'E', 3, false),
    ('S004103', 'SH-E-04', 'E', 4, false),
    ('S004104', 'SH-E-05', 'E', 5, false),
    ('S004105', 'SH-E-06', 'E', 6, false),
    ('S004106', 'SH-E-07', 'E', 7, false),
    ('S004107', 'SH-E-08', 'E', 8, false),
    ('S004108', 'SH-E-09', 'E', 9, false),
    ('S004109', 'SH-E-10', 'E', 10, false),
    ('S004110', 'SH-E-11', 'E', 11, false),
    ('S004111', 'SH-E-12', 'E', 12, false),
    ('S004112', 'SH-E-13', 'E', 13, false),
    ('S004113', 'SH-E-14', 'E', 14, false),
    ('S004114', 'SH-E-15', 'E', 15, false),
    ('S004115', 'SH-E-16', 'E', 16, false),
    ('S004116', 'SH-E-17', 'E', 17, false),
    ('S004117', 'SH-E-18', 'E', 18, false),
    ('S004118', 'SH-E-19', 'E', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004119', 'SH-F-01', 'F', 1, false),
    ('S004120', 'SH-F-02', 'F', 2, false),
    ('S004121', 'SH-F-03', 'F', 3, false),
    ('S004122', 'SH-F-04', 'F', 4, false),
    ('S004123', 'SH-F-05', 'F', 5, false),
    ('S004124', 'SH-F-06', 'F', 6, false),
    ('S004125', 'SH-F-07', 'F', 7, false),
    ('S004126', 'SH-F-08', 'F', 8, false),
    ('S004127', 'SH-F-09', 'F', 9, false),
    ('S004128', 'SH-F-10', 'F', 10, false),
    ('S004129', 'SH-F-11', 'F', 11, false),
    ('S004130', 'SH-F-12', 'F', 12, false),
    ('S004131', 'SH-F-13', 'F', 13, false),
    ('S004132', 'SH-F-14', 'F', 14, false),
    ('S004133', 'SH-F-15', 'F', 15, false),
    ('S004134', 'SH-F-16', 'F', 16, false),
    ('S004135', 'SH-F-17', 'F', 17, false),
    ('S004136', 'SH-F-18', 'F', 18, false),
    ('S004137', 'SH-F-19', 'F', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004138', 'SH-G-01', 'G', 1, false),
    ('S004139', 'SH-G-02', 'G', 2, false),
    ('S004140', 'SH-G-03', 'G', 3, false),
    ('S004141', 'SH-G-04', 'G', 4, false),
    ('S004142', 'SH-G-05', 'G', 5, false),
    ('S004143', 'SH-G-06', 'G', 6, false),
    ('S004144', 'SH-G-07', 'G', 7, false),
    ('S004145', 'SH-G-08', 'G', 8, false),
    ('S004146', 'SH-G-09', 'G', 9, false),
    ('S004147', 'SH-G-10', 'G', 10, false),
    ('S004148', 'SH-G-11', 'G', 11, false),
    ('S004149', 'SH-G-12', 'G', 12, false),
    ('S004150', 'SH-G-13', 'G', 13, false),
    ('S004151', 'SH-G-14', 'G', 14, false),
    ('S004152', 'SH-G-15', 'G', 15, false),
    ('S004153', 'SH-G-16', 'G', 16, false),
    ('S004154', 'SH-G-17', 'G', 17, false),
    ('S004155', 'SH-G-18', 'G', 18, false),
    ('S004156', 'SH-G-19', 'G', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004157', 'SH-H-01', 'H', 1, false),
    ('S004158', 'SH-H-02', 'H', 2, false),
    ('S004159', 'SH-H-03', 'H', 3, false),
    ('S004160', 'SH-H-04', 'H', 4, false),
    ('S004161', 'SH-H-05', 'H', 5, false),
    ('S004162', 'SH-H-06', 'H', 6, false),
    ('S004163', 'SH-H-07', 'H', 7, false),
    ('S004164', 'SH-H-08', 'H', 8, false),
    ('S004165', 'SH-H-09', 'H', 9, false),
    ('S004166', 'SH-H-10', 'H', 10, false),
    ('S004167', 'SH-H-11', 'H', 11, false),
    ('S004168', 'SH-H-12', 'H', 12, false),
    ('S004169', 'SH-H-13', 'H', 13, false),
    ('S004170', 'SH-H-14', 'H', 14, false),
    ('S004171', 'SH-H-15', 'H', 15, false),
    ('S004172', 'SH-H-16', 'H', 16, false),
    ('S004173', 'SH-H-17', 'H', 17, false),
    ('S004174', 'SH-H-18', 'H', 18, false),
    ('S004175', 'SH-H-19', 'H', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SI (136 seats)
-- Row A (14 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004176', 'SI-A-01', 'A', 1, false),
    ('S004177', 'SI-A-02', 'A', 2, false),
    ('S004178', 'SI-A-03', 'A', 3, false),
    ('S004179', 'SI-A-04', 'A', 4, false),
    ('S004180', 'SI-A-05', 'A', 5, false),
    ('S004181', 'SI-A-06', 'A', 6, false),
    ('S004182', 'SI-A-07', 'A', 7, false),
    ('S004183', 'SI-A-08', 'A', 8, false),
    ('S004184', 'SI-A-09', 'A', 9, false),
    ('S004185', 'SI-A-10', 'A', 10, false),
    ('S004186', 'SI-A-11', 'A', 11, false),
    ('S004187', 'SI-A-12', 'A', 12, false),
    ('S004188', 'SI-A-13', 'A', 13, false),
    ('S004189', 'SI-A-14', 'A', 14, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (15 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004190', 'SI-B-01', 'B', 1, false),
    ('S004191', 'SI-B-02', 'B', 2, false),
    ('S004192', 'SI-B-03', 'B', 3, false),
    ('S004193', 'SI-B-04', 'B', 4, false),
    ('S004194', 'SI-B-05', 'B', 5, false),
    ('S004195', 'SI-B-06', 'B', 6, false),
    ('S004196', 'SI-B-07', 'B', 7, false),
    ('S004197', 'SI-B-08', 'B', 8, false),
    ('S004198', 'SI-B-09', 'B', 9, false),
    ('S004199', 'SI-B-10', 'B', 10, false),
    ('S004200', 'SI-B-11', 'B', 11, false),
    ('S004201', 'SI-B-12', 'B', 12, false),
    ('S004202', 'SI-B-13', 'B', 13, false),
    ('S004203', 'SI-B-14', 'B', 14, false),
    ('S004204', 'SI-B-15', 'B', 15, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004205', 'SI-C-01', 'C', 1, false),
    ('S004206', 'SI-C-02', 'C', 2, false),
    ('S004207', 'SI-C-03', 'C', 3, false),
    ('S004208', 'SI-C-04', 'C', 4, false),
    ('S004209', 'SI-C-05', 'C', 5, false),
    ('S004210', 'SI-C-06', 'C', 6, false),
    ('S004211', 'SI-C-07', 'C', 7, false),
    ('S004212', 'SI-C-08', 'C', 8, false),
    ('S004213', 'SI-C-09', 'C', 9, false),
    ('S004214', 'SI-C-10', 'C', 10, false),
    ('S004215', 'SI-C-11', 'C', 11, false),
    ('S004216', 'SI-C-12', 'C', 12, false),
    ('S004217', 'SI-C-13', 'C', 13, false),
    ('S004218', 'SI-C-14', 'C', 14, false),
    ('S004219', 'SI-C-15', 'C', 15, false),
    ('S004220', 'SI-C-16', 'C', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004221', 'SI-D-01', 'D', 1, false),
    ('S004222', 'SI-D-02', 'D', 2, false),
    ('S004223', 'SI-D-03', 'D', 3, false),
    ('S004224', 'SI-D-04', 'D', 4, false),
    ('S004225', 'SI-D-05', 'D', 5, false),
    ('S004226', 'SI-D-06', 'D', 6, false),
    ('S004227', 'SI-D-07', 'D', 7, false),
    ('S004228', 'SI-D-08', 'D', 8, false),
    ('S004229', 'SI-D-09', 'D', 9, false),
    ('S004230', 'SI-D-10', 'D', 10, false),
    ('S004231', 'SI-D-11', 'D', 11, false),
    ('S004232', 'SI-D-12', 'D', 12, false),
    ('S004233', 'SI-D-13', 'D', 13, false),
    ('S004234', 'SI-D-14', 'D', 14, false),
    ('S004235', 'SI-D-15', 'D', 15, false),
    ('S004236', 'SI-D-16', 'D', 16, false),
    ('S004237', 'SI-D-17', 'D', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004238', 'SI-E-01', 'E', 1, false),
    ('S004239', 'SI-E-02', 'E', 2, false),
    ('S004240', 'SI-E-03', 'E', 3, false),
    ('S004241', 'SI-E-04', 'E', 4, false),
    ('S004242', 'SI-E-05', 'E', 5, false),
    ('S004243', 'SI-E-06', 'E', 6, false),
    ('S004244', 'SI-E-07', 'E', 7, false),
    ('S004245', 'SI-E-08', 'E', 8, false),
    ('S004246', 'SI-E-09', 'E', 9, false),
    ('S004247', 'SI-E-10', 'E', 10, false),
    ('S004248', 'SI-E-11', 'E', 11, false),
    ('S004249', 'SI-E-12', 'E', 12, false),
    ('S004250', 'SI-E-13', 'E', 13, false),
    ('S004251', 'SI-E-14', 'E', 14, false),
    ('S004252', 'SI-E-15', 'E', 15, false),
    ('S004253', 'SI-E-16', 'E', 16, false),
    ('S004254', 'SI-E-17', 'E', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004255', 'SI-F-01', 'F', 1, false),
    ('S004256', 'SI-F-02', 'F', 2, false),
    ('S004257', 'SI-F-03', 'F', 3, false),
    ('S004258', 'SI-F-04', 'F', 4, false),
    ('S004259', 'SI-F-05', 'F', 5, false),
    ('S004260', 'SI-F-06', 'F', 6, false),
    ('S004261', 'SI-F-07', 'F', 7, false),
    ('S004262', 'SI-F-08', 'F', 8, false),
    ('S004263', 'SI-F-09', 'F', 9, false),
    ('S004264', 'SI-F-10', 'F', 10, false),
    ('S004265', 'SI-F-11', 'F', 11, false),
    ('S004266', 'SI-F-12', 'F', 12, false),
    ('S004267', 'SI-F-13', 'F', 13, false),
    ('S004268', 'SI-F-14', 'F', 14, false),
    ('S004269', 'SI-F-15', 'F', 15, false),
    ('S004270', 'SI-F-16', 'F', 16, false),
    ('S004271', 'SI-F-17', 'F', 17, false),
    ('S004272', 'SI-F-18', 'F', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004273', 'SI-G-01', 'G', 1, false),
    ('S004274', 'SI-G-02', 'G', 2, false),
    ('S004275', 'SI-G-03', 'G', 3, false),
    ('S004276', 'SI-G-04', 'G', 4, false),
    ('S004277', 'SI-G-05', 'G', 5, false),
    ('S004278', 'SI-G-06', 'G', 6, false),
    ('S004279', 'SI-G-07', 'G', 7, false),
    ('S004280', 'SI-G-08', 'G', 8, false),
    ('S004281', 'SI-G-09', 'G', 9, false),
    ('S004282', 'SI-G-10', 'G', 10, false),
    ('S004283', 'SI-G-11', 'G', 11, false),
    ('S004284', 'SI-G-12', 'G', 12, false),
    ('S004285', 'SI-G-13', 'G', 13, false),
    ('S004286', 'SI-G-14', 'G', 14, false),
    ('S004287', 'SI-G-15', 'G', 15, false),
    ('S004288', 'SI-G-16', 'G', 16, false),
    ('S004289', 'SI-G-17', 'G', 17, false),
    ('S004290', 'SI-G-18', 'G', 18, false),
    ('S004291', 'SI-G-19', 'G', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004292', 'SI-H-01', 'H', 1, false),
    ('S004293', 'SI-H-02', 'H', 2, false),
    ('S004294', 'SI-H-03', 'H', 3, false),
    ('S004295', 'SI-H-04', 'H', 4, false),
    ('S004296', 'SI-H-05', 'H', 5, false),
    ('S004297', 'SI-H-06', 'H', 6, false),
    ('S004298', 'SI-H-07', 'H', 7, false),
    ('S004299', 'SI-H-08', 'H', 8, false),
    ('S004300', 'SI-H-09', 'H', 9, false),
    ('S004301', 'SI-H-10', 'H', 10, false),
    ('S004302', 'SI-H-11', 'H', 11, false),
    ('S004303', 'SI-H-12', 'H', 12, false),
    ('S004304', 'SI-H-13', 'H', 13, false),
    ('S004305', 'SI-H-14', 'H', 14, false),
    ('S004306', 'SI-H-15', 'H', 15, false),
    ('S004307', 'SI-H-16', 'H', 16, false),
    ('S004308', 'SI-H-17', 'H', 17, false),
    ('S004309', 'SI-H-18', 'H', 18, false),
    ('S004310', 'SI-H-19', 'H', 19, false),
    ('S004311', 'SI-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SI'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SJ (160 seats)
-- Row A (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004312', 'SJ-A-01', 'A', 1, false),
    ('S004313', 'SJ-A-02', 'A', 2, false),
    ('S004314', 'SJ-A-03', 'A', 3, false),
    ('S004315', 'SJ-A-04', 'A', 4, false),
    ('S004316', 'SJ-A-05', 'A', 5, false),
    ('S004317', 'SJ-A-06', 'A', 6, false),
    ('S004318', 'SJ-A-07', 'A', 7, false),
    ('S004319', 'SJ-A-08', 'A', 8, false),
    ('S004320', 'SJ-A-09', 'A', 9, false),
    ('S004321', 'SJ-A-10', 'A', 10, false),
    ('S004322', 'SJ-A-11', 'A', 11, false),
    ('S004323', 'SJ-A-12', 'A', 12, false),
    ('S004324', 'SJ-A-13', 'A', 13, false),
    ('S004325', 'SJ-A-14', 'A', 14, false),
    ('S004326', 'SJ-A-15', 'A', 15, false),
    ('S004327', 'SJ-A-16', 'A', 16, false),
    ('S004328', 'SJ-A-17', 'A', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004329', 'SJ-B-01', 'B', 1, false),
    ('S004330', 'SJ-B-02', 'B', 2, false),
    ('S004331', 'SJ-B-03', 'B', 3, false),
    ('S004332', 'SJ-B-04', 'B', 4, false),
    ('S004333', 'SJ-B-05', 'B', 5, false),
    ('S004334', 'SJ-B-06', 'B', 6, false),
    ('S004335', 'SJ-B-07', 'B', 7, false),
    ('S004336', 'SJ-B-08', 'B', 8, false),
    ('S004337', 'SJ-B-09', 'B', 9, false),
    ('S004338', 'SJ-B-10', 'B', 10, false),
    ('S004339', 'SJ-B-11', 'B', 11, false),
    ('S004340', 'SJ-B-12', 'B', 12, false),
    ('S004341', 'SJ-B-13', 'B', 13, false),
    ('S004342', 'SJ-B-14', 'B', 14, false),
    ('S004343', 'SJ-B-15', 'B', 15, false),
    ('S004344', 'SJ-B-16', 'B', 16, false),
    ('S004345', 'SJ-B-17', 'B', 17, false),
    ('S004346', 'SJ-B-18', 'B', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004347', 'SJ-C-01', 'C', 1, false),
    ('S004348', 'SJ-C-02', 'C', 2, false),
    ('S004349', 'SJ-C-03', 'C', 3, false),
    ('S004350', 'SJ-C-04', 'C', 4, false),
    ('S004351', 'SJ-C-05', 'C', 5, false),
    ('S004352', 'SJ-C-06', 'C', 6, false),
    ('S004353', 'SJ-C-07', 'C', 7, false),
    ('S004354', 'SJ-C-08', 'C', 8, false),
    ('S004355', 'SJ-C-09', 'C', 9, false),
    ('S004356', 'SJ-C-10', 'C', 10, false),
    ('S004357', 'SJ-C-11', 'C', 11, false),
    ('S004358', 'SJ-C-12', 'C', 12, false),
    ('S004359', 'SJ-C-13', 'C', 13, false),
    ('S004360', 'SJ-C-14', 'C', 14, false),
    ('S004361', 'SJ-C-15', 'C', 15, false),
    ('S004362', 'SJ-C-16', 'C', 16, false),
    ('S004363', 'SJ-C-17', 'C', 17, false),
    ('S004364', 'SJ-C-18', 'C', 18, false),
    ('S004365', 'SJ-C-19', 'C', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004366', 'SJ-D-01', 'D', 1, false),
    ('S004367', 'SJ-D-02', 'D', 2, false),
    ('S004368', 'SJ-D-03', 'D', 3, false),
    ('S004369', 'SJ-D-04', 'D', 4, false),
    ('S004370', 'SJ-D-05', 'D', 5, false),
    ('S004371', 'SJ-D-06', 'D', 6, false),
    ('S004372', 'SJ-D-07', 'D', 7, false),
    ('S004373', 'SJ-D-08', 'D', 8, false),
    ('S004374', 'SJ-D-09', 'D', 9, false),
    ('S004375', 'SJ-D-10', 'D', 10, false),
    ('S004376', 'SJ-D-11', 'D', 11, false),
    ('S004377', 'SJ-D-12', 'D', 12, false),
    ('S004378', 'SJ-D-13', 'D', 13, false),
    ('S004379', 'SJ-D-14', 'D', 14, false),
    ('S004380', 'SJ-D-15', 'D', 15, false),
    ('S004381', 'SJ-D-16', 'D', 16, false),
    ('S004382', 'SJ-D-17', 'D', 17, false),
    ('S004383', 'SJ-D-18', 'D', 18, false),
    ('S004384', 'SJ-D-19', 'D', 19, false),
    ('S004385', 'SJ-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004386', 'SJ-E-01', 'E', 1, false),
    ('S004387', 'SJ-E-02', 'E', 2, false),
    ('S004388', 'SJ-E-03', 'E', 3, false),
    ('S004389', 'SJ-E-04', 'E', 4, false),
    ('S004390', 'SJ-E-05', 'E', 5, false),
    ('S004391', 'SJ-E-06', 'E', 6, false),
    ('S004392', 'SJ-E-07', 'E', 7, false),
    ('S004393', 'SJ-E-08', 'E', 8, false),
    ('S004394', 'SJ-E-09', 'E', 9, false),
    ('S004395', 'SJ-E-10', 'E', 10, false),
    ('S004396', 'SJ-E-11', 'E', 11, false),
    ('S004397', 'SJ-E-12', 'E', 12, false),
    ('S004398', 'SJ-E-13', 'E', 13, false),
    ('S004399', 'SJ-E-14', 'E', 14, false),
    ('S004400', 'SJ-E-15', 'E', 15, false),
    ('S004401', 'SJ-E-16', 'E', 16, false),
    ('S004402', 'SJ-E-17', 'E', 17, false),
    ('S004403', 'SJ-E-18', 'E', 18, false),
    ('S004404', 'SJ-E-19', 'E', 19, false),
    ('S004405', 'SJ-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004406', 'SJ-F-01', 'F', 1, false),
    ('S004407', 'SJ-F-02', 'F', 2, false),
    ('S004408', 'SJ-F-03', 'F', 3, false),
    ('S004409', 'SJ-F-04', 'F', 4, false),
    ('S004410', 'SJ-F-05', 'F', 5, false),
    ('S004411', 'SJ-F-06', 'F', 6, false),
    ('S004412', 'SJ-F-07', 'F', 7, false),
    ('S004413', 'SJ-F-08', 'F', 8, false),
    ('S004414', 'SJ-F-09', 'F', 9, false),
    ('S004415', 'SJ-F-10', 'F', 10, false),
    ('S004416', 'SJ-F-11', 'F', 11, false),
    ('S004417', 'SJ-F-12', 'F', 12, false),
    ('S004418', 'SJ-F-13', 'F', 13, false),
    ('S004419', 'SJ-F-14', 'F', 14, false),
    ('S004420', 'SJ-F-15', 'F', 15, false),
    ('S004421', 'SJ-F-16', 'F', 16, false),
    ('S004422', 'SJ-F-17', 'F', 17, false),
    ('S004423', 'SJ-F-18', 'F', 18, false),
    ('S004424', 'SJ-F-19', 'F', 19, false),
    ('S004425', 'SJ-F-20', 'F', 20, false),
    ('S004426', 'SJ-F-21', 'F', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004427', 'SJ-G-01', 'G', 1, false),
    ('S004428', 'SJ-G-02', 'G', 2, false),
    ('S004429', 'SJ-G-03', 'G', 3, false),
    ('S004430', 'SJ-G-04', 'G', 4, false),
    ('S004431', 'SJ-G-05', 'G', 5, false),
    ('S004432', 'SJ-G-06', 'G', 6, false),
    ('S004433', 'SJ-G-07', 'G', 7, false),
    ('S004434', 'SJ-G-08', 'G', 8, false),
    ('S004435', 'SJ-G-09', 'G', 9, false),
    ('S004436', 'SJ-G-10', 'G', 10, false),
    ('S004437', 'SJ-G-11', 'G', 11, false),
    ('S004438', 'SJ-G-12', 'G', 12, false),
    ('S004439', 'SJ-G-13', 'G', 13, false),
    ('S004440', 'SJ-G-14', 'G', 14, false),
    ('S004441', 'SJ-G-15', 'G', 15, false),
    ('S004442', 'SJ-G-16', 'G', 16, false),
    ('S004443', 'SJ-G-17', 'G', 17, false),
    ('S004444', 'SJ-G-18', 'G', 18, false),
    ('S004445', 'SJ-G-19', 'G', 19, false),
    ('S004446', 'SJ-G-20', 'G', 20, false),
    ('S004447', 'SJ-G-21', 'G', 21, false),
    ('S004448', 'SJ-G-22', 'G', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (23 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004449', 'SJ-H-01', 'H', 1, false),
    ('S004450', 'SJ-H-02', 'H', 2, false),
    ('S004451', 'SJ-H-03', 'H', 3, false),
    ('S004452', 'SJ-H-04', 'H', 4, false),
    ('S004453', 'SJ-H-05', 'H', 5, false),
    ('S004454', 'SJ-H-06', 'H', 6, false),
    ('S004455', 'SJ-H-07', 'H', 7, false),
    ('S004456', 'SJ-H-08', 'H', 8, false),
    ('S004457', 'SJ-H-09', 'H', 9, false),
    ('S004458', 'SJ-H-10', 'H', 10, false),
    ('S004459', 'SJ-H-11', 'H', 11, false),
    ('S004460', 'SJ-H-12', 'H', 12, false),
    ('S004461', 'SJ-H-13', 'H', 13, false),
    ('S004462', 'SJ-H-14', 'H', 14, false),
    ('S004463', 'SJ-H-15', 'H', 15, false),
    ('S004464', 'SJ-H-16', 'H', 16, false),
    ('S004465', 'SJ-H-17', 'H', 17, false),
    ('S004466', 'SJ-H-18', 'H', 18, false),
    ('S004467', 'SJ-H-19', 'H', 19, false),
    ('S004468', 'SJ-H-20', 'H', 20, false),
    ('S004469', 'SJ-H-21', 'H', 21, false),
    ('S004470', 'SJ-H-22', 'H', 22, false),
    ('S004471', 'SJ-H-23', 'H', 23, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SJ'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SK (191 seats)
-- Row A (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004472', 'SK-A-01', 'A', 1, false),
    ('S004473', 'SK-A-02', 'A', 2, false),
    ('S004474', 'SK-A-03', 'A', 3, false),
    ('S004475', 'SK-A-04', 'A', 4, false),
    ('S004476', 'SK-A-05', 'A', 5, false),
    ('S004477', 'SK-A-06', 'A', 6, false),
    ('S004478', 'SK-A-07', 'A', 7, false),
    ('S004479', 'SK-A-08', 'A', 8, false),
    ('S004480', 'SK-A-09', 'A', 9, false),
    ('S004481', 'SK-A-10', 'A', 10, false),
    ('S004482', 'SK-A-11', 'A', 11, false),
    ('S004483', 'SK-A-12', 'A', 12, false),
    ('S004484', 'SK-A-13', 'A', 13, false),
    ('S004485', 'SK-A-14', 'A', 14, false),
    ('S004486', 'SK-A-15', 'A', 15, false),
    ('S004487', 'SK-A-16', 'A', 16, false),
    ('S004488', 'SK-A-17', 'A', 17, false),
    ('S004489', 'SK-A-18', 'A', 18, false),
    ('S004490', 'SK-A-19', 'A', 19, false),
    ('S004491', 'SK-A-20', 'A', 20, false),
    ('S004492', 'SK-A-21', 'A', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004493', 'SK-B-01', 'B', 1, false),
    ('S004494', 'SK-B-02', 'B', 2, false),
    ('S004495', 'SK-B-03', 'B', 3, false),
    ('S004496', 'SK-B-04', 'B', 4, false),
    ('S004497', 'SK-B-05', 'B', 5, false),
    ('S004498', 'SK-B-06', 'B', 6, false),
    ('S004499', 'SK-B-07', 'B', 7, false),
    ('S004500', 'SK-B-08', 'B', 8, false),
    ('S004501', 'SK-B-09', 'B', 9, false),
    ('S004502', 'SK-B-10', 'B', 10, false),
    ('S004503', 'SK-B-11', 'B', 11, false),
    ('S004504', 'SK-B-12', 'B', 12, false),
    ('S004505', 'SK-B-13', 'B', 13, false),
    ('S004506', 'SK-B-14', 'B', 14, false),
    ('S004507', 'SK-B-15', 'B', 15, false),
    ('S004508', 'SK-B-16', 'B', 16, false),
    ('S004509', 'SK-B-17', 'B', 17, false),
    ('S004510', 'SK-B-18', 'B', 18, false),
    ('S004511', 'SK-B-19', 'B', 19, false),
    ('S004512', 'SK-B-20', 'B', 20, false),
    ('S004513', 'SK-B-21', 'B', 21, false),
    ('S004514', 'SK-B-22', 'B', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (23 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004515', 'SK-C-01', 'C', 1, false),
    ('S004516', 'SK-C-02', 'C', 2, false),
    ('S004517', 'SK-C-03', 'C', 3, false),
    ('S004518', 'SK-C-04', 'C', 4, false),
    ('S004519', 'SK-C-05', 'C', 5, false),
    ('S004520', 'SK-C-06', 'C', 6, false),
    ('S004521', 'SK-C-07', 'C', 7, false),
    ('S004522', 'SK-C-08', 'C', 8, false),
    ('S004523', 'SK-C-09', 'C', 9, false),
    ('S004524', 'SK-C-10', 'C', 10, false),
    ('S004525', 'SK-C-11', 'C', 11, false),
    ('S004526', 'SK-C-12', 'C', 12, false),
    ('S004527', 'SK-C-13', 'C', 13, false),
    ('S004528', 'SK-C-14', 'C', 14, false),
    ('S004529', 'SK-C-15', 'C', 15, false),
    ('S004530', 'SK-C-16', 'C', 16, false),
    ('S004531', 'SK-C-17', 'C', 17, false),
    ('S004532', 'SK-C-18', 'C', 18, false),
    ('S004533', 'SK-C-19', 'C', 19, false),
    ('S004534', 'SK-C-20', 'C', 20, false),
    ('S004535', 'SK-C-21', 'C', 21, false),
    ('S004536', 'SK-C-22', 'C', 22, false),
    ('S004537', 'SK-C-23', 'C', 23, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (23 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004538', 'SK-D-01', 'D', 1, false),
    ('S004539', 'SK-D-02', 'D', 2, false),
    ('S004540', 'SK-D-03', 'D', 3, false),
    ('S004541', 'SK-D-04', 'D', 4, false),
    ('S004542', 'SK-D-05', 'D', 5, false),
    ('S004543', 'SK-D-06', 'D', 6, false),
    ('S004544', 'SK-D-07', 'D', 7, false),
    ('S004545', 'SK-D-08', 'D', 8, false),
    ('S004546', 'SK-D-09', 'D', 9, false),
    ('S004547', 'SK-D-10', 'D', 10, false),
    ('S004548', 'SK-D-11', 'D', 11, false),
    ('S004549', 'SK-D-12', 'D', 12, false),
    ('S004550', 'SK-D-13', 'D', 13, false),
    ('S004551', 'SK-D-14', 'D', 14, false),
    ('S004552', 'SK-D-15', 'D', 15, false),
    ('S004553', 'SK-D-16', 'D', 16, false),
    ('S004554', 'SK-D-17', 'D', 17, false),
    ('S004555', 'SK-D-18', 'D', 18, false),
    ('S004556', 'SK-D-19', 'D', 19, false),
    ('S004557', 'SK-D-20', 'D', 20, false),
    ('S004558', 'SK-D-21', 'D', 21, false),
    ('S004559', 'SK-D-22', 'D', 22, false),
    ('S004560', 'SK-D-23', 'D', 23, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004561', 'SK-E-01', 'E', 1, false),
    ('S004562', 'SK-E-02', 'E', 2, false),
    ('S004563', 'SK-E-03', 'E', 3, false),
    ('S004564', 'SK-E-04', 'E', 4, false),
    ('S004565', 'SK-E-05', 'E', 5, false),
    ('S004566', 'SK-E-06', 'E', 6, false),
    ('S004567', 'SK-E-07', 'E', 7, false),
    ('S004568', 'SK-E-08', 'E', 8, false),
    ('S004569', 'SK-E-09', 'E', 9, false),
    ('S004570', 'SK-E-10', 'E', 10, false),
    ('S004571', 'SK-E-11', 'E', 11, false),
    ('S004572', 'SK-E-12', 'E', 12, false),
    ('S004573', 'SK-E-13', 'E', 13, false),
    ('S004574', 'SK-E-14', 'E', 14, false),
    ('S004575', 'SK-E-15', 'E', 15, false),
    ('S004576', 'SK-E-16', 'E', 16, false),
    ('S004577', 'SK-E-17', 'E', 17, false),
    ('S004578', 'SK-E-18', 'E', 18, false),
    ('S004579', 'SK-E-19', 'E', 19, false),
    ('S004580', 'SK-E-20', 'E', 20, false),
    ('S004581', 'SK-E-21', 'E', 21, false),
    ('S004582', 'SK-E-22', 'E', 22, false),
    ('S004583', 'SK-E-23', 'E', 23, false),
    ('S004584', 'SK-E-24', 'E', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (25 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004585', 'SK-F-01', 'F', 1, false),
    ('S004586', 'SK-F-02', 'F', 2, false),
    ('S004587', 'SK-F-03', 'F', 3, false),
    ('S004588', 'SK-F-04', 'F', 4, false),
    ('S004589', 'SK-F-05', 'F', 5, false),
    ('S004590', 'SK-F-06', 'F', 6, false),
    ('S004591', 'SK-F-07', 'F', 7, false),
    ('S004592', 'SK-F-08', 'F', 8, false),
    ('S004593', 'SK-F-09', 'F', 9, false),
    ('S004594', 'SK-F-10', 'F', 10, false),
    ('S004595', 'SK-F-11', 'F', 11, false),
    ('S004596', 'SK-F-12', 'F', 12, false),
    ('S004597', 'SK-F-13', 'F', 13, false),
    ('S004598', 'SK-F-14', 'F', 14, false),
    ('S004599', 'SK-F-15', 'F', 15, false),
    ('S004600', 'SK-F-16', 'F', 16, false),
    ('S004601', 'SK-F-17', 'F', 17, false),
    ('S004602', 'SK-F-18', 'F', 18, false),
    ('S004603', 'SK-F-19', 'F', 19, false),
    ('S004604', 'SK-F-20', 'F', 20, false),
    ('S004605', 'SK-F-21', 'F', 21, false),
    ('S004606', 'SK-F-22', 'F', 22, false),
    ('S004607', 'SK-F-23', 'F', 23, false),
    ('S004608', 'SK-F-24', 'F', 24, false),
    ('S004609', 'SK-F-25', 'F', 25, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (26 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004610', 'SK-G-01', 'G', 1, false),
    ('S004611', 'SK-G-02', 'G', 2, false),
    ('S004612', 'SK-G-03', 'G', 3, false),
    ('S004613', 'SK-G-04', 'G', 4, false),
    ('S004614', 'SK-G-05', 'G', 5, false),
    ('S004615', 'SK-G-06', 'G', 6, false),
    ('S004616', 'SK-G-07', 'G', 7, false),
    ('S004617', 'SK-G-08', 'G', 8, false),
    ('S004618', 'SK-G-09', 'G', 9, false),
    ('S004619', 'SK-G-10', 'G', 10, false),
    ('S004620', 'SK-G-11', 'G', 11, false),
    ('S004621', 'SK-G-12', 'G', 12, false),
    ('S004622', 'SK-G-13', 'G', 13, false),
    ('S004623', 'SK-G-14', 'G', 14, false),
    ('S004624', 'SK-G-15', 'G', 15, false),
    ('S004625', 'SK-G-16', 'G', 16, false),
    ('S004626', 'SK-G-17', 'G', 17, false),
    ('S004627', 'SK-G-18', 'G', 18, false),
    ('S004628', 'SK-G-19', 'G', 19, false),
    ('S004629', 'SK-G-20', 'G', 20, false),
    ('S004630', 'SK-G-21', 'G', 21, false),
    ('S004631', 'SK-G-22', 'G', 22, false),
    ('S004632', 'SK-G-23', 'G', 23, false),
    ('S004633', 'SK-G-24', 'G', 24, false),
    ('S004634', 'SK-G-25', 'G', 25, false),
    ('S004635', 'SK-G-26', 'G', 26, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (27 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004636', 'SK-H-01', 'H', 1, false),
    ('S004637', 'SK-H-02', 'H', 2, false),
    ('S004638', 'SK-H-03', 'H', 3, false),
    ('S004639', 'SK-H-04', 'H', 4, false),
    ('S004640', 'SK-H-05', 'H', 5, false),
    ('S004641', 'SK-H-06', 'H', 6, false),
    ('S004642', 'SK-H-07', 'H', 7, false),
    ('S004643', 'SK-H-08', 'H', 8, false),
    ('S004644', 'SK-H-09', 'H', 9, false),
    ('S004645', 'SK-H-10', 'H', 10, false),
    ('S004646', 'SK-H-11', 'H', 11, false),
    ('S004647', 'SK-H-12', 'H', 12, false),
    ('S004648', 'SK-H-13', 'H', 13, false),
    ('S004649', 'SK-H-14', 'H', 14, false),
    ('S004650', 'SK-H-15', 'H', 15, false),
    ('S004651', 'SK-H-16', 'H', 16, false),
    ('S004652', 'SK-H-17', 'H', 17, false),
    ('S004653', 'SK-H-18', 'H', 18, false),
    ('S004654', 'SK-H-19', 'H', 19, false),
    ('S004655', 'SK-H-20', 'H', 20, false),
    ('S004656', 'SK-H-21', 'H', 21, false),
    ('S004657', 'SK-H-22', 'H', 22, false),
    ('S004658', 'SK-H-23', 'H', 23, false),
    ('S004659', 'SK-H-24', 'H', 24, false),
    ('S004660', 'SK-H-25', 'H', 25, false),
    ('S004661', 'SK-H-26', 'H', 26, false),
    ('S004662', 'SK-H-27', 'H', 27, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SK'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SL (160 seats)
-- Row A (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004663', 'SL-A-01', 'A', 1, false),
    ('S004664', 'SL-A-02', 'A', 2, false),
    ('S004665', 'SL-A-03', 'A', 3, false),
    ('S004666', 'SL-A-04', 'A', 4, false),
    ('S004667', 'SL-A-05', 'A', 5, false),
    ('S004668', 'SL-A-06', 'A', 6, false),
    ('S004669', 'SL-A-07', 'A', 7, false),
    ('S004670', 'SL-A-08', 'A', 8, false),
    ('S004671', 'SL-A-09', 'A', 9, false),
    ('S004672', 'SL-A-10', 'A', 10, false),
    ('S004673', 'SL-A-11', 'A', 11, false),
    ('S004674', 'SL-A-12', 'A', 12, false),
    ('S004675', 'SL-A-13', 'A', 13, false),
    ('S004676', 'SL-A-14', 'A', 14, false),
    ('S004677', 'SL-A-15', 'A', 15, false),
    ('S004678', 'SL-A-16', 'A', 16, false),
    ('S004679', 'SL-A-17', 'A', 17, false),
    ('S004680', 'SL-A-18', 'A', 18, false),
    ('S004681', 'SL-A-19', 'A', 19, false),
    ('S004682', 'SL-A-20', 'A', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004683', 'SL-B-01', 'B', 1, false),
    ('S004684', 'SL-B-02', 'B', 2, false),
    ('S004685', 'SL-B-03', 'B', 3, false),
    ('S004686', 'SL-B-04', 'B', 4, false),
    ('S004687', 'SL-B-05', 'B', 5, false),
    ('S004688', 'SL-B-06', 'B', 6, false),
    ('S004689', 'SL-B-07', 'B', 7, false),
    ('S004690', 'SL-B-08', 'B', 8, false),
    ('S004691', 'SL-B-09', 'B', 9, false),
    ('S004692', 'SL-B-10', 'B', 10, false),
    ('S004693', 'SL-B-11', 'B', 11, false),
    ('S004694', 'SL-B-12', 'B', 12, false),
    ('S004695', 'SL-B-13', 'B', 13, false),
    ('S004696', 'SL-B-14', 'B', 14, false),
    ('S004697', 'SL-B-15', 'B', 15, false),
    ('S004698', 'SL-B-16', 'B', 16, false),
    ('S004699', 'SL-B-17', 'B', 17, false),
    ('S004700', 'SL-B-18', 'B', 18, false),
    ('S004701', 'SL-B-19', 'B', 19, false),
    ('S004702', 'SL-B-20', 'B', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004703', 'SL-C-01', 'C', 1, false),
    ('S004704', 'SL-C-02', 'C', 2, false),
    ('S004705', 'SL-C-03', 'C', 3, false),
    ('S004706', 'SL-C-04', 'C', 4, false),
    ('S004707', 'SL-C-05', 'C', 5, false),
    ('S004708', 'SL-C-06', 'C', 6, false),
    ('S004709', 'SL-C-07', 'C', 7, false),
    ('S004710', 'SL-C-08', 'C', 8, false),
    ('S004711', 'SL-C-09', 'C', 9, false),
    ('S004712', 'SL-C-10', 'C', 10, false),
    ('S004713', 'SL-C-11', 'C', 11, false),
    ('S004714', 'SL-C-12', 'C', 12, false),
    ('S004715', 'SL-C-13', 'C', 13, false),
    ('S004716', 'SL-C-14', 'C', 14, false),
    ('S004717', 'SL-C-15', 'C', 15, false),
    ('S004718', 'SL-C-16', 'C', 16, false),
    ('S004719', 'SL-C-17', 'C', 17, false),
    ('S004720', 'SL-C-18', 'C', 18, false),
    ('S004721', 'SL-C-19', 'C', 19, false),
    ('S004722', 'SL-C-20', 'C', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004723', 'SL-D-01', 'D', 1, false),
    ('S004724', 'SL-D-02', 'D', 2, false),
    ('S004725', 'SL-D-03', 'D', 3, false),
    ('S004726', 'SL-D-04', 'D', 4, false),
    ('S004727', 'SL-D-05', 'D', 5, false),
    ('S004728', 'SL-D-06', 'D', 6, false),
    ('S004729', 'SL-D-07', 'D', 7, false),
    ('S004730', 'SL-D-08', 'D', 8, false),
    ('S004731', 'SL-D-09', 'D', 9, false),
    ('S004732', 'SL-D-10', 'D', 10, false),
    ('S004733', 'SL-D-11', 'D', 11, false),
    ('S004734', 'SL-D-12', 'D', 12, false),
    ('S004735', 'SL-D-13', 'D', 13, false),
    ('S004736', 'SL-D-14', 'D', 14, false),
    ('S004737', 'SL-D-15', 'D', 15, false),
    ('S004738', 'SL-D-16', 'D', 16, false),
    ('S004739', 'SL-D-17', 'D', 17, false),
    ('S004740', 'SL-D-18', 'D', 18, false),
    ('S004741', 'SL-D-19', 'D', 19, false),
    ('S004742', 'SL-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004743', 'SL-E-01', 'E', 1, false),
    ('S004744', 'SL-E-02', 'E', 2, false),
    ('S004745', 'SL-E-03', 'E', 3, false),
    ('S004746', 'SL-E-04', 'E', 4, false),
    ('S004747', 'SL-E-05', 'E', 5, false),
    ('S004748', 'SL-E-06', 'E', 6, false),
    ('S004749', 'SL-E-07', 'E', 7, false),
    ('S004750', 'SL-E-08', 'E', 8, false),
    ('S004751', 'SL-E-09', 'E', 9, false),
    ('S004752', 'SL-E-10', 'E', 10, false),
    ('S004753', 'SL-E-11', 'E', 11, false),
    ('S004754', 'SL-E-12', 'E', 12, false),
    ('S004755', 'SL-E-13', 'E', 13, false),
    ('S004756', 'SL-E-14', 'E', 14, false),
    ('S004757', 'SL-E-15', 'E', 15, false),
    ('S004758', 'SL-E-16', 'E', 16, false),
    ('S004759', 'SL-E-17', 'E', 17, false),
    ('S004760', 'SL-E-18', 'E', 18, false),
    ('S004761', 'SL-E-19', 'E', 19, false),
    ('S004762', 'SL-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004763', 'SL-F-01', 'F', 1, false),
    ('S004764', 'SL-F-02', 'F', 2, false),
    ('S004765', 'SL-F-03', 'F', 3, false),
    ('S004766', 'SL-F-04', 'F', 4, false),
    ('S004767', 'SL-F-05', 'F', 5, false),
    ('S004768', 'SL-F-06', 'F', 6, false),
    ('S004769', 'SL-F-07', 'F', 7, false),
    ('S004770', 'SL-F-08', 'F', 8, false),
    ('S004771', 'SL-F-09', 'F', 9, false),
    ('S004772', 'SL-F-10', 'F', 10, false),
    ('S004773', 'SL-F-11', 'F', 11, false),
    ('S004774', 'SL-F-12', 'F', 12, false),
    ('S004775', 'SL-F-13', 'F', 13, false),
    ('S004776', 'SL-F-14', 'F', 14, false),
    ('S004777', 'SL-F-15', 'F', 15, false),
    ('S004778', 'SL-F-16', 'F', 16, false),
    ('S004779', 'SL-F-17', 'F', 17, false),
    ('S004780', 'SL-F-18', 'F', 18, false),
    ('S004781', 'SL-F-19', 'F', 19, false),
    ('S004782', 'SL-F-20', 'F', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004783', 'SL-G-01', 'G', 1, false),
    ('S004784', 'SL-G-02', 'G', 2, false),
    ('S004785', 'SL-G-03', 'G', 3, false),
    ('S004786', 'SL-G-04', 'G', 4, false),
    ('S004787', 'SL-G-05', 'G', 5, false),
    ('S004788', 'SL-G-06', 'G', 6, false),
    ('S004789', 'SL-G-07', 'G', 7, false),
    ('S004790', 'SL-G-08', 'G', 8, false),
    ('S004791', 'SL-G-09', 'G', 9, false),
    ('S004792', 'SL-G-10', 'G', 10, false),
    ('S004793', 'SL-G-11', 'G', 11, false),
    ('S004794', 'SL-G-12', 'G', 12, false),
    ('S004795', 'SL-G-13', 'G', 13, false),
    ('S004796', 'SL-G-14', 'G', 14, false),
    ('S004797', 'SL-G-15', 'G', 15, false),
    ('S004798', 'SL-G-16', 'G', 16, false),
    ('S004799', 'SL-G-17', 'G', 17, false),
    ('S004800', 'SL-G-18', 'G', 18, false),
    ('S004801', 'SL-G-19', 'G', 19, false),
    ('S004802', 'SL-G-20', 'G', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004803', 'SL-H-01', 'H', 1, false),
    ('S004804', 'SL-H-02', 'H', 2, false),
    ('S004805', 'SL-H-03', 'H', 3, false),
    ('S004806', 'SL-H-04', 'H', 4, false),
    ('S004807', 'SL-H-05', 'H', 5, false),
    ('S004808', 'SL-H-06', 'H', 6, false),
    ('S004809', 'SL-H-07', 'H', 7, false),
    ('S004810', 'SL-H-08', 'H', 8, false),
    ('S004811', 'SL-H-09', 'H', 9, false),
    ('S004812', 'SL-H-10', 'H', 10, false),
    ('S004813', 'SL-H-11', 'H', 11, false),
    ('S004814', 'SL-H-12', 'H', 12, false),
    ('S004815', 'SL-H-13', 'H', 13, false),
    ('S004816', 'SL-H-14', 'H', 14, false),
    ('S004817', 'SL-H-15', 'H', 15, false),
    ('S004818', 'SL-H-16', 'H', 16, false),
    ('S004819', 'SL-H-17', 'H', 17, false),
    ('S004820', 'SL-H-18', 'H', 18, false),
    ('S004821', 'SL-H-19', 'H', 19, false),
    ('S004822', 'SL-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SM (160 seats)
-- Row A (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004823', 'SM-A-01', 'A', 1, false),
    ('S004824', 'SM-A-02', 'A', 2, false),
    ('S004825', 'SM-A-03', 'A', 3, false),
    ('S004826', 'SM-A-04', 'A', 4, false),
    ('S004827', 'SM-A-05', 'A', 5, false),
    ('S004828', 'SM-A-06', 'A', 6, false),
    ('S004829', 'SM-A-07', 'A', 7, false),
    ('S004830', 'SM-A-08', 'A', 8, false),
    ('S004831', 'SM-A-09', 'A', 9, false),
    ('S004832', 'SM-A-10', 'A', 10, false),
    ('S004833', 'SM-A-11', 'A', 11, false),
    ('S004834', 'SM-A-12', 'A', 12, false),
    ('S004835', 'SM-A-13', 'A', 13, false),
    ('S004836', 'SM-A-14', 'A', 14, false),
    ('S004837', 'SM-A-15', 'A', 15, false),
    ('S004838', 'SM-A-16', 'A', 16, false),
    ('S004839', 'SM-A-17', 'A', 17, false),
    ('S004840', 'SM-A-18', 'A', 18, false),
    ('S004841', 'SM-A-19', 'A', 19, false),
    ('S004842', 'SM-A-20', 'A', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004843', 'SM-B-01', 'B', 1, false),
    ('S004844', 'SM-B-02', 'B', 2, false),
    ('S004845', 'SM-B-03', 'B', 3, false),
    ('S004846', 'SM-B-04', 'B', 4, false),
    ('S004847', 'SM-B-05', 'B', 5, false),
    ('S004848', 'SM-B-06', 'B', 6, false),
    ('S004849', 'SM-B-07', 'B', 7, false),
    ('S004850', 'SM-B-08', 'B', 8, false),
    ('S004851', 'SM-B-09', 'B', 9, false),
    ('S004852', 'SM-B-10', 'B', 10, false),
    ('S004853', 'SM-B-11', 'B', 11, false),
    ('S004854', 'SM-B-12', 'B', 12, false),
    ('S004855', 'SM-B-13', 'B', 13, false),
    ('S004856', 'SM-B-14', 'B', 14, false),
    ('S004857', 'SM-B-15', 'B', 15, false),
    ('S004858', 'SM-B-16', 'B', 16, false),
    ('S004859', 'SM-B-17', 'B', 17, false),
    ('S004860', 'SM-B-18', 'B', 18, false),
    ('S004861', 'SM-B-19', 'B', 19, false),
    ('S004862', 'SM-B-20', 'B', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004863', 'SM-C-01', 'C', 1, false),
    ('S004864', 'SM-C-02', 'C', 2, false),
    ('S004865', 'SM-C-03', 'C', 3, false),
    ('S004866', 'SM-C-04', 'C', 4, false),
    ('S004867', 'SM-C-05', 'C', 5, false),
    ('S004868', 'SM-C-06', 'C', 6, false),
    ('S004869', 'SM-C-07', 'C', 7, false),
    ('S004870', 'SM-C-08', 'C', 8, false),
    ('S004871', 'SM-C-09', 'C', 9, false),
    ('S004872', 'SM-C-10', 'C', 10, false),
    ('S004873', 'SM-C-11', 'C', 11, false),
    ('S004874', 'SM-C-12', 'C', 12, false),
    ('S004875', 'SM-C-13', 'C', 13, false),
    ('S004876', 'SM-C-14', 'C', 14, false),
    ('S004877', 'SM-C-15', 'C', 15, false),
    ('S004878', 'SM-C-16', 'C', 16, false),
    ('S004879', 'SM-C-17', 'C', 17, false),
    ('S004880', 'SM-C-18', 'C', 18, false),
    ('S004881', 'SM-C-19', 'C', 19, false),
    ('S004882', 'SM-C-20', 'C', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004883', 'SM-D-01', 'D', 1, false),
    ('S004884', 'SM-D-02', 'D', 2, false),
    ('S004885', 'SM-D-03', 'D', 3, false),
    ('S004886', 'SM-D-04', 'D', 4, false),
    ('S004887', 'SM-D-05', 'D', 5, false),
    ('S004888', 'SM-D-06', 'D', 6, false),
    ('S004889', 'SM-D-07', 'D', 7, false),
    ('S004890', 'SM-D-08', 'D', 8, false),
    ('S004891', 'SM-D-09', 'D', 9, false),
    ('S004892', 'SM-D-10', 'D', 10, false),
    ('S004893', 'SM-D-11', 'D', 11, false),
    ('S004894', 'SM-D-12', 'D', 12, false),
    ('S004895', 'SM-D-13', 'D', 13, false),
    ('S004896', 'SM-D-14', 'D', 14, false),
    ('S004897', 'SM-D-15', 'D', 15, false),
    ('S004898', 'SM-D-16', 'D', 16, false),
    ('S004899', 'SM-D-17', 'D', 17, false),
    ('S004900', 'SM-D-18', 'D', 18, false),
    ('S004901', 'SM-D-19', 'D', 19, false),
    ('S004902', 'SM-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004903', 'SM-E-01', 'E', 1, false),
    ('S004904', 'SM-E-02', 'E', 2, false),
    ('S004905', 'SM-E-03', 'E', 3, false),
    ('S004906', 'SM-E-04', 'E', 4, false),
    ('S004907', 'SM-E-05', 'E', 5, false),
    ('S004908', 'SM-E-06', 'E', 6, false),
    ('S004909', 'SM-E-07', 'E', 7, false),
    ('S004910', 'SM-E-08', 'E', 8, false),
    ('S004911', 'SM-E-09', 'E', 9, false),
    ('S004912', 'SM-E-10', 'E', 10, false),
    ('S004913', 'SM-E-11', 'E', 11, false),
    ('S004914', 'SM-E-12', 'E', 12, false),
    ('S004915', 'SM-E-13', 'E', 13, false),
    ('S004916', 'SM-E-14', 'E', 14, false),
    ('S004917', 'SM-E-15', 'E', 15, false),
    ('S004918', 'SM-E-16', 'E', 16, false),
    ('S004919', 'SM-E-17', 'E', 17, false),
    ('S004920', 'SM-E-18', 'E', 18, false),
    ('S004921', 'SM-E-19', 'E', 19, false),
    ('S004922', 'SM-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004923', 'SM-F-01', 'F', 1, false),
    ('S004924', 'SM-F-02', 'F', 2, false),
    ('S004925', 'SM-F-03', 'F', 3, false),
    ('S004926', 'SM-F-04', 'F', 4, false),
    ('S004927', 'SM-F-05', 'F', 5, false),
    ('S004928', 'SM-F-06', 'F', 6, false),
    ('S004929', 'SM-F-07', 'F', 7, false),
    ('S004930', 'SM-F-08', 'F', 8, false),
    ('S004931', 'SM-F-09', 'F', 9, false),
    ('S004932', 'SM-F-10', 'F', 10, false),
    ('S004933', 'SM-F-11', 'F', 11, false),
    ('S004934', 'SM-F-12', 'F', 12, false),
    ('S004935', 'SM-F-13', 'F', 13, false),
    ('S004936', 'SM-F-14', 'F', 14, false),
    ('S004937', 'SM-F-15', 'F', 15, false),
    ('S004938', 'SM-F-16', 'F', 16, false),
    ('S004939', 'SM-F-17', 'F', 17, false),
    ('S004940', 'SM-F-18', 'F', 18, false),
    ('S004941', 'SM-F-19', 'F', 19, false),
    ('S004942', 'SM-F-20', 'F', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004943', 'SM-G-01', 'G', 1, false),
    ('S004944', 'SM-G-02', 'G', 2, false),
    ('S004945', 'SM-G-03', 'G', 3, false),
    ('S004946', 'SM-G-04', 'G', 4, false),
    ('S004947', 'SM-G-05', 'G', 5, false),
    ('S004948', 'SM-G-06', 'G', 6, false),
    ('S004949', 'SM-G-07', 'G', 7, false),
    ('S004950', 'SM-G-08', 'G', 8, false),
    ('S004951', 'SM-G-09', 'G', 9, false),
    ('S004952', 'SM-G-10', 'G', 10, false),
    ('S004953', 'SM-G-11', 'G', 11, false),
    ('S004954', 'SM-G-12', 'G', 12, false),
    ('S004955', 'SM-G-13', 'G', 13, false),
    ('S004956', 'SM-G-14', 'G', 14, false),
    ('S004957', 'SM-G-15', 'G', 15, false),
    ('S004958', 'SM-G-16', 'G', 16, false),
    ('S004959', 'SM-G-17', 'G', 17, false),
    ('S004960', 'SM-G-18', 'G', 18, false),
    ('S004961', 'SM-G-19', 'G', 19, false),
    ('S004962', 'SM-G-20', 'G', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004963', 'SM-H-01', 'H', 1, false),
    ('S004964', 'SM-H-02', 'H', 2, false),
    ('S004965', 'SM-H-03', 'H', 3, false),
    ('S004966', 'SM-H-04', 'H', 4, false),
    ('S004967', 'SM-H-05', 'H', 5, false),
    ('S004968', 'SM-H-06', 'H', 6, false),
    ('S004969', 'SM-H-07', 'H', 7, false),
    ('S004970', 'SM-H-08', 'H', 8, false),
    ('S004971', 'SM-H-09', 'H', 9, false),
    ('S004972', 'SM-H-10', 'H', 10, false),
    ('S004973', 'SM-H-11', 'H', 11, false),
    ('S004974', 'SM-H-12', 'H', 12, false),
    ('S004975', 'SM-H-13', 'H', 13, false),
    ('S004976', 'SM-H-14', 'H', 14, false),
    ('S004977', 'SM-H-15', 'H', 15, false),
    ('S004978', 'SM-H-16', 'H', 16, false),
    ('S004979', 'SM-H-17', 'H', 17, false),
    ('S004980', 'SM-H-18', 'H', 18, false),
    ('S004981', 'SM-H-19', 'H', 19, false),
    ('S004982', 'SM-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SM'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SN (160 seats)
-- Row A (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S004983', 'SN-A-01', 'A', 1, false),
    ('S004984', 'SN-A-02', 'A', 2, false),
    ('S004985', 'SN-A-03', 'A', 3, false),
    ('S004986', 'SN-A-04', 'A', 4, false),
    ('S004987', 'SN-A-05', 'A', 5, false),
    ('S004988', 'SN-A-06', 'A', 6, false),
    ('S004989', 'SN-A-07', 'A', 7, false),
    ('S004990', 'SN-A-08', 'A', 8, false),
    ('S004991', 'SN-A-09', 'A', 9, false),
    ('S004992', 'SN-A-10', 'A', 10, false),
    ('S004993', 'SN-A-11', 'A', 11, false),
    ('S004994', 'SN-A-12', 'A', 12, false),
    ('S004995', 'SN-A-13', 'A', 13, false),
    ('S004996', 'SN-A-14', 'A', 14, false),
    ('S004997', 'SN-A-15', 'A', 15, false),
    ('S004998', 'SN-A-16', 'A', 16, false),
    ('S004999', 'SN-A-17', 'A', 17, false),
    ('S005000', 'SN-A-18', 'A', 18, false),
    ('S005001', 'SN-A-19', 'A', 19, false),
    ('S005002', 'SN-A-20', 'A', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005003', 'SN-B-01', 'B', 1, false),
    ('S005004', 'SN-B-02', 'B', 2, false),
    ('S005005', 'SN-B-03', 'B', 3, false),
    ('S005006', 'SN-B-04', 'B', 4, false),
    ('S005007', 'SN-B-05', 'B', 5, false),
    ('S005008', 'SN-B-06', 'B', 6, false),
    ('S005009', 'SN-B-07', 'B', 7, false),
    ('S005010', 'SN-B-08', 'B', 8, false),
    ('S005011', 'SN-B-09', 'B', 9, false),
    ('S005012', 'SN-B-10', 'B', 10, false),
    ('S005013', 'SN-B-11', 'B', 11, false),
    ('S005014', 'SN-B-12', 'B', 12, false),
    ('S005015', 'SN-B-13', 'B', 13, false),
    ('S005016', 'SN-B-14', 'B', 14, false),
    ('S005017', 'SN-B-15', 'B', 15, false),
    ('S005018', 'SN-B-16', 'B', 16, false),
    ('S005019', 'SN-B-17', 'B', 17, false),
    ('S005020', 'SN-B-18', 'B', 18, false),
    ('S005021', 'SN-B-19', 'B', 19, false),
    ('S005022', 'SN-B-20', 'B', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005023', 'SN-C-01', 'C', 1, false),
    ('S005024', 'SN-C-02', 'C', 2, false),
    ('S005025', 'SN-C-03', 'C', 3, false),
    ('S005026', 'SN-C-04', 'C', 4, false),
    ('S005027', 'SN-C-05', 'C', 5, false),
    ('S005028', 'SN-C-06', 'C', 6, false),
    ('S005029', 'SN-C-07', 'C', 7, false),
    ('S005030', 'SN-C-08', 'C', 8, false),
    ('S005031', 'SN-C-09', 'C', 9, false),
    ('S005032', 'SN-C-10', 'C', 10, false),
    ('S005033', 'SN-C-11', 'C', 11, false),
    ('S005034', 'SN-C-12', 'C', 12, false),
    ('S005035', 'SN-C-13', 'C', 13, false),
    ('S005036', 'SN-C-14', 'C', 14, false),
    ('S005037', 'SN-C-15', 'C', 15, false),
    ('S005038', 'SN-C-16', 'C', 16, false),
    ('S005039', 'SN-C-17', 'C', 17, false),
    ('S005040', 'SN-C-18', 'C', 18, false),
    ('S005041', 'SN-C-19', 'C', 19, false),
    ('S005042', 'SN-C-20', 'C', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005043', 'SN-D-01', 'D', 1, false),
    ('S005044', 'SN-D-02', 'D', 2, false),
    ('S005045', 'SN-D-03', 'D', 3, false),
    ('S005046', 'SN-D-04', 'D', 4, false),
    ('S005047', 'SN-D-05', 'D', 5, false),
    ('S005048', 'SN-D-06', 'D', 6, false),
    ('S005049', 'SN-D-07', 'D', 7, false),
    ('S005050', 'SN-D-08', 'D', 8, false),
    ('S005051', 'SN-D-09', 'D', 9, false),
    ('S005052', 'SN-D-10', 'D', 10, false),
    ('S005053', 'SN-D-11', 'D', 11, false),
    ('S005054', 'SN-D-12', 'D', 12, false),
    ('S005055', 'SN-D-13', 'D', 13, false),
    ('S005056', 'SN-D-14', 'D', 14, false),
    ('S005057', 'SN-D-15', 'D', 15, false),
    ('S005058', 'SN-D-16', 'D', 16, false),
    ('S005059', 'SN-D-17', 'D', 17, false),
    ('S005060', 'SN-D-18', 'D', 18, false),
    ('S005061', 'SN-D-19', 'D', 19, false),
    ('S005062', 'SN-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005063', 'SN-E-01', 'E', 1, false),
    ('S005064', 'SN-E-02', 'E', 2, false),
    ('S005065', 'SN-E-03', 'E', 3, false),
    ('S005066', 'SN-E-04', 'E', 4, false),
    ('S005067', 'SN-E-05', 'E', 5, false),
    ('S005068', 'SN-E-06', 'E', 6, false),
    ('S005069', 'SN-E-07', 'E', 7, false),
    ('S005070', 'SN-E-08', 'E', 8, false),
    ('S005071', 'SN-E-09', 'E', 9, false),
    ('S005072', 'SN-E-10', 'E', 10, false),
    ('S005073', 'SN-E-11', 'E', 11, false),
    ('S005074', 'SN-E-12', 'E', 12, false),
    ('S005075', 'SN-E-13', 'E', 13, false),
    ('S005076', 'SN-E-14', 'E', 14, false),
    ('S005077', 'SN-E-15', 'E', 15, false),
    ('S005078', 'SN-E-16', 'E', 16, false),
    ('S005079', 'SN-E-17', 'E', 17, false),
    ('S005080', 'SN-E-18', 'E', 18, false),
    ('S005081', 'SN-E-19', 'E', 19, false),
    ('S005082', 'SN-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005083', 'SN-F-01', 'F', 1, false),
    ('S005084', 'SN-F-02', 'F', 2, false),
    ('S005085', 'SN-F-03', 'F', 3, false),
    ('S005086', 'SN-F-04', 'F', 4, false),
    ('S005087', 'SN-F-05', 'F', 5, false),
    ('S005088', 'SN-F-06', 'F', 6, false),
    ('S005089', 'SN-F-07', 'F', 7, false),
    ('S005090', 'SN-F-08', 'F', 8, false),
    ('S005091', 'SN-F-09', 'F', 9, false),
    ('S005092', 'SN-F-10', 'F', 10, false),
    ('S005093', 'SN-F-11', 'F', 11, false),
    ('S005094', 'SN-F-12', 'F', 12, false),
    ('S005095', 'SN-F-13', 'F', 13, false),
    ('S005096', 'SN-F-14', 'F', 14, false),
    ('S005097', 'SN-F-15', 'F', 15, false),
    ('S005098', 'SN-F-16', 'F', 16, false),
    ('S005099', 'SN-F-17', 'F', 17, false),
    ('S005100', 'SN-F-18', 'F', 18, false),
    ('S005101', 'SN-F-19', 'F', 19, false),
    ('S005102', 'SN-F-20', 'F', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005103', 'SN-G-01', 'G', 1, false),
    ('S005104', 'SN-G-02', 'G', 2, false),
    ('S005105', 'SN-G-03', 'G', 3, false),
    ('S005106', 'SN-G-04', 'G', 4, false),
    ('S005107', 'SN-G-05', 'G', 5, false),
    ('S005108', 'SN-G-06', 'G', 6, false),
    ('S005109', 'SN-G-07', 'G', 7, false),
    ('S005110', 'SN-G-08', 'G', 8, false),
    ('S005111', 'SN-G-09', 'G', 9, false),
    ('S005112', 'SN-G-10', 'G', 10, false),
    ('S005113', 'SN-G-11', 'G', 11, false),
    ('S005114', 'SN-G-12', 'G', 12, false),
    ('S005115', 'SN-G-13', 'G', 13, false),
    ('S005116', 'SN-G-14', 'G', 14, false),
    ('S005117', 'SN-G-15', 'G', 15, false),
    ('S005118', 'SN-G-16', 'G', 16, false),
    ('S005119', 'SN-G-17', 'G', 17, false),
    ('S005120', 'SN-G-18', 'G', 18, false),
    ('S005121', 'SN-G-19', 'G', 19, false),
    ('S005122', 'SN-G-20', 'G', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005123', 'SN-H-01', 'H', 1, false),
    ('S005124', 'SN-H-02', 'H', 2, false),
    ('S005125', 'SN-H-03', 'H', 3, false),
    ('S005126', 'SN-H-04', 'H', 4, false),
    ('S005127', 'SN-H-05', 'H', 5, false),
    ('S005128', 'SN-H-06', 'H', 6, false),
    ('S005129', 'SN-H-07', 'H', 7, false),
    ('S005130', 'SN-H-08', 'H', 8, false),
    ('S005131', 'SN-H-09', 'H', 9, false),
    ('S005132', 'SN-H-10', 'H', 10, false),
    ('S005133', 'SN-H-11', 'H', 11, false),
    ('S005134', 'SN-H-12', 'H', 12, false),
    ('S005135', 'SN-H-13', 'H', 13, false),
    ('S005136', 'SN-H-14', 'H', 14, false),
    ('S005137', 'SN-H-15', 'H', 15, false),
    ('S005138', 'SN-H-16', 'H', 16, false),
    ('S005139', 'SN-H-17', 'H', 17, false),
    ('S005140', 'SN-H-18', 'H', 18, false),
    ('S005141', 'SN-H-19', 'H', 19, false),
    ('S005142', 'SN-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SN'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE B (297 seats)
-- Row A (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005143', 'B-A-01', 'A', 1, false),
    ('S005144', 'B-A-02', 'A', 2, false),
    ('S005145', 'B-A-03', 'A', 3, false),
    ('S005146', 'B-A-04', 'A', 4, false),
    ('S005147', 'B-A-05', 'A', 5, false),
    ('S005148', 'B-A-06', 'A', 6, false),
    ('S005149', 'B-A-07', 'A', 7, false),
    ('S005150', 'B-A-08', 'A', 8, false),
    ('S005151', 'B-A-09', 'A', 9, false),
    ('S005152', 'B-A-10', 'A', 10, false),
    ('S005153', 'B-A-11', 'A', 11, false),
    ('S005154', 'B-A-12', 'A', 12, false),
    ('S005155', 'B-A-13', 'A', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005156', 'B-AA-01', 'AA', 1, false),
    ('S005157', 'B-AA-02', 'AA', 2, false),
    ('S005158', 'B-AA-03', 'AA', 3, false),
    ('S005159', 'B-AA-04', 'AA', 4, false),
    ('S005160', 'B-AA-05', 'AA', 5, false),
    ('S005161', 'B-AA-06', 'AA', 6, false),
    ('S005162', 'B-AA-07', 'AA', 7, false),
    ('S005163', 'B-AA-08', 'AA', 8, false),
    ('S005164', 'B-AA-09', 'AA', 9, false),
    ('S005165', 'B-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005166', 'B-B-01', 'B', 1, false),
    ('S005167', 'B-B-02', 'B', 2, false),
    ('S005168', 'B-B-03', 'B', 3, false),
    ('S005169', 'B-B-04', 'B', 4, false),
    ('S005170', 'B-B-05', 'B', 5, false),
    ('S005171', 'B-B-06', 'B', 6, false),
    ('S005172', 'B-B-07', 'B', 7, false),
    ('S005173', 'B-B-08', 'B', 8, false),
    ('S005174', 'B-B-09', 'B', 9, false),
    ('S005175', 'B-B-10', 'B', 10, false),
    ('S005176', 'B-B-11', 'B', 11, false),
    ('S005177', 'B-B-12', 'B', 12, false),
    ('S005178', 'B-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005179', 'B-C-01', 'C', 1, false),
    ('S005180', 'B-C-02', 'C', 2, false),
    ('S005181', 'B-C-03', 'C', 3, false),
    ('S005182', 'B-C-04', 'C', 4, false),
    ('S005183', 'B-C-05', 'C', 5, false),
    ('S005184', 'B-C-06', 'C', 6, false),
    ('S005185', 'B-C-07', 'C', 7, false),
    ('S005186', 'B-C-08', 'C', 8, false),
    ('S005187', 'B-C-09', 'C', 9, false),
    ('S005188', 'B-C-10', 'C', 10, false),
    ('S005189', 'B-C-11', 'C', 11, false),
    ('S005190', 'B-C-12', 'C', 12, false),
    ('S005191', 'B-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005192', 'B-D-01', 'D', 1, false),
    ('S005193', 'B-D-02', 'D', 2, false),
    ('S005194', 'B-D-03', 'D', 3, false),
    ('S005195', 'B-D-04', 'D', 4, false),
    ('S005196', 'B-D-05', 'D', 5, false),
    ('S005197', 'B-D-06', 'D', 6, false),
    ('S005198', 'B-D-07', 'D', 7, false),
    ('S005199', 'B-D-08', 'D', 8, false),
    ('S005200', 'B-D-09', 'D', 9, false),
    ('S005201', 'B-D-10', 'D', 10, false),
    ('S005202', 'B-D-11', 'D', 11, false),
    ('S005203', 'B-D-12', 'D', 12, false),
    ('S005204', 'B-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005205', 'B-E-01', 'E', 1, false),
    ('S005206', 'B-E-02', 'E', 2, false),
    ('S005207', 'B-E-03', 'E', 3, false),
    ('S005208', 'B-E-04', 'E', 4, false),
    ('S005209', 'B-E-05', 'E', 5, false),
    ('S005210', 'B-E-06', 'E', 6, false),
    ('S005211', 'B-E-07', 'E', 7, false),
    ('S005212', 'B-E-08', 'E', 8, false),
    ('S005213', 'B-E-09', 'E', 9, false),
    ('S005214', 'B-E-10', 'E', 10, false),
    ('S005215', 'B-E-11', 'E', 11, false),
    ('S005216', 'B-E-12', 'E', 12, false),
    ('S005217', 'B-E-13', 'E', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005218', 'B-F-01', 'F', 1, false),
    ('S005219', 'B-F-02', 'F', 2, false),
    ('S005220', 'B-F-03', 'F', 3, false),
    ('S005221', 'B-F-04', 'F', 4, false),
    ('S005222', 'B-F-05', 'F', 5, false),
    ('S005223', 'B-F-06', 'F', 6, false),
    ('S005224', 'B-F-07', 'F', 7, false),
    ('S005225', 'B-F-08', 'F', 8, false),
    ('S005226', 'B-F-09', 'F', 9, false),
    ('S005227', 'B-F-10', 'F', 10, false),
    ('S005228', 'B-F-11', 'F', 11, false),
    ('S005229', 'B-F-12', 'F', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005230', 'B-G-01', 'G', 1, false),
    ('S005231', 'B-G-02', 'G', 2, false),
    ('S005232', 'B-G-03', 'G', 3, false),
    ('S005233', 'B-G-04', 'G', 4, false),
    ('S005234', 'B-G-05', 'G', 5, false),
    ('S005235', 'B-G-06', 'G', 6, false),
    ('S005236', 'B-G-07', 'G', 7, false),
    ('S005237', 'B-G-08', 'G', 8, false),
    ('S005238', 'B-G-09', 'G', 9, false),
    ('S005239', 'B-G-10', 'G', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005240', 'B-H-01', 'H', 1, false),
    ('S005241', 'B-H-02', 'H', 2, false),
    ('S005242', 'B-H-03', 'H', 3, false),
    ('S005243', 'B-H-04', 'H', 4, false),
    ('S005244', 'B-H-05', 'H', 5, false),
    ('S005245', 'B-H-06', 'H', 6, false),
    ('S005246', 'B-H-07', 'H', 7, false),
    ('S005247', 'B-H-08', 'H', 8, false),
    ('S005248', 'B-H-09', 'H', 9, false),
    ('S005249', 'B-H-10', 'H', 10, false),
    ('S005250', 'B-H-11', 'H', 11, false),
    ('S005251', 'B-H-12', 'H', 12, false),
    ('S005252', 'B-H-13', 'H', 13, false),
    ('S005253', 'B-H-14', 'H', 14, false),
    ('S005254', 'B-H-15', 'H', 15, false),
    ('S005255', 'B-H-16', 'H', 16, false),
    ('S005256', 'B-H-17', 'H', 17, false),
    ('S005257', 'B-H-18', 'H', 18, false),
    ('S005258', 'B-H-19', 'H', 19, false),
    ('S005259', 'B-H-20', 'H', 20, false),
    ('S005260', 'B-H-198', 'H', 198, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005261', 'B-I-01', 'I', 1, false),
    ('S005262', 'B-I-02', 'I', 2, false),
    ('S005263', 'B-I-03', 'I', 3, false),
    ('S005264', 'B-I-04', 'I', 4, false),
    ('S005265', 'B-I-05', 'I', 5, false),
    ('S005266', 'B-I-06', 'I', 6, false),
    ('S005267', 'B-I-07', 'I', 7, false),
    ('S005268', 'B-I-08', 'I', 8, false),
    ('S005269', 'B-I-09', 'I', 9, false),
    ('S005270', 'B-I-10', 'I', 10, false),
    ('S005271', 'B-I-11', 'I', 11, false),
    ('S005272', 'B-I-12', 'I', 12, false),
    ('S005273', 'B-I-13', 'I', 13, false),
    ('S005274', 'B-I-14', 'I', 14, false),
    ('S005275', 'B-I-15', 'I', 15, false),
    ('S005276', 'B-I-16', 'I', 16, false),
    ('S005277', 'B-I-17', 'I', 17, false),
    ('S005278', 'B-I-18', 'I', 18, false),
    ('S005279', 'B-I-19', 'I', 19, false),
    ('S005280', 'B-I-20', 'I', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005281', 'B-J-01', 'J', 1, false),
    ('S005282', 'B-J-02', 'J', 2, false),
    ('S005283', 'B-J-03', 'J', 3, false),
    ('S005284', 'B-J-04', 'J', 4, false),
    ('S005285', 'B-J-05', 'J', 5, false),
    ('S005286', 'B-J-06', 'J', 6, false),
    ('S005287', 'B-J-07', 'J', 7, false),
    ('S005288', 'B-J-08', 'J', 8, false),
    ('S005289', 'B-J-09', 'J', 9, false),
    ('S005290', 'B-J-10', 'J', 10, false),
    ('S005291', 'B-J-11', 'J', 11, false),
    ('S005292', 'B-J-12', 'J', 12, false),
    ('S005293', 'B-J-13', 'J', 13, false),
    ('S005294', 'B-J-14', 'J', 14, false),
    ('S005295', 'B-J-15', 'J', 15, false),
    ('S005296', 'B-J-16', 'J', 16, false),
    ('S005297', 'B-J-17', 'J', 17, false),
    ('S005298', 'B-J-18', 'J', 18, false),
    ('S005299', 'B-J-19', 'J', 19, false),
    ('S005300', 'B-J-20', 'J', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005301', 'B-K-01', 'K', 1, false),
    ('S005302', 'B-K-02', 'K', 2, false),
    ('S005303', 'B-K-03', 'K', 3, false),
    ('S005304', 'B-K-04', 'K', 4, false),
    ('S005305', 'B-K-05', 'K', 5, false),
    ('S005306', 'B-K-06', 'K', 6, false),
    ('S005307', 'B-K-07', 'K', 7, false),
    ('S005308', 'B-K-08', 'K', 8, false),
    ('S005309', 'B-K-09', 'K', 9, false),
    ('S005310', 'B-K-10', 'K', 10, false),
    ('S005311', 'B-K-11', 'K', 11, false),
    ('S005312', 'B-K-12', 'K', 12, false),
    ('S005313', 'B-K-13', 'K', 13, false),
    ('S005314', 'B-K-14', 'K', 14, false),
    ('S005315', 'B-K-15', 'K', 15, false),
    ('S005316', 'B-K-16', 'K', 16, false),
    ('S005317', 'B-K-17', 'K', 17, false),
    ('S005318', 'B-K-18', 'K', 18, false),
    ('S005319', 'B-K-19', 'K', 19, false),
    ('S005320', 'B-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005321', 'B-L-01', 'L', 1, false),
    ('S005322', 'B-L-02', 'L', 2, false),
    ('S005323', 'B-L-03', 'L', 3, false),
    ('S005324', 'B-L-04', 'L', 4, false),
    ('S005325', 'B-L-05', 'L', 5, false),
    ('S005326', 'B-L-06', 'L', 6, false),
    ('S005327', 'B-L-07', 'L', 7, false),
    ('S005328', 'B-L-08', 'L', 8, false),
    ('S005329', 'B-L-09', 'L', 9, false),
    ('S005330', 'B-L-10', 'L', 10, false),
    ('S005331', 'B-L-11', 'L', 11, false),
    ('S005332', 'B-L-12', 'L', 12, false),
    ('S005333', 'B-L-13', 'L', 13, false),
    ('S005334', 'B-L-14', 'L', 14, false),
    ('S005335', 'B-L-15', 'L', 15, false),
    ('S005336', 'B-L-16', 'L', 16, false),
    ('S005337', 'B-L-17', 'L', 17, false),
    ('S005338', 'B-L-18', 'L', 18, false),
    ('S005339', 'B-L-19', 'L', 19, false),
    ('S005340', 'B-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005341', 'B-M-01', 'M', 1, false),
    ('S005342', 'B-M-02', 'M', 2, false),
    ('S005343', 'B-M-03', 'M', 3, false),
    ('S005344', 'B-M-04', 'M', 4, false),
    ('S005345', 'B-M-05', 'M', 5, false),
    ('S005346', 'B-M-06', 'M', 6, false),
    ('S005347', 'B-M-07', 'M', 7, false),
    ('S005348', 'B-M-08', 'M', 8, false),
    ('S005349', 'B-M-09', 'M', 9, false),
    ('S005350', 'B-M-10', 'M', 10, false),
    ('S005351', 'B-M-11', 'M', 11, false),
    ('S005352', 'B-M-12', 'M', 12, false),
    ('S005353', 'B-M-13', 'M', 13, false),
    ('S005354', 'B-M-14', 'M', 14, false),
    ('S005355', 'B-M-15', 'M', 15, false),
    ('S005356', 'B-M-16', 'M', 16, false),
    ('S005357', 'B-M-17', 'M', 17, false),
    ('S005358', 'B-M-18', 'M', 18, false),
    ('S005359', 'B-M-19', 'M', 19, false),
    ('S005360', 'B-M-20', 'M', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005361', 'B-N-01', 'N', 1, false),
    ('S005362', 'B-N-02', 'N', 2, false),
    ('S005363', 'B-N-03', 'N', 3, false),
    ('S005364', 'B-N-04', 'N', 4, false),
    ('S005365', 'B-N-05', 'N', 5, false),
    ('S005366', 'B-N-06', 'N', 6, false),
    ('S005367', 'B-N-07', 'N', 7, false),
    ('S005368', 'B-N-08', 'N', 8, false),
    ('S005369', 'B-N-09', 'N', 9, false),
    ('S005370', 'B-N-10', 'N', 10, false),
    ('S005371', 'B-N-11', 'N', 11, false),
    ('S005372', 'B-N-12', 'N', 12, false),
    ('S005373', 'B-N-13', 'N', 13, false),
    ('S005374', 'B-N-14', 'N', 14, false),
    ('S005375', 'B-N-15', 'N', 15, false),
    ('S005376', 'B-N-16', 'N', 16, false),
    ('S005377', 'B-N-17', 'N', 17, false),
    ('S005378', 'B-N-18', 'N', 18, false),
    ('S005379', 'B-N-19', 'N', 19, false),
    ('S005380', 'B-N-20', 'N', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005381', 'B-O-01', 'O', 1, false),
    ('S005382', 'B-O-02', 'O', 2, false),
    ('S005383', 'B-O-03', 'O', 3, false),
    ('S005384', 'B-O-04', 'O', 4, false),
    ('S005385', 'B-O-05', 'O', 5, false),
    ('S005386', 'B-O-06', 'O', 6, false),
    ('S005387', 'B-O-07', 'O', 7, false),
    ('S005388', 'B-O-08', 'O', 8, false),
    ('S005389', 'B-O-09', 'O', 9, false),
    ('S005390', 'B-O-10', 'O', 10, false),
    ('S005391', 'B-O-11', 'O', 11, false),
    ('S005392', 'B-O-12', 'O', 12, false),
    ('S005393', 'B-O-13', 'O', 13, false),
    ('S005394', 'B-O-14', 'O', 14, false),
    ('S005395', 'B-O-15', 'O', 15, false),
    ('S005396', 'B-O-16', 'O', 16, false),
    ('S005397', 'B-O-17', 'O', 17, false),
    ('S005398', 'B-O-18', 'O', 18, false),
    ('S005399', 'B-O-19', 'O', 19, false),
    ('S005400', 'B-O-20', 'O', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005401', 'B-P-01', 'P', 1, false),
    ('S005402', 'B-P-02', 'P', 2, false),
    ('S005403', 'B-P-03', 'P', 3, false),
    ('S005404', 'B-P-04', 'P', 4, false),
    ('S005405', 'B-P-05', 'P', 5, false),
    ('S005406', 'B-P-06', 'P', 6, false),
    ('S005407', 'B-P-07', 'P', 7, false),
    ('S005408', 'B-P-08', 'P', 8, false),
    ('S005409', 'B-P-09', 'P', 9, false),
    ('S005410', 'B-P-10', 'P', 10, false),
    ('S005411', 'B-P-11', 'P', 11, false),
    ('S005412', 'B-P-12', 'P', 12, false),
    ('S005413', 'B-P-13', 'P', 13, false),
    ('S005414', 'B-P-14', 'P', 14, false),
    ('S005415', 'B-P-15', 'P', 15, false),
    ('S005416', 'B-P-16', 'P', 16, false),
    ('S005417', 'B-P-17', 'P', 17, false),
    ('S005418', 'B-P-18', 'P', 18, false),
    ('S005419', 'B-P-19', 'P', 19, false),
    ('S005420', 'B-P-20', 'P', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005421', 'B-Q-01', 'Q', 1, false),
    ('S005422', 'B-Q-02', 'Q', 2, false),
    ('S005423', 'B-Q-03', 'Q', 3, false),
    ('S005424', 'B-Q-04', 'Q', 4, false),
    ('S005425', 'B-Q-05', 'Q', 5, false),
    ('S005426', 'B-Q-06', 'Q', 6, false),
    ('S005427', 'B-Q-07', 'Q', 7, false),
    ('S005428', 'B-Q-08', 'Q', 8, false),
    ('S005429', 'B-Q-09', 'Q', 9, false),
    ('S005430', 'B-Q-10', 'Q', 10, false),
    ('S005431', 'B-Q-11', 'Q', 11, false),
    ('S005432', 'B-Q-12', 'Q', 12, false),
    ('S005433', 'B-Q-13', 'Q', 13, false),
    ('S005434', 'B-Q-14', 'Q', 14, false),
    ('S005435', 'B-Q-15', 'Q', 15, false),
    ('S005436', 'B-Q-16', 'Q', 16, false),
    ('S005437', 'B-Q-17', 'Q', 17, false),
    ('S005438', 'B-Q-18', 'Q', 18, false),
    ('S005439', 'B-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE C (297 seats)
-- Row A (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005440', 'C-A-01', 'A', 1, false),
    ('S005441', 'C-A-02', 'A', 2, false),
    ('S005442', 'C-A-03', 'A', 3, false),
    ('S005443', 'C-A-04', 'A', 4, false),
    ('S005444', 'C-A-05', 'A', 5, false),
    ('S005445', 'C-A-06', 'A', 6, false),
    ('S005446', 'C-A-07', 'A', 7, false),
    ('S005447', 'C-A-08', 'A', 8, false),
    ('S005448', 'C-A-09', 'A', 9, false),
    ('S005449', 'C-A-10', 'A', 10, false),
    ('S005450', 'C-A-11', 'A', 11, false),
    ('S005451', 'C-A-12', 'A', 12, false),
    ('S005452', 'C-A-13', 'A', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005453', 'C-AA-01', 'AA', 1, false),
    ('S005454', 'C-AA-02', 'AA', 2, false),
    ('S005455', 'C-AA-03', 'AA', 3, false),
    ('S005456', 'C-AA-04', 'AA', 4, false),
    ('S005457', 'C-AA-05', 'AA', 5, false),
    ('S005458', 'C-AA-06', 'AA', 6, false),
    ('S005459', 'C-AA-07', 'AA', 7, false),
    ('S005460', 'C-AA-08', 'AA', 8, false),
    ('S005461', 'C-AA-09', 'AA', 9, false),
    ('S005462', 'C-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005463', 'C-B-01', 'B', 1, false),
    ('S005464', 'C-B-02', 'B', 2, false),
    ('S005465', 'C-B-03', 'B', 3, false),
    ('S005466', 'C-B-04', 'B', 4, false),
    ('S005467', 'C-B-05', 'B', 5, false),
    ('S005468', 'C-B-06', 'B', 6, false),
    ('S005469', 'C-B-07', 'B', 7, false),
    ('S005470', 'C-B-08', 'B', 8, false),
    ('S005471', 'C-B-09', 'B', 9, false),
    ('S005472', 'C-B-10', 'B', 10, false),
    ('S005473', 'C-B-11', 'B', 11, false),
    ('S005474', 'C-B-12', 'B', 12, false),
    ('S005475', 'C-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005476', 'C-C-01', 'C', 1, false),
    ('S005477', 'C-C-02', 'C', 2, false),
    ('S005478', 'C-C-03', 'C', 3, false),
    ('S005479', 'C-C-04', 'C', 4, false),
    ('S005480', 'C-C-05', 'C', 5, false),
    ('S005481', 'C-C-06', 'C', 6, false),
    ('S005482', 'C-C-07', 'C', 7, false),
    ('S005483', 'C-C-08', 'C', 8, false),
    ('S005484', 'C-C-09', 'C', 9, false),
    ('S005485', 'C-C-10', 'C', 10, false),
    ('S005486', 'C-C-11', 'C', 11, false),
    ('S005487', 'C-C-12', 'C', 12, false),
    ('S005488', 'C-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005489', 'C-D-01', 'D', 1, false),
    ('S005490', 'C-D-02', 'D', 2, false),
    ('S005491', 'C-D-03', 'D', 3, false),
    ('S005492', 'C-D-04', 'D', 4, false),
    ('S005493', 'C-D-05', 'D', 5, false),
    ('S005494', 'C-D-06', 'D', 6, false),
    ('S005495', 'C-D-07', 'D', 7, false),
    ('S005496', 'C-D-08', 'D', 8, false),
    ('S005497', 'C-D-09', 'D', 9, false),
    ('S005498', 'C-D-10', 'D', 10, false),
    ('S005499', 'C-D-11', 'D', 11, false),
    ('S005500', 'C-D-12', 'D', 12, false),
    ('S005501', 'C-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005502', 'C-E-01', 'E', 1, false),
    ('S005503', 'C-E-02', 'E', 2, false),
    ('S005504', 'C-E-03', 'E', 3, false),
    ('S005505', 'C-E-04', 'E', 4, false),
    ('S005506', 'C-E-05', 'E', 5, false),
    ('S005507', 'C-E-06', 'E', 6, false),
    ('S005508', 'C-E-07', 'E', 7, false),
    ('S005509', 'C-E-08', 'E', 8, false),
    ('S005510', 'C-E-09', 'E', 9, false),
    ('S005511', 'C-E-10', 'E', 10, false),
    ('S005512', 'C-E-11', 'E', 11, false),
    ('S005513', 'C-E-12', 'E', 12, false),
    ('S005514', 'C-E-13', 'E', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005515', 'C-F-01', 'F', 1, false),
    ('S005516', 'C-F-02', 'F', 2, false),
    ('S005517', 'C-F-03', 'F', 3, false),
    ('S005518', 'C-F-04', 'F', 4, false),
    ('S005519', 'C-F-05', 'F', 5, false),
    ('S005520', 'C-F-06', 'F', 6, false),
    ('S005521', 'C-F-07', 'F', 7, false),
    ('S005522', 'C-F-08', 'F', 8, false),
    ('S005523', 'C-F-09', 'F', 9, false),
    ('S005524', 'C-F-10', 'F', 10, false),
    ('S005525', 'C-F-11', 'F', 11, false),
    ('S005526', 'C-F-12', 'F', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005527', 'C-G-01', 'G', 1, false),
    ('S005528', 'C-G-02', 'G', 2, false),
    ('S005529', 'C-G-03', 'G', 3, false),
    ('S005530', 'C-G-04', 'G', 4, false),
    ('S005531', 'C-G-05', 'G', 5, false),
    ('S005532', 'C-G-06', 'G', 6, false),
    ('S005533', 'C-G-07', 'G', 7, false),
    ('S005534', 'C-G-08', 'G', 8, false),
    ('S005535', 'C-G-09', 'G', 9, false),
    ('S005536', 'C-G-10', 'G', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005537', 'C-H-01', 'H', 1, false),
    ('S005538', 'C-H-02', 'H', 2, false),
    ('S005539', 'C-H-03', 'H', 3, false),
    ('S005540', 'C-H-04', 'H', 4, false),
    ('S005541', 'C-H-05', 'H', 5, false),
    ('S005542', 'C-H-06', 'H', 6, false),
    ('S005543', 'C-H-07', 'H', 7, false),
    ('S005544', 'C-H-08', 'H', 8, false),
    ('S005545', 'C-H-09', 'H', 9, false),
    ('S005546', 'C-H-10', 'H', 10, false),
    ('S005547', 'C-H-11', 'H', 11, false),
    ('S005548', 'C-H-12', 'H', 12, false),
    ('S005549', 'C-H-13', 'H', 13, false),
    ('S005550', 'C-H-14', 'H', 14, false),
    ('S005551', 'C-H-15', 'H', 15, false),
    ('S005552', 'C-H-16', 'H', 16, false),
    ('S005553', 'C-H-17', 'H', 17, false),
    ('S005554', 'C-H-18', 'H', 18, false),
    ('S005555', 'C-H-19', 'H', 19, false),
    ('S005556', 'C-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005557', 'C-I-01', 'I', 1, false),
    ('S005558', 'C-I-02', 'I', 2, false),
    ('S005559', 'C-I-03', 'I', 3, false),
    ('S005560', 'C-I-04', 'I', 4, false),
    ('S005561', 'C-I-05', 'I', 5, false),
    ('S005562', 'C-I-06', 'I', 6, false),
    ('S005563', 'C-I-07', 'I', 7, false),
    ('S005564', 'C-I-08', 'I', 8, false),
    ('S005565', 'C-I-09', 'I', 9, false),
    ('S005566', 'C-I-10', 'I', 10, false),
    ('S005567', 'C-I-11', 'I', 11, false),
    ('S005568', 'C-I-12', 'I', 12, false),
    ('S005569', 'C-I-13', 'I', 13, false),
    ('S005570', 'C-I-14', 'I', 14, false),
    ('S005571', 'C-I-15', 'I', 15, false),
    ('S005572', 'C-I-16', 'I', 16, false),
    ('S005573', 'C-I-17', 'I', 17, false),
    ('S005574', 'C-I-18', 'I', 18, false),
    ('S005575', 'C-I-19', 'I', 19, false),
    ('S005576', 'C-I-20', 'I', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005577', 'C-J-01', 'J', 1, false),
    ('S005578', 'C-J-02', 'J', 2, false),
    ('S005579', 'C-J-03', 'J', 3, false),
    ('S005580', 'C-J-04', 'J', 4, false),
    ('S005581', 'C-J-05', 'J', 5, false),
    ('S005582', 'C-J-06', 'J', 6, false),
    ('S005583', 'C-J-07', 'J', 7, false),
    ('S005584', 'C-J-08', 'J', 8, false),
    ('S005585', 'C-J-09', 'J', 9, false),
    ('S005586', 'C-J-10', 'J', 10, false),
    ('S005587', 'C-J-11', 'J', 11, false),
    ('S005588', 'C-J-12', 'J', 12, false),
    ('S005589', 'C-J-13', 'J', 13, false),
    ('S005590', 'C-J-14', 'J', 14, false),
    ('S005591', 'C-J-15', 'J', 15, false),
    ('S005592', 'C-J-16', 'J', 16, false),
    ('S005593', 'C-J-17', 'J', 17, false),
    ('S005594', 'C-J-18', 'J', 18, false),
    ('S005595', 'C-J-19', 'J', 19, false),
    ('S005596', 'C-J-20', 'J', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005597', 'C-K-01', 'K', 1, false),
    ('S005598', 'C-K-02', 'K', 2, false),
    ('S005599', 'C-K-03', 'K', 3, false),
    ('S005600', 'C-K-04', 'K', 4, false),
    ('S005601', 'C-K-05', 'K', 5, false),
    ('S005602', 'C-K-06', 'K', 6, false),
    ('S005603', 'C-K-07', 'K', 7, false),
    ('S005604', 'C-K-08', 'K', 8, false),
    ('S005605', 'C-K-09', 'K', 9, false),
    ('S005606', 'C-K-10', 'K', 10, false),
    ('S005607', 'C-K-11', 'K', 11, false),
    ('S005608', 'C-K-12', 'K', 12, false),
    ('S005609', 'C-K-13', 'K', 13, false),
    ('S005610', 'C-K-14', 'K', 14, false),
    ('S005611', 'C-K-15', 'K', 15, false),
    ('S005612', 'C-K-16', 'K', 16, false),
    ('S005613', 'C-K-17', 'K', 17, false),
    ('S005614', 'C-K-18', 'K', 18, false),
    ('S005615', 'C-K-19', 'K', 19, false),
    ('S005616', 'C-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE C'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S005617', 'C-L-01', 'L', 1, false),
    ('S005618', 'C-L-02', 'L', 2, false),
    ('S005619', 'C-L-03', 'L', 3, false),
    ('S005620', 'C-L-04', 'L', 4, false),
    ('S005621', 'C-L-05', 'L', 5, false),