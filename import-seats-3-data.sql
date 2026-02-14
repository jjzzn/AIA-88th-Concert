-- Row BL (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001801', 'B2-BL-13', 'BL', 13, false),
    ('S001802', 'B2-BL-14', 'BL', 14, false),
    ('S001803', 'B2-BL-15', 'BL', 15, false),
    ('S001804', 'B2-BL-16', 'BL', 16, false),
    ('S001805', 'B2-BL-17', 'BL', 17, false),
    ('S001806', 'B2-BL-18', 'BL', 18, false),
    ('S001807', 'B2-BL-19', 'BL', 19, false),
    ('S001808', 'B2-BL-20', 'BL', 20, false),
    ('S001809', 'B2-BL-21', 'BL', 21, false),
    ('S001810', 'B2-BL-22', 'BL', 22, false),
    ('S001811', 'B2-BL-23', 'BL', 23, false),
    ('S001812', 'B2-BL-24', 'BL', 24, false),
    ('S001813', 'B2-BL-25', 'BL', 25, false),
    ('S001814', 'B2-BL-26', 'BL', 26, false),
    ('S001815', 'B2-BL-27', 'BL', 27, false),
    ('S001816', 'B2-BL-28', 'BL', 28, false),
    ('S001817', 'B2-BL-29', 'BL', 29, false),
    ('S001818', 'B2-BL-30', 'BL', 30, false),
    ('S001819', 'B2-BL-31', 'BL', 31, false),
    ('S001820', 'B2-BL-32', 'BL', 32, false),
    ('S001821', 'B2-BL-33', 'BL', 33, false),
    ('S001822', 'B2-BL-34', 'BL', 34, false),
    ('S001823', 'B2-BL-35', 'BL', 35, false),
    ('S001824', 'B2-BL-36', 'BL', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BM (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001825', 'B2-BM-13', 'BM', 13, false),
    ('S001826', 'B2-BM-14', 'BM', 14, false),
    ('S001827', 'B2-BM-15', 'BM', 15, false),
    ('S001828', 'B2-BM-16', 'BM', 16, false),
    ('S001829', 'B2-BM-17', 'BM', 17, false),
    ('S001830', 'B2-BM-18', 'BM', 18, false),
    ('S001831', 'B2-BM-19', 'BM', 19, false),
    ('S001832', 'B2-BM-20', 'BM', 20, false),
    ('S001833', 'B2-BM-21', 'BM', 21, false),
    ('S001834', 'B2-BM-22', 'BM', 22, false),
    ('S001835', 'B2-BM-23', 'BM', 23, false),
    ('S001836', 'B2-BM-24', 'BM', 24, false),
    ('S001837', 'B2-BM-25', 'BM', 25, false),
    ('S001838', 'B2-BM-26', 'BM', 26, false),
    ('S001839', 'B2-BM-27', 'BM', 27, false),
    ('S001840', 'B2-BM-28', 'BM', 28, false),
    ('S001841', 'B2-BM-29', 'BM', 29, false),
    ('S001842', 'B2-BM-30', 'BM', 30, false),
    ('S001843', 'B2-BM-31', 'BM', 31, false),
    ('S001844', 'B2-BM-32', 'BM', 32, false),
    ('S001845', 'B2-BM-33', 'BM', 33, false),
    ('S001846', 'B2-BM-34', 'BM', 34, false),
    ('S001847', 'B2-BM-35', 'BM', 35, false),
    ('S001848', 'B2-BM-36', 'BM', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BN (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001849', 'B2-BN-13', 'BN', 13, false),
    ('S001850', 'B2-BN-14', 'BN', 14, false),
    ('S001851', 'B2-BN-15', 'BN', 15, false),
    ('S001852', 'B2-BN-16', 'BN', 16, false),
    ('S001853', 'B2-BN-17', 'BN', 17, false),
    ('S001854', 'B2-BN-18', 'BN', 18, false),
    ('S001855', 'B2-BN-19', 'BN', 19, false),
    ('S001856', 'B2-BN-20', 'BN', 20, false),
    ('S001857', 'B2-BN-21', 'BN', 21, false),
    ('S001858', 'B2-BN-22', 'BN', 22, false),
    ('S001859', 'B2-BN-23', 'BN', 23, false),
    ('S001860', 'B2-BN-24', 'BN', 24, false),
    ('S001861', 'B2-BN-25', 'BN', 25, false),
    ('S001862', 'B2-BN-26', 'BN', 26, false),
    ('S001863', 'B2-BN-27', 'BN', 27, false),
    ('S001864', 'B2-BN-28', 'BN', 28, false),
    ('S001865', 'B2-BN-29', 'BN', 29, false),
    ('S001866', 'B2-BN-30', 'BN', 30, false),
    ('S001867', 'B2-BN-31', 'BN', 31, false),
    ('S001868', 'B2-BN-32', 'BN', 32, false),
    ('S001869', 'B2-BN-33', 'BN', 33, false),
    ('S001870', 'B2-BN-34', 'BN', 34, false),
    ('S001871', 'B2-BN-35', 'BN', 35, false),
    ('S001872', 'B2-BN-36', 'BN', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BP (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001873', 'B2-BP-13', 'BP', 13, false),
    ('S001874', 'B2-BP-14', 'BP', 14, false),
    ('S001875', 'B2-BP-15', 'BP', 15, false),
    ('S001876', 'B2-BP-16', 'BP', 16, false),
    ('S001877', 'B2-BP-17', 'BP', 17, false),
    ('S001878', 'B2-BP-18', 'BP', 18, false),
    ('S001879', 'B2-BP-19', 'BP', 19, false),
    ('S001880', 'B2-BP-20', 'BP', 20, false),
    ('S001881', 'B2-BP-21', 'BP', 21, false),
    ('S001882', 'B2-BP-22', 'BP', 22, false),
    ('S001883', 'B2-BP-23', 'BP', 23, false),
    ('S001884', 'B2-BP-24', 'BP', 24, false),
    ('S001885', 'B2-BP-25', 'BP', 25, false),
    ('S001886', 'B2-BP-26', 'BP', 26, false),
    ('S001887', 'B2-BP-27', 'BP', 27, false),
    ('S001888', 'B2-BP-28', 'BP', 28, false),
    ('S001889', 'B2-BP-29', 'BP', 29, false),
    ('S001890', 'B2-BP-30', 'BP', 30, false),
    ('S001891', 'B2-BP-31', 'BP', 31, false),
    ('S001892', 'B2-BP-32', 'BP', 32, false),
    ('S001893', 'B2-BP-33', 'BP', 33, false),
    ('S001894', 'B2-BP-34', 'BP', 34, false),
    ('S001895', 'B2-BP-35', 'BP', 35, false),
    ('S001896', 'B2-BP-36', 'BP', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BQ (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001897', 'B2-BQ-13', 'BQ', 13, false),
    ('S001898', 'B2-BQ-14', 'BQ', 14, false),
    ('S001899', 'B2-BQ-15', 'BQ', 15, false),
    ('S001900', 'B2-BQ-16', 'BQ', 16, false),
    ('S001901', 'B2-BQ-17', 'BQ', 17, false),
    ('S001902', 'B2-BQ-18', 'BQ', 18, false),
    ('S001903', 'B2-BQ-19', 'BQ', 19, false),
    ('S001904', 'B2-BQ-20', 'BQ', 20, false),
    ('S001905', 'B2-BQ-21', 'BQ', 21, false),
    ('S001906', 'B2-BQ-22', 'BQ', 22, false),
    ('S001907', 'B2-BQ-23', 'BQ', 23, false),
    ('S001908', 'B2-BQ-24', 'BQ', 24, false),
    ('S001909', 'B2-BQ-25', 'BQ', 25, false),
    ('S001910', 'B2-BQ-26', 'BQ', 26, false),
    ('S001911', 'B2-BQ-27', 'BQ', 27, false),
    ('S001912', 'B2-BQ-28', 'BQ', 28, false),
    ('S001913', 'B2-BQ-29', 'BQ', 29, false),
    ('S001914', 'B2-BQ-30', 'BQ', 30, false),
    ('S001915', 'B2-BQ-31', 'BQ', 31, false),
    ('S001916', 'B2-BQ-32', 'BQ', 32, false),
    ('S001917', 'B2-BQ-33', 'BQ', 33, false),
    ('S001918', 'B2-BQ-34', 'BQ', 34, false),
    ('S001919', 'B2-BQ-35', 'BQ', 35, false),
    ('S001920', 'B2-BQ-36', 'BQ', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BR (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001921', 'B2-BR-13', 'BR', 13, false),
    ('S001922', 'B2-BR-14', 'BR', 14, false),
    ('S001923', 'B2-BR-15', 'BR', 15, false),
    ('S001924', 'B2-BR-16', 'BR', 16, false),
    ('S001925', 'B2-BR-17', 'BR', 17, false),
    ('S001926', 'B2-BR-18', 'BR', 18, false),
    ('S001927', 'B2-BR-19', 'BR', 19, false),
    ('S001928', 'B2-BR-20', 'BR', 20, false),
    ('S001929', 'B2-BR-21', 'BR', 21, false),
    ('S001930', 'B2-BR-22', 'BR', 22, false),
    ('S001931', 'B2-BR-23', 'BR', 23, false),
    ('S001932', 'B2-BR-24', 'BR', 24, false),
    ('S001933', 'B2-BR-25', 'BR', 25, false),
    ('S001934', 'B2-BR-26', 'BR', 26, false),
    ('S001935', 'B2-BR-27', 'BR', 27, false),
    ('S001936', 'B2-BR-28', 'BR', 28, false),
    ('S001937', 'B2-BR-29', 'BR', 29, false),
    ('S001938', 'B2-BR-30', 'BR', 30, false),
    ('S001939', 'B2-BR-31', 'BR', 31, false),
    ('S001940', 'B2-BR-32', 'BR', 32, false),
    ('S001941', 'B2-BR-33', 'BR', 33, false),
    ('S001942', 'B2-BR-34', 'BR', 34, false),
    ('S001943', 'B2-BR-35', 'BR', 35, false),
    ('S001944', 'B2-BR-36', 'BR', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BS (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001945', 'B2-BS-13', 'BS', 13, false),
    ('S001946', 'B2-BS-14', 'BS', 14, false),
    ('S001947', 'B2-BS-15', 'BS', 15, false),
    ('S001948', 'B2-BS-16', 'BS', 16, false),
    ('S001949', 'B2-BS-17', 'BS', 17, false),
    ('S001950', 'B2-BS-18', 'BS', 18, false),
    ('S001951', 'B2-BS-19', 'BS', 19, false),
    ('S001952', 'B2-BS-20', 'BS', 20, false),
    ('S001953', 'B2-BS-21', 'BS', 21, false),
    ('S001954', 'B2-BS-22', 'BS', 22, false),
    ('S001955', 'B2-BS-23', 'BS', 23, false),
    ('S001956', 'B2-BS-24', 'BS', 24, false),
    ('S001957', 'B2-BS-25', 'BS', 25, false),
    ('S001958', 'B2-BS-26', 'BS', 26, false),
    ('S001959', 'B2-BS-27', 'BS', 27, false),
    ('S001960', 'B2-BS-28', 'BS', 28, false),
    ('S001961', 'B2-BS-29', 'BS', 29, false),
    ('S001962', 'B2-BS-30', 'BS', 30, false),
    ('S001963', 'B2-BS-31', 'BS', 31, false),
    ('S001964', 'B2-BS-32', 'BS', 32, false),
    ('S001965', 'B2-BS-33', 'BS', 33, false),
    ('S001966', 'B2-BS-34', 'BS', 34, false),
    ('S001967', 'B2-BS-35', 'BS', 35, false),
    ('S001968', 'B2-BS-36', 'BS', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BT (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001969', 'B2-BT-13', 'BT', 13, false),
    ('S001970', 'B2-BT-14', 'BT', 14, false),
    ('S001971', 'B2-BT-15', 'BT', 15, false),
    ('S001972', 'B2-BT-16', 'BT', 16, false),
    ('S001973', 'B2-BT-17', 'BT', 17, false),
    ('S001974', 'B2-BT-18', 'BT', 18, false),
    ('S001975', 'B2-BT-19', 'BT', 19, false),
    ('S001976', 'B2-BT-20', 'BT', 20, false),
    ('S001977', 'B2-BT-21', 'BT', 21, false),
    ('S001978', 'B2-BT-22', 'BT', 22, false),
    ('S001979', 'B2-BT-23', 'BT', 23, false),
    ('S001980', 'B2-BT-24', 'BT', 24, false),
    ('S001981', 'B2-BT-25', 'BT', 25, false),
    ('S001982', 'B2-BT-26', 'BT', 26, false),
    ('S001983', 'B2-BT-27', 'BT', 27, false),
    ('S001984', 'B2-BT-28', 'BT', 28, false),
    ('S001985', 'B2-BT-29', 'BT', 29, false),
    ('S001986', 'B2-BT-30', 'BT', 30, false),
    ('S001987', 'B2-BT-31', 'BT', 31, false),
    ('S001988', 'B2-BT-32', 'BT', 32, false),
    ('S001989', 'B2-BT-33', 'BT', 33, false),
    ('S001990', 'B2-BT-34', 'BT', 34, false),
    ('S001991', 'B2-BT-35', 'BT', 35, false),
    ('S001992', 'B2-BT-36', 'BT', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BU (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001993', 'B2-BU-13', 'BU', 13, false),
    ('S001994', 'B2-BU-14', 'BU', 14, false),
    ('S001995', 'B2-BU-15', 'BU', 15, false),
    ('S001996', 'B2-BU-16', 'BU', 16, false),
    ('S001997', 'B2-BU-17', 'BU', 17, false),
    ('S001998', 'B2-BU-18', 'BU', 18, false),
    ('S001999', 'B2-BU-19', 'BU', 19, false),
    ('S002000', 'B2-BU-20', 'BU', 20, false),
    ('S002001', 'B2-BU-21', 'BU', 21, false),
    ('S002002', 'B2-BU-22', 'BU', 22, false),
    ('S002003', 'B2-BU-23', 'BU', 23, false),
    ('S002004', 'B2-BU-24', 'BU', 24, false),
    ('S002005', 'B2-BU-25', 'BU', 25, false),
    ('S002006', 'B2-BU-26', 'BU', 26, false),
    ('S002007', 'B2-BU-27', 'BU', 27, false),
    ('S002008', 'B2-BU-28', 'BU', 28, false),
    ('S002009', 'B2-BU-29', 'BU', 29, false),
    ('S002010', 'B2-BU-30', 'BU', 30, false),
    ('S002011', 'B2-BU-31', 'BU', 31, false),
    ('S002012', 'B2-BU-32', 'BU', 32, false),
    ('S002013', 'B2-BU-33', 'BU', 33, false),
    ('S002014', 'B2-BU-34', 'BU', 34, false),
    ('S002015', 'B2-BU-35', 'BU', 35, false),
    ('S002016', 'B2-BU-36', 'BU', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BV (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002017', 'B2-BV-13', 'BV', 13, false),
    ('S002018', 'B2-BV-14', 'BV', 14, false),
    ('S002019', 'B2-BV-15', 'BV', 15, false),
    ('S002020', 'B2-BV-16', 'BV', 16, false),
    ('S002021', 'B2-BV-17', 'BV', 17, false),
    ('S002022', 'B2-BV-18', 'BV', 18, false),
    ('S002023', 'B2-BV-19', 'BV', 19, false),
    ('S002024', 'B2-BV-20', 'BV', 20, false),
    ('S002025', 'B2-BV-21', 'BV', 21, false),
    ('S002026', 'B2-BV-22', 'BV', 22, false),
    ('S002027', 'B2-BV-23', 'BV', 23, false),
    ('S002028', 'B2-BV-24', 'BV', 24, false),
    ('S002029', 'B2-BV-25', 'BV', 25, false),
    ('S002030', 'B2-BV-26', 'BV', 26, false),
    ('S002031', 'B2-BV-27', 'BV', 27, false),
    ('S002032', 'B2-BV-28', 'BV', 28, false),
    ('S002033', 'B2-BV-29', 'BV', 29, false),
    ('S002034', 'B2-BV-30', 'BV', 30, false),
    ('S002035', 'B2-BV-31', 'BV', 31, false),
    ('S002036', 'B2-BV-32', 'BV', 32, false),
    ('S002037', 'B2-BV-33', 'BV', 33, false),
    ('S002038', 'B2-BV-34', 'BV', 34, false),
    ('S002039', 'B2-BV-35', 'BV', 35, false),
    ('S002040', 'B2-BV-36', 'BV', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BW (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002041', 'B2-BW-13', 'BW', 13, false),
    ('S002042', 'B2-BW-14', 'BW', 14, false),
    ('S002043', 'B2-BW-15', 'BW', 15, false),
    ('S002044', 'B2-BW-16', 'BW', 16, false),
    ('S002045', 'B2-BW-17', 'BW', 17, false),
    ('S002046', 'B2-BW-18', 'BW', 18, false),
    ('S002047', 'B2-BW-19', 'BW', 19, false),
    ('S002048', 'B2-BW-20', 'BW', 20, false),
    ('S002049', 'B2-BW-21', 'BW', 21, false),
    ('S002050', 'B2-BW-22', 'BW', 22, false),
    ('S002051', 'B2-BW-23', 'BW', 23, false),
    ('S002052', 'B2-BW-24', 'BW', 24, false),
    ('S002053', 'B2-BW-25', 'BW', 25, false),
    ('S002054', 'B2-BW-26', 'BW', 26, false),
    ('S002055', 'B2-BW-27', 'BW', 27, false),
    ('S002056', 'B2-BW-28', 'BW', 28, false),
    ('S002057', 'B2-BW-29', 'BW', 29, false),
    ('S002058', 'B2-BW-30', 'BW', 30, false),
    ('S002059', 'B2-BW-31', 'BW', 31, false),
    ('S002060', 'B2-BW-32', 'BW', 32, false),
    ('S002061', 'B2-BW-33', 'BW', 33, false),
    ('S002062', 'B2-BW-34', 'BW', 34, false),
    ('S002063', 'B2-BW-35', 'BW', 35, false),
    ('S002064', 'B2-BW-36', 'BW', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE B3 (492 seats)
-- Row BA (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002065', 'B3-BA-49', 'BA', 49, false),
    ('S002066', 'B3-BA-50', 'BA', 50, false),
    ('S002067', 'B3-BA-51', 'BA', 51, false),
    ('S002068', 'B3-BA-52', 'BA', 52, false),
    ('S002069', 'B3-BA-53', 'BA', 53, false),
    ('S002070', 'B3-BA-54', 'BA', 54, false),
    ('S002071', 'B3-BA-55', 'BA', 55, false),
    ('S002072', 'B3-BA-56', 'BA', 56, false),
    ('S002073', 'B3-BA-57', 'BA', 57, false),
    ('S002074', 'B3-BA-58', 'BA', 58, false),
    ('S002075', 'B3-BA-59', 'BA', 59, false),
    ('S002076', 'B3-BA-60', 'BA', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BB (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002077', 'B3-BB-37', 'BB', 37, false),
    ('S002078', 'B3-BB-38', 'BB', 38, false),
    ('S002079', 'B3-BB-39', 'BB', 39, false),
    ('S002080', 'B3-BB-40', 'BB', 40, false),
    ('S002081', 'B3-BB-41', 'BB', 41, false),
    ('S002082', 'B3-BB-42', 'BB', 42, false),
    ('S002083', 'B3-BB-43', 'BB', 43, false),
    ('S002084', 'B3-BB-44', 'BB', 44, false),
    ('S002085', 'B3-BB-45', 'BB', 45, false),
    ('S002086', 'B3-BB-46', 'BB', 46, false),
    ('S002087', 'B3-BB-47', 'BB', 47, false),
    ('S002088', 'B3-BB-48', 'BB', 48, false),
    ('S002089', 'B3-BB-49', 'BB', 49, false),
    ('S002090', 'B3-BB-50', 'BB', 50, false),
    ('S002091', 'B3-BB-51', 'BB', 51, false),
    ('S002092', 'B3-BB-52', 'BB', 52, false),
    ('S002093', 'B3-BB-53', 'BB', 53, false),
    ('S002094', 'B3-BB-54', 'BB', 54, false),
    ('S002095', 'B3-BB-55', 'BB', 55, false),
    ('S002096', 'B3-BB-56', 'BB', 56, false),
    ('S002097', 'B3-BB-57', 'BB', 57, false),
    ('S002098', 'B3-BB-58', 'BB', 58, false),
    ('S002099', 'B3-BB-59', 'BB', 59, false),
    ('S002100', 'B3-BB-60', 'BB', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BC (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002101', 'B3-BC-37', 'BC', 37, false),
    ('S002102', 'B3-BC-38', 'BC', 38, false),
    ('S002103', 'B3-BC-39', 'BC', 39, false),
    ('S002104', 'B3-BC-40', 'BC', 40, false),
    ('S002105', 'B3-BC-41', 'BC', 41, false),
    ('S002106', 'B3-BC-42', 'BC', 42, false),
    ('S002107', 'B3-BC-43', 'BC', 43, false),
    ('S002108', 'B3-BC-44', 'BC', 44, false),
    ('S002109', 'B3-BC-45', 'BC', 45, false),
    ('S002110', 'B3-BC-46', 'BC', 46, false),
    ('S002111', 'B3-BC-47', 'BC', 47, false),
    ('S002112', 'B3-BC-48', 'BC', 48, false),
    ('S002113', 'B3-BC-49', 'BC', 49, false),
    ('S002114', 'B3-BC-50', 'BC', 50, false),
    ('S002115', 'B3-BC-51', 'BC', 51, false),
    ('S002116', 'B3-BC-52', 'BC', 52, false),
    ('S002117', 'B3-BC-53', 'BC', 53, false),
    ('S002118', 'B3-BC-54', 'BC', 54, false),
    ('S002119', 'B3-BC-55', 'BC', 55, false),
    ('S002120', 'B3-BC-56', 'BC', 56, false),
    ('S002121', 'B3-BC-57', 'BC', 57, false),
    ('S002122', 'B3-BC-58', 'BC', 58, false),
    ('S002123', 'B3-BC-59', 'BC', 59, false),
    ('S002124', 'B3-BC-60', 'BC', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BD (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002125', 'B3-BD-37', 'BD', 37, false),
    ('S002126', 'B3-BD-38', 'BD', 38, false),
    ('S002127', 'B3-BD-39', 'BD', 39, false),
    ('S002128', 'B3-BD-40', 'BD', 40, false),
    ('S002129', 'B3-BD-41', 'BD', 41, false),
    ('S002130', 'B3-BD-42', 'BD', 42, false),
    ('S002131', 'B3-BD-43', 'BD', 43, false),
    ('S002132', 'B3-BD-44', 'BD', 44, false),
    ('S002133', 'B3-BD-45', 'BD', 45, false),
    ('S002134', 'B3-BD-46', 'BD', 46, false),
    ('S002135', 'B3-BD-47', 'BD', 47, false),
    ('S002136', 'B3-BD-48', 'BD', 48, false),
    ('S002137', 'B3-BD-49', 'BD', 49, false),
    ('S002138', 'B3-BD-50', 'BD', 50, false),
    ('S002139', 'B3-BD-51', 'BD', 51, false),
    ('S002140', 'B3-BD-52', 'BD', 52, false),
    ('S002141', 'B3-BD-53', 'BD', 53, false),
    ('S002142', 'B3-BD-54', 'BD', 54, false),
    ('S002143', 'B3-BD-55', 'BD', 55, false),
    ('S002144', 'B3-BD-56', 'BD', 56, false),
    ('S002145', 'B3-BD-57', 'BD', 57, false),
    ('S002146', 'B3-BD-58', 'BD', 58, false),
    ('S002147', 'B3-BD-59', 'BD', 59, false),
    ('S002148', 'B3-BD-60', 'BD', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BE (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002149', 'B3-BE-37', 'BE', 37, false),
    ('S002150', 'B3-BE-38', 'BE', 38, false),
    ('S002151', 'B3-BE-39', 'BE', 39, false),
    ('S002152', 'B3-BE-40', 'BE', 40, false),
    ('S002153', 'B3-BE-41', 'BE', 41, false),
    ('S002154', 'B3-BE-42', 'BE', 42, false),
    ('S002155', 'B3-BE-43', 'BE', 43, false),
    ('S002156', 'B3-BE-44', 'BE', 44, false),
    ('S002157', 'B3-BE-45', 'BE', 45, false),
    ('S002158', 'B3-BE-46', 'BE', 46, false),
    ('S002159', 'B3-BE-47', 'BE', 47, false),
    ('S002160', 'B3-BE-48', 'BE', 48, false),
    ('S002161', 'B3-BE-49', 'BE', 49, false),
    ('S002162', 'B3-BE-50', 'BE', 50, false),
    ('S002163', 'B3-BE-51', 'BE', 51, false),
    ('S002164', 'B3-BE-52', 'BE', 52, false),
    ('S002165', 'B3-BE-53', 'BE', 53, false),
    ('S002166', 'B3-BE-54', 'BE', 54, false),
    ('S002167', 'B3-BE-55', 'BE', 55, false),
    ('S002168', 'B3-BE-56', 'BE', 56, false),
    ('S002169', 'B3-BE-57', 'BE', 57, false),
    ('S002170', 'B3-BE-58', 'BE', 58, false),
    ('S002171', 'B3-BE-59', 'BE', 59, false),
    ('S002172', 'B3-BE-60', 'BE', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BF (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002173', 'B3-BF-37', 'BF', 37, false),
    ('S002174', 'B3-BF-38', 'BF', 38, false),
    ('S002175', 'B3-BF-39', 'BF', 39, false),
    ('S002176', 'B3-BF-40', 'BF', 40, false),
    ('S002177', 'B3-BF-41', 'BF', 41, false),
    ('S002178', 'B3-BF-42', 'BF', 42, false),
    ('S002179', 'B3-BF-43', 'BF', 43, false),
    ('S002180', 'B3-BF-44', 'BF', 44, false),
    ('S002181', 'B3-BF-45', 'BF', 45, false),
    ('S002182', 'B3-BF-46', 'BF', 46, false),
    ('S002183', 'B3-BF-47', 'BF', 47, false),
    ('S002184', 'B3-BF-48', 'BF', 48, false),
    ('S002185', 'B3-BF-49', 'BF', 49, false),
    ('S002186', 'B3-BF-50', 'BF', 50, false),
    ('S002187', 'B3-BF-51', 'BF', 51, false),
    ('S002188', 'B3-BF-52', 'BF', 52, false),
    ('S002189', 'B3-BF-53', 'BF', 53, false),
    ('S002190', 'B3-BF-54', 'BF', 54, false),
    ('S002191', 'B3-BF-55', 'BF', 55, false),
    ('S002192', 'B3-BF-56', 'BF', 56, false),
    ('S002193', 'B3-BF-57', 'BF', 57, false),
    ('S002194', 'B3-BF-58', 'BF', 58, false),
    ('S002195', 'B3-BF-59', 'BF', 59, false),
    ('S002196', 'B3-BF-60', 'BF', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BG (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002197', 'B3-BG-37', 'BG', 37, false),
    ('S002198', 'B3-BG-38', 'BG', 38, false),
    ('S002199', 'B3-BG-39', 'BG', 39, false),
    ('S002200', 'B3-BG-40', 'BG', 40, false),
    ('S002201', 'B3-BG-41', 'BG', 41, false),
    ('S002202', 'B3-BG-42', 'BG', 42, false),
    ('S002203', 'B3-BG-43', 'BG', 43, false),
    ('S002204', 'B3-BG-44', 'BG', 44, false),
    ('S002205', 'B3-BG-45', 'BG', 45, false),
    ('S002206', 'B3-BG-46', 'BG', 46, false),
    ('S002207', 'B3-BG-47', 'BG', 47, false),
    ('S002208', 'B3-BG-48', 'BG', 48, false),
    ('S002209', 'B3-BG-49', 'BG', 49, false),
    ('S002210', 'B3-BG-50', 'BG', 50, false),
    ('S002211', 'B3-BG-51', 'BG', 51, false),
    ('S002212', 'B3-BG-52', 'BG', 52, false),
    ('S002213', 'B3-BG-53', 'BG', 53, false),
    ('S002214', 'B3-BG-54', 'BG', 54, false),
    ('S002215', 'B3-BG-55', 'BG', 55, false),
    ('S002216', 'B3-BG-56', 'BG', 56, false),
    ('S002217', 'B3-BG-57', 'BG', 57, false),
    ('S002218', 'B3-BG-58', 'BG', 58, false),
    ('S002219', 'B3-BG-59', 'BG', 59, false),
    ('S002220', 'B3-BG-60', 'BG', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BH (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002221', 'B3-BH-37', 'BH', 37, false),
    ('S002222', 'B3-BH-38', 'BH', 38, false),
    ('S002223', 'B3-BH-39', 'BH', 39, false),
    ('S002224', 'B3-BH-40', 'BH', 40, false),
    ('S002225', 'B3-BH-41', 'BH', 41, false),
    ('S002226', 'B3-BH-42', 'BH', 42, false),
    ('S002227', 'B3-BH-43', 'BH', 43, false),
    ('S002228', 'B3-BH-44', 'BH', 44, false),
    ('S002229', 'B3-BH-45', 'BH', 45, false),
    ('S002230', 'B3-BH-46', 'BH', 46, false),
    ('S002231', 'B3-BH-47', 'BH', 47, false),
    ('S002232', 'B3-BH-48', 'BH', 48, false),
    ('S002233', 'B3-BH-49', 'BH', 49, false),
    ('S002234', 'B3-BH-50', 'BH', 50, false),
    ('S002235', 'B3-BH-51', 'BH', 51, false),
    ('S002236', 'B3-BH-52', 'BH', 52, false),
    ('S002237', 'B3-BH-53', 'BH', 53, false),
    ('S002238', 'B3-BH-54', 'BH', 54, false),
    ('S002239', 'B3-BH-55', 'BH', 55, false),
    ('S002240', 'B3-BH-56', 'BH', 56, false),
    ('S002241', 'B3-BH-57', 'BH', 57, false),
    ('S002242', 'B3-BH-58', 'BH', 58, false),
    ('S002243', 'B3-BH-59', 'BH', 59, false),
    ('S002244', 'B3-BH-60', 'BH', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BJ (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002245', 'B3-BJ-37', 'BJ', 37, false),
    ('S002246', 'B3-BJ-38', 'BJ', 38, false),
    ('S002247', 'B3-BJ-39', 'BJ', 39, false),
    ('S002248', 'B3-BJ-40', 'BJ', 40, false),
    ('S002249', 'B3-BJ-41', 'BJ', 41, false),
    ('S002250', 'B3-BJ-42', 'BJ', 42, false),
    ('S002251', 'B3-BJ-43', 'BJ', 43, false),
    ('S002252', 'B3-BJ-44', 'BJ', 44, false),
    ('S002253', 'B3-BJ-45', 'BJ', 45, false),
    ('S002254', 'B3-BJ-46', 'BJ', 46, false),
    ('S002255', 'B3-BJ-47', 'BJ', 47, false),
    ('S002256', 'B3-BJ-48', 'BJ', 48, false),
    ('S002257', 'B3-BJ-49', 'BJ', 49, false),
    ('S002258', 'B3-BJ-50', 'BJ', 50, false),
    ('S002259', 'B3-BJ-51', 'BJ', 51, false),
    ('S002260', 'B3-BJ-52', 'BJ', 52, false),
    ('S002261', 'B3-BJ-53', 'BJ', 53, false),
    ('S002262', 'B3-BJ-54', 'BJ', 54, false),
    ('S002263', 'B3-BJ-55', 'BJ', 55, false),
    ('S002264', 'B3-BJ-56', 'BJ', 56, false),
    ('S002265', 'B3-BJ-57', 'BJ', 57, false),
    ('S002266', 'B3-BJ-58', 'BJ', 58, false),
    ('S002267', 'B3-BJ-59', 'BJ', 59, false),
    ('S002268', 'B3-BJ-60', 'BJ', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BK (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002269', 'B3-BK-37', 'BK', 37, false),
    ('S002270', 'B3-BK-38', 'BK', 38, false),
    ('S002271', 'B3-BK-39', 'BK', 39, false),
    ('S002272', 'B3-BK-40', 'BK', 40, false),
    ('S002273', 'B3-BK-41', 'BK', 41, false),
    ('S002274', 'B3-BK-42', 'BK', 42, false),
    ('S002275', 'B3-BK-43', 'BK', 43, false),
    ('S002276', 'B3-BK-44', 'BK', 44, false),
    ('S002277', 'B3-BK-45', 'BK', 45, false),
    ('S002278', 'B3-BK-46', 'BK', 46, false),
    ('S002279', 'B3-BK-47', 'BK', 47, false),
    ('S002280', 'B3-BK-48', 'BK', 48, false),
    ('S002281', 'B3-BK-49', 'BK', 49, false),
    ('S002282', 'B3-BK-50', 'BK', 50, false),
    ('S002283', 'B3-BK-51', 'BK', 51, false),
    ('S002284', 'B3-BK-52', 'BK', 52, false),
    ('S002285', 'B3-BK-53', 'BK', 53, false),
    ('S002286', 'B3-BK-54', 'BK', 54, false),
    ('S002287', 'B3-BK-55', 'BK', 55, false),
    ('S002288', 'B3-BK-56', 'BK', 56, false),
    ('S002289', 'B3-BK-57', 'BK', 57, false),
    ('S002290', 'B3-BK-58', 'BK', 58, false),
    ('S002291', 'B3-BK-59', 'BK', 59, false),
    ('S002292', 'B3-BK-60', 'BK', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BL (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002293', 'B3-BL-37', 'BL', 37, false),
    ('S002294', 'B3-BL-38', 'BL', 38, false),
    ('S002295', 'B3-BL-39', 'BL', 39, false),
    ('S002296', 'B3-BL-40', 'BL', 40, false),
    ('S002297', 'B3-BL-41', 'BL', 41, false),
    ('S002298', 'B3-BL-42', 'BL', 42, false),
    ('S002299', 'B3-BL-43', 'BL', 43, false),
    ('S002300', 'B3-BL-44', 'BL', 44, false),
    ('S002301', 'B3-BL-45', 'BL', 45, false),
    ('S002302', 'B3-BL-46', 'BL', 46, false),
    ('S002303', 'B3-BL-47', 'BL', 47, false),
    ('S002304', 'B3-BL-48', 'BL', 48, false),
    ('S002305', 'B3-BL-49', 'BL', 49, false),
    ('S002306', 'B3-BL-50', 'BL', 50, false),
    ('S002307', 'B3-BL-51', 'BL', 51, false),
    ('S002308', 'B3-BL-52', 'BL', 52, false),
    ('S002309', 'B3-BL-53', 'BL', 53, false),
    ('S002310', 'B3-BL-54', 'BL', 54, false),
    ('S002311', 'B3-BL-55', 'BL', 55, false),
    ('S002312', 'B3-BL-56', 'BL', 56, false),
    ('S002313', 'B3-BL-57', 'BL', 57, false),
    ('S002314', 'B3-BL-58', 'BL', 58, false),
    ('S002315', 'B3-BL-59', 'BL', 59, false),
    ('S002316', 'B3-BL-60', 'BL', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BM (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002317', 'B3-BM-37', 'BM', 37, false),
    ('S002318', 'B3-BM-38', 'BM', 38, false),
    ('S002319', 'B3-BM-39', 'BM', 39, false),
    ('S002320', 'B3-BM-40', 'BM', 40, false),
    ('S002321', 'B3-BM-41', 'BM', 41, false),
    ('S002322', 'B3-BM-42', 'BM', 42, false),
    ('S002323', 'B3-BM-43', 'BM', 43, false),
    ('S002324', 'B3-BM-44', 'BM', 44, false),
    ('S002325', 'B3-BM-45', 'BM', 45, false),
    ('S002326', 'B3-BM-46', 'BM', 46, false),
    ('S002327', 'B3-BM-47', 'BM', 47, false),
    ('S002328', 'B3-BM-48', 'BM', 48, false),
    ('S002329', 'B3-BM-49', 'BM', 49, false),
    ('S002330', 'B3-BM-50', 'BM', 50, false),
    ('S002331', 'B3-BM-51', 'BM', 51, false),
    ('S002332', 'B3-BM-52', 'BM', 52, false),
    ('S002333', 'B3-BM-53', 'BM', 53, false),
    ('S002334', 'B3-BM-54', 'BM', 54, false),
    ('S002335', 'B3-BM-55', 'BM', 55, false),
    ('S002336', 'B3-BM-56', 'BM', 56, false),
    ('S002337', 'B3-BM-57', 'BM', 57, false),
    ('S002338', 'B3-BM-58', 'BM', 58, false),
    ('S002339', 'B3-BM-59', 'BM', 59, false),
    ('S002340', 'B3-BM-60', 'BM', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BN (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002341', 'B3-BN-37', 'BN', 37, false),
    ('S002342', 'B3-BN-38', 'BN', 38, false),
    ('S002343', 'B3-BN-39', 'BN', 39, false),
    ('S002344', 'B3-BN-40', 'BN', 40, false),
    ('S002345', 'B3-BN-41', 'BN', 41, false),
    ('S002346', 'B3-BN-42', 'BN', 42, false),
    ('S002347', 'B3-BN-43', 'BN', 43, false),
    ('S002348', 'B3-BN-44', 'BN', 44, false),
    ('S002349', 'B3-BN-45', 'BN', 45, false),
    ('S002350', 'B3-BN-46', 'BN', 46, false),
    ('S002351', 'B3-BN-47', 'BN', 47, false),
    ('S002352', 'B3-BN-48', 'BN', 48, false),
    ('S002353', 'B3-BN-49', 'BN', 49, false),
    ('S002354', 'B3-BN-50', 'BN', 50, false),
    ('S002355', 'B3-BN-51', 'BN', 51, false),
    ('S002356', 'B3-BN-52', 'BN', 52, false),
    ('S002357', 'B3-BN-53', 'BN', 53, false),
    ('S002358', 'B3-BN-54', 'BN', 54, false),
    ('S002359', 'B3-BN-55', 'BN', 55, false),
    ('S002360', 'B3-BN-56', 'BN', 56, false),
    ('S002361', 'B3-BN-57', 'BN', 57, false),
    ('S002362', 'B3-BN-58', 'BN', 58, false),
    ('S002363', 'B3-BN-59', 'BN', 59, false),
    ('S002364', 'B3-BN-60', 'BN', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BP (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002365', 'B3-BP-37', 'BP', 37, false),
    ('S002366', 'B3-BP-38', 'BP', 38, false),
    ('S002367', 'B3-BP-39', 'BP', 39, false),
    ('S002368', 'B3-BP-40', 'BP', 40, false),
    ('S002369', 'B3-BP-41', 'BP', 41, false),
    ('S002370', 'B3-BP-42', 'BP', 42, false),
    ('S002371', 'B3-BP-43', 'BP', 43, false),
    ('S002372', 'B3-BP-44', 'BP', 44, false),
    ('S002373', 'B3-BP-45', 'BP', 45, false),
    ('S002374', 'B3-BP-46', 'BP', 46, false),
    ('S002375', 'B3-BP-47', 'BP', 47, false),
    ('S002376', 'B3-BP-48', 'BP', 48, false),
    ('S002377', 'B3-BP-49', 'BP', 49, false),
    ('S002378', 'B3-BP-50', 'BP', 50, false),
    ('S002379', 'B3-BP-51', 'BP', 51, false),
    ('S002380', 'B3-BP-52', 'BP', 52, false),
    ('S002381', 'B3-BP-53', 'BP', 53, false),
    ('S002382', 'B3-BP-54', 'BP', 54, false),
    ('S002383', 'B3-BP-55', 'BP', 55, false),
    ('S002384', 'B3-BP-56', 'BP', 56, false),
    ('S002385', 'B3-BP-57', 'BP', 57, false),
    ('S002386', 'B3-BP-58', 'BP', 58, false),
    ('S002387', 'B3-BP-59', 'BP', 59, false),
    ('S002388', 'B3-BP-60', 'BP', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BQ (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002389', 'B3-BQ-37', 'BQ', 37, false),
    ('S002390', 'B3-BQ-38', 'BQ', 38, false),
    ('S002391', 'B3-BQ-39', 'BQ', 39, false),
    ('S002392', 'B3-BQ-40', 'BQ', 40, false),
    ('S002393', 'B3-BQ-41', 'BQ', 41, false),
    ('S002394', 'B3-BQ-42', 'BQ', 42, false),
    ('S002395', 'B3-BQ-43', 'BQ', 43, false),
    ('S002396', 'B3-BQ-44', 'BQ', 44, false),
    ('S002397', 'B3-BQ-45', 'BQ', 45, false),
    ('S002398', 'B3-BQ-46', 'BQ', 46, false),
    ('S002399', 'B3-BQ-47', 'BQ', 47, false),
    ('S002400', 'B3-BQ-48', 'BQ', 48, false),
    ('S002401', 'B3-BQ-49', 'BQ', 49, false),
    ('S002402', 'B3-BQ-50', 'BQ', 50, false),
    ('S002403', 'B3-BQ-51', 'BQ', 51, false),
    ('S002404', 'B3-BQ-52', 'BQ', 52, false),
    ('S002405', 'B3-BQ-53', 'BQ', 53, false),
    ('S002406', 'B3-BQ-54', 'BQ', 54, false),
    ('S002407', 'B3-BQ-55', 'BQ', 55, false),
    ('S002408', 'B3-BQ-56', 'BQ', 56, false),
    ('S002409', 'B3-BQ-57', 'BQ', 57, false),
    ('S002410', 'B3-BQ-58', 'BQ', 58, false),
    ('S002411', 'B3-BQ-59', 'BQ', 59, false),
    ('S002412', 'B3-BQ-60', 'BQ', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BR (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002413', 'B3-BR-37', 'BR', 37, false),
    ('S002414', 'B3-BR-38', 'BR', 38, false),
    ('S002415', 'B3-BR-39', 'BR', 39, false),
    ('S002416', 'B3-BR-40', 'BR', 40, false),
    ('S002417', 'B3-BR-41', 'BR', 41, false),
    ('S002418', 'B3-BR-42', 'BR', 42, false),
    ('S002419', 'B3-BR-43', 'BR', 43, false),
    ('S002420', 'B3-BR-44', 'BR', 44, false),
    ('S002421', 'B3-BR-45', 'BR', 45, false),
    ('S002422', 'B3-BR-46', 'BR', 46, false),
    ('S002423', 'B3-BR-47', 'BR', 47, false),
    ('S002424', 'B3-BR-48', 'BR', 48, false),
    ('S002425', 'B3-BR-49', 'BR', 49, false),
    ('S002426', 'B3-BR-50', 'BR', 50, false),
    ('S002427', 'B3-BR-51', 'BR', 51, false),
    ('S002428', 'B3-BR-52', 'BR', 52, false),
    ('S002429', 'B3-BR-53', 'BR', 53, false),
    ('S002430', 'B3-BR-54', 'BR', 54, false),
    ('S002431', 'B3-BR-55', 'BR', 55, false),
    ('S002432', 'B3-BR-56', 'BR', 56, false),
    ('S002433', 'B3-BR-57', 'BR', 57, false),
    ('S002434', 'B3-BR-58', 'BR', 58, false),
    ('S002435', 'B3-BR-59', 'BR', 59, false),
    ('S002436', 'B3-BR-60', 'BR', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BS (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002437', 'B3-BS-37', 'BS', 37, false),
    ('S002438', 'B3-BS-38', 'BS', 38, false),
    ('S002439', 'B3-BS-39', 'BS', 39, false),
    ('S002440', 'B3-BS-40', 'BS', 40, false),
    ('S002441', 'B3-BS-41', 'BS', 41, false),
    ('S002442', 'B3-BS-42', 'BS', 42, false),
    ('S002443', 'B3-BS-43', 'BS', 43, false),
    ('S002444', 'B3-BS-44', 'BS', 44, false),
    ('S002445', 'B3-BS-45', 'BS', 45, false),
    ('S002446', 'B3-BS-46', 'BS', 46, false),
    ('S002447', 'B3-BS-47', 'BS', 47, false),
    ('S002448', 'B3-BS-48', 'BS', 48, false),
    ('S002449', 'B3-BS-49', 'BS', 49, false),
    ('S002450', 'B3-BS-50', 'BS', 50, false),
    ('S002451', 'B3-BS-51', 'BS', 51, false),
    ('S002452', 'B3-BS-52', 'BS', 52, false),
    ('S002453', 'B3-BS-53', 'BS', 53, false),
    ('S002454', 'B3-BS-54', 'BS', 54, false),
    ('S002455', 'B3-BS-55', 'BS', 55, false),
    ('S002456', 'B3-BS-56', 'BS', 56, false),
    ('S002457', 'B3-BS-57', 'BS', 57, false),
    ('S002458', 'B3-BS-58', 'BS', 58, false),
    ('S002459', 'B3-BS-59', 'BS', 59, false),
    ('S002460', 'B3-BS-60', 'BS', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BT (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002461', 'B3-BT-37', 'BT', 37, false),
    ('S002462', 'B3-BT-38', 'BT', 38, false),
    ('S002463', 'B3-BT-39', 'BT', 39, false),
    ('S002464', 'B3-BT-40', 'BT', 40, false),
    ('S002465', 'B3-BT-41', 'BT', 41, false),
    ('S002466', 'B3-BT-42', 'BT', 42, false),
    ('S002467', 'B3-BT-43', 'BT', 43, false),
    ('S002468', 'B3-BT-44', 'BT', 44, false),
    ('S002469', 'B3-BT-45', 'BT', 45, false),
    ('S002470', 'B3-BT-46', 'BT', 46, false),
    ('S002471', 'B3-BT-47', 'BT', 47, false),
    ('S002472', 'B3-BT-48', 'BT', 48, false),
    ('S002473', 'B3-BT-49', 'BT', 49, false),
    ('S002474', 'B3-BT-50', 'BT', 50, false),
    ('S002475', 'B3-BT-51', 'BT', 51, false),
    ('S002476', 'B3-BT-52', 'BT', 52, false),
    ('S002477', 'B3-BT-53', 'BT', 53, false),
    ('S002478', 'B3-BT-54', 'BT', 54, false),
    ('S002479', 'B3-BT-55', 'BT', 55, false),
    ('S002480', 'B3-BT-56', 'BT', 56, false),
    ('S002481', 'B3-BT-57', 'BT', 57, false),
    ('S002482', 'B3-BT-58', 'BT', 58, false),
    ('S002483', 'B3-BT-59', 'BT', 59, false),
    ('S002484', 'B3-BT-60', 'BT', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BU (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002485', 'B3-BU-37', 'BU', 37, false),
    ('S002486', 'B3-BU-38', 'BU', 38, false),
    ('S002487', 'B3-BU-39', 'BU', 39, false),
    ('S002488', 'B3-BU-40', 'BU', 40, false),
    ('S002489', 'B3-BU-41', 'BU', 41, false),
    ('S002490', 'B3-BU-42', 'BU', 42, false),
    ('S002491', 'B3-BU-43', 'BU', 43, false),
    ('S002492', 'B3-BU-44', 'BU', 44, false),
    ('S002493', 'B3-BU-45', 'BU', 45, false),
    ('S002494', 'B3-BU-46', 'BU', 46, false),
    ('S002495', 'B3-BU-47', 'BU', 47, false),
    ('S002496', 'B3-BU-48', 'BU', 48, false),
    ('S002497', 'B3-BU-49', 'BU', 49, false),
    ('S002498', 'B3-BU-50', 'BU', 50, false),
    ('S002499', 'B3-BU-51', 'BU', 51, false),
    ('S002500', 'B3-BU-52', 'BU', 52, false),
    ('S002501', 'B3-BU-53', 'BU', 53, false),
    ('S002502', 'B3-BU-54', 'BU', 54, false),
    ('S002503', 'B3-BU-55', 'BU', 55, false),
    ('S002504', 'B3-BU-56', 'BU', 56, false),
    ('S002505', 'B3-BU-57', 'BU', 57, false),
    ('S002506', 'B3-BU-58', 'BU', 58, false),
    ('S002507', 'B3-BU-59', 'BU', 59, false),
    ('S002508', 'B3-BU-60', 'BU', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BV (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002509', 'B3-BV-37', 'BV', 37, false),
    ('S002510', 'B3-BV-38', 'BV', 38, false),
    ('S002511', 'B3-BV-39', 'BV', 39, false),
    ('S002512', 'B3-BV-40', 'BV', 40, false),
    ('S002513', 'B3-BV-41', 'BV', 41, false),
    ('S002514', 'B3-BV-42', 'BV', 42, false),
    ('S002515', 'B3-BV-43', 'BV', 43, false),
    ('S002516', 'B3-BV-44', 'BV', 44, false),
    ('S002517', 'B3-BV-45', 'BV', 45, false),
    ('S002518', 'B3-BV-46', 'BV', 46, false),
    ('S002519', 'B3-BV-47', 'BV', 47, false),
    ('S002520', 'B3-BV-48', 'BV', 48, false),
    ('S002521', 'B3-BV-49', 'BV', 49, false),
    ('S002522', 'B3-BV-50', 'BV', 50, false),
    ('S002523', 'B3-BV-51', 'BV', 51, false),
    ('S002524', 'B3-BV-52', 'BV', 52, false),
    ('S002525', 'B3-BV-53', 'BV', 53, false),
    ('S002526', 'B3-BV-54', 'BV', 54, false),
    ('S002527', 'B3-BV-55', 'BV', 55, false),
    ('S002528', 'B3-BV-56', 'BV', 56, false),
    ('S002529', 'B3-BV-57', 'BV', 57, false),
    ('S002530', 'B3-BV-58', 'BV', 58, false),
    ('S002531', 'B3-BV-59', 'BV', 59, false),
    ('S002532', 'B3-BV-60', 'BV', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BW (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002533', 'B3-BW-37', 'BW', 37, false),
    ('S002534', 'B3-BW-38', 'BW', 38, false),
    ('S002535', 'B3-BW-39', 'BW', 39, false),
    ('S002536', 'B3-BW-40', 'BW', 40, false),
    ('S002537', 'B3-BW-41', 'BW', 41, false),
    ('S002538', 'B3-BW-42', 'BW', 42, false),
    ('S002539', 'B3-BW-43', 'BW', 43, false),
    ('S002540', 'B3-BW-44', 'BW', 44, false),
    ('S002541', 'B3-BW-45', 'BW', 45, false),
    ('S002542', 'B3-BW-46', 'BW', 46, false),
    ('S002543', 'B3-BW-47', 'BW', 47, false),
    ('S002544', 'B3-BW-48', 'BW', 48, false),
    ('S002545', 'B3-BW-49', 'BW', 49, false),
    ('S002546', 'B3-BW-50', 'BW', 50, false),
    ('S002547', 'B3-BW-51', 'BW', 51, false),
    ('S002548', 'B3-BW-52', 'BW', 52, false),
    ('S002549', 'B3-BW-53', 'BW', 53, false),
    ('S002550', 'B3-BW-54', 'BW', 54, false),
    ('S002551', 'B3-BW-55', 'BW', 55, false),
    ('S002552', 'B3-BW-56', 'BW', 56, false),
    ('S002553', 'B3-BW-57', 'BW', 57, false),
    ('S002554', 'B3-BW-58', 'BW', 58, false),
    ('S002555', 'B3-BW-59', 'BW', 59, false),
    ('S002556', 'B3-BW-60', 'BW', 60, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE B4 (244 seats)
-- Row BA (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002557', 'B4-BA-64', 'BA', 64, false),
    ('S002558', 'B4-BA-65', 'BA', 65, false),
    ('S002559', 'B4-BA-66', 'BA', 66, false),
    ('S002560', 'B4-BA-67', 'BA', 67, false),
    ('S002561', 'B4-BA-68', 'BA', 68, false),
    ('S002562', 'B4-BA-69', 'BA', 69, false),
    ('S002563', 'B4-BA-70', 'BA', 70, false),
    ('S002564', 'B4-BA-71', 'BA', 71, false),
    ('S002565', 'B4-BA-72', 'BA', 72, false),
    ('S002566', 'B4-BA-73', 'BA', 73, false),
    ('S002567', 'B4-BA-74', 'BA', 74, false),
    ('S002568', 'B4-BA-75', 'BA', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BB (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002569', 'B4-BB-64', 'BB', 64, false),
    ('S002570', 'B4-BB-65', 'BB', 65, false),
    ('S002571', 'B4-BB-66', 'BB', 66, false),
    ('S002572', 'B4-BB-67', 'BB', 67, false),
    ('S002573', 'B4-BB-68', 'BB', 68, false),
    ('S002574', 'B4-BB-69', 'BB', 69, false),
    ('S002575', 'B4-BB-70', 'BB', 70, false),
    ('S002576', 'B4-BB-71', 'BB', 71, false),
    ('S002577', 'B4-BB-72', 'BB', 72, false),
    ('S002578', 'B4-BB-73', 'BB', 73, false),
    ('S002579', 'B4-BB-74', 'BB', 74, false),
    ('S002580', 'B4-BB-75', 'BB', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BC (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002581', 'B4-BC-64', 'BC', 64, false),
    ('S002582', 'B4-BC-65', 'BC', 65, false),
    ('S002583', 'B4-BC-66', 'BC', 66, false),
    ('S002584', 'B4-BC-67', 'BC', 67, false),
    ('S002585', 'B4-BC-68', 'BC', 68, false),
    ('S002586', 'B4-BC-69', 'BC', 69, false),
    ('S002587', 'B4-BC-70', 'BC', 70, false),
    ('S002588', 'B4-BC-71', 'BC', 71, false),
    ('S002589', 'B4-BC-72', 'BC', 72, false),
    ('S002590', 'B4-BC-73', 'BC', 73, false),
    ('S002591', 'B4-BC-74', 'BC', 74, false),
    ('S002592', 'B4-BC-75', 'BC', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BD (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002593', 'B4-BD-64', 'BD', 64, false),
    ('S002594', 'B4-BD-65', 'BD', 65, false),
    ('S002595', 'B4-BD-66', 'BD', 66, false),
    ('S002596', 'B4-BD-67', 'BD', 67, false),
    ('S002597', 'B4-BD-68', 'BD', 68, false),
    ('S002598', 'B4-BD-69', 'BD', 69, false),
    ('S002599', 'B4-BD-70', 'BD', 70, false),
    ('S002600', 'B4-BD-71', 'BD', 71, false),
    ('S002601', 'B4-BD-72', 'BD', 72, false),
    ('S002602', 'B4-BD-73', 'BD', 73, false),
    ('S002603', 'B4-BD-74', 'BD', 74, false),
    ('S002604', 'B4-BD-75', 'BD', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BE (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002605', 'B4-BE-64', 'BE', 64, false),
    ('S002606', 'B4-BE-65', 'BE', 65, false),
    ('S002607', 'B4-BE-66', 'BE', 66, false),
    ('S002608', 'B4-BE-67', 'BE', 67, false),
    ('S002609', 'B4-BE-68', 'BE', 68, false),
    ('S002610', 'B4-BE-69', 'BE', 69, false),
    ('S002611', 'B4-BE-70', 'BE', 70, false),
    ('S002612', 'B4-BE-71', 'BE', 71, false),
    ('S002613', 'B4-BE-72', 'BE', 72, false),
    ('S002614', 'B4-BE-73', 'BE', 73, false),
    ('S002615', 'B4-BE-74', 'BE', 74, false),
    ('S002616', 'B4-BE-75', 'BE', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BF (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002617', 'B4-BF-64', 'BF', 64, false),
    ('S002618', 'B4-BF-65', 'BF', 65, false),
    ('S002619', 'B4-BF-66', 'BF', 66, false),
    ('S002620', 'B4-BF-67', 'BF', 67, false),
    ('S002621', 'B4-BF-68', 'BF', 68, false),
    ('S002622', 'B4-BF-69', 'BF', 69, false),
    ('S002623', 'B4-BF-70', 'BF', 70, false),
    ('S002624', 'B4-BF-71', 'BF', 71, false),
    ('S002625', 'B4-BF-72', 'BF', 72, false),
    ('S002626', 'B4-BF-73', 'BF', 73, false),
    ('S002627', 'B4-BF-74', 'BF', 74, false),
    ('S002628', 'B4-BF-75', 'BF', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BG (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002629', 'B4-BG-64', 'BG', 64, false),
    ('S002630', 'B4-BG-65', 'BG', 65, false),
    ('S002631', 'B4-BG-66', 'BG', 66, false),
    ('S002632', 'B4-BG-67', 'BG', 67, false),
    ('S002633', 'B4-BG-68', 'BG', 68, false),
    ('S002634', 'B4-BG-69', 'BG', 69, false),
    ('S002635', 'B4-BG-70', 'BG', 70, false),
    ('S002636', 'B4-BG-71', 'BG', 71, false),
    ('S002637', 'B4-BG-72', 'BG', 72, false),
    ('S002638', 'B4-BG-73', 'BG', 73, false),
    ('S002639', 'B4-BG-74', 'BG', 74, false),
    ('S002640', 'B4-BG-75', 'BG', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BH (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002641', 'B4-BH-64', 'BH', 64, false),
    ('S002642', 'B4-BH-65', 'BH', 65, false),
    ('S002643', 'B4-BH-66', 'BH', 66, false),
    ('S002644', 'B4-BH-67', 'BH', 67, false),
    ('S002645', 'B4-BH-68', 'BH', 68, false),
    ('S002646', 'B4-BH-69', 'BH', 69, false),
    ('S002647', 'B4-BH-70', 'BH', 70, false),
    ('S002648', 'B4-BH-71', 'BH', 71, false),
    ('S002649', 'B4-BH-72', 'BH', 72, false),
    ('S002650', 'B4-BH-73', 'BH', 73, false),
    ('S002651', 'B4-BH-74', 'BH', 74, false),
    ('S002652', 'B4-BH-75', 'BH', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BJ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002653', 'B4-BJ-64', 'BJ', 64, false),
    ('S002654', 'B4-BJ-65', 'BJ', 65, false),
    ('S002655', 'B4-BJ-66', 'BJ', 66, false),
    ('S002656', 'B4-BJ-67', 'BJ', 67, false),
    ('S002657', 'B4-BJ-68', 'BJ', 68, false),
    ('S002658', 'B4-BJ-69', 'BJ', 69, false),
    ('S002659', 'B4-BJ-70', 'BJ', 70, false),
    ('S002660', 'B4-BJ-71', 'BJ', 71, false),
    ('S002661', 'B4-BJ-72', 'BJ', 72, false),
    ('S002662', 'B4-BJ-73', 'BJ', 73, false),
    ('S002663', 'B4-BJ-74', 'BJ', 74, false),
    ('S002664', 'B4-BJ-75', 'BJ', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BK (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002665', 'B4-BK-64', 'BK', 64, false),
    ('S002666', 'B4-BK-65', 'BK', 65, false),
    ('S002667', 'B4-BK-66', 'BK', 66, false),
    ('S002668', 'B4-BK-67', 'BK', 67, false),
    ('S002669', 'B4-BK-68', 'BK', 68, false),
    ('S002670', 'B4-BK-69', 'BK', 69, false),
    ('S002671', 'B4-BK-70', 'BK', 70, false),
    ('S002672', 'B4-BK-71', 'BK', 71, false),
    ('S002673', 'B4-BK-72', 'BK', 72, false),
    ('S002674', 'B4-BK-73', 'BK', 73, false),
    ('S002675', 'B4-BK-74', 'BK', 74, false),
    ('S002676', 'B4-BK-75', 'BK', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BL (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002677', 'B4-BL-64', 'BL', 64, false),
    ('S002678', 'B4-BL-65', 'BL', 65, false),
    ('S002679', 'B4-BL-66', 'BL', 66, false),
    ('S002680', 'B4-BL-67', 'BL', 67, false),
    ('S002681', 'B4-BL-68', 'BL', 68, false),
    ('S002682', 'B4-BL-69', 'BL', 69, false),
    ('S002683', 'B4-BL-70', 'BL', 70, false),
    ('S002684', 'B4-BL-71', 'BL', 71, false),
    ('S002685', 'B4-BL-72', 'BL', 72, false),
    ('S002686', 'B4-BL-73', 'BL', 73, false),
    ('S002687', 'B4-BL-74', 'BL', 74, false),
    ('S002688', 'B4-BL-75', 'BL', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BM (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002689', 'B4-BM-64', 'BM', 64, false),
    ('S002690', 'B4-BM-65', 'BM', 65, false),
    ('S002691', 'B4-BM-66', 'BM', 66, false),
    ('S002692', 'B4-BM-67', 'BM', 67, false),
    ('S002693', 'B4-BM-68', 'BM', 68, false),
    ('S002694', 'B4-BM-69', 'BM', 69, false),
    ('S002695', 'B4-BM-70', 'BM', 70, false),
    ('S002696', 'B4-BM-71', 'BM', 71, false),
    ('S002697', 'B4-BM-72', 'BM', 72, false),
    ('S002698', 'B4-BM-73', 'BM', 73, false),
    ('S002699', 'B4-BM-74', 'BM', 74, false),
    ('S002700', 'B4-BM-75', 'BM', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BN (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002701', 'B4-BN-64', 'BN', 64, false),
    ('S002702', 'B4-BN-65', 'BN', 65, false),
    ('S002703', 'B4-BN-66', 'BN', 66, false),
    ('S002704', 'B4-BN-67', 'BN', 67, false),
    ('S002705', 'B4-BN-68', 'BN', 68, false),
    ('S002706', 'B4-BN-69', 'BN', 69, false),
    ('S002707', 'B4-BN-70', 'BN', 70, false),
    ('S002708', 'B4-BN-71', 'BN', 71, false),
    ('S002709', 'B4-BN-72', 'BN', 72, false),
    ('S002710', 'B4-BN-73', 'BN', 73, false),
    ('S002711', 'B4-BN-74', 'BN', 74, false),
    ('S002712', 'B4-BN-75', 'BN', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BP (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002713', 'B4-BP-64', 'BP', 64, false),
    ('S002714', 'B4-BP-65', 'BP', 65, false),
    ('S002715', 'B4-BP-66', 'BP', 66, false),
    ('S002716', 'B4-BP-67', 'BP', 67, false),
    ('S002717', 'B4-BP-68', 'BP', 68, false),
    ('S002718', 'B4-BP-69', 'BP', 69, false),
    ('S002719', 'B4-BP-70', 'BP', 70, false),
    ('S002720', 'B4-BP-71', 'BP', 71, false),
    ('S002721', 'B4-BP-72', 'BP', 72, false),
    ('S002722', 'B4-BP-73', 'BP', 73, false),
    ('S002723', 'B4-BP-74', 'BP', 74, false),
    ('S002724', 'B4-BP-75', 'BP', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BQ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002725', 'B4-BQ-64', 'BQ', 64, false),
    ('S002726', 'B4-BQ-65', 'BQ', 65, false),
    ('S002727', 'B4-BQ-66', 'BQ', 66, false),
    ('S002728', 'B4-BQ-67', 'BQ', 67, false),
    ('S002729', 'B4-BQ-68', 'BQ', 68, false),
    ('S002730', 'B4-BQ-69', 'BQ', 69, false),
    ('S002731', 'B4-BQ-70', 'BQ', 70, false),
    ('S002732', 'B4-BQ-71', 'BQ', 71, false),
    ('S002733', 'B4-BQ-72', 'BQ', 72, false),
    ('S002734', 'B4-BQ-73', 'BQ', 73, false),
    ('S002735', 'B4-BQ-74', 'BQ', 74, false),
    ('S002736', 'B4-BQ-75', 'BQ', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BR (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002737', 'B4-BR-64', 'BR', 64, false),
    ('S002738', 'B4-BR-65', 'BR', 65, false),
    ('S002739', 'B4-BR-66', 'BR', 66, false),
    ('S002740', 'B4-BR-67', 'BR', 67, false),
    ('S002741', 'B4-BR-68', 'BR', 68, false),
    ('S002742', 'B4-BR-69', 'BR', 69, false),
    ('S002743', 'B4-BR-70', 'BR', 70, false),
    ('S002744', 'B4-BR-71', 'BR', 71, false),
    ('S002745', 'B4-BR-72', 'BR', 72, false),
    ('S002746', 'B4-BR-73', 'BR', 73, false),
    ('S002747', 'B4-BR-74', 'BR', 74, false),
    ('S002748', 'B4-BR-75', 'BR', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BS (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002749', 'B4-BS-64', 'BS', 64, false),
    ('S002750', 'B4-BS-65', 'BS', 65, false),
    ('S002751', 'B4-BS-66', 'BS', 66, false),
    ('S002752', 'B4-BS-67', 'BS', 67, false),
    ('S002753', 'B4-BS-68', 'BS', 68, false),
    ('S002754', 'B4-BS-69', 'BS', 69, false),
    ('S002755', 'B4-BS-70', 'BS', 70, false),
    ('S002756', 'B4-BS-71', 'BS', 71, false),
    ('S002757', 'B4-BS-72', 'BS', 72, false),
    ('S002758', 'B4-BS-73', 'BS', 73, false),
    ('S002759', 'B4-BS-74', 'BS', 74, false),
    ('S002760', 'B4-BS-75', 'BS', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BT (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002761', 'B4-BT-64', 'BT', 64, false),
    ('S002762', 'B4-BT-65', 'BT', 65, false),
    ('S002763', 'B4-BT-66', 'BT', 66, false),
    ('S002764', 'B4-BT-67', 'BT', 67, false),
    ('S002765', 'B4-BT-68', 'BT', 68, false),
    ('S002766', 'B4-BT-69', 'BT', 69, false),
    ('S002767', 'B4-BT-70', 'BT', 70, false),
    ('S002768', 'B4-BT-71', 'BT', 71, false),
    ('S002769', 'B4-BT-72', 'BT', 72, false),
    ('S002770', 'B4-BT-73', 'BT', 73, false),
    ('S002771', 'B4-BT-74', 'BT', 74, false),
    ('S002772', 'B4-BT-75', 'BT', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BU (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002773', 'B4-BU-64', 'BU', 64, false),
    ('S002774', 'B4-BU-65', 'BU', 65, false),
    ('S002775', 'B4-BU-66', 'BU', 66, false),
    ('S002776', 'B4-BU-67', 'BU', 67, false),
    ('S002777', 'B4-BU-68', 'BU', 68, false),
    ('S002778', 'B4-BU-69', 'BU', 69, false),
    ('S002779', 'B4-BU-70', 'BU', 70, false),
    ('S002780', 'B4-BU-71', 'BU', 71, false),
    ('S002781', 'B4-BU-72', 'BU', 72, false),
    ('S002782', 'B4-BU-73', 'BU', 73, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BV (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002783', 'B4-BV-64', 'BV', 64, false),
    ('S002784', 'B4-BV-65', 'BV', 65, false),
    ('S002785', 'B4-BV-66', 'BV', 66, false),
    ('S002786', 'B4-BV-67', 'BV', 67, false),
    ('S002787', 'B4-BV-68', 'BV', 68, false),
    ('S002788', 'B4-BV-69', 'BV', 69, false),
    ('S002789', 'B4-BV-70', 'BV', 70, false),
    ('S002790', 'B4-BV-71', 'BV', 71, false),
    ('S002791', 'B4-BV-72', 'BV', 72, false),
    ('S002792', 'B4-BV-73', 'BV', 73, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BW (8 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002793', 'B4-BW-64', 'BW', 64, false),
    ('S002794', 'B4-BW-65', 'BW', 65, false),
    ('S002795', 'B4-BW-66', 'BW', 66, false),
    ('S002796', 'B4-BW-67', 'BW', 67, false),
    ('S002797', 'B4-BW-68', 'BW', 68, false),
    ('S002798', 'B4-BW-69', 'BW', 69, false),
    ('S002799', 'B4-BW-70', 'BW', 70, false),
    ('S002800', 'B4-BW-71', 'BW', 71, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE VL (37 seats)
-- Row Row_60 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002801', 'VL-Row_60-01', 'Row_60', 1, false),
    ('S002802', 'VL-Row_60-02', 'Row_60', 2, false),
    ('S002803', 'VL-Row_60-03', 'Row_60', 3, false),
    ('S002804', 'VL-Row_60-04', 'Row_60', 4, false),
    ('S002805', 'VL-Row_60-05', 'Row_60', 5, false),
    ('S002806', 'VL-Row_60-06', 'Row_60', 6, false),
    ('S002807', 'VL-Row_60-07', 'Row_60', 7, false),
    ('S002808', 'VL-Row_60-08', 'Row_60', 8, false),
    ('S002809', 'VL-Row_60-09', 'Row_60', 9, false),
    ('S002810', 'VL-Row_60-10', 'Row_60', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_62 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002811', 'VL-Row_62-01', 'Row_62', 1, false),
    ('S002812', 'VL-Row_62-02', 'Row_62', 2, false),
    ('S002813', 'VL-Row_62-03', 'Row_62', 3, false),
    ('S002814', 'VL-Row_62-04', 'Row_62', 4, false),
    ('S002815', 'VL-Row_62-05', 'Row_62', 5, false),
    ('S002816', 'VL-Row_62-06', 'Row_62', 6, false),
    ('S002817', 'VL-Row_62-07', 'Row_62', 7, false),
    ('S002818', 'VL-Row_62-08', 'Row_62', 8, false),
    ('S002819', 'VL-Row_62-09', 'Row_62', 9, false),
    ('S002820', 'VL-Row_62-10', 'Row_62', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_63 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002821', 'VL-Row_63-01', 'Row_63', 1, false),
    ('S002822', 'VL-Row_63-02', 'Row_63', 2, false),
    ('S002823', 'VL-Row_63-03', 'Row_63', 3, false),
    ('S002824', 'VL-Row_63-04', 'Row_63', 4, false),
    ('S002825', 'VL-Row_63-05', 'Row_63', 5, false),
    ('S002826', 'VL-Row_63-06', 'Row_63', 6, false),
    ('S002827', 'VL-Row_63-07', 'Row_63', 7, false),
    ('S002828', 'VL-Row_63-08', 'Row_63', 8, false),
    ('S002829', 'VL-Row_63-09', 'Row_63', 9, false),
    ('S002830', 'VL-Row_63-10', 'Row_63', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_64 (7 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002831', 'VL-Row_64-04', 'Row_64', 4, false),
    ('S002832', 'VL-Row_64-05', 'Row_64', 5, false),
    ('S002833', 'VL-Row_64-06', 'Row_64', 6, false),
    ('S002834', 'VL-Row_64-07', 'Row_64', 7, false),
    ('S002835', 'VL-Row_64-08', 'Row_64', 8, false),
    ('S002836', 'VL-Row_64-09', 'Row_64', 9, false),
    ('S002837', 'VL-Row_64-10', 'Row_64', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VL'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE FF (91 seats)
-- Row Row_60 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002838', 'FF-Row_60-01', 'Row_60', 1, false),
    ('S002839', 'FF-Row_60-02', 'Row_60', 2, false),
    ('S002840', 'FF-Row_60-03', 'Row_60', 3, false),
    ('S002841', 'FF-Row_60-04', 'Row_60', 4, false),
    ('S002842', 'FF-Row_60-05', 'Row_60', 5, false),
    ('S002843', 'FF-Row_60-06', 'Row_60', 6, false),
    ('S002844', 'FF-Row_60-07', 'Row_60', 7, false),
    ('S002845', 'FF-Row_60-08', 'Row_60', 8, false),
    ('S002846', 'FF-Row_60-09', 'Row_60', 9, false),
    ('S002847', 'FF-Row_60-10', 'Row_60', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_61 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002848', 'FF-Row_61-01', 'Row_61', 1, false),
    ('S002849', 'FF-Row_61-02', 'Row_61', 2, false),
    ('S002850', 'FF-Row_61-03', 'Row_61', 3, false),
    ('S002851', 'FF-Row_61-04', 'Row_61', 4, false),
    ('S002852', 'FF-Row_61-05', 'Row_61', 5, false),
    ('S002853', 'FF-Row_61-06', 'Row_61', 6, false),
    ('S002854', 'FF-Row_61-07', 'Row_61', 7, false),
    ('S002855', 'FF-Row_61-08', 'Row_61', 8, false),
    ('S002856', 'FF-Row_61-09', 'Row_61', 9, false),
    ('S002857', 'FF-Row_61-10', 'Row_61', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_62 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002858', 'FF-Row_62-01', 'Row_62', 1, false),
    ('S002859', 'FF-Row_62-02', 'Row_62', 2, false),
    ('S002860', 'FF-Row_62-03', 'Row_62', 3, false),
    ('S002861', 'FF-Row_62-04', 'Row_62', 4, false),
    ('S002862', 'FF-Row_62-05', 'Row_62', 5, false),
    ('S002863', 'FF-Row_62-06', 'Row_62', 6, false),
    ('S002864', 'FF-Row_62-07', 'Row_62', 7, false),
    ('S002865', 'FF-Row_62-08', 'Row_62', 8, false),
    ('S002866', 'FF-Row_62-09', 'Row_62', 9, false),
    ('S002867', 'FF-Row_62-10', 'Row_62', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_63 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002868', 'FF-Row_63-01', 'Row_63', 1, false),
    ('S002869', 'FF-Row_63-02', 'Row_63', 2, false),
    ('S002870', 'FF-Row_63-03', 'Row_63', 3, false),
    ('S002871', 'FF-Row_63-04', 'Row_63', 4, false),
    ('S002872', 'FF-Row_63-05', 'Row_63', 5, false),
    ('S002873', 'FF-Row_63-06', 'Row_63', 6, false),
    ('S002874', 'FF-Row_63-07', 'Row_63', 7, false),
    ('S002875', 'FF-Row_63-08', 'Row_63', 8, false),
    ('S002876', 'FF-Row_63-09', 'Row_63', 9, false),
    ('S002877', 'FF-Row_63-10', 'Row_63', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_64 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002878', 'FF-Row_64-01', 'Row_64', 1, false),
    ('S002879', 'FF-Row_64-02', 'Row_64', 2, false),
    ('S002880', 'FF-Row_64-03', 'Row_64', 3, false),
    ('S002881', 'FF-Row_64-04', 'Row_64', 4, false),
    ('S002882', 'FF-Row_64-05', 'Row_64', 5, false),
    ('S002883', 'FF-Row_64-06', 'Row_64', 6, false),
    ('S002884', 'FF-Row_64-07', 'Row_64', 7, false),
    ('S002885', 'FF-Row_64-08', 'Row_64', 8, false),
    ('S002886', 'FF-Row_64-09', 'Row_64', 9, false),
    ('S002887', 'FF-Row_64-10', 'Row_64', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_65 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002888', 'FF-Row_65-01', 'Row_65', 1, false),
    ('S002889', 'FF-Row_65-02', 'Row_65', 2, false),
    ('S002890', 'FF-Row_65-03', 'Row_65', 3, false),
    ('S002891', 'FF-Row_65-04', 'Row_65', 4, false),
    ('S002892', 'FF-Row_65-05', 'Row_65', 5, false),
    ('S002893', 'FF-Row_65-06', 'Row_65', 6, false),
    ('S002894', 'FF-Row_65-07', 'Row_65', 7, false),
    ('S002895', 'FF-Row_65-08', 'Row_65', 8, false),
    ('S002896', 'FF-Row_65-09', 'Row_65', 9, false),
    ('S002897', 'FF-Row_65-10', 'Row_65', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_66 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002898', 'FF-Row_66-01', 'Row_66', 1, false),
    ('S002899', 'FF-Row_66-02', 'Row_66', 2, false),
    ('S002900', 'FF-Row_66-03', 'Row_66', 3, false),
    ('S002901', 'FF-Row_66-04', 'Row_66', 4, false),
    ('S002902', 'FF-Row_66-05', 'Row_66', 5, false),
    ('S002903', 'FF-Row_66-06', 'Row_66', 6, false),
    ('S002904', 'FF-Row_66-07', 'Row_66', 7, false),
    ('S002905', 'FF-Row_66-08', 'Row_66', 8, false),
    ('S002906', 'FF-Row_66-09', 'Row_66', 9, false),
    ('S002907', 'FF-Row_66-10', 'Row_66', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_67 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002908', 'FF-Row_67-01', 'Row_67', 1, false),
    ('S002909', 'FF-Row_67-02', 'Row_67', 2, false),
    ('S002910', 'FF-Row_67-03', 'Row_67', 3, false),
    ('S002911', 'FF-Row_67-04', 'Row_67', 4, false),
    ('S002912', 'FF-Row_67-05', 'Row_67', 5, false),
    ('S002913', 'FF-Row_67-06', 'Row_67', 6, false),
    ('S002914', 'FF-Row_67-07', 'Row_67', 7, false),
    ('S002915', 'FF-Row_67-08', 'Row_67', 8, false),
    ('S002916', 'FF-Row_67-09', 'Row_67', 9, false),
    ('S002917', 'FF-Row_67-10', 'Row_67', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_68 (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002918', 'FF-Row_68-01', 'Row_68', 1, false),
    ('S002919', 'FF-Row_68-02', 'Row_68', 2, false),
    ('S002920', 'FF-Row_68-03', 'Row_68', 3, false),
    ('S002921', 'FF-Row_68-04', 'Row_68', 4, false),
    ('S002922', 'FF-Row_68-05', 'Row_68', 5, false),
    ('S002923', 'FF-Row_68-06', 'Row_68', 6, false),
    ('S002924', 'FF-Row_68-07', 'Row_68', 7, false),
    ('S002925', 'FF-Row_68-08', 'Row_68', 8, false),
    ('S002926', 'FF-Row_68-09', 'Row_68', 9, false),
    ('S002927', 'FF-Row_68-10', 'Row_68', 10, false),
    ('S002928', 'FF-Row_68-11', 'Row_68', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE FF'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE HH (91 seats)
-- Row Row_60 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002929', 'HH-Row_60-01', 'Row_60', 1, false),
    ('S002930', 'HH-Row_60-02', 'Row_60', 2, false),
    ('S002931', 'HH-Row_60-03', 'Row_60', 3, false),
    ('S002932', 'HH-Row_60-04', 'Row_60', 4, false),
    ('S002933', 'HH-Row_60-05', 'Row_60', 5, false),
    ('S002934', 'HH-Row_60-06', 'Row_60', 6, false),
    ('S002935', 'HH-Row_60-07', 'Row_60', 7, false),
    ('S002936', 'HH-Row_60-08', 'Row_60', 8, false),
    ('S002937', 'HH-Row_60-09', 'Row_60', 9, false),
    ('S002938', 'HH-Row_60-10', 'Row_60', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_61 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002939', 'HH-Row_61-01', 'Row_61', 1, false),
    ('S002940', 'HH-Row_61-02', 'Row_61', 2, false),
    ('S002941', 'HH-Row_61-03', 'Row_61', 3, false),
    ('S002942', 'HH-Row_61-04', 'Row_61', 4, false),
    ('S002943', 'HH-Row_61-05', 'Row_61', 5, false),
    ('S002944', 'HH-Row_61-06', 'Row_61', 6, false),
    ('S002945', 'HH-Row_61-07', 'Row_61', 7, false),
    ('S002946', 'HH-Row_61-08', 'Row_61', 8, false),
    ('S002947', 'HH-Row_61-09', 'Row_61', 9, false),
    ('S002948', 'HH-Row_61-10', 'Row_61', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_62 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002949', 'HH-Row_62-01', 'Row_62', 1, false),
    ('S002950', 'HH-Row_62-02', 'Row_62', 2, false),
    ('S002951', 'HH-Row_62-03', 'Row_62', 3, false),
    ('S002952', 'HH-Row_62-04', 'Row_62', 4, false),
    ('S002953', 'HH-Row_62-05', 'Row_62', 5, false),
    ('S002954', 'HH-Row_62-06', 'Row_62', 6, false),
    ('S002955', 'HH-Row_62-07', 'Row_62', 7, false),
    ('S002956', 'HH-Row_62-08', 'Row_62', 8, false),
    ('S002957', 'HH-Row_62-09', 'Row_62', 9, false),
    ('S002958', 'HH-Row_62-10', 'Row_62', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_63 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002959', 'HH-Row_63-01', 'Row_63', 1, false),
    ('S002960', 'HH-Row_63-02', 'Row_63', 2, false),
    ('S002961', 'HH-Row_63-03', 'Row_63', 3, false),
    ('S002962', 'HH-Row_63-04', 'Row_63', 4, false),
    ('S002963', 'HH-Row_63-05', 'Row_63', 5, false),
    ('S002964', 'HH-Row_63-06', 'Row_63', 6, false),
    ('S002965', 'HH-Row_63-07', 'Row_63', 7, false),
    ('S002966', 'HH-Row_63-08', 'Row_63', 8, false),
    ('S002967', 'HH-Row_63-09', 'Row_63', 9, false),
    ('S002968', 'HH-Row_63-10', 'Row_63', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_64 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002969', 'HH-Row_64-01', 'Row_64', 1, false),
    ('S002970', 'HH-Row_64-02', 'Row_64', 2, false),
    ('S002971', 'HH-Row_64-03', 'Row_64', 3, false),
    ('S002972', 'HH-Row_64-04', 'Row_64', 4, false),
    ('S002973', 'HH-Row_64-05', 'Row_64', 5, false),
    ('S002974', 'HH-Row_64-06', 'Row_64', 6, false),
    ('S002975', 'HH-Row_64-07', 'Row_64', 7, false),
    ('S002976', 'HH-Row_64-08', 'Row_64', 8, false),
    ('S002977', 'HH-Row_64-09', 'Row_64', 9, false),
    ('S002978', 'HH-Row_64-10', 'Row_64', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_65 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002979', 'HH-Row_65-01', 'Row_65', 1, false),
    ('S002980', 'HH-Row_65-02', 'Row_65', 2, false),
    ('S002981', 'HH-Row_65-03', 'Row_65', 3, false),
    ('S002982', 'HH-Row_65-04', 'Row_65', 4, false),
    ('S002983', 'HH-Row_65-05', 'Row_65', 5, false),
    ('S002984', 'HH-Row_65-06', 'Row_65', 6, false),
    ('S002985', 'HH-Row_65-07', 'Row_65', 7, false),
    ('S002986', 'HH-Row_65-08', 'Row_65', 8, false),
    ('S002987', 'HH-Row_65-09', 'Row_65', 9, false),
    ('S002988', 'HH-Row_65-10', 'Row_65', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_66 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002989', 'HH-Row_66-01', 'Row_66', 1, false),
    ('S002990', 'HH-Row_66-02', 'Row_66', 2, false),
    ('S002991', 'HH-Row_66-03', 'Row_66', 3, false),
    ('S002992', 'HH-Row_66-04', 'Row_66', 4, false),
    ('S002993', 'HH-Row_66-05', 'Row_66', 5, false),
    ('S002994', 'HH-Row_66-06', 'Row_66', 6, false),
    ('S002995', 'HH-Row_66-07', 'Row_66', 7, false),
    ('S002996', 'HH-Row_66-08', 'Row_66', 8, false),
    ('S002997', 'HH-Row_66-09', 'Row_66', 9, false),
    ('S002998', 'HH-Row_66-10', 'Row_66', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_67 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S002999', 'HH-Row_67-01', 'Row_67', 1, false),
    ('S003000', 'HH-Row_67-02', 'Row_67', 2, false),
    ('S003001', 'HH-Row_67-03', 'Row_67', 3, false),
    ('S003002', 'HH-Row_67-04', 'Row_67', 4, false),
    ('S003003', 'HH-Row_67-05', 'Row_67', 5, false),
    ('S003004', 'HH-Row_67-06', 'Row_67', 6, false),
    ('S003005', 'HH-Row_67-07', 'Row_67', 7, false),
    ('S003006', 'HH-Row_67-08', 'Row_67', 8, false),
    ('S003007', 'HH-Row_67-09', 'Row_67', 9, false),
    ('S003008', 'HH-Row_67-10', 'Row_67', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_68 (11 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003009', 'HH-Row_68-01', 'Row_68', 1, false),
    ('S003010', 'HH-Row_68-02', 'Row_68', 2, false),
    ('S003011', 'HH-Row_68-03', 'Row_68', 3, false),
    ('S003012', 'HH-Row_68-04', 'Row_68', 4, false),
    ('S003013', 'HH-Row_68-05', 'Row_68', 5, false),
    ('S003014', 'HH-Row_68-06', 'Row_68', 6, false),
    ('S003015', 'HH-Row_68-07', 'Row_68', 7, false),
    ('S003016', 'HH-Row_68-08', 'Row_68', 8, false),
    ('S003017', 'HH-Row_68-09', 'Row_68', 9, false),
    ('S003018', 'HH-Row_68-10', 'Row_68', 10, false),
    ('S003019', 'HH-Row_68-11', 'Row_68', 11, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE HH'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE VR (37 seats)
-- Row Row_60 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003020', 'VR-Row_60-01', 'Row_60', 1, false),
    ('S003021', 'VR-Row_60-02', 'Row_60', 2, false),
    ('S003022', 'VR-Row_60-03', 'Row_60', 3, false),
    ('S003023', 'VR-Row_60-04', 'Row_60', 4, false),
    ('S003024', 'VR-Row_60-05', 'Row_60', 5, false),
    ('S003025', 'VR-Row_60-06', 'Row_60', 6, false),
    ('S003026', 'VR-Row_60-07', 'Row_60', 7, false),
    ('S003027', 'VR-Row_60-08', 'Row_60', 8, false),
    ('S003028', 'VR-Row_60-09', 'Row_60', 9, false),
    ('S003029', 'VR-Row_60-10', 'Row_60', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VR'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_62 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003030', 'VR-Row_62-01', 'Row_62', 1, false),
    ('S003031', 'VR-Row_62-02', 'Row_62', 2, false),
    ('S003032', 'VR-Row_62-03', 'Row_62', 3, false),
    ('S003033', 'VR-Row_62-04', 'Row_62', 4, false),
    ('S003034', 'VR-Row_62-05', 'Row_62', 5, false),
    ('S003035', 'VR-Row_62-06', 'Row_62', 6, false),
    ('S003036', 'VR-Row_62-07', 'Row_62', 7, false),
    ('S003037', 'VR-Row_62-08', 'Row_62', 8, false),
    ('S003038', 'VR-Row_62-09', 'Row_62', 9, false),
    ('S003039', 'VR-Row_62-10', 'Row_62', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VR'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_63 (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003040', 'VR-Row_63-01', 'Row_63', 1, false),
    ('S003041', 'VR-Row_63-02', 'Row_63', 2, false),
    ('S003042', 'VR-Row_63-03', 'Row_63', 3, false),
    ('S003043', 'VR-Row_63-04', 'Row_63', 4, false),
    ('S003044', 'VR-Row_63-05', 'Row_63', 5, false),
    ('S003045', 'VR-Row_63-06', 'Row_63', 6, false),
    ('S003046', 'VR-Row_63-07', 'Row_63', 7, false),
    ('S003047', 'VR-Row_63-08', 'Row_63', 8, false),
    ('S003048', 'VR-Row_63-09', 'Row_63', 9, false),
    ('S003049', 'VR-Row_63-10', 'Row_63', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VR'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Row_64 (7 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003050', 'VR-Row_64-01', 'Row_64', 1, false),
    ('S003051', 'VR-Row_64-02', 'Row_64', 2, false),
    ('S003052', 'VR-Row_64-03', 'Row_64', 3, false),
    ('S003053', 'VR-Row_64-04', 'Row_64', 4, false),
    ('S003054', 'VR-Row_64-05', 'Row_64', 5, false),
    ('S003055', 'VR-Row_64-06', 'Row_64', 6, false),
    ('S003056', 'VR-Row_64-07', 'Row_64', 7, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE VR'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SB (160 seats)
-- Row A (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003057', 'SB-A-01', 'A', 1, false),
    ('S003058', 'SB-A-02', 'A', 2, false),
    ('S003059', 'SB-A-03', 'A', 3, false),
    ('S003060', 'SB-A-04', 'A', 4, false),
    ('S003061', 'SB-A-05', 'A', 5, false),
    ('S003062', 'SB-A-06', 'A', 6, false),
    ('S003063', 'SB-A-07', 'A', 7, false),
    ('S003064', 'SB-A-08', 'A', 8, false),
    ('S003065', 'SB-A-09', 'A', 9, false),
    ('S003066', 'SB-A-10', 'A', 10, false),
    ('S003067', 'SB-A-11', 'A', 11, false),
    ('S003068', 'SB-A-12', 'A', 12, false),
    ('S003069', 'SB-A-13', 'A', 13, false),
    ('S003070', 'SB-A-14', 'A', 14, false),
    ('S003071', 'SB-A-15', 'A', 15, false),
    ('S003072', 'SB-A-16', 'A', 16, false),
    ('S003073', 'SB-A-17', 'A', 17, false),
    ('S003074', 'SB-A-18', 'A', 18, false),
    ('S003075', 'SB-A-19', 'A', 19, false),
    ('S003076', 'SB-A-20', 'A', 20, false),
    ('S003077', 'SB-A-160', 'A', 160, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003078', 'SB-B-01', 'B', 1, false),
    ('S003079', 'SB-B-02', 'B', 2, false),
    ('S003080', 'SB-B-03', 'B', 3, false),
    ('S003081', 'SB-B-04', 'B', 4, false),
    ('S003082', 'SB-B-05', 'B', 5, false),
    ('S003083', 'SB-B-06', 'B', 6, false),
    ('S003084', 'SB-B-07', 'B', 7, false),
    ('S003085', 'SB-B-08', 'B', 8, false),
    ('S003086', 'SB-B-09', 'B', 9, false),
    ('S003087', 'SB-B-10', 'B', 10, false),
    ('S003088', 'SB-B-11', 'B', 11, false),
    ('S003089', 'SB-B-12', 'B', 12, false),
    ('S003090', 'SB-B-13', 'B', 13, false),
    ('S003091', 'SB-B-14', 'B', 14, false),
    ('S003092', 'SB-B-15', 'B', 15, false),
    ('S003093', 'SB-B-16', 'B', 16, false),
    ('S003094', 'SB-B-17', 'B', 17, false),
    ('S003095', 'SB-B-18', 'B', 18, false),
    ('S003096', 'SB-B-19', 'B', 19, false),
    ('S003097', 'SB-B-20', 'B', 20, false),
    ('S003098', 'SB-B-160', 'B', 160, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003099', 'SB-C-01', 'C', 1, false),
    ('S003100', 'SB-C-02', 'C', 2, false),
    ('S003101', 'SB-C-03', 'C', 3, false),
    ('S003102', 'SB-C-04', 'C', 4, false),
    ('S003103', 'SB-C-05', 'C', 5, false),
    ('S003104', 'SB-C-06', 'C', 6, false),
    ('S003105', 'SB-C-07', 'C', 7, false),
    ('S003106', 'SB-C-08', 'C', 8, false),
    ('S003107', 'SB-C-09', 'C', 9, false),
    ('S003108', 'SB-C-10', 'C', 10, false),
    ('S003109', 'SB-C-11', 'C', 11, false),
    ('S003110', 'SB-C-12', 'C', 12, false),
    ('S003111', 'SB-C-13', 'C', 13, false),
    ('S003112', 'SB-C-14', 'C', 14, false),
    ('S003113', 'SB-C-15', 'C', 15, false),
    ('S003114', 'SB-C-16', 'C', 16, false),
    ('S003115', 'SB-C-17', 'C', 17, false),
    ('S003116', 'SB-C-18', 'C', 18, false),
    ('S003117', 'SB-C-19', 'C', 19, false),
    ('S003118', 'SB-C-20', 'C', 20, false),
    ('S003119', 'SB-C-191', 'C', 191, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003120', 'SB-D-01', 'D', 1, false),
    ('S003121', 'SB-D-02', 'D', 2, false),
    ('S003122', 'SB-D-03', 'D', 3, false),
    ('S003123', 'SB-D-04', 'D', 4, false),
    ('S003124', 'SB-D-05', 'D', 5, false),
    ('S003125', 'SB-D-06', 'D', 6, false),
    ('S003126', 'SB-D-07', 'D', 7, false),
    ('S003127', 'SB-D-08', 'D', 8, false),
    ('S003128', 'SB-D-09', 'D', 9, false),
    ('S003129', 'SB-D-10', 'D', 10, false),
    ('S003130', 'SB-D-11', 'D', 11, false),
    ('S003131', 'SB-D-12', 'D', 12, false),
    ('S003132', 'SB-D-13', 'D', 13, false),
    ('S003133', 'SB-D-14', 'D', 14, false),
    ('S003134', 'SB-D-15', 'D', 15, false),
    ('S003135', 'SB-D-16', 'D', 16, false),
    ('S003136', 'SB-D-17', 'D', 17, false),
    ('S003137', 'SB-D-18', 'D', 18, false),
    ('S003138', 'SB-D-19', 'D', 19, false),
    ('S003139', 'SB-D-20', 'D', 20, false),
    ('S003140', 'SB-D-160', 'D', 160, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003141', 'SB-E-01', 'E', 1, false),
    ('S003142', 'SB-E-02', 'E', 2, false),
    ('S003143', 'SB-E-03', 'E', 3, false),
    ('S003144', 'SB-E-04', 'E', 4, false),
    ('S003145', 'SB-E-05', 'E', 5, false),
    ('S003146', 'SB-E-06', 'E', 6, false),
    ('S003147', 'SB-E-07', 'E', 7, false),
    ('S003148', 'SB-E-08', 'E', 8, false),
    ('S003149', 'SB-E-09', 'E', 9, false),
    ('S003150', 'SB-E-10', 'E', 10, false),
    ('S003151', 'SB-E-11', 'E', 11, false),
    ('S003152', 'SB-E-12', 'E', 12, false),
    ('S003153', 'SB-E-13', 'E', 13, false),
    ('S003154', 'SB-E-14', 'E', 14, false),
    ('S003155', 'SB-E-15', 'E', 15, false),
    ('S003156', 'SB-E-16', 'E', 16, false),
    ('S003157', 'SB-E-17', 'E', 17, false),
    ('S003158', 'SB-E-18', 'E', 18, false),
    ('S003159', 'SB-E-19', 'E', 19, false),
    ('S003160', 'SB-E-20', 'E', 20, false),
    ('S003161', 'SB-E-136', 'E', 136, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003162', 'SB-F-01', 'F', 1, false),
    ('S003163', 'SB-F-02', 'F', 2, false),
    ('S003164', 'SB-F-03', 'F', 3, false),
    ('S003165', 'SB-F-04', 'F', 4, false),
    ('S003166', 'SB-F-05', 'F', 5, false),
    ('S003167', 'SB-F-06', 'F', 6, false),
    ('S003168', 'SB-F-07', 'F', 7, false),
    ('S003169', 'SB-F-08', 'F', 8, false),
    ('S003170', 'SB-F-09', 'F', 9, false),
    ('S003171', 'SB-F-10', 'F', 10, false),
    ('S003172', 'SB-F-11', 'F', 11, false),
    ('S003173', 'SB-F-12', 'F', 12, false),
    ('S003174', 'SB-F-13', 'F', 13, false),
    ('S003175', 'SB-F-14', 'F', 14, false),
    ('S003176', 'SB-F-15', 'F', 15, false),
    ('S003177', 'SB-F-16', 'F', 16, false),
    ('S003178', 'SB-F-17', 'F', 17, false),
    ('S003179', 'SB-F-18', 'F', 18, false),
    ('S003180', 'SB-F-19', 'F', 19, false),
    ('S003181', 'SB-F-20', 'F', 20, false),
    ('S003182', 'SB-F-152', 'F', 152, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003183', 'SB-G-01', 'G', 1, false),
    ('S003184', 'SB-G-02', 'G', 2, false),
    ('S003185', 'SB-G-03', 'G', 3, false),
    ('S003186', 'SB-G-04', 'G', 4, false),
    ('S003187', 'SB-G-05', 'G', 5, false),
    ('S003188', 'SB-G-06', 'G', 6, false),
    ('S003189', 'SB-G-07', 'G', 7, false),
    ('S003190', 'SB-G-08', 'G', 8, false),
    ('S003191', 'SB-G-09', 'G', 9, false),
    ('S003192', 'SB-G-10', 'G', 10, false),
    ('S003193', 'SB-G-11', 'G', 11, false),
    ('S003194', 'SB-G-12', 'G', 12, false),
    ('S003195', 'SB-G-13', 'G', 13, false),
    ('S003196', 'SB-G-14', 'G', 14, false),
    ('S003197', 'SB-G-15', 'G', 15, false),
    ('S003198', 'SB-G-16', 'G', 16, false),
    ('S003199', 'SB-G-17', 'G', 17, false),
    ('S003200', 'SB-G-18', 'G', 18, false),
    ('S003201', 'SB-G-19', 'G', 19, false),
    ('S003202', 'SB-G-20', 'G', 20, false),
    ('S003203', 'SB-G-136', 'G', 136, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003204', 'SB-H-01', 'H', 1, false),
    ('S003205', 'SB-H-02', 'H', 2, false),
    ('S003206', 'SB-H-03', 'H', 3, false),
    ('S003207', 'SB-H-04', 'H', 4, false),
    ('S003208', 'SB-H-05', 'H', 5, false),
    ('S003209', 'SB-H-06', 'H', 6, false),
    ('S003210', 'SB-H-07', 'H', 7, false),
    ('S003211', 'SB-H-08', 'H', 8, false),
    ('S003212', 'SB-H-09', 'H', 9, false),
    ('S003213', 'SB-H-10', 'H', 10, false),
    ('S003214', 'SB-H-11', 'H', 11, false),
    ('S003215', 'SB-H-12', 'H', 12, false),
    ('S003216', 'SB-H-13', 'H', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SB'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SC (160 seats)
-- Row A (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003217', 'SC-A-01', 'A', 1, false),
    ('S003218', 'SC-A-02', 'A', 2, false),
    ('S003219', 'SC-A-03', 'A', 3, false),
    ('S003220', 'SC-A-04', 'A', 4, false),
    ('S003221', 'SC-A-05', 'A', 5, false),
    ('S003222', 'SC-A-06', 'A', 6, false),
    ('S003223', 'SC-A-07', 'A', 7, false),
    ('S003224', 'SC-A-08', 'A', 8, false),
    ('S003225', 'SC-A-09', 'A', 9, false),
    ('S003226', 'SC-A-10', 'A', 10, false),
    ('S003227', 'SC-A-11', 'A', 11, false),
    ('S003228', 'SC-A-12', 'A', 12, false),
    ('S003229', 'SC-A-13', 'A', 13, false),
    ('S003230', 'SC-A-14', 'A', 14, false),
    ('S003231', 'SC-A-15', 'A', 15, false),
    ('S003232', 'SC-A-16', 'A', 16, false),
    ('S003233', 'SC-A-17', 'A', 17, false),
    ('S003234', 'SC-A-18', 'A', 18, false),
    ('S003235', 'SC-A-19', 'A', 19, false),
    ('S003236', 'SC-A-20', 'A', 20, false),
    ('S003237', 'SC-A-160', 'A', 160, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003238', 'SC-B-01', 'B', 1, false),
    ('S003239', 'SC-B-02', 'B', 2, false),
    ('S003240', 'SC-B-03', 'B', 3, false),
    ('S003241', 'SC-B-04', 'B', 4, false),
    ('S003242', 'SC-B-05', 'B', 5, false),
    ('S003243', 'SC-B-06', 'B', 6, false),
    ('S003244', 'SC-B-07', 'B', 7, false),
    ('S003245', 'SC-B-08', 'B', 8, false),
    ('S003246', 'SC-B-09', 'B', 9, false),
    ('S003247', 'SC-B-10', 'B', 10, false),
    ('S003248', 'SC-B-11', 'B', 11, false),
    ('S003249', 'SC-B-12', 'B', 12, false),
    ('S003250', 'SC-B-13', 'B', 13, false),
    ('S003251', 'SC-B-14', 'B', 14, false),
    ('S003252', 'SC-B-15', 'B', 15, false),
    ('S003253', 'SC-B-16', 'B', 16, false),
    ('S003254', 'SC-B-17', 'B', 17, false),
    ('S003255', 'SC-B-18', 'B', 18, false),
    ('S003256', 'SC-B-19', 'B', 19, false),
    ('S003257', 'SC-B-20', 'B', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003258', 'SC-C-01', 'C', 1, false),
    ('S003259', 'SC-C-02', 'C', 2, false),
    ('S003260', 'SC-C-03', 'C', 3, false),
    ('S003261', 'SC-C-04', 'C', 4, false),
    ('S003262', 'SC-C-05', 'C', 5, false),
    ('S003263', 'SC-C-06', 'C', 6, false),
    ('S003264', 'SC-C-07', 'C', 7, false),
    ('S003265', 'SC-C-08', 'C', 8, false),
    ('S003266', 'SC-C-09', 'C', 9, false),
    ('S003267', 'SC-C-10', 'C', 10, false),
    ('S003268', 'SC-C-11', 'C', 11, false),
    ('S003269', 'SC-C-12', 'C', 12, false),
    ('S003270', 'SC-C-13', 'C', 13, false),
    ('S003271', 'SC-C-14', 'C', 14, false),
    ('S003272', 'SC-C-15', 'C', 15, false),
    ('S003273', 'SC-C-16', 'C', 16, false),
    ('S003274', 'SC-C-17', 'C', 17, false),
    ('S003275', 'SC-C-18', 'C', 18, false),
    ('S003276', 'SC-C-19', 'C', 19, false),
    ('S003277', 'SC-C-20', 'C', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003278', 'SC-D-01', 'D', 1, false),
    ('S003279', 'SC-D-02', 'D', 2, false),
    ('S003280', 'SC-D-03', 'D', 3, false),
    ('S003281', 'SC-D-04', 'D', 4, false),
    ('S003282', 'SC-D-05', 'D', 5, false),
    ('S003283', 'SC-D-06', 'D', 6, false),
    ('S003284', 'SC-D-07', 'D', 7, false),
    ('S003285', 'SC-D-08', 'D', 8, false),
    ('S003286', 'SC-D-09', 'D', 9, false),
    ('S003287', 'SC-D-10', 'D', 10, false),
    ('S003288', 'SC-D-11', 'D', 11, false),
    ('S003289', 'SC-D-12', 'D', 12, false),
    ('S003290', 'SC-D-13', 'D', 13, false),
    ('S003291', 'SC-D-14', 'D', 14, false),
    ('S003292', 'SC-D-15', 'D', 15, false),
    ('S003293', 'SC-D-16', 'D', 16, false),
    ('S003294', 'SC-D-17', 'D', 17, false),
    ('S003295', 'SC-D-18', 'D', 18, false),
    ('S003296', 'SC-D-19', 'D', 19, false),
    ('S003297', 'SC-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003298', 'SC-E-01', 'E', 1, false),
    ('S003299', 'SC-E-02', 'E', 2, false),
    ('S003300', 'SC-E-03', 'E', 3, false),
    ('S003301', 'SC-E-04', 'E', 4, false),
    ('S003302', 'SC-E-05', 'E', 5, false),
    ('S003303', 'SC-E-06', 'E', 6, false),
    ('S003304', 'SC-E-07', 'E', 7, false),
    ('S003305', 'SC-E-08', 'E', 8, false),
    ('S003306', 'SC-E-09', 'E', 9, false),
    ('S003307', 'SC-E-10', 'E', 10, false),
    ('S003308', 'SC-E-11', 'E', 11, false),
    ('S003309', 'SC-E-12', 'E', 12, false),
    ('S003310', 'SC-E-13', 'E', 13, false),
    ('S003311', 'SC-E-14', 'E', 14, false),
    ('S003312', 'SC-E-15', 'E', 15, false),
    ('S003313', 'SC-E-16', 'E', 16, false),
    ('S003314', 'SC-E-17', 'E', 17, false),
    ('S003315', 'SC-E-18', 'E', 18, false),
    ('S003316', 'SC-E-19', 'E', 19, false),
    ('S003317', 'SC-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003318', 'SC-F-01', 'F', 1, false),
    ('S003319', 'SC-F-02', 'F', 2, false),
    ('S003320', 'SC-F-03', 'F', 3, false),
    ('S003321', 'SC-F-04', 'F', 4, false),
    ('S003322', 'SC-F-05', 'F', 5, false),
    ('S003323', 'SC-F-06', 'F', 6, false),
    ('S003324', 'SC-F-07', 'F', 7, false),
    ('S003325', 'SC-F-08', 'F', 8, false),
    ('S003326', 'SC-F-09', 'F', 9, false),
    ('S003327', 'SC-F-10', 'F', 10, false),
    ('S003328', 'SC-F-11', 'F', 11, false),
    ('S003329', 'SC-F-12', 'F', 12, false),
    ('S003330', 'SC-F-13', 'F', 13, false),
    ('S003331', 'SC-F-14', 'F', 14, false),
    ('S003332', 'SC-F-15', 'F', 15, false),
    ('S003333', 'SC-F-16', 'F', 16, false),
    ('S003334', 'SC-F-17', 'F', 17, false),
    ('S003335', 'SC-F-18', 'F', 18, false),
    ('S003336', 'SC-F-19', 'F', 19, false),
    ('S003337', 'SC-F-20', 'F', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003338', 'SC-G-01', 'G', 1, false),
    ('S003339', 'SC-G-02', 'G', 2, false),
    ('S003340', 'SC-G-03', 'G', 3, false),
    ('S003341', 'SC-G-04', 'G', 4, false),
    ('S003342', 'SC-G-05', 'G', 5, false),
    ('S003343', 'SC-G-06', 'G', 6, false),
    ('S003344', 'SC-G-07', 'G', 7, false),
    ('S003345', 'SC-G-08', 'G', 8, false),
    ('S003346', 'SC-G-09', 'G', 9, false),
    ('S003347', 'SC-G-10', 'G', 10, false),
    ('S003348', 'SC-G-11', 'G', 11, false),
    ('S003349', 'SC-G-12', 'G', 12, false),
    ('S003350', 'SC-G-13', 'G', 13, false),
    ('S003351', 'SC-G-14', 'G', 14, false),
    ('S003352', 'SC-G-15', 'G', 15, false),
    ('S003353', 'SC-G-16', 'G', 16, false),
    ('S003354', 'SC-G-17', 'G', 17, false),
    ('S003355', 'SC-G-18', 'G', 18, false),
    ('S003356', 'SC-G-19', 'G', 19, false),
    ('S003357', 'SC-G-20', 'G', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003358', 'SC-H-01', 'H', 1, false),
    ('S003359', 'SC-H-02', 'H', 2, false),
    ('S003360', 'SC-H-03', 'H', 3, false),
    ('S003361', 'SC-H-04', 'H', 4, false),
    ('S003362', 'SC-H-05', 'H', 5, false),
    ('S003363', 'SC-H-06', 'H', 6, false),
    ('S003364', 'SC-H-07', 'H', 7, false),
    ('S003365', 'SC-H-08', 'H', 8, false),
    ('S003366', 'SC-H-09', 'H', 9, false),
    ('S003367', 'SC-H-10', 'H', 10, false),
    ('S003368', 'SC-H-11', 'H', 11, false),
    ('S003369', 'SC-H-12', 'H', 12, false),
    ('S003370', 'SC-H-13', 'H', 13, false),
    ('S003371', 'SC-H-14', 'H', 14, false),
    ('S003372', 'SC-H-15', 'H', 15, false),
    ('S003373', 'SC-H-16', 'H', 16, false),
    ('S003374', 'SC-H-17', 'H', 17, false),
    ('S003375', 'SC-H-18', 'H', 18, false),
    ('S003376', 'SC-H-19', 'H', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SC'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SD (160 seats)
-- Row A (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003377', 'SD-A-01', 'A', 1, false),
    ('S003378', 'SD-A-02', 'A', 2, false),
    ('S003379', 'SD-A-03', 'A', 3, false),
    ('S003380', 'SD-A-04', 'A', 4, false),
    ('S003381', 'SD-A-05', 'A', 5, false),
    ('S003382', 'SD-A-06', 'A', 6, false),
    ('S003383', 'SD-A-07', 'A', 7, false),
    ('S003384', 'SD-A-08', 'A', 8, false),
    ('S003385', 'SD-A-09', 'A', 9, false),
    ('S003386', 'SD-A-10', 'A', 10, false),
    ('S003387', 'SD-A-11', 'A', 11, false),
    ('S003388', 'SD-A-12', 'A', 12, false),
    ('S003389', 'SD-A-13', 'A', 13, false),
    ('S003390', 'SD-A-14', 'A', 14, false),
    ('S003391', 'SD-A-15', 'A', 15, false),
    ('S003392', 'SD-A-16', 'A', 16, false),
    ('S003393', 'SD-A-17', 'A', 17, false),
    ('S003394', 'SD-A-18', 'A', 18, false),
    ('S003395', 'SD-A-19', 'A', 19, false),
    ('S003396', 'SD-A-20', 'A', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003397', 'SD-B-01', 'B', 1, false),
    ('S003398', 'SD-B-02', 'B', 2, false),
    ('S003399', 'SD-B-03', 'B', 3, false),
    ('S003400', 'SD-B-04', 'B', 4, false),
    ('S003401', 'SD-B-05', 'B', 5, false),
    ('S003402', 'SD-B-06', 'B', 6, false),
    ('S003403', 'SD-B-07', 'B', 7, false),
    ('S003404', 'SD-B-08', 'B', 8, false),
    ('S003405', 'SD-B-09', 'B', 9, false),
    ('S003406', 'SD-B-10', 'B', 10, false),
    ('S003407', 'SD-B-11', 'B', 11, false),
    ('S003408', 'SD-B-12', 'B', 12, false),
    ('S003409', 'SD-B-13', 'B', 13, false),
    ('S003410', 'SD-B-14', 'B', 14, false),
    ('S003411', 'SD-B-15', 'B', 15, false),
    ('S003412', 'SD-B-16', 'B', 16, false),
    ('S003413', 'SD-B-17', 'B', 17, false),
    ('S003414', 'SD-B-18', 'B', 18, false),
    ('S003415', 'SD-B-19', 'B', 19, false),
    ('S003416', 'SD-B-20', 'B', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003417', 'SD-C-01', 'C', 1, false),
    ('S003418', 'SD-C-02', 'C', 2, false),
    ('S003419', 'SD-C-03', 'C', 3, false),
    ('S003420', 'SD-C-04', 'C', 4, false),
    ('S003421', 'SD-C-05', 'C', 5, false),
    ('S003422', 'SD-C-06', 'C', 6, false),
    ('S003423', 'SD-C-07', 'C', 7, false),
    ('S003424', 'SD-C-08', 'C', 8, false),
    ('S003425', 'SD-C-09', 'C', 9, false),
    ('S003426', 'SD-C-10', 'C', 10, false),
    ('S003427', 'SD-C-11', 'C', 11, false),
    ('S003428', 'SD-C-12', 'C', 12, false),
    ('S003429', 'SD-C-13', 'C', 13, false),
    ('S003430', 'SD-C-14', 'C', 14, false),
    ('S003431', 'SD-C-15', 'C', 15, false),
    ('S003432', 'SD-C-16', 'C', 16, false),
    ('S003433', 'SD-C-17', 'C', 17, false),
    ('S003434', 'SD-C-18', 'C', 18, false),
    ('S003435', 'SD-C-19', 'C', 19, false),
    ('S003436', 'SD-C-20', 'C', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003437', 'SD-D-01', 'D', 1, false),
    ('S003438', 'SD-D-02', 'D', 2, false),
    ('S003439', 'SD-D-03', 'D', 3, false),
    ('S003440', 'SD-D-04', 'D', 4, false),
    ('S003441', 'SD-D-05', 'D', 5, false),
    ('S003442', 'SD-D-06', 'D', 6, false),
    ('S003443', 'SD-D-07', 'D', 7, false),
    ('S003444', 'SD-D-08', 'D', 8, false),
    ('S003445', 'SD-D-09', 'D', 9, false),
    ('S003446', 'SD-D-10', 'D', 10, false),
    ('S003447', 'SD-D-11', 'D', 11, false),
    ('S003448', 'SD-D-12', 'D', 12, false),
    ('S003449', 'SD-D-13', 'D', 13, false),
    ('S003450', 'SD-D-14', 'D', 14, false),
    ('S003451', 'SD-D-15', 'D', 15, false),
    ('S003452', 'SD-D-16', 'D', 16, false),
    ('S003453', 'SD-D-17', 'D', 17, false),
    ('S003454', 'SD-D-18', 'D', 18, false),
    ('S003455', 'SD-D-19', 'D', 19, false),
    ('S003456', 'SD-D-20', 'D', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003457', 'SD-E-01', 'E', 1, false),
    ('S003458', 'SD-E-02', 'E', 2, false),
    ('S003459', 'SD-E-03', 'E', 3, false),
    ('S003460', 'SD-E-04', 'E', 4, false),
    ('S003461', 'SD-E-05', 'E', 5, false),
    ('S003462', 'SD-E-06', 'E', 6, false),
    ('S003463', 'SD-E-07', 'E', 7, false),
    ('S003464', 'SD-E-08', 'E', 8, false),
    ('S003465', 'SD-E-09', 'E', 9, false),
    ('S003466', 'SD-E-10', 'E', 10, false),
    ('S003467', 'SD-E-11', 'E', 11, false),
    ('S003468', 'SD-E-12', 'E', 12, false),
    ('S003469', 'SD-E-13', 'E', 13, false),
    ('S003470', 'SD-E-14', 'E', 14, false),
    ('S003471', 'SD-E-15', 'E', 15, false),
    ('S003472', 'SD-E-16', 'E', 16, false),
    ('S003473', 'SD-E-17', 'E', 17, false),
    ('S003474', 'SD-E-18', 'E', 18, false),
    ('S003475', 'SD-E-19', 'E', 19, false),
    ('S003476', 'SD-E-20', 'E', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003477', 'SD-F-01', 'F', 1, false),
    ('S003478', 'SD-F-02', 'F', 2, false),
    ('S003479', 'SD-F-03', 'F', 3, false),
    ('S003480', 'SD-F-04', 'F', 4, false),
    ('S003481', 'SD-F-05', 'F', 5, false),
    ('S003482', 'SD-F-06', 'F', 6, false),
    ('S003483', 'SD-F-07', 'F', 7, false),
    ('S003484', 'SD-F-08', 'F', 8, false),
    ('S003485', 'SD-F-09', 'F', 9, false),
    ('S003486', 'SD-F-10', 'F', 10, false),
    ('S003487', 'SD-F-11', 'F', 11, false),
    ('S003488', 'SD-F-12', 'F', 12, false),
    ('S003489', 'SD-F-13', 'F', 13, false),
    ('S003490', 'SD-F-14', 'F', 14, false),
    ('S003491', 'SD-F-15', 'F', 15, false),
    ('S003492', 'SD-F-16', 'F', 16, false),
    ('S003493', 'SD-F-17', 'F', 17, false),
    ('S003494', 'SD-F-18', 'F', 18, false),
    ('S003495', 'SD-F-19', 'F', 19, false),
    ('S003496', 'SD-F-20', 'F', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003497', 'SD-G-01', 'G', 1, false),
    ('S003498', 'SD-G-02', 'G', 2, false),
    ('S003499', 'SD-G-03', 'G', 3, false),
    ('S003500', 'SD-G-04', 'G', 4, false),
    ('S003501', 'SD-G-05', 'G', 5, false),
    ('S003502', 'SD-G-06', 'G', 6, false),
    ('S003503', 'SD-G-07', 'G', 7, false),
    ('S003504', 'SD-G-08', 'G', 8, false),
    ('S003505', 'SD-G-09', 'G', 9, false),
    ('S003506', 'SD-G-10', 'G', 10, false),
    ('S003507', 'SD-G-11', 'G', 11, false),
    ('S003508', 'SD-G-12', 'G', 12, false),
    ('S003509', 'SD-G-13', 'G', 13, false),
    ('S003510', 'SD-G-14', 'G', 14, false),
    ('S003511', 'SD-G-15', 'G', 15, false),
    ('S003512', 'SD-G-16', 'G', 16, false),
    ('S003513', 'SD-G-17', 'G', 17, false),
    ('S003514', 'SD-G-18', 'G', 18, false),
    ('S003515', 'SD-G-19', 'G', 19, false),
    ('S003516', 'SD-G-20', 'G', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003517', 'SD-H-01', 'H', 1, false),
    ('S003518', 'SD-H-02', 'H', 2, false),
    ('S003519', 'SD-H-03', 'H', 3, false),
    ('S003520', 'SD-H-04', 'H', 4, false),
    ('S003521', 'SD-H-05', 'H', 5, false),
    ('S003522', 'SD-H-06', 'H', 6, false),
    ('S003523', 'SD-H-07', 'H', 7, false),
    ('S003524', 'SD-H-08', 'H', 8, false),
    ('S003525', 'SD-H-09', 'H', 9, false),
    ('S003526', 'SD-H-10', 'H', 10, false),
    ('S003527', 'SD-H-11', 'H', 11, false),
    ('S003528', 'SD-H-12', 'H', 12, false),
    ('S003529', 'SD-H-13', 'H', 13, false),
    ('S003530', 'SD-H-14', 'H', 14, false),
    ('S003531', 'SD-H-15', 'H', 15, false),
    ('S003532', 'SD-H-16', 'H', 16, false),
    ('S003533', 'SD-H-17', 'H', 17, false),
    ('S003534', 'SD-H-18', 'H', 18, false),
    ('S003535', 'SD-H-19', 'H', 19, false),
    ('S003536', 'SD-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SD'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE SE (191 seats)
-- Row A (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003537', 'SE-A-01', 'A', 1, false),
    ('S003538', 'SE-A-02', 'A', 2, false),
    ('S003539', 'SE-A-03', 'A', 3, false),
    ('S003540', 'SE-A-04', 'A', 4, false),
    ('S003541', 'SE-A-05', 'A', 5, false),
    ('S003542', 'SE-A-06', 'A', 6, false),
    ('S003543', 'SE-A-07', 'A', 7, false),
    ('S003544', 'SE-A-08', 'A', 8, false),
    ('S003545', 'SE-A-09', 'A', 9, false),
    ('S003546', 'SE-A-10', 'A', 10, false),
    ('S003547', 'SE-A-11', 'A', 11, false),
    ('S003548', 'SE-A-12', 'A', 12, false),
    ('S003549', 'SE-A-13', 'A', 13, false),
    ('S003550', 'SE-A-14', 'A', 14, false),
    ('S003551', 'SE-A-15', 'A', 15, false),
    ('S003552', 'SE-A-16', 'A', 16, false),
    ('S003553', 'SE-A-17', 'A', 17, false),
    ('S003554', 'SE-A-18', 'A', 18, false),
    ('S003555', 'SE-A-19', 'A', 19, false),
    ('S003556', 'SE-A-20', 'A', 20, false),
    ('S003557', 'SE-A-21', 'A', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003558', 'SE-B-01', 'B', 1, false),
    ('S003559', 'SE-B-02', 'B', 2, false),
    ('S003560', 'SE-B-03', 'B', 3, false),
    ('S003561', 'SE-B-04', 'B', 4, false),
    ('S003562', 'SE-B-05', 'B', 5, false),
    ('S003563', 'SE-B-06', 'B', 6, false),
    ('S003564', 'SE-B-07', 'B', 7, false),
    ('S003565', 'SE-B-08', 'B', 8, false),
    ('S003566', 'SE-B-09', 'B', 9, false),
    ('S003567', 'SE-B-10', 'B', 10, false),
    ('S003568', 'SE-B-11', 'B', 11, false),
    ('S003569', 'SE-B-12', 'B', 12, false),
    ('S003570', 'SE-B-13', 'B', 13, false),
    ('S003571', 'SE-B-14', 'B', 14, false),
    ('S003572', 'SE-B-15', 'B', 15, false),
    ('S003573', 'SE-B-16', 'B', 16, false),
    ('S003574', 'SE-B-17', 'B', 17, false),
    ('S003575', 'SE-B-18', 'B', 18, false),
    ('S003576', 'SE-B-19', 'B', 19, false),
    ('S003577', 'SE-B-20', 'B', 20, false),
    ('S003578', 'SE-B-21', 'B', 21, false),
    ('S003579', 'SE-B-22', 'B', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (23 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003580', 'SE-C-01', 'C', 1, false),
    ('S003581', 'SE-C-02', 'C', 2, false),
    ('S003582', 'SE-C-03', 'C', 3, false),
    ('S003583', 'SE-C-04', 'C', 4, false),
    ('S003584', 'SE-C-05', 'C', 5, false),
    ('S003585', 'SE-C-06', 'C', 6, false),
    ('S003586', 'SE-C-07', 'C', 7, false),
    ('S003587', 'SE-C-08', 'C', 8, false),
    ('S003588', 'SE-C-09', 'C', 9, false),
    ('S003589', 'SE-C-10', 'C', 10, false),
    ('S003590', 'SE-C-11', 'C', 11, false),
    ('S003591', 'SE-C-12', 'C', 12, false),
    ('S003592', 'SE-C-13', 'C', 13, false),
    ('S003593', 'SE-C-14', 'C', 14, false),
    ('S003594', 'SE-C-15', 'C', 15, false),
    ('S003595', 'SE-C-16', 'C', 16, false),
    ('S003596', 'SE-C-17', 'C', 17, false),
    ('S003597', 'SE-C-18', 'C', 18, false),
    ('S003598', 'SE-C-19', 'C', 19, false),
    ('S003599', 'SE-C-20', 'C', 20, false),
    ('S003600', 'SE-C-21', 'C', 21, false),
    ('S003601', 'SE-C-22', 'C', 22, false),
    ('S003602', 'SE-C-23', 'C', 23, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (23 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003603', 'SE-D-01', 'D', 1, false),
    ('S003604', 'SE-D-02', 'D', 2, false),
    ('S003605', 'SE-D-03', 'D', 3, false),
    ('S003606', 'SE-D-04', 'D', 4, false),
    ('S003607', 'SE-D-05', 'D', 5, false),
    ('S003608', 'SE-D-06', 'D', 6, false),
    ('S003609', 'SE-D-07', 'D', 7, false),
    ('S003610', 'SE-D-08', 'D', 8, false),
    ('S003611', 'SE-D-09', 'D', 9, false),
    ('S003612', 'SE-D-10', 'D', 10, false),
    ('S003613', 'SE-D-11', 'D', 11, false),
    ('S003614', 'SE-D-12', 'D', 12, false),
    ('S003615', 'SE-D-13', 'D', 13, false),
    ('S003616', 'SE-D-14', 'D', 14, false),
    ('S003617', 'SE-D-15', 'D', 15, false),
    ('S003618', 'SE-D-16', 'D', 16, false),
    ('S003619', 'SE-D-17', 'D', 17, false),
    ('S003620', 'SE-D-18', 'D', 18, false),
    ('S003621', 'SE-D-19', 'D', 19, false),
    ('S003622', 'SE-D-20', 'D', 20, false),
    ('S003623', 'SE-D-21', 'D', 21, false),
    ('S003624', 'SE-D-22', 'D', 22, false),
    ('S003625', 'SE-D-23', 'D', 23, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003626', 'SE-E-01', 'E', 1, false),
    ('S003627', 'SE-E-02', 'E', 2, false),
    ('S003628', 'SE-E-03', 'E', 3, false),
    ('S003629', 'SE-E-04', 'E', 4, false),
    ('S003630', 'SE-E-05', 'E', 5, false),
    ('S003631', 'SE-E-06', 'E', 6, false),
    ('S003632', 'SE-E-07', 'E', 7, false),
    ('S003633', 'SE-E-08', 'E', 8, false),
    ('S003634', 'SE-E-09', 'E', 9, false),
    ('S003635', 'SE-E-10', 'E', 10, false),
    ('S003636', 'SE-E-11', 'E', 11, false),
    ('S003637', 'SE-E-12', 'E', 12, false),
    ('S003638', 'SE-E-13', 'E', 13, false),
    ('S003639', 'SE-E-14', 'E', 14, false),
    ('S003640', 'SE-E-15', 'E', 15, false),
    ('S003641', 'SE-E-16', 'E', 16, false),
    ('S003642', 'SE-E-17', 'E', 17, false),
    ('S003643', 'SE-E-18', 'E', 18, false),
    ('S003644', 'SE-E-19', 'E', 19, false),
    ('S003645', 'SE-E-20', 'E', 20, false),
    ('S003646', 'SE-E-21', 'E', 21, false),
    ('S003647', 'SE-E-22', 'E', 22, false),
    ('S003648', 'SE-E-23', 'E', 23, false),
    ('S003649', 'SE-E-24', 'E', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (25 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003650', 'SE-F-01', 'F', 1, false),
    ('S003651', 'SE-F-02', 'F', 2, false),
    ('S003652', 'SE-F-03', 'F', 3, false),
    ('S003653', 'SE-F-04', 'F', 4, false),
    ('S003654', 'SE-F-05', 'F', 5, false),
    ('S003655', 'SE-F-06', 'F', 6, false),
    ('S003656', 'SE-F-07', 'F', 7, false),
    ('S003657', 'SE-F-08', 'F', 8, false),
    ('S003658', 'SE-F-09', 'F', 9, false),
    ('S003659', 'SE-F-10', 'F', 10, false),
    ('S003660', 'SE-F-11', 'F', 11, false),
    ('S003661', 'SE-F-12', 'F', 12, false),
    ('S003662', 'SE-F-13', 'F', 13, false),
    ('S003663', 'SE-F-14', 'F', 14, false),
    ('S003664', 'SE-F-15', 'F', 15, false),
    ('S003665', 'SE-F-16', 'F', 16, false),
    ('S003666', 'SE-F-17', 'F', 17, false),
    ('S003667', 'SE-F-18', 'F', 18, false),
    ('S003668', 'SE-F-19', 'F', 19, false),
    ('S003669', 'SE-F-20', 'F', 20, false),
    ('S003670', 'SE-F-21', 'F', 21, false),
    ('S003671', 'SE-F-22', 'F', 22, false),
    ('S003672', 'SE-F-23', 'F', 23, false),
    ('S003673', 'SE-F-24', 'F', 24, false),
    ('S003674', 'SE-F-25', 'F', 25, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE SE'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (26 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S003675', 'SE-G-01', 'G', 1, false),
    ('S003676', 'SE-G-02', 'G', 2, false),
    ('S003677', 'SE-G-03', 'G', 3, false),
    ('S003678', 'SE-G-04', 'G', 4, false),
    ('S003679', 'SE-G-05', 'G', 5, false),
    ('S003680', 'SE-G-06', 'G', 6, false),
    ('S003681', 'SE-G-07', 'G', 7, false),
    ('S003682', 'SE-G-08', 'G', 8, false),
    ('S003683', 'SE-G-09', 'G', 9, false),