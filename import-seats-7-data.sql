    ('S009026', 'P-K-10', 'K', 10, false),
    ('S009027', 'P-K-11', 'K', 11, false),
    ('S009028', 'P-K-12', 'K', 12, false),
    ('S009029', 'P-K-13', 'K', 13, false),
    ('S009030', 'P-K-14', 'K', 14, false),
    ('S009031', 'P-K-15', 'K', 15, false),
    ('S009032', 'P-K-16', 'K', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (16 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009033', 'P-L-01', 'L', 1, false),
    ('S009034', 'P-L-02', 'L', 2, false),
    ('S009035', 'P-L-03', 'L', 3, false),
    ('S009036', 'P-L-04', 'L', 4, false),
    ('S009037', 'P-L-05', 'L', 5, false),
    ('S009038', 'P-L-06', 'L', 6, false),
    ('S009039', 'P-L-07', 'L', 7, false),
    ('S009040', 'P-L-08', 'L', 8, false),
    ('S009041', 'P-L-09', 'L', 9, false),
    ('S009042', 'P-L-10', 'L', 10, false),
    ('S009043', 'P-L-11', 'L', 11, false),
    ('S009044', 'P-L-12', 'L', 12, false),
    ('S009045', 'P-L-13', 'L', 13, false),
    ('S009046', 'P-L-14', 'L', 14, false),
    ('S009047', 'P-L-15', 'L', 15, false),
    ('S009048', 'P-L-16', 'L', 16, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009049', 'P-M-01', 'M', 1, false),
    ('S009050', 'P-M-02', 'M', 2, false),
    ('S009051', 'P-M-03', 'M', 3, false),
    ('S009052', 'P-M-04', 'M', 4, false),
    ('S009053', 'P-M-05', 'M', 5, false),
    ('S009054', 'P-M-06', 'M', 6, false),
    ('S009055', 'P-M-07', 'M', 7, false),
    ('S009056', 'P-M-08', 'M', 8, false),
    ('S009057', 'P-M-09', 'M', 9, false),
    ('S009058', 'P-M-10', 'M', 10, false),
    ('S009059', 'P-M-11', 'M', 11, false),
    ('S009060', 'P-M-12', 'M', 12, false),
    ('S009061', 'P-M-13', 'M', 13, false),
    ('S009062', 'P-M-14', 'M', 14, false),
    ('S009063', 'P-M-15', 'M', 15, false),
    ('S009064', 'P-M-16', 'M', 16, false),
    ('S009065', 'P-M-17', 'M', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009066', 'P-N-01', 'N', 1, false),
    ('S009067', 'P-N-02', 'N', 2, false),
    ('S009068', 'P-N-03', 'N', 3, false),
    ('S009069', 'P-N-04', 'N', 4, false),
    ('S009070', 'P-N-05', 'N', 5, false),
    ('S009071', 'P-N-06', 'N', 6, false),
    ('S009072', 'P-N-07', 'N', 7, false),
    ('S009073', 'P-N-08', 'N', 8, false),
    ('S009074', 'P-N-09', 'N', 9, false),
    ('S009075', 'P-N-10', 'N', 10, false),
    ('S009076', 'P-N-11', 'N', 11, false),
    ('S009077', 'P-N-12', 'N', 12, false),
    ('S009078', 'P-N-13', 'N', 13, false),
    ('S009079', 'P-N-14', 'N', 14, false),
    ('S009080', 'P-N-15', 'N', 15, false),
    ('S009081', 'P-N-16', 'N', 16, false),
    ('S009082', 'P-N-17', 'N', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009083', 'P-O-01', 'O', 1, false),
    ('S009084', 'P-O-02', 'O', 2, false),
    ('S009085', 'P-O-03', 'O', 3, false),
    ('S009086', 'P-O-04', 'O', 4, false),
    ('S009087', 'P-O-05', 'O', 5, false),
    ('S009088', 'P-O-06', 'O', 6, false),
    ('S009089', 'P-O-07', 'O', 7, false),
    ('S009090', 'P-O-08', 'O', 8, false),
    ('S009091', 'P-O-09', 'O', 9, false),
    ('S009092', 'P-O-10', 'O', 10, false),
    ('S009093', 'P-O-11', 'O', 11, false),
    ('S009094', 'P-O-12', 'O', 12, false),
    ('S009095', 'P-O-13', 'O', 13, false),
    ('S009096', 'P-O-14', 'O', 14, false),
    ('S009097', 'P-O-15', 'O', 15, false),
    ('S009098', 'P-O-16', 'O', 16, false),
    ('S009099', 'P-O-17', 'O', 17, false),
    ('S009100', 'P-O-18', 'O', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009101', 'P-P-01', 'P', 1, false),
    ('S009102', 'P-P-02', 'P', 2, false),
    ('S009103', 'P-P-03', 'P', 3, false),
    ('S009104', 'P-P-04', 'P', 4, false),
    ('S009105', 'P-P-05', 'P', 5, false),
    ('S009106', 'P-P-06', 'P', 6, false),
    ('S009107', 'P-P-07', 'P', 7, false),
    ('S009108', 'P-P-08', 'P', 8, false),
    ('S009109', 'P-P-09', 'P', 9, false),
    ('S009110', 'P-P-10', 'P', 10, false),
    ('S009111', 'P-P-11', 'P', 11, false),
    ('S009112', 'P-P-12', 'P', 12, false),
    ('S009113', 'P-P-13', 'P', 13, false),
    ('S009114', 'P-P-14', 'P', 14, false),
    ('S009115', 'P-P-15', 'P', 15, false),
    ('S009116', 'P-P-16', 'P', 16, false),
    ('S009117', 'P-P-17', 'P', 17, false),
    ('S009118', 'P-P-18', 'P', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009119', 'P-Q-01', 'Q', 1, false),
    ('S009120', 'P-Q-02', 'Q', 2, false),
    ('S009121', 'P-Q-03', 'Q', 3, false),
    ('S009122', 'P-Q-04', 'Q', 4, false),
    ('S009123', 'P-Q-05', 'Q', 5, false),
    ('S009124', 'P-Q-06', 'Q', 6, false),
    ('S009125', 'P-Q-07', 'Q', 7, false),
    ('S009126', 'P-Q-08', 'Q', 8, false),
    ('S009127', 'P-Q-09', 'Q', 9, false),
    ('S009128', 'P-Q-10', 'Q', 10, false),
    ('S009129', 'P-Q-11', 'Q', 11, false),
    ('S009130', 'P-Q-12', 'Q', 12, false),
    ('S009131', 'P-Q-13', 'Q', 13, false),
    ('S009132', 'P-Q-14', 'Q', 14, false),
    ('S009133', 'P-Q-15', 'Q', 15, false),
    ('S009134', 'P-Q-16', 'Q', 16, false),
    ('S009135', 'P-Q-17', 'Q', 17, false),
    ('S009136', 'P-Q-18', 'Q', 18, false),
    ('S009137', 'P-Q-19', 'Q', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row R (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009138', 'P-R-01', 'R', 1, false),
    ('S009139', 'P-R-02', 'R', 2, false),
    ('S009140', 'P-R-03', 'R', 3, false),
    ('S009141', 'P-R-04', 'R', 4, false),
    ('S009142', 'P-R-05', 'R', 5, false),
    ('S009143', 'P-R-06', 'R', 6, false),
    ('S009144', 'P-R-07', 'R', 7, false),
    ('S009145', 'P-R-08', 'R', 8, false),
    ('S009146', 'P-R-09', 'R', 9, false),
    ('S009147', 'P-R-10', 'R', 10, false),
    ('S009148', 'P-R-11', 'R', 11, false),
    ('S009149', 'P-R-12', 'R', 12, false),
    ('S009150', 'P-R-13', 'R', 13, false),
    ('S009151', 'P-R-14', 'R', 14, false),
    ('S009152', 'P-R-15', 'R', 15, false),
    ('S009153', 'P-R-16', 'R', 16, false),
    ('S009154', 'P-R-17', 'R', 17, false),
    ('S009155', 'P-R-18', 'R', 18, false),
    ('S009156', 'P-R-19', 'R', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row S (18 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009157', 'P-S-01', 'S', 1, false),
    ('S009158', 'P-S-02', 'S', 2, false),
    ('S009159', 'P-S-03', 'S', 3, false),
    ('S009160', 'P-S-04', 'S', 4, false),
    ('S009161', 'P-S-05', 'S', 5, false),
    ('S009162', 'P-S-06', 'S', 6, false),
    ('S009163', 'P-S-07', 'S', 7, false),
    ('S009164', 'P-S-08', 'S', 8, false),
    ('S009165', 'P-S-09', 'S', 9, false),
    ('S009166', 'P-S-10', 'S', 10, false),
    ('S009167', 'P-S-11', 'S', 11, false),
    ('S009168', 'P-S-12', 'S', 12, false),
    ('S009169', 'P-S-13', 'S', 13, false),
    ('S009170', 'P-S-14', 'S', 14, false),
    ('S009171', 'P-S-15', 'S', 15, false),
    ('S009172', 'P-S-16', 'S', 16, false),
    ('S009173', 'P-S-17', 'S', 17, false),
    ('S009174', 'P-S-18', 'S', 18, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row T (17 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009175', 'P-T-01', 'T', 1, false),
    ('S009176', 'P-T-02', 'T', 2, false),
    ('S009177', 'P-T-03', 'T', 3, false),
    ('S009178', 'P-T-04', 'T', 4, false),
    ('S009179', 'P-T-05', 'T', 5, false),
    ('S009180', 'P-T-06', 'T', 6, false),
    ('S009181', 'P-T-07', 'T', 7, false),
    ('S009182', 'P-T-08', 'T', 8, false),
    ('S009183', 'P-T-09', 'T', 9, false),
    ('S009184', 'P-T-10', 'T', 10, false),
    ('S009185', 'P-T-11', 'T', 11, false),
    ('S009186', 'P-T-12', 'T', 12, false),
    ('S009187', 'P-T-13', 'T', 13, false),
    ('S009188', 'P-T-14', 'T', 14, false),
    ('S009189', 'P-T-15', 'T', 15, false),
    ('S009190', 'P-T-16', 'T', 16, false),
    ('S009191', 'P-T-17', 'T', 17, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row U (6 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009192', 'P-U-01', 'U', 1, false),
    ('S009193', 'P-U-02', 'U', 2, false),
    ('S009194', 'P-U-03', 'U', 3, false),
    ('S009195', 'P-U-04', 'U', 4, false),
    ('S009196', 'P-U-05', 'U', 5, false),
    ('S009197', 'P-U-06', 'U', 6, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE P'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE Q (306 seats)
-- Row A (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009198', 'Q-A-01', 'A', 1, false),
    ('S009199', 'Q-A-02', 'A', 2, false),
    ('S009200', 'Q-A-03', 'A', 3, false),
    ('S009201', 'Q-A-04', 'A', 4, false),
    ('S009202', 'Q-A-05', 'A', 5, false),
    ('S009203', 'Q-A-06', 'A', 6, false),
    ('S009204', 'Q-A-07', 'A', 7, false),
    ('S009205', 'Q-A-08', 'A', 8, false),
    ('S009206', 'Q-A-09', 'A', 9, false),
    ('S009207', 'Q-A-10', 'A', 10, false),
    ('S009208', 'Q-A-11', 'A', 11, false),
    ('S009209', 'Q-A-12', 'A', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009210', 'Q-AA-01', 'AA', 1, false),
    ('S009211', 'Q-AA-02', 'AA', 2, false),
    ('S009212', 'Q-AA-03', 'AA', 3, false),
    ('S009213', 'Q-AA-04', 'AA', 4, false),
    ('S009214', 'Q-AA-05', 'AA', 5, false),
    ('S009215', 'Q-AA-06', 'AA', 6, false),
    ('S009216', 'Q-AA-07', 'AA', 7, false),
    ('S009217', 'Q-AA-08', 'AA', 8, false),
    ('S009218', 'Q-AA-09', 'AA', 9, false),
    ('S009219', 'Q-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009220', 'Q-B-01', 'B', 1, false),
    ('S009221', 'Q-B-02', 'B', 2, false),
    ('S009222', 'Q-B-03', 'B', 3, false),
    ('S009223', 'Q-B-04', 'B', 4, false),
    ('S009224', 'Q-B-05', 'B', 5, false),
    ('S009225', 'Q-B-06', 'B', 6, false),
    ('S009226', 'Q-B-07', 'B', 7, false),
    ('S009227', 'Q-B-08', 'B', 8, false),
    ('S009228', 'Q-B-09', 'B', 9, false),
    ('S009229', 'Q-B-10', 'B', 10, false),
    ('S009230', 'Q-B-11', 'B', 11, false),
    ('S009231', 'Q-B-12', 'B', 12, false),
    ('S009232', 'Q-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009233', 'Q-C-01', 'C', 1, false),
    ('S009234', 'Q-C-02', 'C', 2, false),
    ('S009235', 'Q-C-03', 'C', 3, false),
    ('S009236', 'Q-C-04', 'C', 4, false),
    ('S009237', 'Q-C-05', 'C', 5, false),
    ('S009238', 'Q-C-06', 'C', 6, false),
    ('S009239', 'Q-C-07', 'C', 7, false),
    ('S009240', 'Q-C-08', 'C', 8, false),
    ('S009241', 'Q-C-09', 'C', 9, false),
    ('S009242', 'Q-C-10', 'C', 10, false),
    ('S009243', 'Q-C-11', 'C', 11, false),
    ('S009244', 'Q-C-12', 'C', 12, false),
    ('S009245', 'Q-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009246', 'Q-D-01', 'D', 1, false),
    ('S009247', 'Q-D-02', 'D', 2, false),
    ('S009248', 'Q-D-03', 'D', 3, false),
    ('S009249', 'Q-D-04', 'D', 4, false),
    ('S009250', 'Q-D-05', 'D', 5, false),
    ('S009251', 'Q-D-06', 'D', 6, false),
    ('S009252', 'Q-D-07', 'D', 7, false),
    ('S009253', 'Q-D-08', 'D', 8, false),
    ('S009254', 'Q-D-09', 'D', 9, false),
    ('S009255', 'Q-D-10', 'D', 10, false),
    ('S009256', 'Q-D-11', 'D', 11, false),
    ('S009257', 'Q-D-12', 'D', 12, false),
    ('S009258', 'Q-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (14 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009259', 'Q-E-01', 'E', 1, false),
    ('S009260', 'Q-E-02', 'E', 2, false),
    ('S009261', 'Q-E-03', 'E', 3, false),
    ('S009262', 'Q-E-04', 'E', 4, false),
    ('S009263', 'Q-E-05', 'E', 5, false),
    ('S009264', 'Q-E-06', 'E', 6, false),
    ('S009265', 'Q-E-07', 'E', 7, false),
    ('S009266', 'Q-E-08', 'E', 8, false),
    ('S009267', 'Q-E-09', 'E', 9, false),
    ('S009268', 'Q-E-10', 'E', 10, false),
    ('S009269', 'Q-E-11', 'E', 11, false),
    ('S009270', 'Q-E-12', 'E', 12, false),
    ('S009271', 'Q-E-13', 'E', 13, false),
    ('S009272', 'Q-E-14', 'E', 14, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009273', 'Q-F-01', 'F', 1, false),
    ('S009274', 'Q-F-02', 'F', 2, false),
    ('S009275', 'Q-F-03', 'F', 3, false),
    ('S009276', 'Q-F-04', 'F', 4, false),
    ('S009277', 'Q-F-05', 'F', 5, false),
    ('S009278', 'Q-F-06', 'F', 6, false),
    ('S009279', 'Q-F-07', 'F', 7, false),
    ('S009280', 'Q-F-08', 'F', 8, false),
    ('S009281', 'Q-F-09', 'F', 9, false),
    ('S009282', 'Q-F-10', 'F', 10, false),
    ('S009283', 'Q-F-11', 'F', 11, false),
    ('S009284', 'Q-F-12', 'F', 12, false),
    ('S009285', 'Q-F-13', 'F', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009286', 'Q-G-01', 'G', 1, false),
    ('S009287', 'Q-G-02', 'G', 2, false),
    ('S009288', 'Q-G-03', 'G', 3, false),
    ('S009289', 'Q-G-04', 'G', 4, false),
    ('S009290', 'Q-G-05', 'G', 5, false),
    ('S009291', 'Q-G-06', 'G', 6, false),
    ('S009292', 'Q-G-07', 'G', 7, false),
    ('S009293', 'Q-G-08', 'G', 8, false),
    ('S009294', 'Q-G-09', 'G', 9, false),
    ('S009295', 'Q-G-10', 'G', 10, false),
    ('S009296', 'Q-G-11', 'G', 11, false),
    ('S009297', 'Q-G-12', 'G', 12, false),
    ('S009298', 'Q-G-13', 'G', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009299', 'Q-H-01', 'H', 1, false),
    ('S009300', 'Q-H-02', 'H', 2, false),
    ('S009301', 'Q-H-03', 'H', 3, false),
    ('S009302', 'Q-H-04', 'H', 4, false),
    ('S009303', 'Q-H-05', 'H', 5, false),
    ('S009304', 'Q-H-06', 'H', 6, false),
    ('S009305', 'Q-H-07', 'H', 7, false),
    ('S009306', 'Q-H-08', 'H', 8, false),
    ('S009307', 'Q-H-09', 'H', 9, false),
    ('S009308', 'Q-H-10', 'H', 10, false),
    ('S009309', 'Q-H-11', 'H', 11, false),
    ('S009310', 'Q-H-12', 'H', 12, false),
    ('S009311', 'Q-H-13', 'H', 13, false),
    ('S009312', 'Q-H-14', 'H', 14, false),
    ('S009313', 'Q-H-15', 'H', 15, false),
    ('S009314', 'Q-H-16', 'H', 16, false),
    ('S009315', 'Q-H-17', 'H', 17, false),
    ('S009316', 'Q-H-18', 'H', 18, false),
    ('S009317', 'Q-H-19', 'H', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009318', 'Q-I-01', 'I', 1, false),
    ('S009319', 'Q-I-02', 'I', 2, false),
    ('S009320', 'Q-I-03', 'I', 3, false),
    ('S009321', 'Q-I-04', 'I', 4, false),
    ('S009322', 'Q-I-05', 'I', 5, false),
    ('S009323', 'Q-I-06', 'I', 6, false),
    ('S009324', 'Q-I-07', 'I', 7, false),
    ('S009325', 'Q-I-08', 'I', 8, false),
    ('S009326', 'Q-I-09', 'I', 9, false),
    ('S009327', 'Q-I-10', 'I', 10, false),
    ('S009328', 'Q-I-11', 'I', 11, false),
    ('S009329', 'Q-I-12', 'I', 12, false),
    ('S009330', 'Q-I-13', 'I', 13, false),
    ('S009331', 'Q-I-14', 'I', 14, false),
    ('S009332', 'Q-I-15', 'I', 15, false),
    ('S009333', 'Q-I-16', 'I', 16, false),
    ('S009334', 'Q-I-17', 'I', 17, false),
    ('S009335', 'Q-I-18', 'I', 18, false),
    ('S009336', 'Q-I-19', 'I', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (19 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009337', 'Q-J-01', 'J', 1, false),
    ('S009338', 'Q-J-02', 'J', 2, false),
    ('S009339', 'Q-J-03', 'J', 3, false),
    ('S009340', 'Q-J-04', 'J', 4, false),
    ('S009341', 'Q-J-05', 'J', 5, false),
    ('S009342', 'Q-J-06', 'J', 6, false),
    ('S009343', 'Q-J-07', 'J', 7, false),
    ('S009344', 'Q-J-08', 'J', 8, false),
    ('S009345', 'Q-J-09', 'J', 9, false),
    ('S009346', 'Q-J-10', 'J', 10, false),
    ('S009347', 'Q-J-11', 'J', 11, false),
    ('S009348', 'Q-J-12', 'J', 12, false),
    ('S009349', 'Q-J-13', 'J', 13, false),
    ('S009350', 'Q-J-14', 'J', 14, false),
    ('S009351', 'Q-J-15', 'J', 15, false),
    ('S009352', 'Q-J-16', 'J', 16, false),
    ('S009353', 'Q-J-17', 'J', 17, false),
    ('S009354', 'Q-J-18', 'J', 18, false),
    ('S009355', 'Q-J-19', 'J', 19, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009356', 'Q-K-01', 'K', 1, false),
    ('S009357', 'Q-K-02', 'K', 2, false),
    ('S009358', 'Q-K-03', 'K', 3, false),
    ('S009359', 'Q-K-04', 'K', 4, false),
    ('S009360', 'Q-K-05', 'K', 5, false),
    ('S009361', 'Q-K-06', 'K', 6, false),
    ('S009362', 'Q-K-07', 'K', 7, false),
    ('S009363', 'Q-K-08', 'K', 8, false),
    ('S009364', 'Q-K-09', 'K', 9, false),
    ('S009365', 'Q-K-10', 'K', 10, false),
    ('S009366', 'Q-K-11', 'K', 11, false),
    ('S009367', 'Q-K-12', 'K', 12, false),
    ('S009368', 'Q-K-13', 'K', 13, false),
    ('S009369', 'Q-K-14', 'K', 14, false),
    ('S009370', 'Q-K-15', 'K', 15, false),
    ('S009371', 'Q-K-16', 'K', 16, false),
    ('S009372', 'Q-K-17', 'K', 17, false),
    ('S009373', 'Q-K-18', 'K', 18, false),
    ('S009374', 'Q-K-19', 'K', 19, false),
    ('S009375', 'Q-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009376', 'Q-L-01', 'L', 1, false),
    ('S009377', 'Q-L-02', 'L', 2, false),
    ('S009378', 'Q-L-03', 'L', 3, false),
    ('S009379', 'Q-L-04', 'L', 4, false),
    ('S009380', 'Q-L-05', 'L', 5, false),
    ('S009381', 'Q-L-06', 'L', 6, false),
    ('S009382', 'Q-L-07', 'L', 7, false),
    ('S009383', 'Q-L-08', 'L', 8, false),
    ('S009384', 'Q-L-09', 'L', 9, false),
    ('S009385', 'Q-L-10', 'L', 10, false),
    ('S009386', 'Q-L-11', 'L', 11, false),
    ('S009387', 'Q-L-12', 'L', 12, false),
    ('S009388', 'Q-L-13', 'L', 13, false),
    ('S009389', 'Q-L-14', 'L', 14, false),
    ('S009390', 'Q-L-15', 'L', 15, false),
    ('S009391', 'Q-L-16', 'L', 16, false),
    ('S009392', 'Q-L-17', 'L', 17, false),
    ('S009393', 'Q-L-18', 'L', 18, false),
    ('S009394', 'Q-L-19', 'L', 19, false),
    ('S009395', 'Q-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009396', 'Q-M-01', 'M', 1, false),
    ('S009397', 'Q-M-02', 'M', 2, false),
    ('S009398', 'Q-M-03', 'M', 3, false),
    ('S009399', 'Q-M-04', 'M', 4, false),
    ('S009400', 'Q-M-05', 'M', 5, false),
    ('S009401', 'Q-M-06', 'M', 6, false),
    ('S009402', 'Q-M-07', 'M', 7, false),
    ('S009403', 'Q-M-08', 'M', 8, false),
    ('S009404', 'Q-M-09', 'M', 9, false),
    ('S009405', 'Q-M-10', 'M', 10, false),
    ('S009406', 'Q-M-11', 'M', 11, false),
    ('S009407', 'Q-M-12', 'M', 12, false),
    ('S009408', 'Q-M-13', 'M', 13, false),
    ('S009409', 'Q-M-14', 'M', 14, false),
    ('S009410', 'Q-M-15', 'M', 15, false),
    ('S009411', 'Q-M-16', 'M', 16, false),
    ('S009412', 'Q-M-17', 'M', 17, false),
    ('S009413', 'Q-M-18', 'M', 18, false),
    ('S009414', 'Q-M-19', 'M', 19, false),
    ('S009415', 'Q-M-20', 'M', 20, false),
    ('S009416', 'Q-M-21', 'M', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (21 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009417', 'Q-N-01', 'N', 1, false),
    ('S009418', 'Q-N-02', 'N', 2, false),
    ('S009419', 'Q-N-03', 'N', 3, false),
    ('S009420', 'Q-N-04', 'N', 4, false),
    ('S009421', 'Q-N-05', 'N', 5, false),
    ('S009422', 'Q-N-06', 'N', 6, false),
    ('S009423', 'Q-N-07', 'N', 7, false),
    ('S009424', 'Q-N-08', 'N', 8, false),
    ('S009425', 'Q-N-09', 'N', 9, false),
    ('S009426', 'Q-N-10', 'N', 10, false),
    ('S009427', 'Q-N-11', 'N', 11, false),
    ('S009428', 'Q-N-12', 'N', 12, false),
    ('S009429', 'Q-N-13', 'N', 13, false),
    ('S009430', 'Q-N-14', 'N', 14, false),
    ('S009431', 'Q-N-15', 'N', 15, false),
    ('S009432', 'Q-N-16', 'N', 16, false),
    ('S009433', 'Q-N-17', 'N', 17, false),
    ('S009434', 'Q-N-18', 'N', 18, false),
    ('S009435', 'Q-N-19', 'N', 19, false),
    ('S009436', 'Q-N-20', 'N', 20, false),
    ('S009437', 'Q-N-21', 'N', 21, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009438', 'Q-O-01', 'O', 1, false),
    ('S009439', 'Q-O-02', 'O', 2, false),
    ('S009440', 'Q-O-03', 'O', 3, false),
    ('S009441', 'Q-O-04', 'O', 4, false),
    ('S009442', 'Q-O-05', 'O', 5, false),
    ('S009443', 'Q-O-06', 'O', 6, false),
    ('S009444', 'Q-O-07', 'O', 7, false),
    ('S009445', 'Q-O-08', 'O', 8, false),
    ('S009446', 'Q-O-09', 'O', 9, false),
    ('S009447', 'Q-O-10', 'O', 10, false),
    ('S009448', 'Q-O-11', 'O', 11, false),
    ('S009449', 'Q-O-12', 'O', 12, false),
    ('S009450', 'Q-O-13', 'O', 13, false),
    ('S009451', 'Q-O-14', 'O', 14, false),
    ('S009452', 'Q-O-15', 'O', 15, false),
    ('S009453', 'Q-O-16', 'O', 16, false),
    ('S009454', 'Q-O-17', 'O', 17, false),
    ('S009455', 'Q-O-18', 'O', 18, false),
    ('S009456', 'Q-O-19', 'O', 19, false),
    ('S009457', 'Q-O-20', 'O', 20, false),
    ('S009458', 'Q-O-21', 'O', 21, false),
    ('S009459', 'Q-O-22', 'O', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009460', 'Q-P-01', 'P', 1, false),
    ('S009461', 'Q-P-02', 'P', 2, false),
    ('S009462', 'Q-P-03', 'P', 3, false),
    ('S009463', 'Q-P-04', 'P', 4, false),
    ('S009464', 'Q-P-05', 'P', 5, false),
    ('S009465', 'Q-P-06', 'P', 6, false),
    ('S009466', 'Q-P-07', 'P', 7, false),
    ('S009467', 'Q-P-08', 'P', 8, false),
    ('S009468', 'Q-P-09', 'P', 9, false),
    ('S009469', 'Q-P-10', 'P', 10, false),
    ('S009470', 'Q-P-11', 'P', 11, false),
    ('S009471', 'Q-P-12', 'P', 12, false),
    ('S009472', 'Q-P-13', 'P', 13, false),
    ('S009473', 'Q-P-14', 'P', 14, false),
    ('S009474', 'Q-P-15', 'P', 15, false),
    ('S009475', 'Q-P-16', 'P', 16, false),
    ('S009476', 'Q-P-17', 'P', 17, false),
    ('S009477', 'Q-P-18', 'P', 18, false),
    ('S009478', 'Q-P-19', 'P', 19, false),
    ('S009479', 'Q-P-20', 'P', 20, false),
    ('S009480', 'Q-P-21', 'P', 21, false),
    ('S009481', 'Q-P-22', 'P', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (22 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009482', 'Q-Q-01', 'Q', 1, false),
    ('S009483', 'Q-Q-02', 'Q', 2, false),
    ('S009484', 'Q-Q-03', 'Q', 3, false),
    ('S009485', 'Q-Q-04', 'Q', 4, false),
    ('S009486', 'Q-Q-05', 'Q', 5, false),
    ('S009487', 'Q-Q-06', 'Q', 6, false),
    ('S009488', 'Q-Q-07', 'Q', 7, false),
    ('S009489', 'Q-Q-08', 'Q', 8, false),
    ('S009490', 'Q-Q-09', 'Q', 9, false),
    ('S009491', 'Q-Q-10', 'Q', 10, false),
    ('S009492', 'Q-Q-11', 'Q', 11, false),
    ('S009493', 'Q-Q-12', 'Q', 12, false),
    ('S009494', 'Q-Q-13', 'Q', 13, false),
    ('S009495', 'Q-Q-14', 'Q', 14, false),
    ('S009496', 'Q-Q-15', 'Q', 15, false),
    ('S009497', 'Q-Q-16', 'Q', 16, false),
    ('S009498', 'Q-Q-17', 'Q', 17, false),
    ('S009499', 'Q-Q-18', 'Q', 18, false),
    ('S009500', 'Q-Q-19', 'Q', 19, false),
    ('S009501', 'Q-Q-20', 'Q', 20, false),
    ('S009502', 'Q-Q-21', 'Q', 21, false),
    ('S009503', 'Q-Q-22', 'Q', 22, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE Q'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE R (297 seats)
-- Row A (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009504', 'R-A-01', 'A', 1, false),
    ('S009505', 'R-A-02', 'A', 2, false),
    ('S009506', 'R-A-03', 'A', 3, false),
    ('S009507', 'R-A-04', 'A', 4, false),
    ('S009508', 'R-A-05', 'A', 5, false),
    ('S009509', 'R-A-06', 'A', 6, false),
    ('S009510', 'R-A-07', 'A', 7, false),
    ('S009511', 'R-A-08', 'A', 8, false),
    ('S009512', 'R-A-09', 'A', 9, false),
    ('S009513', 'R-A-10', 'A', 10, false),
    ('S009514', 'R-A-11', 'A', 11, false),
    ('S009515', 'R-A-12', 'A', 12, false),
    ('S009516', 'R-A-13', 'A', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009517', 'R-AA-01', 'AA', 1, false),
    ('S009518', 'R-AA-02', 'AA', 2, false),
    ('S009519', 'R-AA-03', 'AA', 3, false),
    ('S009520', 'R-AA-04', 'AA', 4, false),
    ('S009521', 'R-AA-05', 'AA', 5, false),
    ('S009522', 'R-AA-06', 'AA', 6, false),
    ('S009523', 'R-AA-07', 'AA', 7, false),
    ('S009524', 'R-AA-08', 'AA', 8, false),
    ('S009525', 'R-AA-09', 'AA', 9, false),
    ('S009526', 'R-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009527', 'R-B-01', 'B', 1, false),
    ('S009528', 'R-B-02', 'B', 2, false),
    ('S009529', 'R-B-03', 'B', 3, false),
    ('S009530', 'R-B-04', 'B', 4, false),
    ('S009531', 'R-B-05', 'B', 5, false),
    ('S009532', 'R-B-06', 'B', 6, false),
    ('S009533', 'R-B-07', 'B', 7, false),
    ('S009534', 'R-B-08', 'B', 8, false),
    ('S009535', 'R-B-09', 'B', 9, false),
    ('S009536', 'R-B-10', 'B', 10, false),
    ('S009537', 'R-B-11', 'B', 11, false),
    ('S009538', 'R-B-12', 'B', 12, false),
    ('S009539', 'R-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009540', 'R-C-01', 'C', 1, false),
    ('S009541', 'R-C-02', 'C', 2, false),
    ('S009542', 'R-C-03', 'C', 3, false),
    ('S009543', 'R-C-04', 'C', 4, false),
    ('S009544', 'R-C-05', 'C', 5, false),
    ('S009545', 'R-C-06', 'C', 6, false),
    ('S009546', 'R-C-07', 'C', 7, false),
    ('S009547', 'R-C-08', 'C', 8, false),
    ('S009548', 'R-C-09', 'C', 9, false),
    ('S009549', 'R-C-10', 'C', 10, false),
    ('S009550', 'R-C-11', 'C', 11, false),
    ('S009551', 'R-C-12', 'C', 12, false),
    ('S009552', 'R-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009553', 'R-D-01', 'D', 1, false),
    ('S009554', 'R-D-02', 'D', 2, false),
    ('S009555', 'R-D-03', 'D', 3, false),
    ('S009556', 'R-D-04', 'D', 4, false),
    ('S009557', 'R-D-05', 'D', 5, false),
    ('S009558', 'R-D-06', 'D', 6, false),
    ('S009559', 'R-D-07', 'D', 7, false),
    ('S009560', 'R-D-08', 'D', 8, false),
    ('S009561', 'R-D-09', 'D', 9, false),
    ('S009562', 'R-D-10', 'D', 10, false),
    ('S009563', 'R-D-11', 'D', 11, false),
    ('S009564', 'R-D-12', 'D', 12, false),
    ('S009565', 'R-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009566', 'R-E-01', 'E', 1, false),
    ('S009567', 'R-E-02', 'E', 2, false),
    ('S009568', 'R-E-03', 'E', 3, false),
    ('S009569', 'R-E-04', 'E', 4, false),
    ('S009570', 'R-E-05', 'E', 5, false),
    ('S009571', 'R-E-06', 'E', 6, false),
    ('S009572', 'R-E-07', 'E', 7, false),
    ('S009573', 'R-E-08', 'E', 8, false),
    ('S009574', 'R-E-09', 'E', 9, false),
    ('S009575', 'R-E-10', 'E', 10, false),
    ('S009576', 'R-E-11', 'E', 11, false),
    ('S009577', 'R-E-12', 'E', 12, false),
    ('S009578', 'R-E-13', 'E', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009579', 'R-F-01', 'F', 1, false),
    ('S009580', 'R-F-02', 'F', 2, false),
    ('S009581', 'R-F-03', 'F', 3, false),
    ('S009582', 'R-F-04', 'F', 4, false),
    ('S009583', 'R-F-05', 'F', 5, false),
    ('S009584', 'R-F-06', 'F', 6, false),
    ('S009585', 'R-F-07', 'F', 7, false),
    ('S009586', 'R-F-08', 'F', 8, false),
    ('S009587', 'R-F-09', 'F', 9, false),
    ('S009588', 'R-F-10', 'F', 10, false),
    ('S009589', 'R-F-11', 'F', 11, false),
    ('S009590', 'R-F-12', 'F', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009591', 'R-G-01', 'G', 1, false),
    ('S009592', 'R-G-02', 'G', 2, false),
    ('S009593', 'R-G-03', 'G', 3, false),
    ('S009594', 'R-G-04', 'G', 4, false),
    ('S009595', 'R-G-05', 'G', 5, false),
    ('S009596', 'R-G-06', 'G', 6, false),
    ('S009597', 'R-G-07', 'G', 7, false),
    ('S009598', 'R-G-08', 'G', 8, false),
    ('S009599', 'R-G-09', 'G', 9, false),
    ('S009600', 'R-G-10', 'G', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009601', 'R-H-01', 'H', 1, false),
    ('S009602', 'R-H-02', 'H', 2, false),
    ('S009603', 'R-H-03', 'H', 3, false),
    ('S009604', 'R-H-04', 'H', 4, false),
    ('S009605', 'R-H-05', 'H', 5, false),
    ('S009606', 'R-H-06', 'H', 6, false),
    ('S009607', 'R-H-07', 'H', 7, false),
    ('S009608', 'R-H-08', 'H', 8, false),
    ('S009609', 'R-H-09', 'H', 9, false),
    ('S009610', 'R-H-10', 'H', 10, false),
    ('S009611', 'R-H-11', 'H', 11, false),
    ('S009612', 'R-H-12', 'H', 12, false),
    ('S009613', 'R-H-13', 'H', 13, false),
    ('S009614', 'R-H-14', 'H', 14, false),
    ('S009615', 'R-H-15', 'H', 15, false),
    ('S009616', 'R-H-16', 'H', 16, false),
    ('S009617', 'R-H-17', 'H', 17, false),
    ('S009618', 'R-H-18', 'H', 18, false),
    ('S009619', 'R-H-19', 'H', 19, false),
    ('S009620', 'R-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009621', 'R-I-01', 'I', 1, false),
    ('S009622', 'R-I-02', 'I', 2, false),
    ('S009623', 'R-I-03', 'I', 3, false),
    ('S009624', 'R-I-04', 'I', 4, false),
    ('S009625', 'R-I-05', 'I', 5, false),
    ('S009626', 'R-I-06', 'I', 6, false),
    ('S009627', 'R-I-07', 'I', 7, false),
    ('S009628', 'R-I-08', 'I', 8, false),
    ('S009629', 'R-I-09', 'I', 9, false),
    ('S009630', 'R-I-10', 'I', 10, false),
    ('S009631', 'R-I-11', 'I', 11, false),
    ('S009632', 'R-I-12', 'I', 12, false),
    ('S009633', 'R-I-13', 'I', 13, false),
    ('S009634', 'R-I-14', 'I', 14, false),
    ('S009635', 'R-I-15', 'I', 15, false),
    ('S009636', 'R-I-16', 'I', 16, false),
    ('S009637', 'R-I-17', 'I', 17, false),
    ('S009638', 'R-I-18', 'I', 18, false),
    ('S009639', 'R-I-19', 'I', 19, false),
    ('S009640', 'R-I-20', 'I', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009641', 'R-J-01', 'J', 1, false),
    ('S009642', 'R-J-02', 'J', 2, false),
    ('S009643', 'R-J-03', 'J', 3, false),
    ('S009644', 'R-J-04', 'J', 4, false),
    ('S009645', 'R-J-05', 'J', 5, false),
    ('S009646', 'R-J-06', 'J', 6, false),
    ('S009647', 'R-J-07', 'J', 7, false),
    ('S009648', 'R-J-08', 'J', 8, false),
    ('S009649', 'R-J-09', 'J', 9, false),
    ('S009650', 'R-J-10', 'J', 10, false),
    ('S009651', 'R-J-11', 'J', 11, false),
    ('S009652', 'R-J-12', 'J', 12, false),
    ('S009653', 'R-J-13', 'J', 13, false),
    ('S009654', 'R-J-14', 'J', 14, false),
    ('S009655', 'R-J-15', 'J', 15, false),
    ('S009656', 'R-J-16', 'J', 16, false),
    ('S009657', 'R-J-17', 'J', 17, false),
    ('S009658', 'R-J-18', 'J', 18, false),
    ('S009659', 'R-J-19', 'J', 19, false),
    ('S009660', 'R-J-20', 'J', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009661', 'R-K-01', 'K', 1, false),
    ('S009662', 'R-K-02', 'K', 2, false),
    ('S009663', 'R-K-03', 'K', 3, false),
    ('S009664', 'R-K-04', 'K', 4, false),
    ('S009665', 'R-K-05', 'K', 5, false),
    ('S009666', 'R-K-06', 'K', 6, false),
    ('S009667', 'R-K-07', 'K', 7, false),
    ('S009668', 'R-K-08', 'K', 8, false),
    ('S009669', 'R-K-09', 'K', 9, false),
    ('S009670', 'R-K-10', 'K', 10, false),
    ('S009671', 'R-K-11', 'K', 11, false),
    ('S009672', 'R-K-12', 'K', 12, false),
    ('S009673', 'R-K-13', 'K', 13, false),
    ('S009674', 'R-K-14', 'K', 14, false),
    ('S009675', 'R-K-15', 'K', 15, false),
    ('S009676', 'R-K-16', 'K', 16, false),
    ('S009677', 'R-K-17', 'K', 17, false),
    ('S009678', 'R-K-18', 'K', 18, false),
    ('S009679', 'R-K-19', 'K', 19, false),
    ('S009680', 'R-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009681', 'R-L-01', 'L', 1, false),
    ('S009682', 'R-L-02', 'L', 2, false),
    ('S009683', 'R-L-03', 'L', 3, false),
    ('S009684', 'R-L-04', 'L', 4, false),
    ('S009685', 'R-L-05', 'L', 5, false),
    ('S009686', 'R-L-06', 'L', 6, false),
    ('S009687', 'R-L-07', 'L', 7, false),
    ('S009688', 'R-L-08', 'L', 8, false),
    ('S009689', 'R-L-09', 'L', 9, false),
    ('S009690', 'R-L-10', 'L', 10, false),
    ('S009691', 'R-L-11', 'L', 11, false),
    ('S009692', 'R-L-12', 'L', 12, false),
    ('S009693', 'R-L-13', 'L', 13, false),
    ('S009694', 'R-L-14', 'L', 14, false),
    ('S009695', 'R-L-15', 'L', 15, false),
    ('S009696', 'R-L-16', 'L', 16, false),
    ('S009697', 'R-L-17', 'L', 17, false),
    ('S009698', 'R-L-18', 'L', 18, false),
    ('S009699', 'R-L-19', 'L', 19, false),
    ('S009700', 'R-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009701', 'R-M-01', 'M', 1, false),
    ('S009702', 'R-M-02', 'M', 2, false),
    ('S009703', 'R-M-03', 'M', 3, false),
    ('S009704', 'R-M-04', 'M', 4, false),
    ('S009705', 'R-M-05', 'M', 5, false),
    ('S009706', 'R-M-06', 'M', 6, false),
    ('S009707', 'R-M-07', 'M', 7, false),
    ('S009708', 'R-M-08', 'M', 8, false),
    ('S009709', 'R-M-09', 'M', 9, false),
    ('S009710', 'R-M-10', 'M', 10, false),
    ('S009711', 'R-M-11', 'M', 11, false),
    ('S009712', 'R-M-12', 'M', 12, false),
    ('S009713', 'R-M-13', 'M', 13, false),
    ('S009714', 'R-M-14', 'M', 14, false),
    ('S009715', 'R-M-15', 'M', 15, false),
    ('S009716', 'R-M-16', 'M', 16, false),
    ('S009717', 'R-M-17', 'M', 17, false),
    ('S009718', 'R-M-18', 'M', 18, false),
    ('S009719', 'R-M-19', 'M', 19, false),
    ('S009720', 'R-M-20', 'M', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009721', 'R-N-01', 'N', 1, false),
    ('S009722', 'R-N-02', 'N', 2, false),
    ('S009723', 'R-N-03', 'N', 3, false),
    ('S009724', 'R-N-04', 'N', 4, false),
    ('S009725', 'R-N-05', 'N', 5, false),
    ('S009726', 'R-N-06', 'N', 6, false),
    ('S009727', 'R-N-07', 'N', 7, false),
    ('S009728', 'R-N-08', 'N', 8, false),
    ('S009729', 'R-N-09', 'N', 9, false),
    ('S009730', 'R-N-10', 'N', 10, false),
    ('S009731', 'R-N-11', 'N', 11, false),
    ('S009732', 'R-N-12', 'N', 12, false),
    ('S009733', 'R-N-13', 'N', 13, false),
    ('S009734', 'R-N-14', 'N', 14, false),
    ('S009735', 'R-N-15', 'N', 15, false),
    ('S009736', 'R-N-16', 'N', 16, false),
    ('S009737', 'R-N-17', 'N', 17, false),
    ('S009738', 'R-N-18', 'N', 18, false),
    ('S009739', 'R-N-19', 'N', 19, false),
    ('S009740', 'R-N-20', 'N', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009741', 'R-O-01', 'O', 1, false),
    ('S009742', 'R-O-02', 'O', 2, false),
    ('S009743', 'R-O-03', 'O', 3, false),
    ('S009744', 'R-O-04', 'O', 4, false),
    ('S009745', 'R-O-05', 'O', 5, false),
    ('S009746', 'R-O-06', 'O', 6, false),
    ('S009747', 'R-O-07', 'O', 7, false),
    ('S009748', 'R-O-08', 'O', 8, false),
    ('S009749', 'R-O-09', 'O', 9, false),
    ('S009750', 'R-O-10', 'O', 10, false),
    ('S009751', 'R-O-11', 'O', 11, false),
    ('S009752', 'R-O-12', 'O', 12, false),
    ('S009753', 'R-O-13', 'O', 13, false),
    ('S009754', 'R-O-14', 'O', 14, false),
    ('S009755', 'R-O-15', 'O', 15, false),
    ('S009756', 'R-O-16', 'O', 16, false),
    ('S009757', 'R-O-17', 'O', 17, false),
    ('S009758', 'R-O-18', 'O', 18, false),
    ('S009759', 'R-O-19', 'O', 19, false),
    ('S009760', 'R-O-20', 'O', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009761', 'R-P-01', 'P', 1, false),
    ('S009762', 'R-P-02', 'P', 2, false),
    ('S009763', 'R-P-03', 'P', 3, false),
    ('S009764', 'R-P-04', 'P', 4, false),
    ('S009765', 'R-P-05', 'P', 5, false),
    ('S009766', 'R-P-06', 'P', 6, false),
    ('S009767', 'R-P-07', 'P', 7, false),
    ('S009768', 'R-P-08', 'P', 8, false),
    ('S009769', 'R-P-09', 'P', 9, false),
    ('S009770', 'R-P-10', 'P', 10, false),
    ('S009771', 'R-P-11', 'P', 11, false),
    ('S009772', 'R-P-12', 'P', 12, false),
    ('S009773', 'R-P-13', 'P', 13, false),
    ('S009774', 'R-P-14', 'P', 14, false),
    ('S009775', 'R-P-15', 'P', 15, false),
    ('S009776', 'R-P-16', 'P', 16, false),
    ('S009777', 'R-P-17', 'P', 17, false),
    ('S009778', 'R-P-18', 'P', 18, false),
    ('S009779', 'R-P-19', 'P', 19, false),
    ('S009780', 'R-P-20', 'P', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009781', 'R-Q-01', 'Q', 1, false),
    ('S009782', 'R-Q-02', 'Q', 2, false),
    ('S009783', 'R-Q-03', 'Q', 3, false),
    ('S009784', 'R-Q-04', 'Q', 4, false),
    ('S009785', 'R-Q-05', 'Q', 5, false),
    ('S009786', 'R-Q-06', 'Q', 6, false),
    ('S009787', 'R-Q-07', 'Q', 7, false),
    ('S009788', 'R-Q-08', 'Q', 8, false),
    ('S009789', 'R-Q-09', 'Q', 9, false),
    ('S009790', 'R-Q-10', 'Q', 10, false),
    ('S009791', 'R-Q-11', 'Q', 11, false),
    ('S009792', 'R-Q-12', 'Q', 12, false),
    ('S009793', 'R-Q-13', 'Q', 13, false),
    ('S009794', 'R-Q-14', 'Q', 14, false),
    ('S009795', 'R-Q-15', 'Q', 15, false),
    ('S009796', 'R-Q-16', 'Q', 16, false),
    ('S009797', 'R-Q-17', 'Q', 17, false),
    ('S009798', 'R-Q-18', 'Q', 18, false),
    ('S009799', 'R-Q-19', 'Q', 19, false),
    ('S009800', 'R-Q-20', 'Q', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE R'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE S (297 seats)
-- Row A (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009801', 'S-A-01', 'A', 1, false),
    ('S009802', 'S-A-02', 'A', 2, false),
    ('S009803', 'S-A-03', 'A', 3, false),
    ('S009804', 'S-A-04', 'A', 4, false),
    ('S009805', 'S-A-05', 'A', 5, false),
    ('S009806', 'S-A-06', 'A', 6, false),
    ('S009807', 'S-A-07', 'A', 7, false),
    ('S009808', 'S-A-08', 'A', 8, false),
    ('S009809', 'S-A-09', 'A', 9, false),
    ('S009810', 'S-A-10', 'A', 10, false),
    ('S009811', 'S-A-11', 'A', 11, false),
    ('S009812', 'S-A-12', 'A', 12, false),
    ('S009813', 'S-A-13', 'A', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009814', 'S-AA-01', 'AA', 1, false),
    ('S009815', 'S-AA-02', 'AA', 2, false),
    ('S009816', 'S-AA-03', 'AA', 3, false),
    ('S009817', 'S-AA-04', 'AA', 4, false),
    ('S009818', 'S-AA-05', 'AA', 5, false),
    ('S009819', 'S-AA-06', 'AA', 6, false),
    ('S009820', 'S-AA-07', 'AA', 7, false),
    ('S009821', 'S-AA-08', 'AA', 8, false),
    ('S009822', 'S-AA-09', 'AA', 9, false),
    ('S009823', 'S-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009824', 'S-B-01', 'B', 1, false),
    ('S009825', 'S-B-02', 'B', 2, false),
    ('S009826', 'S-B-03', 'B', 3, false),
    ('S009827', 'S-B-04', 'B', 4, false),
    ('S009828', 'S-B-05', 'B', 5, false),
    ('S009829', 'S-B-06', 'B', 6, false),
    ('S009830', 'S-B-07', 'B', 7, false),
    ('S009831', 'S-B-08', 'B', 8, false),
    ('S009832', 'S-B-09', 'B', 9, false),
    ('S009833', 'S-B-10', 'B', 10, false),
    ('S009834', 'S-B-11', 'B', 11, false),
    ('S009835', 'S-B-12', 'B', 12, false),
    ('S009836', 'S-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009837', 'S-C-01', 'C', 1, false),
    ('S009838', 'S-C-02', 'C', 2, false),
    ('S009839', 'S-C-03', 'C', 3, false),
    ('S009840', 'S-C-04', 'C', 4, false),
    ('S009841', 'S-C-05', 'C', 5, false),
    ('S009842', 'S-C-06', 'C', 6, false),
    ('S009843', 'S-C-07', 'C', 7, false),
    ('S009844', 'S-C-08', 'C', 8, false),
    ('S009845', 'S-C-09', 'C', 9, false),
    ('S009846', 'S-C-10', 'C', 10, false),
    ('S009847', 'S-C-11', 'C', 11, false),
    ('S009848', 'S-C-12', 'C', 12, false),
    ('S009849', 'S-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009850', 'S-D-01', 'D', 1, false),
    ('S009851', 'S-D-02', 'D', 2, false),
    ('S009852', 'S-D-03', 'D', 3, false),
    ('S009853', 'S-D-04', 'D', 4, false),
    ('S009854', 'S-D-05', 'D', 5, false),
    ('S009855', 'S-D-06', 'D', 6, false),
    ('S009856', 'S-D-07', 'D', 7, false),
    ('S009857', 'S-D-08', 'D', 8, false),
    ('S009858', 'S-D-09', 'D', 9, false),
    ('S009859', 'S-D-10', 'D', 10, false),
    ('S009860', 'S-D-11', 'D', 11, false),
    ('S009861', 'S-D-12', 'D', 12, false),
    ('S009862', 'S-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009863', 'S-E-01', 'E', 1, false),
    ('S009864', 'S-E-02', 'E', 2, false),
    ('S009865', 'S-E-03', 'E', 3, false),
    ('S009866', 'S-E-04', 'E', 4, false),
    ('S009867', 'S-E-05', 'E', 5, false),
    ('S009868', 'S-E-06', 'E', 6, false),
    ('S009869', 'S-E-07', 'E', 7, false),
    ('S009870', 'S-E-08', 'E', 8, false),
    ('S009871', 'S-E-09', 'E', 9, false),
    ('S009872', 'S-E-10', 'E', 10, false),
    ('S009873', 'S-E-11', 'E', 11, false),
    ('S009874', 'S-E-12', 'E', 12, false),
    ('S009875', 'S-E-13', 'E', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009876', 'S-F-01', 'F', 1, false),
    ('S009877', 'S-F-02', 'F', 2, false),
    ('S009878', 'S-F-03', 'F', 3, false),
    ('S009879', 'S-F-04', 'F', 4, false),
    ('S009880', 'S-F-05', 'F', 5, false),
    ('S009881', 'S-F-06', 'F', 6, false),
    ('S009882', 'S-F-07', 'F', 7, false),
    ('S009883', 'S-F-08', 'F', 8, false),
    ('S009884', 'S-F-09', 'F', 9, false),
    ('S009885', 'S-F-10', 'F', 10, false),
    ('S009886', 'S-F-11', 'F', 11, false),
    ('S009887', 'S-F-12', 'F', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009888', 'S-G-01', 'G', 1, false),
    ('S009889', 'S-G-02', 'G', 2, false),
    ('S009890', 'S-G-03', 'G', 3, false),
    ('S009891', 'S-G-04', 'G', 4, false),
    ('S009892', 'S-G-05', 'G', 5, false),
    ('S009893', 'S-G-06', 'G', 6, false),
    ('S009894', 'S-G-07', 'G', 7, false),
    ('S009895', 'S-G-08', 'G', 8, false),
    ('S009896', 'S-G-09', 'G', 9, false),
    ('S009897', 'S-G-10', 'G', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009898', 'S-H-01', 'H', 1, false),
    ('S009899', 'S-H-02', 'H', 2, false),
    ('S009900', 'S-H-03', 'H', 3, false),
    ('S009901', 'S-H-04', 'H', 4, false),
    ('S009902', 'S-H-05', 'H', 5, false),
    ('S009903', 'S-H-06', 'H', 6, false),
    ('S009904', 'S-H-07', 'H', 7, false),
    ('S009905', 'S-H-08', 'H', 8, false),
    ('S009906', 'S-H-09', 'H', 9, false),
    ('S009907', 'S-H-10', 'H', 10, false),
    ('S009908', 'S-H-11', 'H', 11, false),
    ('S009909', 'S-H-12', 'H', 12, false),
    ('S009910', 'S-H-13', 'H', 13, false),
    ('S009911', 'S-H-14', 'H', 14, false),
    ('S009912', 'S-H-15', 'H', 15, false),
    ('S009913', 'S-H-16', 'H', 16, false),
    ('S009914', 'S-H-17', 'H', 17, false),
    ('S009915', 'S-H-18', 'H', 18, false),
    ('S009916', 'S-H-19', 'H', 19, false),
    ('S009917', 'S-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009918', 'S-I-01', 'I', 1, false),
    ('S009919', 'S-I-02', 'I', 2, false),
    ('S009920', 'S-I-03', 'I', 3, false),
    ('S009921', 'S-I-04', 'I', 4, false),
    ('S009922', 'S-I-05', 'I', 5, false),
    ('S009923', 'S-I-06', 'I', 6, false),
    ('S009924', 'S-I-07', 'I', 7, false),
    ('S009925', 'S-I-08', 'I', 8, false),
    ('S009926', 'S-I-09', 'I', 9, false),
    ('S009927', 'S-I-10', 'I', 10, false),
    ('S009928', 'S-I-11', 'I', 11, false),
    ('S009929', 'S-I-12', 'I', 12, false),
    ('S009930', 'S-I-13', 'I', 13, false),
    ('S009931', 'S-I-14', 'I', 14, false),
    ('S009932', 'S-I-15', 'I', 15, false),
    ('S009933', 'S-I-16', 'I', 16, false),
    ('S009934', 'S-I-17', 'I', 17, false),
    ('S009935', 'S-I-18', 'I', 18, false),
    ('S009936', 'S-I-19', 'I', 19, false),
    ('S009937', 'S-I-20', 'I', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009938', 'S-J-01', 'J', 1, false),
    ('S009939', 'S-J-02', 'J', 2, false),
    ('S009940', 'S-J-03', 'J', 3, false),
    ('S009941', 'S-J-04', 'J', 4, false),
    ('S009942', 'S-J-05', 'J', 5, false),
    ('S009943', 'S-J-06', 'J', 6, false),
    ('S009944', 'S-J-07', 'J', 7, false),
    ('S009945', 'S-J-08', 'J', 8, false),
    ('S009946', 'S-J-09', 'J', 9, false),
    ('S009947', 'S-J-10', 'J', 10, false),
    ('S009948', 'S-J-11', 'J', 11, false),
    ('S009949', 'S-J-12', 'J', 12, false),
    ('S009950', 'S-J-13', 'J', 13, false),
    ('S009951', 'S-J-14', 'J', 14, false),
    ('S009952', 'S-J-15', 'J', 15, false),
    ('S009953', 'S-J-16', 'J', 16, false),
    ('S009954', 'S-J-17', 'J', 17, false),
    ('S009955', 'S-J-18', 'J', 18, false),
    ('S009956', 'S-J-19', 'J', 19, false),
    ('S009957', 'S-J-20', 'J', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009958', 'S-K-01', 'K', 1, false),
    ('S009959', 'S-K-02', 'K', 2, false),
    ('S009960', 'S-K-03', 'K', 3, false),
    ('S009961', 'S-K-04', 'K', 4, false),
    ('S009962', 'S-K-05', 'K', 5, false),
    ('S009963', 'S-K-06', 'K', 6, false),
    ('S009964', 'S-K-07', 'K', 7, false),
    ('S009965', 'S-K-08', 'K', 8, false),
    ('S009966', 'S-K-09', 'K', 9, false),
    ('S009967', 'S-K-10', 'K', 10, false),
    ('S009968', 'S-K-11', 'K', 11, false),
    ('S009969', 'S-K-12', 'K', 12, false),
    ('S009970', 'S-K-13', 'K', 13, false),
    ('S009971', 'S-K-14', 'K', 14, false),
    ('S009972', 'S-K-15', 'K', 15, false),
    ('S009973', 'S-K-16', 'K', 16, false),
    ('S009974', 'S-K-17', 'K', 17, false),
    ('S009975', 'S-K-18', 'K', 18, false),
    ('S009976', 'S-K-19', 'K', 19, false),
    ('S009977', 'S-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009978', 'S-L-01', 'L', 1, false),
    ('S009979', 'S-L-02', 'L', 2, false),
    ('S009980', 'S-L-03', 'L', 3, false),
    ('S009981', 'S-L-04', 'L', 4, false),
    ('S009982', 'S-L-05', 'L', 5, false),
    ('S009983', 'S-L-06', 'L', 6, false),
    ('S009984', 'S-L-07', 'L', 7, false),
    ('S009985', 'S-L-08', 'L', 8, false),
    ('S009986', 'S-L-09', 'L', 9, false),
    ('S009987', 'S-L-10', 'L', 10, false),
    ('S009988', 'S-L-11', 'L', 11, false),
    ('S009989', 'S-L-12', 'L', 12, false),
    ('S009990', 'S-L-13', 'L', 13, false),
    ('S009991', 'S-L-14', 'L', 14, false),
    ('S009992', 'S-L-15', 'L', 15, false),
    ('S009993', 'S-L-16', 'L', 16, false),
    ('S009994', 'S-L-17', 'L', 17, false),
    ('S009995', 'S-L-18', 'L', 18, false),
    ('S009996', 'S-L-19', 'L', 19, false),
    ('S009997', 'S-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S009998', 'S-M-01', 'M', 1, false),
    ('S009999', 'S-M-02', 'M', 2, false),
    ('S010000', 'S-M-03', 'M', 3, false),
    ('S010001', 'S-M-04', 'M', 4, false),
    ('S010002', 'S-M-05', 'M', 5, false),
    ('S010003', 'S-M-06', 'M', 6, false),
    ('S010004', 'S-M-07', 'M', 7, false),
    ('S010005', 'S-M-08', 'M', 8, false),
    ('S010006', 'S-M-09', 'M', 9, false),
    ('S010007', 'S-M-10', 'M', 10, false),
    ('S010008', 'S-M-11', 'M', 11, false),
    ('S010009', 'S-M-12', 'M', 12, false),
    ('S010010', 'S-M-13', 'M', 13, false),
    ('S010011', 'S-M-14', 'M', 14, false),
    ('S010012', 'S-M-15', 'M', 15, false),
    ('S010013', 'S-M-16', 'M', 16, false),
    ('S010014', 'S-M-17', 'M', 17, false),
    ('S010015', 'S-M-18', 'M', 18, false),
    ('S010016', 'S-M-19', 'M', 19, false),
    ('S010017', 'S-M-20', 'M', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010018', 'S-N-01', 'N', 1, false),
    ('S010019', 'S-N-02', 'N', 2, false),
    ('S010020', 'S-N-03', 'N', 3, false),
    ('S010021', 'S-N-04', 'N', 4, false),
    ('S010022', 'S-N-05', 'N', 5, false),
    ('S010023', 'S-N-06', 'N', 6, false),
    ('S010024', 'S-N-07', 'N', 7, false),
    ('S010025', 'S-N-08', 'N', 8, false),
    ('S010026', 'S-N-09', 'N', 9, false),
    ('S010027', 'S-N-10', 'N', 10, false),
    ('S010028', 'S-N-11', 'N', 11, false),
    ('S010029', 'S-N-12', 'N', 12, false),
    ('S010030', 'S-N-13', 'N', 13, false),
    ('S010031', 'S-N-14', 'N', 14, false),
    ('S010032', 'S-N-15', 'N', 15, false),
    ('S010033', 'S-N-16', 'N', 16, false),
    ('S010034', 'S-N-17', 'N', 17, false),
    ('S010035', 'S-N-18', 'N', 18, false),
    ('S010036', 'S-N-19', 'N', 19, false),
    ('S010037', 'S-N-20', 'N', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010038', 'S-O-01', 'O', 1, false),
    ('S010039', 'S-O-02', 'O', 2, false),
    ('S010040', 'S-O-03', 'O', 3, false),
    ('S010041', 'S-O-04', 'O', 4, false),
    ('S010042', 'S-O-05', 'O', 5, false),
    ('S010043', 'S-O-06', 'O', 6, false),
    ('S010044', 'S-O-07', 'O', 7, false),
    ('S010045', 'S-O-08', 'O', 8, false),
    ('S010046', 'S-O-09', 'O', 9, false),
    ('S010047', 'S-O-10', 'O', 10, false),
    ('S010048', 'S-O-11', 'O', 11, false),
    ('S010049', 'S-O-12', 'O', 12, false),
    ('S010050', 'S-O-13', 'O', 13, false),
    ('S010051', 'S-O-14', 'O', 14, false),
    ('S010052', 'S-O-15', 'O', 15, false),
    ('S010053', 'S-O-16', 'O', 16, false),
    ('S010054', 'S-O-17', 'O', 17, false),
    ('S010055', 'S-O-18', 'O', 18, false),
    ('S010056', 'S-O-19', 'O', 19, false),
    ('S010057', 'S-O-20', 'O', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010058', 'S-P-01', 'P', 1, false),
    ('S010059', 'S-P-02', 'P', 2, false),
    ('S010060', 'S-P-03', 'P', 3, false),
    ('S010061', 'S-P-04', 'P', 4, false),
    ('S010062', 'S-P-05', 'P', 5, false),
    ('S010063', 'S-P-06', 'P', 6, false),
    ('S010064', 'S-P-07', 'P', 7, false),
    ('S010065', 'S-P-08', 'P', 8, false),
    ('S010066', 'S-P-09', 'P', 9, false),
    ('S010067', 'S-P-10', 'P', 10, false),
    ('S010068', 'S-P-11', 'P', 11, false),
    ('S010069', 'S-P-12', 'P', 12, false),
    ('S010070', 'S-P-13', 'P', 13, false),
    ('S010071', 'S-P-14', 'P', 14, false),
    ('S010072', 'S-P-15', 'P', 15, false),
    ('S010073', 'S-P-16', 'P', 16, false),
    ('S010074', 'S-P-17', 'P', 17, false),
    ('S010075', 'S-P-18', 'P', 18, false),
    ('S010076', 'S-P-19', 'P', 19, false),
    ('S010077', 'S-P-20', 'P', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010078', 'S-Q-01', 'Q', 1, false),
    ('S010079', 'S-Q-02', 'Q', 2, false),
    ('S010080', 'S-Q-03', 'Q', 3, false),
    ('S010081', 'S-Q-04', 'Q', 4, false),
    ('S010082', 'S-Q-05', 'Q', 5, false),
    ('S010083', 'S-Q-06', 'Q', 6, false),
    ('S010084', 'S-Q-07', 'Q', 7, false),
    ('S010085', 'S-Q-08', 'Q', 8, false),
    ('S010086', 'S-Q-09', 'Q', 9, false),
    ('S010087', 'S-Q-10', 'Q', 10, false),
    ('S010088', 'S-Q-11', 'Q', 11, false),
    ('S010089', 'S-Q-12', 'Q', 12, false),
    ('S010090', 'S-Q-13', 'Q', 13, false),
    ('S010091', 'S-Q-14', 'Q', 14, false),
    ('S010092', 'S-Q-15', 'Q', 15, false),
    ('S010093', 'S-Q-16', 'Q', 16, false),
    ('S010094', 'S-Q-17', 'Q', 17, false),
    ('S010095', 'S-Q-18', 'Q', 18, false),
    ('S010096', 'S-Q-19', 'Q', 19, false),
    ('S010097', 'S-Q-20', 'Q', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE S'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE T (297 seats)
-- Row A (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010098', 'T-A-01', 'A', 1, false),
    ('S010099', 'T-A-02', 'A', 2, false),
    ('S010100', 'T-A-03', 'A', 3, false),
    ('S010101', 'T-A-04', 'A', 4, false),
    ('S010102', 'T-A-05', 'A', 5, false),
    ('S010103', 'T-A-06', 'A', 6, false),
    ('S010104', 'T-A-07', 'A', 7, false),
    ('S010105', 'T-A-08', 'A', 8, false),
    ('S010106', 'T-A-09', 'A', 9, false),
    ('S010107', 'T-A-10', 'A', 10, false),
    ('S010108', 'T-A-11', 'A', 11, false),
    ('S010109', 'T-A-12', 'A', 12, false),
    ('S010110', 'T-A-13', 'A', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AA (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010111', 'T-AA-01', 'AA', 1, false),
    ('S010112', 'T-AA-02', 'AA', 2, false),
    ('S010113', 'T-AA-03', 'AA', 3, false),
    ('S010114', 'T-AA-04', 'AA', 4, false),
    ('S010115', 'T-AA-05', 'AA', 5, false),
    ('S010116', 'T-AA-06', 'AA', 6, false),
    ('S010117', 'T-AA-07', 'AA', 7, false),
    ('S010118', 'T-AA-08', 'AA', 8, false),
    ('S010119', 'T-AA-09', 'AA', 9, false),
    ('S010120', 'T-AA-10', 'AA', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row B (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010121', 'T-B-01', 'B', 1, false),
    ('S010122', 'T-B-02', 'B', 2, false),
    ('S010123', 'T-B-03', 'B', 3, false),
    ('S010124', 'T-B-04', 'B', 4, false),
    ('S010125', 'T-B-05', 'B', 5, false),
    ('S010126', 'T-B-06', 'B', 6, false),
    ('S010127', 'T-B-07', 'B', 7, false),
    ('S010128', 'T-B-08', 'B', 8, false),
    ('S010129', 'T-B-09', 'B', 9, false),
    ('S010130', 'T-B-10', 'B', 10, false),
    ('S010131', 'T-B-11', 'B', 11, false),
    ('S010132', 'T-B-12', 'B', 12, false),
    ('S010133', 'T-B-13', 'B', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row C (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010134', 'T-C-01', 'C', 1, false),
    ('S010135', 'T-C-02', 'C', 2, false),
    ('S010136', 'T-C-03', 'C', 3, false),
    ('S010137', 'T-C-04', 'C', 4, false),
    ('S010138', 'T-C-05', 'C', 5, false),
    ('S010139', 'T-C-06', 'C', 6, false),
    ('S010140', 'T-C-07', 'C', 7, false),
    ('S010141', 'T-C-08', 'C', 8, false),
    ('S010142', 'T-C-09', 'C', 9, false),
    ('S010143', 'T-C-10', 'C', 10, false),
    ('S010144', 'T-C-11', 'C', 11, false),
    ('S010145', 'T-C-12', 'C', 12, false),
    ('S010146', 'T-C-13', 'C', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row D (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010147', 'T-D-01', 'D', 1, false),
    ('S010148', 'T-D-02', 'D', 2, false),
    ('S010149', 'T-D-03', 'D', 3, false),
    ('S010150', 'T-D-04', 'D', 4, false),
    ('S010151', 'T-D-05', 'D', 5, false),
    ('S010152', 'T-D-06', 'D', 6, false),
    ('S010153', 'T-D-07', 'D', 7, false),
    ('S010154', 'T-D-08', 'D', 8, false),
    ('S010155', 'T-D-09', 'D', 9, false),
    ('S010156', 'T-D-10', 'D', 10, false),
    ('S010157', 'T-D-11', 'D', 11, false),
    ('S010158', 'T-D-12', 'D', 12, false),
    ('S010159', 'T-D-13', 'D', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row E (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010160', 'T-E-01', 'E', 1, false),
    ('S010161', 'T-E-02', 'E', 2, false),
    ('S010162', 'T-E-03', 'E', 3, false),
    ('S010163', 'T-E-04', 'E', 4, false),
    ('S010164', 'T-E-05', 'E', 5, false),
    ('S010165', 'T-E-06', 'E', 6, false),
    ('S010166', 'T-E-07', 'E', 7, false),
    ('S010167', 'T-E-08', 'E', 8, false),
    ('S010168', 'T-E-09', 'E', 9, false),
    ('S010169', 'T-E-10', 'E', 10, false),
    ('S010170', 'T-E-11', 'E', 11, false),
    ('S010171', 'T-E-12', 'E', 12, false),
    ('S010172', 'T-E-13', 'E', 13, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row F (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010173', 'T-F-01', 'F', 1, false),
    ('S010174', 'T-F-02', 'F', 2, false),
    ('S010175', 'T-F-03', 'F', 3, false),
    ('S010176', 'T-F-04', 'F', 4, false),
    ('S010177', 'T-F-05', 'F', 5, false),
    ('S010178', 'T-F-06', 'F', 6, false),
    ('S010179', 'T-F-07', 'F', 7, false),
    ('S010180', 'T-F-08', 'F', 8, false),
    ('S010181', 'T-F-09', 'F', 9, false),
    ('S010182', 'T-F-10', 'F', 10, false),
    ('S010183', 'T-F-11', 'F', 11, false),
    ('S010184', 'T-F-12', 'F', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row G (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010185', 'T-G-01', 'G', 1, false),
    ('S010186', 'T-G-02', 'G', 2, false),
    ('S010187', 'T-G-03', 'G', 3, false),
    ('S010188', 'T-G-04', 'G', 4, false),
    ('S010189', 'T-G-05', 'G', 5, false),
    ('S010190', 'T-G-06', 'G', 6, false),
    ('S010191', 'T-G-07', 'G', 7, false),
    ('S010192', 'T-G-08', 'G', 8, false),
    ('S010193', 'T-G-09', 'G', 9, false),
    ('S010194', 'T-G-10', 'G', 10, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row H (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010195', 'T-H-01', 'H', 1, false),
    ('S010196', 'T-H-02', 'H', 2, false),
    ('S010197', 'T-H-03', 'H', 3, false),
    ('S010198', 'T-H-04', 'H', 4, false),
    ('S010199', 'T-H-05', 'H', 5, false),
    ('S010200', 'T-H-06', 'H', 6, false),
    ('S010201', 'T-H-07', 'H', 7, false),
    ('S010202', 'T-H-08', 'H', 8, false),
    ('S010203', 'T-H-09', 'H', 9, false),
    ('S010204', 'T-H-10', 'H', 10, false),
    ('S010205', 'T-H-11', 'H', 11, false),
    ('S010206', 'T-H-12', 'H', 12, false),
    ('S010207', 'T-H-13', 'H', 13, false),
    ('S010208', 'T-H-14', 'H', 14, false),
    ('S010209', 'T-H-15', 'H', 15, false),
    ('S010210', 'T-H-16', 'H', 16, false),
    ('S010211', 'T-H-17', 'H', 17, false),
    ('S010212', 'T-H-18', 'H', 18, false),
    ('S010213', 'T-H-19', 'H', 19, false),
    ('S010214', 'T-H-20', 'H', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row I (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010215', 'T-I-01', 'I', 1, false),
    ('S010216', 'T-I-02', 'I', 2, false),
    ('S010217', 'T-I-03', 'I', 3, false),
    ('S010218', 'T-I-04', 'I', 4, false),
    ('S010219', 'T-I-05', 'I', 5, false),
    ('S010220', 'T-I-06', 'I', 6, false),
    ('S010221', 'T-I-07', 'I', 7, false),
    ('S010222', 'T-I-08', 'I', 8, false),
    ('S010223', 'T-I-09', 'I', 9, false),
    ('S010224', 'T-I-10', 'I', 10, false),
    ('S010225', 'T-I-11', 'I', 11, false),
    ('S010226', 'T-I-12', 'I', 12, false),
    ('S010227', 'T-I-13', 'I', 13, false),
    ('S010228', 'T-I-14', 'I', 14, false),
    ('S010229', 'T-I-15', 'I', 15, false),
    ('S010230', 'T-I-16', 'I', 16, false),
    ('S010231', 'T-I-17', 'I', 17, false),
    ('S010232', 'T-I-18', 'I', 18, false),
    ('S010233', 'T-I-19', 'I', 19, false),
    ('S010234', 'T-I-20', 'I', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row J (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010235', 'T-J-01', 'J', 1, false),
    ('S010236', 'T-J-02', 'J', 2, false),
    ('S010237', 'T-J-03', 'J', 3, false),
    ('S010238', 'T-J-04', 'J', 4, false),
    ('S010239', 'T-J-05', 'J', 5, false),
    ('S010240', 'T-J-06', 'J', 6, false),
    ('S010241', 'T-J-07', 'J', 7, false),
    ('S010242', 'T-J-08', 'J', 8, false),
    ('S010243', 'T-J-09', 'J', 9, false),
    ('S010244', 'T-J-10', 'J', 10, false),
    ('S010245', 'T-J-11', 'J', 11, false),
    ('S010246', 'T-J-12', 'J', 12, false),
    ('S010247', 'T-J-13', 'J', 13, false),
    ('S010248', 'T-J-14', 'J', 14, false),
    ('S010249', 'T-J-15', 'J', 15, false),
    ('S010250', 'T-J-16', 'J', 16, false),
    ('S010251', 'T-J-17', 'J', 17, false),
    ('S010252', 'T-J-18', 'J', 18, false),
    ('S010253', 'T-J-19', 'J', 19, false),
    ('S010254', 'T-J-20', 'J', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row K (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010255', 'T-K-01', 'K', 1, false),
    ('S010256', 'T-K-02', 'K', 2, false),
    ('S010257', 'T-K-03', 'K', 3, false),
    ('S010258', 'T-K-04', 'K', 4, false),
    ('S010259', 'T-K-05', 'K', 5, false),
    ('S010260', 'T-K-06', 'K', 6, false),
    ('S010261', 'T-K-07', 'K', 7, false),
    ('S010262', 'T-K-08', 'K', 8, false),
    ('S010263', 'T-K-09', 'K', 9, false),
    ('S010264', 'T-K-10', 'K', 10, false),
    ('S010265', 'T-K-11', 'K', 11, false),
    ('S010266', 'T-K-12', 'K', 12, false),
    ('S010267', 'T-K-13', 'K', 13, false),
    ('S010268', 'T-K-14', 'K', 14, false),
    ('S010269', 'T-K-15', 'K', 15, false),
    ('S010270', 'T-K-16', 'K', 16, false),
    ('S010271', 'T-K-17', 'K', 17, false),
    ('S010272', 'T-K-18', 'K', 18, false),
    ('S010273', 'T-K-19', 'K', 19, false),
    ('S010274', 'T-K-20', 'K', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row L (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010275', 'T-L-01', 'L', 1, false),
    ('S010276', 'T-L-02', 'L', 2, false),
    ('S010277', 'T-L-03', 'L', 3, false),
    ('S010278', 'T-L-04', 'L', 4, false),
    ('S010279', 'T-L-05', 'L', 5, false),
    ('S010280', 'T-L-06', 'L', 6, false),
    ('S010281', 'T-L-07', 'L', 7, false),
    ('S010282', 'T-L-08', 'L', 8, false),
    ('S010283', 'T-L-09', 'L', 9, false),
    ('S010284', 'T-L-10', 'L', 10, false),
    ('S010285', 'T-L-11', 'L', 11, false),
    ('S010286', 'T-L-12', 'L', 12, false),
    ('S010287', 'T-L-13', 'L', 13, false),
    ('S010288', 'T-L-14', 'L', 14, false),
    ('S010289', 'T-L-15', 'L', 15, false),
    ('S010290', 'T-L-16', 'L', 16, false),
    ('S010291', 'T-L-17', 'L', 17, false),
    ('S010292', 'T-L-18', 'L', 18, false),
    ('S010293', 'T-L-19', 'L', 19, false),
    ('S010294', 'T-L-20', 'L', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row M (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010295', 'T-M-01', 'M', 1, false),
    ('S010296', 'T-M-02', 'M', 2, false),
    ('S010297', 'T-M-03', 'M', 3, false),
    ('S010298', 'T-M-04', 'M', 4, false),
    ('S010299', 'T-M-05', 'M', 5, false),
    ('S010300', 'T-M-06', 'M', 6, false),
    ('S010301', 'T-M-07', 'M', 7, false),
    ('S010302', 'T-M-08', 'M', 8, false),
    ('S010303', 'T-M-09', 'M', 9, false),
    ('S010304', 'T-M-10', 'M', 10, false),
    ('S010305', 'T-M-11', 'M', 11, false),
    ('S010306', 'T-M-12', 'M', 12, false),
    ('S010307', 'T-M-13', 'M', 13, false),
    ('S010308', 'T-M-14', 'M', 14, false),
    ('S010309', 'T-M-15', 'M', 15, false),
    ('S010310', 'T-M-16', 'M', 16, false),
    ('S010311', 'T-M-17', 'M', 17, false),
    ('S010312', 'T-M-18', 'M', 18, false),
    ('S010313', 'T-M-19', 'M', 19, false),
    ('S010314', 'T-M-20', 'M', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row N (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010315', 'T-N-01', 'N', 1, false),
    ('S010316', 'T-N-02', 'N', 2, false),
    ('S010317', 'T-N-03', 'N', 3, false),
    ('S010318', 'T-N-04', 'N', 4, false),
    ('S010319', 'T-N-05', 'N', 5, false),
    ('S010320', 'T-N-06', 'N', 6, false),
    ('S010321', 'T-N-07', 'N', 7, false),
    ('S010322', 'T-N-08', 'N', 8, false),
    ('S010323', 'T-N-09', 'N', 9, false),
    ('S010324', 'T-N-10', 'N', 10, false),
    ('S010325', 'T-N-11', 'N', 11, false),
    ('S010326', 'T-N-12', 'N', 12, false),
    ('S010327', 'T-N-13', 'N', 13, false),
    ('S010328', 'T-N-14', 'N', 14, false),
    ('S010329', 'T-N-15', 'N', 15, false),
    ('S010330', 'T-N-16', 'N', 16, false),
    ('S010331', 'T-N-17', 'N', 17, false),
    ('S010332', 'T-N-18', 'N', 18, false),
    ('S010333', 'T-N-19', 'N', 19, false),
    ('S010334', 'T-N-20', 'N', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row O (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010335', 'T-O-01', 'O', 1, false),
    ('S010336', 'T-O-02', 'O', 2, false),
    ('S010337', 'T-O-03', 'O', 3, false),
    ('S010338', 'T-O-04', 'O', 4, false),
    ('S010339', 'T-O-05', 'O', 5, false),
    ('S010340', 'T-O-06', 'O', 6, false),
    ('S010341', 'T-O-07', 'O', 7, false),
    ('S010342', 'T-O-08', 'O', 8, false),
    ('S010343', 'T-O-09', 'O', 9, false),
    ('S010344', 'T-O-10', 'O', 10, false),
    ('S010345', 'T-O-11', 'O', 11, false),
    ('S010346', 'T-O-12', 'O', 12, false),
    ('S010347', 'T-O-13', 'O', 13, false),
    ('S010348', 'T-O-14', 'O', 14, false),
    ('S010349', 'T-O-15', 'O', 15, false),
    ('S010350', 'T-O-16', 'O', 16, false),
    ('S010351', 'T-O-17', 'O', 17, false),
    ('S010352', 'T-O-18', 'O', 18, false),
    ('S010353', 'T-O-19', 'O', 19, false),
    ('S010354', 'T-O-20', 'O', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row P (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010355', 'T-P-01', 'P', 1, false),
    ('S010356', 'T-P-02', 'P', 2, false),
    ('S010357', 'T-P-03', 'P', 3, false),
    ('S010358', 'T-P-04', 'P', 4, false),
    ('S010359', 'T-P-05', 'P', 5, false),
    ('S010360', 'T-P-06', 'P', 6, false),
    ('S010361', 'T-P-07', 'P', 7, false),
    ('S010362', 'T-P-08', 'P', 8, false),
    ('S010363', 'T-P-09', 'P', 9, false),
    ('S010364', 'T-P-10', 'P', 10, false),
    ('S010365', 'T-P-11', 'P', 11, false),
    ('S010366', 'T-P-12', 'P', 12, false),
    ('S010367', 'T-P-13', 'P', 13, false),
    ('S010368', 'T-P-14', 'P', 14, false),
    ('S010369', 'T-P-15', 'P', 15, false),
    ('S010370', 'T-P-16', 'P', 16, false),
    ('S010371', 'T-P-17', 'P', 17, false),
    ('S010372', 'T-P-18', 'P', 18, false),
    ('S010373', 'T-P-19', 'P', 19, false),
    ('S010374', 'T-P-20', 'P', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row Q (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S010375', 'T-Q-01', 'Q', 1, false),
    ('S010376', 'T-Q-02', 'Q', 2, false),
    ('S010377', 'T-Q-03', 'Q', 3, false),
    ('S010378', 'T-Q-04', 'Q', 4, false),
    ('S010379', 'T-Q-05', 'Q', 5, false),
    ('S010380', 'T-Q-06', 'Q', 6, false),
    ('S010381', 'T-Q-07', 'Q', 7, false),
    ('S010382', 'T-Q-08', 'Q', 8, false),
    ('S010383', 'T-Q-09', 'Q', 9, false),
    ('S010384', 'T-Q-10', 'Q', 10, false),
    ('S010385', 'T-Q-11', 'Q', 11, false),
    ('S010386', 'T-Q-12', 'Q', 12, false),
    ('S010387', 'T-Q-13', 'Q', 13, false),
    ('S010388', 'T-Q-14', 'Q', 14, false),
    ('S010389', 'T-Q-15', 'Q', 15, false),
    ('S010390', 'T-Q-16', 'Q', 16, false),
    ('S010391', 'T-Q-17', 'Q', 17, false),
    ('S010392', 'T-Q-18', 'Q', 18, false),
    ('S010393', 'T-Q-19', 'Q', 19, false),
    ('S010394', 'T-Q-20', 'Q', 20, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE T'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

