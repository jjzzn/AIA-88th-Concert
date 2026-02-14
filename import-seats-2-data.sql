
-- ZONE A1 (264 seats)
-- Row AA (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000001', 'A1-AA-01', 'AA', 1, false),
    ('S000002', 'A1-AA-02', 'AA', 2, false),
    ('S000003', 'A1-AA-03', 'AA', 3, false),
    ('S000004', 'A1-AA-04', 'AA', 4, false),
    ('S000005', 'A1-AA-05', 'AA', 5, false),
    ('S000006', 'A1-AA-06', 'AA', 6, false),
    ('S000007', 'A1-AA-07', 'AA', 7, false),
    ('S000008', 'A1-AA-08', 'AA', 8, false),
    ('S000009', 'A1-AA-09', 'AA', 9, false),
    ('S000010', 'A1-AA-10', 'AA', 10, false),
    ('S000011', 'A1-AA-11', 'AA', 11, false),
    ('S000012', 'A1-AA-12', 'AA', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AB (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000013', 'A1-AB-01', 'AB', 1, false),
    ('S000014', 'A1-AB-02', 'AB', 2, false),
    ('S000015', 'A1-AB-03', 'AB', 3, false),
    ('S000016', 'A1-AB-04', 'AB', 4, false),
    ('S000017', 'A1-AB-05', 'AB', 5, false),
    ('S000018', 'A1-AB-06', 'AB', 6, false),
    ('S000019', 'A1-AB-07', 'AB', 7, false),
    ('S000020', 'A1-AB-08', 'AB', 8, false),
    ('S000021', 'A1-AB-09', 'AB', 9, false),
    ('S000022', 'A1-AB-10', 'AB', 10, false),
    ('S000023', 'A1-AB-11', 'AB', 11, false),
    ('S000024', 'A1-AB-12', 'AB', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AC (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000025', 'A1-AC-01', 'AC', 1, false),
    ('S000026', 'A1-AC-02', 'AC', 2, false),
    ('S000027', 'A1-AC-03', 'AC', 3, false),
    ('S000028', 'A1-AC-04', 'AC', 4, false),
    ('S000029', 'A1-AC-05', 'AC', 5, false),
    ('S000030', 'A1-AC-06', 'AC', 6, false),
    ('S000031', 'A1-AC-07', 'AC', 7, false),
    ('S000032', 'A1-AC-08', 'AC', 8, false),
    ('S000033', 'A1-AC-09', 'AC', 9, false),
    ('S000034', 'A1-AC-10', 'AC', 10, false),
    ('S000035', 'A1-AC-11', 'AC', 11, false),
    ('S000036', 'A1-AC-12', 'AC', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AD (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000037', 'A1-AD-01', 'AD', 1, false),
    ('S000038', 'A1-AD-02', 'AD', 2, false),
    ('S000039', 'A1-AD-03', 'AD', 3, false),
    ('S000040', 'A1-AD-04', 'AD', 4, false),
    ('S000041', 'A1-AD-05', 'AD', 5, false),
    ('S000042', 'A1-AD-06', 'AD', 6, false),
    ('S000043', 'A1-AD-07', 'AD', 7, false),
    ('S000044', 'A1-AD-08', 'AD', 8, false),
    ('S000045', 'A1-AD-09', 'AD', 9, false),
    ('S000046', 'A1-AD-10', 'AD', 10, false),
    ('S000047', 'A1-AD-11', 'AD', 11, false),
    ('S000048', 'A1-AD-12', 'AD', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AE (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000049', 'A1-AE-01', 'AE', 1, false),
    ('S000050', 'A1-AE-02', 'AE', 2, false),
    ('S000051', 'A1-AE-03', 'AE', 3, false),
    ('S000052', 'A1-AE-04', 'AE', 4, false),
    ('S000053', 'A1-AE-05', 'AE', 5, false),
    ('S000054', 'A1-AE-06', 'AE', 6, false),
    ('S000055', 'A1-AE-07', 'AE', 7, false),
    ('S000056', 'A1-AE-08', 'AE', 8, false),
    ('S000057', 'A1-AE-09', 'AE', 9, false),
    ('S000058', 'A1-AE-10', 'AE', 10, false),
    ('S000059', 'A1-AE-11', 'AE', 11, false),
    ('S000060', 'A1-AE-12', 'AE', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AF (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000061', 'A1-AF-01', 'AF', 1, false),
    ('S000062', 'A1-AF-02', 'AF', 2, false),
    ('S000063', 'A1-AF-03', 'AF', 3, false),
    ('S000064', 'A1-AF-04', 'AF', 4, false),
    ('S000065', 'A1-AF-05', 'AF', 5, false),
    ('S000066', 'A1-AF-06', 'AF', 6, false),
    ('S000067', 'A1-AF-07', 'AF', 7, false),
    ('S000068', 'A1-AF-08', 'AF', 8, false),
    ('S000069', 'A1-AF-09', 'AF', 9, false),
    ('S000070', 'A1-AF-10', 'AF', 10, false),
    ('S000071', 'A1-AF-11', 'AF', 11, false),
    ('S000072', 'A1-AF-12', 'AF', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AG (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000073', 'A1-AG-01', 'AG', 1, false),
    ('S000074', 'A1-AG-02', 'AG', 2, false),
    ('S000075', 'A1-AG-03', 'AG', 3, false),
    ('S000076', 'A1-AG-04', 'AG', 4, false),
    ('S000077', 'A1-AG-05', 'AG', 5, false),
    ('S000078', 'A1-AG-06', 'AG', 6, false),
    ('S000079', 'A1-AG-07', 'AG', 7, false),
    ('S000080', 'A1-AG-08', 'AG', 8, false),
    ('S000081', 'A1-AG-09', 'AG', 9, false),
    ('S000082', 'A1-AG-10', 'AG', 10, false),
    ('S000083', 'A1-AG-11', 'AG', 11, false),
    ('S000084', 'A1-AG-12', 'AG', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AH (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000085', 'A1-AH-01', 'AH', 1, false),
    ('S000086', 'A1-AH-02', 'AH', 2, false),
    ('S000087', 'A1-AH-03', 'AH', 3, false),
    ('S000088', 'A1-AH-04', 'AH', 4, false),
    ('S000089', 'A1-AH-05', 'AH', 5, false),
    ('S000090', 'A1-AH-06', 'AH', 6, false),
    ('S000091', 'A1-AH-07', 'AH', 7, false),
    ('S000092', 'A1-AH-08', 'AH', 8, false),
    ('S000093', 'A1-AH-09', 'AH', 9, false),
    ('S000094', 'A1-AH-10', 'AH', 10, false),
    ('S000095', 'A1-AH-11', 'AH', 11, false),
    ('S000096', 'A1-AH-12', 'AH', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AJ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000097', 'A1-AJ-01', 'AJ', 1, false),
    ('S000098', 'A1-AJ-02', 'AJ', 2, false),
    ('S000099', 'A1-AJ-03', 'AJ', 3, false),
    ('S000100', 'A1-AJ-04', 'AJ', 4, false),
    ('S000101', 'A1-AJ-05', 'AJ', 5, false),
    ('S000102', 'A1-AJ-06', 'AJ', 6, false),
    ('S000103', 'A1-AJ-07', 'AJ', 7, false),
    ('S000104', 'A1-AJ-08', 'AJ', 8, false),
    ('S000105', 'A1-AJ-09', 'AJ', 9, false),
    ('S000106', 'A1-AJ-10', 'AJ', 10, false),
    ('S000107', 'A1-AJ-11', 'AJ', 11, false),
    ('S000108', 'A1-AJ-12', 'AJ', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AK (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000109', 'A1-AK-01', 'AK', 1, false),
    ('S000110', 'A1-AK-02', 'AK', 2, false),
    ('S000111', 'A1-AK-03', 'AK', 3, false),
    ('S000112', 'A1-AK-04', 'AK', 4, false),
    ('S000113', 'A1-AK-05', 'AK', 5, false),
    ('S000114', 'A1-AK-06', 'AK', 6, false),
    ('S000115', 'A1-AK-07', 'AK', 7, false),
    ('S000116', 'A1-AK-08', 'AK', 8, false),
    ('S000117', 'A1-AK-09', 'AK', 9, false),
    ('S000118', 'A1-AK-10', 'AK', 10, false),
    ('S000119', 'A1-AK-11', 'AK', 11, false),
    ('S000120', 'A1-AK-12', 'AK', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AL (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000121', 'A1-AL-01', 'AL', 1, false),
    ('S000122', 'A1-AL-02', 'AL', 2, false),
    ('S000123', 'A1-AL-03', 'AL', 3, false),
    ('S000124', 'A1-AL-04', 'AL', 4, false),
    ('S000125', 'A1-AL-05', 'AL', 5, false),
    ('S000126', 'A1-AL-06', 'AL', 6, false),
    ('S000127', 'A1-AL-07', 'AL', 7, false),
    ('S000128', 'A1-AL-08', 'AL', 8, false),
    ('S000129', 'A1-AL-09', 'AL', 9, false),
    ('S000130', 'A1-AL-10', 'AL', 10, false),
    ('S000131', 'A1-AL-11', 'AL', 11, false),
    ('S000132', 'A1-AL-12', 'AL', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AM (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000133', 'A1-AM-01', 'AM', 1, false),
    ('S000134', 'A1-AM-02', 'AM', 2, false),
    ('S000135', 'A1-AM-03', 'AM', 3, false),
    ('S000136', 'A1-AM-04', 'AM', 4, false),
    ('S000137', 'A1-AM-05', 'AM', 5, false),
    ('S000138', 'A1-AM-06', 'AM', 6, false),
    ('S000139', 'A1-AM-07', 'AM', 7, false),
    ('S000140', 'A1-AM-08', 'AM', 8, false),
    ('S000141', 'A1-AM-09', 'AM', 9, false),
    ('S000142', 'A1-AM-10', 'AM', 10, false),
    ('S000143', 'A1-AM-11', 'AM', 11, false),
    ('S000144', 'A1-AM-12', 'AM', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AN (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000145', 'A1-AN-01', 'AN', 1, false),
    ('S000146', 'A1-AN-02', 'AN', 2, false),
    ('S000147', 'A1-AN-03', 'AN', 3, false),
    ('S000148', 'A1-AN-04', 'AN', 4, false),
    ('S000149', 'A1-AN-05', 'AN', 5, false),
    ('S000150', 'A1-AN-06', 'AN', 6, false),
    ('S000151', 'A1-AN-07', 'AN', 7, false),
    ('S000152', 'A1-AN-08', 'AN', 8, false),
    ('S000153', 'A1-AN-09', 'AN', 9, false),
    ('S000154', 'A1-AN-10', 'AN', 10, false),
    ('S000155', 'A1-AN-11', 'AN', 11, false),
    ('S000156', 'A1-AN-12', 'AN', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AP (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000157', 'A1-AP-01', 'AP', 1, false),
    ('S000158', 'A1-AP-02', 'AP', 2, false),
    ('S000159', 'A1-AP-03', 'AP', 3, false),
    ('S000160', 'A1-AP-04', 'AP', 4, false),
    ('S000161', 'A1-AP-05', 'AP', 5, false),
    ('S000162', 'A1-AP-06', 'AP', 6, false),
    ('S000163', 'A1-AP-07', 'AP', 7, false),
    ('S000164', 'A1-AP-08', 'AP', 8, false),
    ('S000165', 'A1-AP-09', 'AP', 9, false),
    ('S000166', 'A1-AP-10', 'AP', 10, false),
    ('S000167', 'A1-AP-11', 'AP', 11, false),
    ('S000168', 'A1-AP-12', 'AP', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AQ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000169', 'A1-AQ-01', 'AQ', 1, false),
    ('S000170', 'A1-AQ-02', 'AQ', 2, false),
    ('S000171', 'A1-AQ-03', 'AQ', 3, false),
    ('S000172', 'A1-AQ-04', 'AQ', 4, false),
    ('S000173', 'A1-AQ-05', 'AQ', 5, false),
    ('S000174', 'A1-AQ-06', 'AQ', 6, false),
    ('S000175', 'A1-AQ-07', 'AQ', 7, false),
    ('S000176', 'A1-AQ-08', 'AQ', 8, false),
    ('S000177', 'A1-AQ-09', 'AQ', 9, false),
    ('S000178', 'A1-AQ-10', 'AQ', 10, false),
    ('S000179', 'A1-AQ-11', 'AQ', 11, false),
    ('S000180', 'A1-AQ-12', 'AQ', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AR (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000181', 'A1-AR-01', 'AR', 1, false),
    ('S000182', 'A1-AR-02', 'AR', 2, false),
    ('S000183', 'A1-AR-03', 'AR', 3, false),
    ('S000184', 'A1-AR-04', 'AR', 4, false),
    ('S000185', 'A1-AR-05', 'AR', 5, false),
    ('S000186', 'A1-AR-06', 'AR', 6, false),
    ('S000187', 'A1-AR-07', 'AR', 7, false),
    ('S000188', 'A1-AR-08', 'AR', 8, false),
    ('S000189', 'A1-AR-09', 'AR', 9, false),
    ('S000190', 'A1-AR-10', 'AR', 10, false),
    ('S000191', 'A1-AR-11', 'AR', 11, false),
    ('S000192', 'A1-AR-12', 'AR', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AS (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000193', 'A1-AS-01', 'AS', 1, false),
    ('S000194', 'A1-AS-02', 'AS', 2, false),
    ('S000195', 'A1-AS-03', 'AS', 3, false),
    ('S000196', 'A1-AS-04', 'AS', 4, false),
    ('S000197', 'A1-AS-05', 'AS', 5, false),
    ('S000198', 'A1-AS-06', 'AS', 6, false),
    ('S000199', 'A1-AS-07', 'AS', 7, false),
    ('S000200', 'A1-AS-08', 'AS', 8, false),
    ('S000201', 'A1-AS-09', 'AS', 9, false),
    ('S000202', 'A1-AS-10', 'AS', 10, false),
    ('S000203', 'A1-AS-11', 'AS', 11, false),
    ('S000204', 'A1-AS-12', 'AS', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AT (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000205', 'A1-AT-01', 'AT', 1, false),
    ('S000206', 'A1-AT-02', 'AT', 2, false),
    ('S000207', 'A1-AT-03', 'AT', 3, false),
    ('S000208', 'A1-AT-04', 'AT', 4, false),
    ('S000209', 'A1-AT-05', 'AT', 5, false),
    ('S000210', 'A1-AT-06', 'AT', 6, false),
    ('S000211', 'A1-AT-07', 'AT', 7, false),
    ('S000212', 'A1-AT-08', 'AT', 8, false),
    ('S000213', 'A1-AT-09', 'AT', 9, false),
    ('S000214', 'A1-AT-10', 'AT', 10, false),
    ('S000215', 'A1-AT-11', 'AT', 11, false),
    ('S000216', 'A1-AT-12', 'AT', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AU (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000217', 'A1-AU-01', 'AU', 1, false),
    ('S000218', 'A1-AU-02', 'AU', 2, false),
    ('S000219', 'A1-AU-03', 'AU', 3, false),
    ('S000220', 'A1-AU-04', 'AU', 4, false),
    ('S000221', 'A1-AU-05', 'AU', 5, false),
    ('S000222', 'A1-AU-06', 'AU', 6, false),
    ('S000223', 'A1-AU-07', 'AU', 7, false),
    ('S000224', 'A1-AU-08', 'AU', 8, false),
    ('S000225', 'A1-AU-09', 'AU', 9, false),
    ('S000226', 'A1-AU-10', 'AU', 10, false),
    ('S000227', 'A1-AU-11', 'AU', 11, false),
    ('S000228', 'A1-AU-12', 'AU', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AV (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000229', 'A1-AV-01', 'AV', 1, false),
    ('S000230', 'A1-AV-02', 'AV', 2, false),
    ('S000231', 'A1-AV-03', 'AV', 3, false),
    ('S000232', 'A1-AV-04', 'AV', 4, false),
    ('S000233', 'A1-AV-05', 'AV', 5, false),
    ('S000234', 'A1-AV-06', 'AV', 6, false),
    ('S000235', 'A1-AV-07', 'AV', 7, false),
    ('S000236', 'A1-AV-08', 'AV', 8, false),
    ('S000237', 'A1-AV-09', 'AV', 9, false),
    ('S000238', 'A1-AV-10', 'AV', 10, false),
    ('S000239', 'A1-AV-11', 'AV', 11, false),
    ('S000240', 'A1-AV-12', 'AV', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AW (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000241', 'A1-AW-01', 'AW', 1, false),
    ('S000242', 'A1-AW-02', 'AW', 2, false),
    ('S000243', 'A1-AW-03', 'AW', 3, false),
    ('S000244', 'A1-AW-04', 'AW', 4, false),
    ('S000245', 'A1-AW-05', 'AW', 5, false),
    ('S000246', 'A1-AW-06', 'AW', 6, false),
    ('S000247', 'A1-AW-07', 'AW', 7, false),
    ('S000248', 'A1-AW-08', 'AW', 8, false),
    ('S000249', 'A1-AW-09', 'AW', 9, false),
    ('S000250', 'A1-AW-10', 'AW', 10, false),
    ('S000251', 'A1-AW-11', 'AW', 11, false),
    ('S000252', 'A1-AW-12', 'AW', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AX (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000253', 'A1-AX-01', 'AX', 1, false),
    ('S000254', 'A1-AX-02', 'AX', 2, false),
    ('S000255', 'A1-AX-03', 'AX', 3, false),
    ('S000256', 'A1-AX-04', 'AX', 4, false),
    ('S000257', 'A1-AX-05', 'AX', 5, false),
    ('S000258', 'A1-AX-06', 'AX', 6, false),
    ('S000259', 'A1-AX-07', 'AX', 7, false),
    ('S000260', 'A1-AX-08', 'AX', 8, false),
    ('S000261', 'A1-AX-09', 'AX', 9, false),
    ('S000262', 'A1-AX-10', 'AX', 10, false),
    ('S000263', 'A1-AX-11', 'AX', 11, false),
    ('S000264', 'A1-AX-12', 'AX', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE A2 (400 seats)
-- Row AA (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000265', 'A2-AA-13', 'AA', 13, false),
    ('S000266', 'A2-AA-14', 'AA', 14, false),
    ('S000267', 'A2-AA-15', 'AA', 15, false),
    ('S000268', 'A2-AA-16', 'AA', 16, false),
    ('S000269', 'A2-AA-17', 'AA', 17, false),
    ('S000270', 'A2-AA-18', 'AA', 18, false),
    ('S000271', 'A2-AA-19', 'AA', 19, false),
    ('S000272', 'A2-AA-20', 'AA', 20, false),
    ('S000273', 'A2-AA-21', 'AA', 21, false),
    ('S000274', 'A2-AA-22', 'AA', 22, false),
    ('S000275', 'A2-AA-23', 'AA', 23, false),
    ('S000276', 'A2-AA-24', 'AA', 24, false),
    ('S000277', 'A2-AA-25', 'AA', 25, false),
    ('S000278', 'A2-AA-26', 'AA', 26, false),
    ('S000279', 'A2-AA-27', 'AA', 27, false),
    ('S000280', 'A2-AA-28', 'AA', 28, false),
    ('S000281', 'A2-AA-29', 'AA', 29, false),
    ('S000282', 'A2-AA-30', 'AA', 30, false),
    ('S000283', 'A2-AA-31', 'AA', 31, false),
    ('S000284', 'A2-AA-32', 'AA', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AB (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000285', 'A2-AB-13', 'AB', 13, false),
    ('S000286', 'A2-AB-14', 'AB', 14, false),
    ('S000287', 'A2-AB-15', 'AB', 15, false),
    ('S000288', 'A2-AB-16', 'AB', 16, false),
    ('S000289', 'A2-AB-17', 'AB', 17, false),
    ('S000290', 'A2-AB-18', 'AB', 18, false),
    ('S000291', 'A2-AB-19', 'AB', 19, false),
    ('S000292', 'A2-AB-20', 'AB', 20, false),
    ('S000293', 'A2-AB-21', 'AB', 21, false),
    ('S000294', 'A2-AB-22', 'AB', 22, false),
    ('S000295', 'A2-AB-23', 'AB', 23, false),
    ('S000296', 'A2-AB-24', 'AB', 24, false),
    ('S000297', 'A2-AB-25', 'AB', 25, false),
    ('S000298', 'A2-AB-26', 'AB', 26, false),
    ('S000299', 'A2-AB-27', 'AB', 27, false),
    ('S000300', 'A2-AB-28', 'AB', 28, false),
    ('S000301', 'A2-AB-29', 'AB', 29, false),
    ('S000302', 'A2-AB-30', 'AB', 30, false),
    ('S000303', 'A2-AB-31', 'AB', 31, false),
    ('S000304', 'A2-AB-32', 'AB', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AC (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000305', 'A2-AC-13', 'AC', 13, false),
    ('S000306', 'A2-AC-14', 'AC', 14, false),
    ('S000307', 'A2-AC-15', 'AC', 15, false),
    ('S000308', 'A2-AC-16', 'AC', 16, false),
    ('S000309', 'A2-AC-17', 'AC', 17, false),
    ('S000310', 'A2-AC-18', 'AC', 18, false),
    ('S000311', 'A2-AC-19', 'AC', 19, false),
    ('S000312', 'A2-AC-20', 'AC', 20, false),
    ('S000313', 'A2-AC-21', 'AC', 21, false),
    ('S000314', 'A2-AC-22', 'AC', 22, false),
    ('S000315', 'A2-AC-23', 'AC', 23, false),
    ('S000316', 'A2-AC-24', 'AC', 24, false),
    ('S000317', 'A2-AC-25', 'AC', 25, false),
    ('S000318', 'A2-AC-26', 'AC', 26, false),
    ('S000319', 'A2-AC-27', 'AC', 27, false),
    ('S000320', 'A2-AC-28', 'AC', 28, false),
    ('S000321', 'A2-AC-29', 'AC', 29, false),
    ('S000322', 'A2-AC-30', 'AC', 30, false),
    ('S000323', 'A2-AC-31', 'AC', 31, false),
    ('S000324', 'A2-AC-32', 'AC', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AD (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000325', 'A2-AD-13', 'AD', 13, false),
    ('S000326', 'A2-AD-14', 'AD', 14, false),
    ('S000327', 'A2-AD-15', 'AD', 15, false),
    ('S000328', 'A2-AD-16', 'AD', 16, false),
    ('S000329', 'A2-AD-17', 'AD', 17, false),
    ('S000330', 'A2-AD-18', 'AD', 18, false),
    ('S000331', 'A2-AD-19', 'AD', 19, false),
    ('S000332', 'A2-AD-20', 'AD', 20, false),
    ('S000333', 'A2-AD-21', 'AD', 21, false),
    ('S000334', 'A2-AD-22', 'AD', 22, false),
    ('S000335', 'A2-AD-23', 'AD', 23, false),
    ('S000336', 'A2-AD-24', 'AD', 24, false),
    ('S000337', 'A2-AD-25', 'AD', 25, false),
    ('S000338', 'A2-AD-26', 'AD', 26, false),
    ('S000339', 'A2-AD-27', 'AD', 27, false),
    ('S000340', 'A2-AD-28', 'AD', 28, false),
    ('S000341', 'A2-AD-29', 'AD', 29, false),
    ('S000342', 'A2-AD-30', 'AD', 30, false),
    ('S000343', 'A2-AD-31', 'AD', 31, false),
    ('S000344', 'A2-AD-32', 'AD', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AE (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000345', 'A2-AE-13', 'AE', 13, false),
    ('S000346', 'A2-AE-14', 'AE', 14, false),
    ('S000347', 'A2-AE-15', 'AE', 15, false),
    ('S000348', 'A2-AE-16', 'AE', 16, false),
    ('S000349', 'A2-AE-17', 'AE', 17, false),
    ('S000350', 'A2-AE-18', 'AE', 18, false),
    ('S000351', 'A2-AE-19', 'AE', 19, false),
    ('S000352', 'A2-AE-20', 'AE', 20, false),
    ('S000353', 'A2-AE-21', 'AE', 21, false),
    ('S000354', 'A2-AE-22', 'AE', 22, false),
    ('S000355', 'A2-AE-23', 'AE', 23, false),
    ('S000356', 'A2-AE-24', 'AE', 24, false),
    ('S000357', 'A2-AE-25', 'AE', 25, false),
    ('S000358', 'A2-AE-26', 'AE', 26, false),
    ('S000359', 'A2-AE-27', 'AE', 27, false),
    ('S000360', 'A2-AE-28', 'AE', 28, false),
    ('S000361', 'A2-AE-29', 'AE', 29, false),
    ('S000362', 'A2-AE-30', 'AE', 30, false),
    ('S000363', 'A2-AE-31', 'AE', 31, false),
    ('S000364', 'A2-AE-32', 'AE', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AF (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000365', 'A2-AF-13', 'AF', 13, false),
    ('S000366', 'A2-AF-14', 'AF', 14, false),
    ('S000367', 'A2-AF-15', 'AF', 15, false),
    ('S000368', 'A2-AF-16', 'AF', 16, false),
    ('S000369', 'A2-AF-17', 'AF', 17, false),
    ('S000370', 'A2-AF-18', 'AF', 18, false),
    ('S000371', 'A2-AF-19', 'AF', 19, false),
    ('S000372', 'A2-AF-20', 'AF', 20, false),
    ('S000373', 'A2-AF-21', 'AF', 21, false),
    ('S000374', 'A2-AF-22', 'AF', 22, false),
    ('S000375', 'A2-AF-23', 'AF', 23, false),
    ('S000376', 'A2-AF-24', 'AF', 24, false),
    ('S000377', 'A2-AF-25', 'AF', 25, false),
    ('S000378', 'A2-AF-26', 'AF', 26, false),
    ('S000379', 'A2-AF-27', 'AF', 27, false),
    ('S000380', 'A2-AF-28', 'AF', 28, false),
    ('S000381', 'A2-AF-29', 'AF', 29, false),
    ('S000382', 'A2-AF-30', 'AF', 30, false),
    ('S000383', 'A2-AF-31', 'AF', 31, false),
    ('S000384', 'A2-AF-32', 'AF', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AG (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000385', 'A2-AG-13', 'AG', 13, false),
    ('S000386', 'A2-AG-14', 'AG', 14, false),
    ('S000387', 'A2-AG-15', 'AG', 15, false),
    ('S000388', 'A2-AG-16', 'AG', 16, false),
    ('S000389', 'A2-AG-17', 'AG', 17, false),
    ('S000390', 'A2-AG-18', 'AG', 18, false),
    ('S000391', 'A2-AG-19', 'AG', 19, false),
    ('S000392', 'A2-AG-20', 'AG', 20, false),
    ('S000393', 'A2-AG-21', 'AG', 21, false),
    ('S000394', 'A2-AG-22', 'AG', 22, false),
    ('S000395', 'A2-AG-23', 'AG', 23, false),
    ('S000396', 'A2-AG-24', 'AG', 24, false),
    ('S000397', 'A2-AG-25', 'AG', 25, false),
    ('S000398', 'A2-AG-26', 'AG', 26, false),
    ('S000399', 'A2-AG-27', 'AG', 27, false),
    ('S000400', 'A2-AG-28', 'AG', 28, false),
    ('S000401', 'A2-AG-29', 'AG', 29, false),
    ('S000402', 'A2-AG-30', 'AG', 30, false),
    ('S000403', 'A2-AG-31', 'AG', 31, false),
    ('S000404', 'A2-AG-32', 'AG', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AH (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000405', 'A2-AH-13', 'AH', 13, false),
    ('S000406', 'A2-AH-14', 'AH', 14, false),
    ('S000407', 'A2-AH-15', 'AH', 15, false),
    ('S000408', 'A2-AH-16', 'AH', 16, false),
    ('S000409', 'A2-AH-17', 'AH', 17, false),
    ('S000410', 'A2-AH-18', 'AH', 18, false),
    ('S000411', 'A2-AH-19', 'AH', 19, false),
    ('S000412', 'A2-AH-20', 'AH', 20, false),
    ('S000413', 'A2-AH-21', 'AH', 21, false),
    ('S000414', 'A2-AH-22', 'AH', 22, false),
    ('S000415', 'A2-AH-23', 'AH', 23, false),
    ('S000416', 'A2-AH-24', 'AH', 24, false),
    ('S000417', 'A2-AH-25', 'AH', 25, false),
    ('S000418', 'A2-AH-26', 'AH', 26, false),
    ('S000419', 'A2-AH-27', 'AH', 27, false),
    ('S000420', 'A2-AH-28', 'AH', 28, false),
    ('S000421', 'A2-AH-29', 'AH', 29, false),
    ('S000422', 'A2-AH-30', 'AH', 30, false),
    ('S000423', 'A2-AH-31', 'AH', 31, false),
    ('S000424', 'A2-AH-32', 'AH', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AJ (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000425', 'A2-AJ-13', 'AJ', 13, false),
    ('S000426', 'A2-AJ-14', 'AJ', 14, false),
    ('S000427', 'A2-AJ-15', 'AJ', 15, false),
    ('S000428', 'A2-AJ-16', 'AJ', 16, false),
    ('S000429', 'A2-AJ-17', 'AJ', 17, false),
    ('S000430', 'A2-AJ-18', 'AJ', 18, false),
    ('S000431', 'A2-AJ-19', 'AJ', 19, false),
    ('S000432', 'A2-AJ-20', 'AJ', 20, false),
    ('S000433', 'A2-AJ-21', 'AJ', 21, false),
    ('S000434', 'A2-AJ-22', 'AJ', 22, false),
    ('S000435', 'A2-AJ-23', 'AJ', 23, false),
    ('S000436', 'A2-AJ-24', 'AJ', 24, false),
    ('S000437', 'A2-AJ-25', 'AJ', 25, false),
    ('S000438', 'A2-AJ-26', 'AJ', 26, false),
    ('S000439', 'A2-AJ-27', 'AJ', 27, false),
    ('S000440', 'A2-AJ-28', 'AJ', 28, false),
    ('S000441', 'A2-AJ-29', 'AJ', 29, false),
    ('S000442', 'A2-AJ-30', 'AJ', 30, false),
    ('S000443', 'A2-AJ-31', 'AJ', 31, false),
    ('S000444', 'A2-AJ-32', 'AJ', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AK (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000445', 'A2-AK-13', 'AK', 13, false),
    ('S000446', 'A2-AK-14', 'AK', 14, false),
    ('S000447', 'A2-AK-15', 'AK', 15, false),
    ('S000448', 'A2-AK-16', 'AK', 16, false),
    ('S000449', 'A2-AK-17', 'AK', 17, false),
    ('S000450', 'A2-AK-18', 'AK', 18, false),
    ('S000451', 'A2-AK-19', 'AK', 19, false),
    ('S000452', 'A2-AK-20', 'AK', 20, false),
    ('S000453', 'A2-AK-21', 'AK', 21, false),
    ('S000454', 'A2-AK-22', 'AK', 22, false),
    ('S000455', 'A2-AK-23', 'AK', 23, false),
    ('S000456', 'A2-AK-24', 'AK', 24, false),
    ('S000457', 'A2-AK-25', 'AK', 25, false),
    ('S000458', 'A2-AK-26', 'AK', 26, false),
    ('S000459', 'A2-AK-27', 'AK', 27, false),
    ('S000460', 'A2-AK-28', 'AK', 28, false),
    ('S000461', 'A2-AK-29', 'AK', 29, false),
    ('S000462', 'A2-AK-30', 'AK', 30, false),
    ('S000463', 'A2-AK-31', 'AK', 31, false),
    ('S000464', 'A2-AK-32', 'AK', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AL (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000465', 'A2-AL-13', 'AL', 13, false),
    ('S000466', 'A2-AL-14', 'AL', 14, false),
    ('S000467', 'A2-AL-15', 'AL', 15, false),
    ('S000468', 'A2-AL-16', 'AL', 16, false),
    ('S000469', 'A2-AL-17', 'AL', 17, false),
    ('S000470', 'A2-AL-18', 'AL', 18, false),
    ('S000471', 'A2-AL-19', 'AL', 19, false),
    ('S000472', 'A2-AL-20', 'AL', 20, false),
    ('S000473', 'A2-AL-21', 'AL', 21, false),
    ('S000474', 'A2-AL-22', 'AL', 22, false),
    ('S000475', 'A2-AL-23', 'AL', 23, false),
    ('S000476', 'A2-AL-24', 'AL', 24, false),
    ('S000477', 'A2-AL-25', 'AL', 25, false),
    ('S000478', 'A2-AL-26', 'AL', 26, false),
    ('S000479', 'A2-AL-27', 'AL', 27, false),
    ('S000480', 'A2-AL-28', 'AL', 28, false),
    ('S000481', 'A2-AL-29', 'AL', 29, false),
    ('S000482', 'A2-AL-30', 'AL', 30, false),
    ('S000483', 'A2-AL-31', 'AL', 31, false),
    ('S000484', 'A2-AL-32', 'AL', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AM (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000485', 'A2-AM-13', 'AM', 13, false),
    ('S000486', 'A2-AM-14', 'AM', 14, false),
    ('S000487', 'A2-AM-15', 'AM', 15, false),
    ('S000488', 'A2-AM-16', 'AM', 16, false),
    ('S000489', 'A2-AM-17', 'AM', 17, false),
    ('S000490', 'A2-AM-18', 'AM', 18, false),
    ('S000491', 'A2-AM-19', 'AM', 19, false),
    ('S000492', 'A2-AM-20', 'AM', 20, false),
    ('S000493', 'A2-AM-21', 'AM', 21, false),
    ('S000494', 'A2-AM-22', 'AM', 22, false),
    ('S000495', 'A2-AM-23', 'AM', 23, false),
    ('S000496', 'A2-AM-24', 'AM', 24, false),
    ('S000497', 'A2-AM-25', 'AM', 25, false),
    ('S000498', 'A2-AM-26', 'AM', 26, false),
    ('S000499', 'A2-AM-27', 'AM', 27, false),
    ('S000500', 'A2-AM-28', 'AM', 28, false),
    ('S000501', 'A2-AM-29', 'AM', 29, false),
    ('S000502', 'A2-AM-30', 'AM', 30, false),
    ('S000503', 'A2-AM-31', 'AM', 31, false),
    ('S000504', 'A2-AM-32', 'AM', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AN (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000505', 'A2-AN-13', 'AN', 13, false),
    ('S000506', 'A2-AN-14', 'AN', 14, false),
    ('S000507', 'A2-AN-15', 'AN', 15, false),
    ('S000508', 'A2-AN-16', 'AN', 16, false),
    ('S000509', 'A2-AN-17', 'AN', 17, false),
    ('S000510', 'A2-AN-18', 'AN', 18, false),
    ('S000511', 'A2-AN-19', 'AN', 19, false),
    ('S000512', 'A2-AN-20', 'AN', 20, false),
    ('S000513', 'A2-AN-21', 'AN', 21, false),
    ('S000514', 'A2-AN-22', 'AN', 22, false),
    ('S000515', 'A2-AN-23', 'AN', 23, false),
    ('S000516', 'A2-AN-24', 'AN', 24, false),
    ('S000517', 'A2-AN-25', 'AN', 25, false),
    ('S000518', 'A2-AN-26', 'AN', 26, false),
    ('S000519', 'A2-AN-27', 'AN', 27, false),
    ('S000520', 'A2-AN-28', 'AN', 28, false),
    ('S000521', 'A2-AN-29', 'AN', 29, false),
    ('S000522', 'A2-AN-30', 'AN', 30, false),
    ('S000523', 'A2-AN-31', 'AN', 31, false),
    ('S000524', 'A2-AN-32', 'AN', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AP (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000525', 'A2-AP-13', 'AP', 13, false),
    ('S000526', 'A2-AP-14', 'AP', 14, false),
    ('S000527', 'A2-AP-15', 'AP', 15, false),
    ('S000528', 'A2-AP-16', 'AP', 16, false),
    ('S000529', 'A2-AP-17', 'AP', 17, false),
    ('S000530', 'A2-AP-18', 'AP', 18, false),
    ('S000531', 'A2-AP-19', 'AP', 19, false),
    ('S000532', 'A2-AP-20', 'AP', 20, false),
    ('S000533', 'A2-AP-21', 'AP', 21, false),
    ('S000534', 'A2-AP-22', 'AP', 22, false),
    ('S000535', 'A2-AP-23', 'AP', 23, false),
    ('S000536', 'A2-AP-24', 'AP', 24, false),
    ('S000537', 'A2-AP-25', 'AP', 25, false),
    ('S000538', 'A2-AP-26', 'AP', 26, false),
    ('S000539', 'A2-AP-27', 'AP', 27, false),
    ('S000540', 'A2-AP-28', 'AP', 28, false),
    ('S000541', 'A2-AP-29', 'AP', 29, false),
    ('S000542', 'A2-AP-30', 'AP', 30, false),
    ('S000543', 'A2-AP-31', 'AP', 31, false),
    ('S000544', 'A2-AP-32', 'AP', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AQ (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000545', 'A2-AQ-13', 'AQ', 13, false),
    ('S000546', 'A2-AQ-14', 'AQ', 14, false),
    ('S000547', 'A2-AQ-15', 'AQ', 15, false),
    ('S000548', 'A2-AQ-16', 'AQ', 16, false),
    ('S000549', 'A2-AQ-17', 'AQ', 17, false),
    ('S000550', 'A2-AQ-18', 'AQ', 18, false),
    ('S000551', 'A2-AQ-19', 'AQ', 19, false),
    ('S000552', 'A2-AQ-20', 'AQ', 20, false),
    ('S000553', 'A2-AQ-21', 'AQ', 21, false),
    ('S000554', 'A2-AQ-22', 'AQ', 22, false),
    ('S000555', 'A2-AQ-23', 'AQ', 23, false),
    ('S000556', 'A2-AQ-24', 'AQ', 24, false),
    ('S000557', 'A2-AQ-25', 'AQ', 25, false),
    ('S000558', 'A2-AQ-26', 'AQ', 26, false),
    ('S000559', 'A2-AQ-27', 'AQ', 27, false),
    ('S000560', 'A2-AQ-28', 'AQ', 28, false),
    ('S000561', 'A2-AQ-29', 'AQ', 29, false),
    ('S000562', 'A2-AQ-30', 'AQ', 30, false),
    ('S000563', 'A2-AQ-31', 'AQ', 31, false),
    ('S000564', 'A2-AQ-32', 'AQ', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AR (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000565', 'A2-AR-13', 'AR', 13, false),
    ('S000566', 'A2-AR-14', 'AR', 14, false),
    ('S000567', 'A2-AR-15', 'AR', 15, false),
    ('S000568', 'A2-AR-16', 'AR', 16, false),
    ('S000569', 'A2-AR-17', 'AR', 17, false),
    ('S000570', 'A2-AR-18', 'AR', 18, false),
    ('S000571', 'A2-AR-19', 'AR', 19, false),
    ('S000572', 'A2-AR-20', 'AR', 20, false),
    ('S000573', 'A2-AR-21', 'AR', 21, false),
    ('S000574', 'A2-AR-22', 'AR', 22, false),
    ('S000575', 'A2-AR-23', 'AR', 23, false),
    ('S000576', 'A2-AR-24', 'AR', 24, false),
    ('S000577', 'A2-AR-25', 'AR', 25, false),
    ('S000578', 'A2-AR-26', 'AR', 26, false),
    ('S000579', 'A2-AR-27', 'AR', 27, false),
    ('S000580', 'A2-AR-28', 'AR', 28, false),
    ('S000581', 'A2-AR-29', 'AR', 29, false),
    ('S000582', 'A2-AR-30', 'AR', 30, false),
    ('S000583', 'A2-AR-31', 'AR', 31, false),
    ('S000584', 'A2-AR-32', 'AR', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AS (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000585', 'A2-AS-13', 'AS', 13, false),
    ('S000586', 'A2-AS-14', 'AS', 14, false),
    ('S000587', 'A2-AS-15', 'AS', 15, false),
    ('S000588', 'A2-AS-16', 'AS', 16, false),
    ('S000589', 'A2-AS-17', 'AS', 17, false),
    ('S000590', 'A2-AS-18', 'AS', 18, false),
    ('S000591', 'A2-AS-19', 'AS', 19, false),
    ('S000592', 'A2-AS-20', 'AS', 20, false),
    ('S000593', 'A2-AS-21', 'AS', 21, false),
    ('S000594', 'A2-AS-22', 'AS', 22, false),
    ('S000595', 'A2-AS-23', 'AS', 23, false),
    ('S000596', 'A2-AS-24', 'AS', 24, false),
    ('S000597', 'A2-AS-25', 'AS', 25, false),
    ('S000598', 'A2-AS-26', 'AS', 26, false),
    ('S000599', 'A2-AS-27', 'AS', 27, false),
    ('S000600', 'A2-AS-28', 'AS', 28, false),
    ('S000601', 'A2-AS-29', 'AS', 29, false),
    ('S000602', 'A2-AS-30', 'AS', 30, false),
    ('S000603', 'A2-AS-31', 'AS', 31, false),
    ('S000604', 'A2-AS-32', 'AS', 32, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AT (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000605', 'A2-AT-13', 'AT', 13, false),
    ('S000606', 'A2-AT-14', 'AT', 14, false),
    ('S000607', 'A2-AT-15', 'AT', 15, false),
    ('S000608', 'A2-AT-16', 'AT', 16, false),
    ('S000609', 'A2-AT-17', 'AT', 17, false),
    ('S000610', 'A2-AT-18', 'AT', 18, false),
    ('S000611', 'A2-AT-19', 'AT', 19, false),
    ('S000612', 'A2-AT-20', 'AT', 20, false),
    ('S000613', 'A2-AT-21', 'AT', 21, false),
    ('S000614', 'A2-AT-22', 'AT', 22, false),
    ('S000615', 'A2-AT-23', 'AT', 23, false),
    ('S000616', 'A2-AT-24', 'AT', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AU (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000617', 'A2-AU-13', 'AU', 13, false),
    ('S000618', 'A2-AU-14', 'AU', 14, false),
    ('S000619', 'A2-AU-15', 'AU', 15, false),
    ('S000620', 'A2-AU-16', 'AU', 16, false),
    ('S000621', 'A2-AU-17', 'AU', 17, false),
    ('S000622', 'A2-AU-18', 'AU', 18, false),
    ('S000623', 'A2-AU-19', 'AU', 19, false),
    ('S000624', 'A2-AU-20', 'AU', 20, false),
    ('S000625', 'A2-AU-21', 'AU', 21, false),
    ('S000626', 'A2-AU-22', 'AU', 22, false),
    ('S000627', 'A2-AU-23', 'AU', 23, false),
    ('S000628', 'A2-AU-24', 'AU', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AV (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000629', 'A2-AV-13', 'AV', 13, false),
    ('S000630', 'A2-AV-14', 'AV', 14, false),
    ('S000631', 'A2-AV-15', 'AV', 15, false),
    ('S000632', 'A2-AV-16', 'AV', 16, false),
    ('S000633', 'A2-AV-17', 'AV', 17, false),
    ('S000634', 'A2-AV-18', 'AV', 18, false),
    ('S000635', 'A2-AV-19', 'AV', 19, false),
    ('S000636', 'A2-AV-20', 'AV', 20, false),
    ('S000637', 'A2-AV-21', 'AV', 21, false),
    ('S000638', 'A2-AV-22', 'AV', 22, false),
    ('S000639', 'A2-AV-23', 'AV', 23, false),
    ('S000640', 'A2-AV-24', 'AV', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AW (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000641', 'A2-AW-13', 'AW', 13, false),
    ('S000642', 'A2-AW-14', 'AW', 14, false),
    ('S000643', 'A2-AW-15', 'AW', 15, false),
    ('S000644', 'A2-AW-16', 'AW', 16, false),
    ('S000645', 'A2-AW-17', 'AW', 17, false),
    ('S000646', 'A2-AW-18', 'AW', 18, false),
    ('S000647', 'A2-AW-19', 'AW', 19, false),
    ('S000648', 'A2-AW-20', 'AW', 20, false),
    ('S000649', 'A2-AW-21', 'AW', 21, false),
    ('S000650', 'A2-AW-22', 'AW', 22, false),
    ('S000651', 'A2-AW-23', 'AW', 23, false),
    ('S000652', 'A2-AW-24', 'AW', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AX (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000653', 'A2-AX-13', 'AX', 13, false),
    ('S000654', 'A2-AX-14', 'AX', 14, false),
    ('S000655', 'A2-AX-15', 'AX', 15, false),
    ('S000656', 'A2-AX-16', 'AX', 16, false),
    ('S000657', 'A2-AX-17', 'AX', 17, false),
    ('S000658', 'A2-AX-18', 'AX', 18, false),
    ('S000659', 'A2-AX-19', 'AX', 19, false),
    ('S000660', 'A2-AX-20', 'AX', 20, false),
    ('S000661', 'A2-AX-21', 'AX', 21, false),
    ('S000662', 'A2-AX-22', 'AX', 22, false),
    ('S000663', 'A2-AX-23', 'AX', 23, false),
    ('S000664', 'A2-AX-24', 'AX', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE A3 (400 seats)
-- Row AA (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000665', 'A3-AA-44', 'AA', 44, false),
    ('S000666', 'A3-AA-45', 'AA', 45, false),
    ('S000667', 'A3-AA-46', 'AA', 46, false),
    ('S000668', 'A3-AA-47', 'AA', 47, false),
    ('S000669', 'A3-AA-48', 'AA', 48, false),
    ('S000670', 'A3-AA-49', 'AA', 49, false),
    ('S000671', 'A3-AA-50', 'AA', 50, false),
    ('S000672', 'A3-AA-51', 'AA', 51, false),
    ('S000673', 'A3-AA-52', 'AA', 52, false),
    ('S000674', 'A3-AA-53', 'AA', 53, false),
    ('S000675', 'A3-AA-54', 'AA', 54, false),
    ('S000676', 'A3-AA-55', 'AA', 55, false),
    ('S000677', 'A3-AA-56', 'AA', 56, false),
    ('S000678', 'A3-AA-57', 'AA', 57, false),
    ('S000679', 'A3-AA-58', 'AA', 58, false),
    ('S000680', 'A3-AA-59', 'AA', 59, false),
    ('S000681', 'A3-AA-60', 'AA', 60, false),
    ('S000682', 'A3-AA-61', 'AA', 61, false),
    ('S000683', 'A3-AA-62', 'AA', 62, false),
    ('S000684', 'A3-AA-63', 'AA', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AB (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000685', 'A3-AB-44', 'AB', 44, false),
    ('S000686', 'A3-AB-45', 'AB', 45, false),
    ('S000687', 'A3-AB-46', 'AB', 46, false),
    ('S000688', 'A3-AB-47', 'AB', 47, false),
    ('S000689', 'A3-AB-48', 'AB', 48, false),
    ('S000690', 'A3-AB-49', 'AB', 49, false),
    ('S000691', 'A3-AB-50', 'AB', 50, false),
    ('S000692', 'A3-AB-51', 'AB', 51, false),
    ('S000693', 'A3-AB-52', 'AB', 52, false),
    ('S000694', 'A3-AB-53', 'AB', 53, false),
    ('S000695', 'A3-AB-54', 'AB', 54, false),
    ('S000696', 'A3-AB-55', 'AB', 55, false),
    ('S000697', 'A3-AB-56', 'AB', 56, false),
    ('S000698', 'A3-AB-57', 'AB', 57, false),
    ('S000699', 'A3-AB-58', 'AB', 58, false),
    ('S000700', 'A3-AB-59', 'AB', 59, false),
    ('S000701', 'A3-AB-60', 'AB', 60, false),
    ('S000702', 'A3-AB-61', 'AB', 61, false),
    ('S000703', 'A3-AB-62', 'AB', 62, false),
    ('S000704', 'A3-AB-63', 'AB', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AC (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000705', 'A3-AC-44', 'AC', 44, false),
    ('S000706', 'A3-AC-45', 'AC', 45, false),
    ('S000707', 'A3-AC-46', 'AC', 46, false),
    ('S000708', 'A3-AC-47', 'AC', 47, false),
    ('S000709', 'A3-AC-48', 'AC', 48, false),
    ('S000710', 'A3-AC-49', 'AC', 49, false),
    ('S000711', 'A3-AC-50', 'AC', 50, false),
    ('S000712', 'A3-AC-51', 'AC', 51, false),
    ('S000713', 'A3-AC-52', 'AC', 52, false),
    ('S000714', 'A3-AC-53', 'AC', 53, false),
    ('S000715', 'A3-AC-54', 'AC', 54, false),
    ('S000716', 'A3-AC-55', 'AC', 55, false),
    ('S000717', 'A3-AC-56', 'AC', 56, false),
    ('S000718', 'A3-AC-57', 'AC', 57, false),
    ('S000719', 'A3-AC-58', 'AC', 58, false),
    ('S000720', 'A3-AC-59', 'AC', 59, false),
    ('S000721', 'A3-AC-60', 'AC', 60, false),
    ('S000722', 'A3-AC-61', 'AC', 61, false),
    ('S000723', 'A3-AC-62', 'AC', 62, false),
    ('S000724', 'A3-AC-63', 'AC', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AD (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000725', 'A3-AD-44', 'AD', 44, false),
    ('S000726', 'A3-AD-45', 'AD', 45, false),
    ('S000727', 'A3-AD-46', 'AD', 46, false),
    ('S000728', 'A3-AD-47', 'AD', 47, false),
    ('S000729', 'A3-AD-48', 'AD', 48, false),
    ('S000730', 'A3-AD-49', 'AD', 49, false),
    ('S000731', 'A3-AD-50', 'AD', 50, false),
    ('S000732', 'A3-AD-51', 'AD', 51, false),
    ('S000733', 'A3-AD-52', 'AD', 52, false),
    ('S000734', 'A3-AD-53', 'AD', 53, false),
    ('S000735', 'A3-AD-54', 'AD', 54, false),
    ('S000736', 'A3-AD-55', 'AD', 55, false),
    ('S000737', 'A3-AD-56', 'AD', 56, false),
    ('S000738', 'A3-AD-57', 'AD', 57, false),
    ('S000739', 'A3-AD-58', 'AD', 58, false),
    ('S000740', 'A3-AD-59', 'AD', 59, false),
    ('S000741', 'A3-AD-60', 'AD', 60, false),
    ('S000742', 'A3-AD-61', 'AD', 61, false),
    ('S000743', 'A3-AD-62', 'AD', 62, false),
    ('S000744', 'A3-AD-63', 'AD', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AE (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000745', 'A3-AE-44', 'AE', 44, false),
    ('S000746', 'A3-AE-45', 'AE', 45, false),
    ('S000747', 'A3-AE-46', 'AE', 46, false),
    ('S000748', 'A3-AE-47', 'AE', 47, false),
    ('S000749', 'A3-AE-48', 'AE', 48, false),
    ('S000750', 'A3-AE-49', 'AE', 49, false),
    ('S000751', 'A3-AE-50', 'AE', 50, false),
    ('S000752', 'A3-AE-51', 'AE', 51, false),
    ('S000753', 'A3-AE-52', 'AE', 52, false),
    ('S000754', 'A3-AE-53', 'AE', 53, false),
    ('S000755', 'A3-AE-54', 'AE', 54, false),
    ('S000756', 'A3-AE-55', 'AE', 55, false),
    ('S000757', 'A3-AE-56', 'AE', 56, false),
    ('S000758', 'A3-AE-57', 'AE', 57, false),
    ('S000759', 'A3-AE-58', 'AE', 58, false),
    ('S000760', 'A3-AE-59', 'AE', 59, false),
    ('S000761', 'A3-AE-60', 'AE', 60, false),
    ('S000762', 'A3-AE-61', 'AE', 61, false),
    ('S000763', 'A3-AE-62', 'AE', 62, false),
    ('S000764', 'A3-AE-63', 'AE', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AF (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000765', 'A3-AF-44', 'AF', 44, false),
    ('S000766', 'A3-AF-45', 'AF', 45, false),
    ('S000767', 'A3-AF-46', 'AF', 46, false),
    ('S000768', 'A3-AF-47', 'AF', 47, false),
    ('S000769', 'A3-AF-48', 'AF', 48, false),
    ('S000770', 'A3-AF-49', 'AF', 49, false),
    ('S000771', 'A3-AF-50', 'AF', 50, false),
    ('S000772', 'A3-AF-51', 'AF', 51, false),
    ('S000773', 'A3-AF-52', 'AF', 52, false),
    ('S000774', 'A3-AF-53', 'AF', 53, false),
    ('S000775', 'A3-AF-54', 'AF', 54, false),
    ('S000776', 'A3-AF-55', 'AF', 55, false),
    ('S000777', 'A3-AF-56', 'AF', 56, false),
    ('S000778', 'A3-AF-57', 'AF', 57, false),
    ('S000779', 'A3-AF-58', 'AF', 58, false),
    ('S000780', 'A3-AF-59', 'AF', 59, false),
    ('S000781', 'A3-AF-60', 'AF', 60, false),
    ('S000782', 'A3-AF-61', 'AF', 61, false),
    ('S000783', 'A3-AF-62', 'AF', 62, false),
    ('S000784', 'A3-AF-63', 'AF', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AG (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000785', 'A3-AG-44', 'AG', 44, false),
    ('S000786', 'A3-AG-45', 'AG', 45, false),
    ('S000787', 'A3-AG-46', 'AG', 46, false),
    ('S000788', 'A3-AG-47', 'AG', 47, false),
    ('S000789', 'A3-AG-48', 'AG', 48, false),
    ('S000790', 'A3-AG-49', 'AG', 49, false),
    ('S000791', 'A3-AG-50', 'AG', 50, false),
    ('S000792', 'A3-AG-51', 'AG', 51, false),
    ('S000793', 'A3-AG-52', 'AG', 52, false),
    ('S000794', 'A3-AG-53', 'AG', 53, false),
    ('S000795', 'A3-AG-54', 'AG', 54, false),
    ('S000796', 'A3-AG-55', 'AG', 55, false),
    ('S000797', 'A3-AG-56', 'AG', 56, false),
    ('S000798', 'A3-AG-57', 'AG', 57, false),
    ('S000799', 'A3-AG-58', 'AG', 58, false),
    ('S000800', 'A3-AG-59', 'AG', 59, false),
    ('S000801', 'A3-AG-60', 'AG', 60, false),
    ('S000802', 'A3-AG-61', 'AG', 61, false),
    ('S000803', 'A3-AG-62', 'AG', 62, false),
    ('S000804', 'A3-AG-63', 'AG', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AH (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000805', 'A3-AH-44', 'AH', 44, false),
    ('S000806', 'A3-AH-45', 'AH', 45, false),
    ('S000807', 'A3-AH-46', 'AH', 46, false),
    ('S000808', 'A3-AH-47', 'AH', 47, false),
    ('S000809', 'A3-AH-48', 'AH', 48, false),
    ('S000810', 'A3-AH-49', 'AH', 49, false),
    ('S000811', 'A3-AH-50', 'AH', 50, false),
    ('S000812', 'A3-AH-51', 'AH', 51, false),
    ('S000813', 'A3-AH-52', 'AH', 52, false),
    ('S000814', 'A3-AH-53', 'AH', 53, false),
    ('S000815', 'A3-AH-54', 'AH', 54, false),
    ('S000816', 'A3-AH-55', 'AH', 55, false),
    ('S000817', 'A3-AH-56', 'AH', 56, false),
    ('S000818', 'A3-AH-57', 'AH', 57, false),
    ('S000819', 'A3-AH-58', 'AH', 58, false),
    ('S000820', 'A3-AH-59', 'AH', 59, false),
    ('S000821', 'A3-AH-60', 'AH', 60, false),
    ('S000822', 'A3-AH-61', 'AH', 61, false),
    ('S000823', 'A3-AH-62', 'AH', 62, false),
    ('S000824', 'A3-AH-63', 'AH', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AJ (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000825', 'A3-AJ-44', 'AJ', 44, false),
    ('S000826', 'A3-AJ-45', 'AJ', 45, false),
    ('S000827', 'A3-AJ-46', 'AJ', 46, false),
    ('S000828', 'A3-AJ-47', 'AJ', 47, false),
    ('S000829', 'A3-AJ-48', 'AJ', 48, false),
    ('S000830', 'A3-AJ-49', 'AJ', 49, false),
    ('S000831', 'A3-AJ-50', 'AJ', 50, false),
    ('S000832', 'A3-AJ-51', 'AJ', 51, false),
    ('S000833', 'A3-AJ-52', 'AJ', 52, false),
    ('S000834', 'A3-AJ-53', 'AJ', 53, false),
    ('S000835', 'A3-AJ-54', 'AJ', 54, false),
    ('S000836', 'A3-AJ-55', 'AJ', 55, false),
    ('S000837', 'A3-AJ-56', 'AJ', 56, false),
    ('S000838', 'A3-AJ-57', 'AJ', 57, false),
    ('S000839', 'A3-AJ-58', 'AJ', 58, false),
    ('S000840', 'A3-AJ-59', 'AJ', 59, false),
    ('S000841', 'A3-AJ-60', 'AJ', 60, false),
    ('S000842', 'A3-AJ-61', 'AJ', 61, false),
    ('S000843', 'A3-AJ-62', 'AJ', 62, false),
    ('S000844', 'A3-AJ-63', 'AJ', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AK (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000845', 'A3-AK-44', 'AK', 44, false),
    ('S000846', 'A3-AK-45', 'AK', 45, false),
    ('S000847', 'A3-AK-46', 'AK', 46, false),
    ('S000848', 'A3-AK-47', 'AK', 47, false),
    ('S000849', 'A3-AK-48', 'AK', 48, false),
    ('S000850', 'A3-AK-49', 'AK', 49, false),
    ('S000851', 'A3-AK-50', 'AK', 50, false),
    ('S000852', 'A3-AK-51', 'AK', 51, false),
    ('S000853', 'A3-AK-52', 'AK', 52, false),
    ('S000854', 'A3-AK-53', 'AK', 53, false),
    ('S000855', 'A3-AK-54', 'AK', 54, false),
    ('S000856', 'A3-AK-55', 'AK', 55, false),
    ('S000857', 'A3-AK-56', 'AK', 56, false),
    ('S000858', 'A3-AK-57', 'AK', 57, false),
    ('S000859', 'A3-AK-58', 'AK', 58, false),
    ('S000860', 'A3-AK-59', 'AK', 59, false),
    ('S000861', 'A3-AK-60', 'AK', 60, false),
    ('S000862', 'A3-AK-61', 'AK', 61, false),
    ('S000863', 'A3-AK-62', 'AK', 62, false),
    ('S000864', 'A3-AK-63', 'AK', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AL (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000865', 'A3-AL-44', 'AL', 44, false),
    ('S000866', 'A3-AL-45', 'AL', 45, false),
    ('S000867', 'A3-AL-46', 'AL', 46, false),
    ('S000868', 'A3-AL-47', 'AL', 47, false),
    ('S000869', 'A3-AL-48', 'AL', 48, false),
    ('S000870', 'A3-AL-49', 'AL', 49, false),
    ('S000871', 'A3-AL-50', 'AL', 50, false),
    ('S000872', 'A3-AL-51', 'AL', 51, false),
    ('S000873', 'A3-AL-52', 'AL', 52, false),
    ('S000874', 'A3-AL-53', 'AL', 53, false),
    ('S000875', 'A3-AL-54', 'AL', 54, false),
    ('S000876', 'A3-AL-55', 'AL', 55, false),
    ('S000877', 'A3-AL-56', 'AL', 56, false),
    ('S000878', 'A3-AL-57', 'AL', 57, false),
    ('S000879', 'A3-AL-58', 'AL', 58, false),
    ('S000880', 'A3-AL-59', 'AL', 59, false),
    ('S000881', 'A3-AL-60', 'AL', 60, false),
    ('S000882', 'A3-AL-61', 'AL', 61, false),
    ('S000883', 'A3-AL-62', 'AL', 62, false),
    ('S000884', 'A3-AL-63', 'AL', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AM (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000885', 'A3-AM-44', 'AM', 44, false),
    ('S000886', 'A3-AM-45', 'AM', 45, false),
    ('S000887', 'A3-AM-46', 'AM', 46, false),
    ('S000888', 'A3-AM-47', 'AM', 47, false),
    ('S000889', 'A3-AM-48', 'AM', 48, false),
    ('S000890', 'A3-AM-49', 'AM', 49, false),
    ('S000891', 'A3-AM-50', 'AM', 50, false),
    ('S000892', 'A3-AM-51', 'AM', 51, false),
    ('S000893', 'A3-AM-52', 'AM', 52, false),
    ('S000894', 'A3-AM-53', 'AM', 53, false),
    ('S000895', 'A3-AM-54', 'AM', 54, false),
    ('S000896', 'A3-AM-55', 'AM', 55, false),
    ('S000897', 'A3-AM-56', 'AM', 56, false),
    ('S000898', 'A3-AM-57', 'AM', 57, false),
    ('S000899', 'A3-AM-58', 'AM', 58, false),
    ('S000900', 'A3-AM-59', 'AM', 59, false),
    ('S000901', 'A3-AM-60', 'AM', 60, false),
    ('S000902', 'A3-AM-61', 'AM', 61, false),
    ('S000903', 'A3-AM-62', 'AM', 62, false),
    ('S000904', 'A3-AM-63', 'AM', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AN (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000905', 'A3-AN-44', 'AN', 44, false),
    ('S000906', 'A3-AN-45', 'AN', 45, false),
    ('S000907', 'A3-AN-46', 'AN', 46, false),
    ('S000908', 'A3-AN-47', 'AN', 47, false),
    ('S000909', 'A3-AN-48', 'AN', 48, false),
    ('S000910', 'A3-AN-49', 'AN', 49, false),
    ('S000911', 'A3-AN-50', 'AN', 50, false),
    ('S000912', 'A3-AN-51', 'AN', 51, false),
    ('S000913', 'A3-AN-52', 'AN', 52, false),
    ('S000914', 'A3-AN-53', 'AN', 53, false),
    ('S000915', 'A3-AN-54', 'AN', 54, false),
    ('S000916', 'A3-AN-55', 'AN', 55, false),
    ('S000917', 'A3-AN-56', 'AN', 56, false),
    ('S000918', 'A3-AN-57', 'AN', 57, false),
    ('S000919', 'A3-AN-58', 'AN', 58, false),
    ('S000920', 'A3-AN-59', 'AN', 59, false),
    ('S000921', 'A3-AN-60', 'AN', 60, false),
    ('S000922', 'A3-AN-61', 'AN', 61, false),
    ('S000923', 'A3-AN-62', 'AN', 62, false),
    ('S000924', 'A3-AN-63', 'AN', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AP (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000925', 'A3-AP-44', 'AP', 44, false),
    ('S000926', 'A3-AP-45', 'AP', 45, false),
    ('S000927', 'A3-AP-46', 'AP', 46, false),
    ('S000928', 'A3-AP-47', 'AP', 47, false),
    ('S000929', 'A3-AP-48', 'AP', 48, false),
    ('S000930', 'A3-AP-49', 'AP', 49, false),
    ('S000931', 'A3-AP-50', 'AP', 50, false),
    ('S000932', 'A3-AP-51', 'AP', 51, false),
    ('S000933', 'A3-AP-52', 'AP', 52, false),
    ('S000934', 'A3-AP-53', 'AP', 53, false),
    ('S000935', 'A3-AP-54', 'AP', 54, false),
    ('S000936', 'A3-AP-55', 'AP', 55, false),
    ('S000937', 'A3-AP-56', 'AP', 56, false),
    ('S000938', 'A3-AP-57', 'AP', 57, false),
    ('S000939', 'A3-AP-58', 'AP', 58, false),
    ('S000940', 'A3-AP-59', 'AP', 59, false),
    ('S000941', 'A3-AP-60', 'AP', 60, false),
    ('S000942', 'A3-AP-61', 'AP', 61, false),
    ('S000943', 'A3-AP-62', 'AP', 62, false),
    ('S000944', 'A3-AP-63', 'AP', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AQ (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000945', 'A3-AQ-44', 'AQ', 44, false),
    ('S000946', 'A3-AQ-45', 'AQ', 45, false),
    ('S000947', 'A3-AQ-46', 'AQ', 46, false),
    ('S000948', 'A3-AQ-47', 'AQ', 47, false),
    ('S000949', 'A3-AQ-48', 'AQ', 48, false),
    ('S000950', 'A3-AQ-49', 'AQ', 49, false),
    ('S000951', 'A3-AQ-50', 'AQ', 50, false),
    ('S000952', 'A3-AQ-51', 'AQ', 51, false),
    ('S000953', 'A3-AQ-52', 'AQ', 52, false),
    ('S000954', 'A3-AQ-53', 'AQ', 53, false),
    ('S000955', 'A3-AQ-54', 'AQ', 54, false),
    ('S000956', 'A3-AQ-55', 'AQ', 55, false),
    ('S000957', 'A3-AQ-56', 'AQ', 56, false),
    ('S000958', 'A3-AQ-57', 'AQ', 57, false),
    ('S000959', 'A3-AQ-58', 'AQ', 58, false),
    ('S000960', 'A3-AQ-59', 'AQ', 59, false),
    ('S000961', 'A3-AQ-60', 'AQ', 60, false),
    ('S000962', 'A3-AQ-61', 'AQ', 61, false),
    ('S000963', 'A3-AQ-62', 'AQ', 62, false),
    ('S000964', 'A3-AQ-63', 'AQ', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AR (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000965', 'A3-AR-44', 'AR', 44, false),
    ('S000966', 'A3-AR-45', 'AR', 45, false),
    ('S000967', 'A3-AR-46', 'AR', 46, false),
    ('S000968', 'A3-AR-47', 'AR', 47, false),
    ('S000969', 'A3-AR-48', 'AR', 48, false),
    ('S000970', 'A3-AR-49', 'AR', 49, false),
    ('S000971', 'A3-AR-50', 'AR', 50, false),
    ('S000972', 'A3-AR-51', 'AR', 51, false),
    ('S000973', 'A3-AR-52', 'AR', 52, false),
    ('S000974', 'A3-AR-53', 'AR', 53, false),
    ('S000975', 'A3-AR-54', 'AR', 54, false),
    ('S000976', 'A3-AR-55', 'AR', 55, false),
    ('S000977', 'A3-AR-56', 'AR', 56, false),
    ('S000978', 'A3-AR-57', 'AR', 57, false),
    ('S000979', 'A3-AR-58', 'AR', 58, false),
    ('S000980', 'A3-AR-59', 'AR', 59, false),
    ('S000981', 'A3-AR-60', 'AR', 60, false),
    ('S000982', 'A3-AR-61', 'AR', 61, false),
    ('S000983', 'A3-AR-62', 'AR', 62, false),
    ('S000984', 'A3-AR-63', 'AR', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AS (20 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S000985', 'A3-AS-44', 'AS', 44, false),
    ('S000986', 'A3-AS-45', 'AS', 45, false),
    ('S000987', 'A3-AS-46', 'AS', 46, false),
    ('S000988', 'A3-AS-47', 'AS', 47, false),
    ('S000989', 'A3-AS-48', 'AS', 48, false),
    ('S000990', 'A3-AS-49', 'AS', 49, false),
    ('S000991', 'A3-AS-50', 'AS', 50, false),
    ('S000992', 'A3-AS-51', 'AS', 51, false),
    ('S000993', 'A3-AS-52', 'AS', 52, false),
    ('S000994', 'A3-AS-53', 'AS', 53, false),
    ('S000995', 'A3-AS-54', 'AS', 54, false),
    ('S000996', 'A3-AS-55', 'AS', 55, false),
    ('S000997', 'A3-AS-56', 'AS', 56, false),
    ('S000998', 'A3-AS-57', 'AS', 57, false),
    ('S000999', 'A3-AS-58', 'AS', 58, false),
    ('S001000', 'A3-AS-59', 'AS', 59, false),
    ('S001001', 'A3-AS-60', 'AS', 60, false),
    ('S001002', 'A3-AS-61', 'AS', 61, false),
    ('S001003', 'A3-AS-62', 'AS', 62, false),
    ('S001004', 'A3-AS-63', 'AS', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AT (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001005', 'A3-AT-52', 'AT', 52, false),
    ('S001006', 'A3-AT-53', 'AT', 53, false),
    ('S001007', 'A3-AT-54', 'AT', 54, false),
    ('S001008', 'A3-AT-55', 'AT', 55, false),
    ('S001009', 'A3-AT-56', 'AT', 56, false),
    ('S001010', 'A3-AT-57', 'AT', 57, false),
    ('S001011', 'A3-AT-58', 'AT', 58, false),
    ('S001012', 'A3-AT-59', 'AT', 59, false),
    ('S001013', 'A3-AT-60', 'AT', 60, false),
    ('S001014', 'A3-AT-61', 'AT', 61, false),
    ('S001015', 'A3-AT-62', 'AT', 62, false),
    ('S001016', 'A3-AT-63', 'AT', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AU (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001017', 'A3-AU-52', 'AU', 52, false),
    ('S001018', 'A3-AU-53', 'AU', 53, false),
    ('S001019', 'A3-AU-54', 'AU', 54, false),
    ('S001020', 'A3-AU-55', 'AU', 55, false),
    ('S001021', 'A3-AU-56', 'AU', 56, false),
    ('S001022', 'A3-AU-57', 'AU', 57, false),
    ('S001023', 'A3-AU-58', 'AU', 58, false),
    ('S001024', 'A3-AU-59', 'AU', 59, false),
    ('S001025', 'A3-AU-60', 'AU', 60, false),
    ('S001026', 'A3-AU-61', 'AU', 61, false),
    ('S001027', 'A3-AU-62', 'AU', 62, false),
    ('S001028', 'A3-AU-63', 'AU', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AV (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001029', 'A3-AV-52', 'AV', 52, false),
    ('S001030', 'A3-AV-53', 'AV', 53, false),
    ('S001031', 'A3-AV-54', 'AV', 54, false),
    ('S001032', 'A3-AV-55', 'AV', 55, false),
    ('S001033', 'A3-AV-56', 'AV', 56, false),
    ('S001034', 'A3-AV-57', 'AV', 57, false),
    ('S001035', 'A3-AV-58', 'AV', 58, false),
    ('S001036', 'A3-AV-59', 'AV', 59, false),
    ('S001037', 'A3-AV-60', 'AV', 60, false),
    ('S001038', 'A3-AV-61', 'AV', 61, false),
    ('S001039', 'A3-AV-62', 'AV', 62, false),
    ('S001040', 'A3-AV-63', 'AV', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AW (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001041', 'A3-AW-52', 'AW', 52, false),
    ('S001042', 'A3-AW-53', 'AW', 53, false),
    ('S001043', 'A3-AW-54', 'AW', 54, false),
    ('S001044', 'A3-AW-55', 'AW', 55, false),
    ('S001045', 'A3-AW-56', 'AW', 56, false),
    ('S001046', 'A3-AW-57', 'AW', 57, false),
    ('S001047', 'A3-AW-58', 'AW', 58, false),
    ('S001048', 'A3-AW-59', 'AW', 59, false),
    ('S001049', 'A3-AW-60', 'AW', 60, false),
    ('S001050', 'A3-AW-61', 'AW', 61, false),
    ('S001051', 'A3-AW-62', 'AW', 62, false),
    ('S001052', 'A3-AW-63', 'AW', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AX (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001053', 'A3-AX-52', 'AX', 52, false),
    ('S001054', 'A3-AX-53', 'AX', 53, false),
    ('S001055', 'A3-AX-54', 'AX', 54, false),
    ('S001056', 'A3-AX-55', 'AX', 55, false),
    ('S001057', 'A3-AX-56', 'AX', 56, false),
    ('S001058', 'A3-AX-57', 'AX', 57, false),
    ('S001059', 'A3-AX-58', 'AX', 58, false),
    ('S001060', 'A3-AX-59', 'AX', 59, false),
    ('S001061', 'A3-AX-60', 'AX', 60, false),
    ('S001062', 'A3-AX-61', 'AX', 61, false),
    ('S001063', 'A3-AX-62', 'AX', 62, false),
    ('S001064', 'A3-AX-63', 'AX', 63, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A3'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE A4 (264 seats)
-- Row AA (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001065', 'A4-AA-64', 'AA', 64, false),
    ('S001066', 'A4-AA-65', 'AA', 65, false),
    ('S001067', 'A4-AA-66', 'AA', 66, false),
    ('S001068', 'A4-AA-67', 'AA', 67, false),
    ('S001069', 'A4-AA-68', 'AA', 68, false),
    ('S001070', 'A4-AA-69', 'AA', 69, false),
    ('S001071', 'A4-AA-70', 'AA', 70, false),
    ('S001072', 'A4-AA-71', 'AA', 71, false),
    ('S001073', 'A4-AA-72', 'AA', 72, false),
    ('S001074', 'A4-AA-73', 'AA', 73, false),
    ('S001075', 'A4-AA-74', 'AA', 74, false),
    ('S001076', 'A4-AA-75', 'AA', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AB (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001077', 'A4-AB-64', 'AB', 64, false),
    ('S001078', 'A4-AB-65', 'AB', 65, false),
    ('S001079', 'A4-AB-66', 'AB', 66, false),
    ('S001080', 'A4-AB-67', 'AB', 67, false),
    ('S001081', 'A4-AB-68', 'AB', 68, false),
    ('S001082', 'A4-AB-69', 'AB', 69, false),
    ('S001083', 'A4-AB-70', 'AB', 70, false),
    ('S001084', 'A4-AB-71', 'AB', 71, false),
    ('S001085', 'A4-AB-72', 'AB', 72, false),
    ('S001086', 'A4-AB-73', 'AB', 73, false),
    ('S001087', 'A4-AB-74', 'AB', 74, false),
    ('S001088', 'A4-AB-75', 'AB', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AC (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001089', 'A4-AC-64', 'AC', 64, false),
    ('S001090', 'A4-AC-65', 'AC', 65, false),
    ('S001091', 'A4-AC-66', 'AC', 66, false),
    ('S001092', 'A4-AC-67', 'AC', 67, false),
    ('S001093', 'A4-AC-68', 'AC', 68, false),
    ('S001094', 'A4-AC-69', 'AC', 69, false),
    ('S001095', 'A4-AC-70', 'AC', 70, false),
    ('S001096', 'A4-AC-71', 'AC', 71, false),
    ('S001097', 'A4-AC-72', 'AC', 72, false),
    ('S001098', 'A4-AC-73', 'AC', 73, false),
    ('S001099', 'A4-AC-74', 'AC', 74, false),
    ('S001100', 'A4-AC-75', 'AC', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AD (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001101', 'A4-AD-64', 'AD', 64, false),
    ('S001102', 'A4-AD-65', 'AD', 65, false),
    ('S001103', 'A4-AD-66', 'AD', 66, false),
    ('S001104', 'A4-AD-67', 'AD', 67, false),
    ('S001105', 'A4-AD-68', 'AD', 68, false),
    ('S001106', 'A4-AD-69', 'AD', 69, false),
    ('S001107', 'A4-AD-70', 'AD', 70, false),
    ('S001108', 'A4-AD-71', 'AD', 71, false),
    ('S001109', 'A4-AD-72', 'AD', 72, false),
    ('S001110', 'A4-AD-73', 'AD', 73, false),
    ('S001111', 'A4-AD-74', 'AD', 74, false),
    ('S001112', 'A4-AD-75', 'AD', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AE (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001113', 'A4-AE-64', 'AE', 64, false),
    ('S001114', 'A4-AE-65', 'AE', 65, false),
    ('S001115', 'A4-AE-66', 'AE', 66, false),
    ('S001116', 'A4-AE-67', 'AE', 67, false),
    ('S001117', 'A4-AE-68', 'AE', 68, false),
    ('S001118', 'A4-AE-69', 'AE', 69, false),
    ('S001119', 'A4-AE-70', 'AE', 70, false),
    ('S001120', 'A4-AE-71', 'AE', 71, false),
    ('S001121', 'A4-AE-72', 'AE', 72, false),
    ('S001122', 'A4-AE-73', 'AE', 73, false),
    ('S001123', 'A4-AE-74', 'AE', 74, false),
    ('S001124', 'A4-AE-75', 'AE', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AF (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001125', 'A4-AF-64', 'AF', 64, false),
    ('S001126', 'A4-AF-65', 'AF', 65, false),
    ('S001127', 'A4-AF-66', 'AF', 66, false),
    ('S001128', 'A4-AF-67', 'AF', 67, false),
    ('S001129', 'A4-AF-68', 'AF', 68, false),
    ('S001130', 'A4-AF-69', 'AF', 69, false),
    ('S001131', 'A4-AF-70', 'AF', 70, false),
    ('S001132', 'A4-AF-71', 'AF', 71, false),
    ('S001133', 'A4-AF-72', 'AF', 72, false),
    ('S001134', 'A4-AF-73', 'AF', 73, false),
    ('S001135', 'A4-AF-74', 'AF', 74, false),
    ('S001136', 'A4-AF-75', 'AF', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AG (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001137', 'A4-AG-64', 'AG', 64, false),
    ('S001138', 'A4-AG-65', 'AG', 65, false),
    ('S001139', 'A4-AG-66', 'AG', 66, false),
    ('S001140', 'A4-AG-67', 'AG', 67, false),
    ('S001141', 'A4-AG-68', 'AG', 68, false),
    ('S001142', 'A4-AG-69', 'AG', 69, false),
    ('S001143', 'A4-AG-70', 'AG', 70, false),
    ('S001144', 'A4-AG-71', 'AG', 71, false),
    ('S001145', 'A4-AG-72', 'AG', 72, false),
    ('S001146', 'A4-AG-73', 'AG', 73, false),
    ('S001147', 'A4-AG-74', 'AG', 74, false),
    ('S001148', 'A4-AG-75', 'AG', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AH (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001149', 'A4-AH-64', 'AH', 64, false),
    ('S001150', 'A4-AH-65', 'AH', 65, false),
    ('S001151', 'A4-AH-66', 'AH', 66, false),
    ('S001152', 'A4-AH-67', 'AH', 67, false),
    ('S001153', 'A4-AH-68', 'AH', 68, false),
    ('S001154', 'A4-AH-69', 'AH', 69, false),
    ('S001155', 'A4-AH-70', 'AH', 70, false),
    ('S001156', 'A4-AH-71', 'AH', 71, false),
    ('S001157', 'A4-AH-72', 'AH', 72, false),
    ('S001158', 'A4-AH-73', 'AH', 73, false),
    ('S001159', 'A4-AH-74', 'AH', 74, false),
    ('S001160', 'A4-AH-75', 'AH', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AJ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001161', 'A4-AJ-64', 'AJ', 64, false),
    ('S001162', 'A4-AJ-65', 'AJ', 65, false),
    ('S001163', 'A4-AJ-66', 'AJ', 66, false),
    ('S001164', 'A4-AJ-67', 'AJ', 67, false),
    ('S001165', 'A4-AJ-68', 'AJ', 68, false),
    ('S001166', 'A4-AJ-69', 'AJ', 69, false),
    ('S001167', 'A4-AJ-70', 'AJ', 70, false),
    ('S001168', 'A4-AJ-71', 'AJ', 71, false),
    ('S001169', 'A4-AJ-72', 'AJ', 72, false),
    ('S001170', 'A4-AJ-73', 'AJ', 73, false),
    ('S001171', 'A4-AJ-74', 'AJ', 74, false),
    ('S001172', 'A4-AJ-75', 'AJ', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AK (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001173', 'A4-AK-64', 'AK', 64, false),
    ('S001174', 'A4-AK-65', 'AK', 65, false),
    ('S001175', 'A4-AK-66', 'AK', 66, false),
    ('S001176', 'A4-AK-67', 'AK', 67, false),
    ('S001177', 'A4-AK-68', 'AK', 68, false),
    ('S001178', 'A4-AK-69', 'AK', 69, false),
    ('S001179', 'A4-AK-70', 'AK', 70, false),
    ('S001180', 'A4-AK-71', 'AK', 71, false),
    ('S001181', 'A4-AK-72', 'AK', 72, false),
    ('S001182', 'A4-AK-73', 'AK', 73, false),
    ('S001183', 'A4-AK-74', 'AK', 74, false),
    ('S001184', 'A4-AK-75', 'AK', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AL (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001185', 'A4-AL-64', 'AL', 64, false),
    ('S001186', 'A4-AL-65', 'AL', 65, false),
    ('S001187', 'A4-AL-66', 'AL', 66, false),
    ('S001188', 'A4-AL-67', 'AL', 67, false),
    ('S001189', 'A4-AL-68', 'AL', 68, false),
    ('S001190', 'A4-AL-69', 'AL', 69, false),
    ('S001191', 'A4-AL-70', 'AL', 70, false),
    ('S001192', 'A4-AL-71', 'AL', 71, false),
    ('S001193', 'A4-AL-72', 'AL', 72, false),
    ('S001194', 'A4-AL-73', 'AL', 73, false),
    ('S001195', 'A4-AL-74', 'AL', 74, false),
    ('S001196', 'A4-AL-75', 'AL', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AM (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001197', 'A4-AM-64', 'AM', 64, false),
    ('S001198', 'A4-AM-65', 'AM', 65, false),
    ('S001199', 'A4-AM-66', 'AM', 66, false),
    ('S001200', 'A4-AM-67', 'AM', 67, false),
    ('S001201', 'A4-AM-68', 'AM', 68, false),
    ('S001202', 'A4-AM-69', 'AM', 69, false),
    ('S001203', 'A4-AM-70', 'AM', 70, false),
    ('S001204', 'A4-AM-71', 'AM', 71, false),
    ('S001205', 'A4-AM-72', 'AM', 72, false),
    ('S001206', 'A4-AM-73', 'AM', 73, false),
    ('S001207', 'A4-AM-74', 'AM', 74, false),
    ('S001208', 'A4-AM-75', 'AM', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AN (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001209', 'A4-AN-64', 'AN', 64, false),
    ('S001210', 'A4-AN-65', 'AN', 65, false),
    ('S001211', 'A4-AN-66', 'AN', 66, false),
    ('S001212', 'A4-AN-67', 'AN', 67, false),
    ('S001213', 'A4-AN-68', 'AN', 68, false),
    ('S001214', 'A4-AN-69', 'AN', 69, false),
    ('S001215', 'A4-AN-70', 'AN', 70, false),
    ('S001216', 'A4-AN-71', 'AN', 71, false),
    ('S001217', 'A4-AN-72', 'AN', 72, false),
    ('S001218', 'A4-AN-73', 'AN', 73, false),
    ('S001219', 'A4-AN-74', 'AN', 74, false),
    ('S001220', 'A4-AN-75', 'AN', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AP (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001221', 'A4-AP-64', 'AP', 64, false),
    ('S001222', 'A4-AP-65', 'AP', 65, false),
    ('S001223', 'A4-AP-66', 'AP', 66, false),
    ('S001224', 'A4-AP-67', 'AP', 67, false),
    ('S001225', 'A4-AP-68', 'AP', 68, false),
    ('S001226', 'A4-AP-69', 'AP', 69, false),
    ('S001227', 'A4-AP-70', 'AP', 70, false),
    ('S001228', 'A4-AP-71', 'AP', 71, false),
    ('S001229', 'A4-AP-72', 'AP', 72, false),
    ('S001230', 'A4-AP-73', 'AP', 73, false),
    ('S001231', 'A4-AP-74', 'AP', 74, false),
    ('S001232', 'A4-AP-75', 'AP', 75, false),
    ('S001233', 'A4-AP-91', 'AP', 91, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AQ (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001234', 'A4-AQ-64', 'AQ', 64, false),
    ('S001235', 'A4-AQ-65', 'AQ', 65, false),
    ('S001236', 'A4-AQ-66', 'AQ', 66, false),
    ('S001237', 'A4-AQ-67', 'AQ', 67, false),
    ('S001238', 'A4-AQ-68', 'AQ', 68, false),
    ('S001239', 'A4-AQ-69', 'AQ', 69, false),
    ('S001240', 'A4-AQ-70', 'AQ', 70, false),
    ('S001241', 'A4-AQ-71', 'AQ', 71, false),
    ('S001242', 'A4-AQ-72', 'AQ', 72, false),
    ('S001243', 'A4-AQ-73', 'AQ', 73, false),
    ('S001244', 'A4-AQ-74', 'AQ', 74, false),
    ('S001245', 'A4-AQ-75', 'AQ', 75, false),
    ('S001246', 'A4-AQ-91', 'AQ', 91, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AR (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001247', 'A4-AR-64', 'AR', 64, false),
    ('S001248', 'A4-AR-65', 'AR', 65, false),
    ('S001249', 'A4-AR-66', 'AR', 66, false),
    ('S001250', 'A4-AR-67', 'AR', 67, false),
    ('S001251', 'A4-AR-68', 'AR', 68, false),
    ('S001252', 'A4-AR-69', 'AR', 69, false),
    ('S001253', 'A4-AR-70', 'AR', 70, false),
    ('S001254', 'A4-AR-71', 'AR', 71, false),
    ('S001255', 'A4-AR-72', 'AR', 72, false),
    ('S001256', 'A4-AR-73', 'AR', 73, false),
    ('S001257', 'A4-AR-74', 'AR', 74, false),
    ('S001258', 'A4-AR-75', 'AR', 75, false),
    ('S001259', 'A4-AR-182', 'AR', 182, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AS (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001260', 'A4-AS-64', 'AS', 64, false),
    ('S001261', 'A4-AS-65', 'AS', 65, false),
    ('S001262', 'A4-AS-66', 'AS', 66, false),
    ('S001263', 'A4-AS-67', 'AS', 67, false),
    ('S001264', 'A4-AS-68', 'AS', 68, false),
    ('S001265', 'A4-AS-69', 'AS', 69, false),
    ('S001266', 'A4-AS-70', 'AS', 70, false),
    ('S001267', 'A4-AS-71', 'AS', 71, false),
    ('S001268', 'A4-AS-72', 'AS', 72, false),
    ('S001269', 'A4-AS-73', 'AS', 73, false),
    ('S001270', 'A4-AS-74', 'AS', 74, false),
    ('S001271', 'A4-AS-75', 'AS', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AT (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001272', 'A4-AT-37', 'AT', 37, false),
    ('S001273', 'A4-AT-64', 'AT', 64, false),
    ('S001274', 'A4-AT-65', 'AT', 65, false),
    ('S001275', 'A4-AT-66', 'AT', 66, false),
    ('S001276', 'A4-AT-67', 'AT', 67, false),
    ('S001277', 'A4-AT-68', 'AT', 68, false),
    ('S001278', 'A4-AT-69', 'AT', 69, false),
    ('S001279', 'A4-AT-70', 'AT', 70, false),
    ('S001280', 'A4-AT-71', 'AT', 71, false),
    ('S001281', 'A4-AT-72', 'AT', 72, false),
    ('S001282', 'A4-AT-73', 'AT', 73, false),
    ('S001283', 'A4-AT-74', 'AT', 74, false),
    ('S001284', 'A4-AT-75', 'AT', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AU (13 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001285', 'A4-AU-37', 'AU', 37, false),
    ('S001286', 'A4-AU-64', 'AU', 64, false),
    ('S001287', 'A4-AU-65', 'AU', 65, false),
    ('S001288', 'A4-AU-66', 'AU', 66, false),
    ('S001289', 'A4-AU-67', 'AU', 67, false),
    ('S001290', 'A4-AU-68', 'AU', 68, false),
    ('S001291', 'A4-AU-69', 'AU', 69, false),
    ('S001292', 'A4-AU-70', 'AU', 70, false),
    ('S001293', 'A4-AU-71', 'AU', 71, false),
    ('S001294', 'A4-AU-72', 'AU', 72, false),
    ('S001295', 'A4-AU-73', 'AU', 73, false),
    ('S001296', 'A4-AU-74', 'AU', 74, false),
    ('S001297', 'A4-AU-75', 'AU', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AV (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001298', 'A4-AV-64', 'AV', 64, false),
    ('S001299', 'A4-AV-65', 'AV', 65, false),
    ('S001300', 'A4-AV-66', 'AV', 66, false),
    ('S001301', 'A4-AV-67', 'AV', 67, false),
    ('S001302', 'A4-AV-68', 'AV', 68, false),
    ('S001303', 'A4-AV-69', 'AV', 69, false),
    ('S001304', 'A4-AV-70', 'AV', 70, false),
    ('S001305', 'A4-AV-71', 'AV', 71, false),
    ('S001306', 'A4-AV-72', 'AV', 72, false),
    ('S001307', 'A4-AV-73', 'AV', 73, false),
    ('S001308', 'A4-AV-74', 'AV', 74, false),
    ('S001309', 'A4-AV-75', 'AV', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AW (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001311', 'A4-AW-64', 'AW', 64, false),
    ('S001312', 'A4-AW-65', 'AW', 65, false),
    ('S001313', 'A4-AW-66', 'AW', 66, false),
    ('S001314', 'A4-AW-67', 'AW', 67, false),
    ('S001315', 'A4-AW-68', 'AW', 68, false),
    ('S001316', 'A4-AW-69', 'AW', 69, false),
    ('S001317', 'A4-AW-70', 'AW', 70, false),
    ('S001318', 'A4-AW-71', 'AW', 71, false),
    ('S001319', 'A4-AW-72', 'AW', 72, false),
    ('S001320', 'A4-AW-73', 'AW', 73, false),
    ('S001321', 'A4-AW-74', 'AW', 74, false),
    ('S001322', 'A4-AW-75', 'AW', 75, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row AX (6 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001323', 'A4-AX-64', 'AX', 64, false),
    ('S001324', 'A4-AX-65', 'AX', 65, false),
    ('S001325', 'A4-AX-66', 'AX', 66, false),
    ('S001326', 'A4-AX-67', 'AX', 67, false),
    ('S001327', 'A4-AX-68', 'AX', 68, false),
    ('S001328', 'A4-AX-69', 'AX', 69, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE A4'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE B1 (244 seats)
-- Row BA (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001329', 'B1-BA-01', 'BA', 1, false),
    ('S001330', 'B1-BA-02', 'BA', 2, false),
    ('S001331', 'B1-BA-03', 'BA', 3, false),
    ('S001332', 'B1-BA-04', 'BA', 4, false),
    ('S001333', 'B1-BA-05', 'BA', 5, false),
    ('S001334', 'B1-BA-06', 'BA', 6, false),
    ('S001335', 'B1-BA-07', 'BA', 7, false),
    ('S001336', 'B1-BA-08', 'BA', 8, false),
    ('S001337', 'B1-BA-09', 'BA', 9, false),
    ('S001338', 'B1-BA-10', 'BA', 10, false),
    ('S001339', 'B1-BA-11', 'BA', 11, false),
    ('S001340', 'B1-BA-12', 'BA', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BB (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001341', 'B1-BB-01', 'BB', 1, false),
    ('S001342', 'B1-BB-02', 'BB', 2, false),
    ('S001343', 'B1-BB-03', 'BB', 3, false),
    ('S001344', 'B1-BB-04', 'BB', 4, false),
    ('S001345', 'B1-BB-05', 'BB', 5, false),
    ('S001346', 'B1-BB-06', 'BB', 6, false),
    ('S001347', 'B1-BB-07', 'BB', 7, false),
    ('S001348', 'B1-BB-08', 'BB', 8, false),
    ('S001349', 'B1-BB-09', 'BB', 9, false),
    ('S001350', 'B1-BB-10', 'BB', 10, false),
    ('S001351', 'B1-BB-11', 'BB', 11, false),
    ('S001352', 'B1-BB-12', 'BB', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BC (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001353', 'B1-BC-01', 'BC', 1, false),
    ('S001354', 'B1-BC-02', 'BC', 2, false),
    ('S001355', 'B1-BC-03', 'BC', 3, false),
    ('S001356', 'B1-BC-04', 'BC', 4, false),
    ('S001357', 'B1-BC-05', 'BC', 5, false),
    ('S001358', 'B1-BC-06', 'BC', 6, false),
    ('S001359', 'B1-BC-07', 'BC', 7, false),
    ('S001360', 'B1-BC-08', 'BC', 8, false),
    ('S001361', 'B1-BC-09', 'BC', 9, false),
    ('S001362', 'B1-BC-10', 'BC', 10, false),
    ('S001363', 'B1-BC-11', 'BC', 11, false),
    ('S001364', 'B1-BC-12', 'BC', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BD (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001365', 'B1-BD-01', 'BD', 1, false),
    ('S001366', 'B1-BD-02', 'BD', 2, false),
    ('S001367', 'B1-BD-03', 'BD', 3, false),
    ('S001368', 'B1-BD-04', 'BD', 4, false),
    ('S001369', 'B1-BD-05', 'BD', 5, false),
    ('S001370', 'B1-BD-06', 'BD', 6, false),
    ('S001371', 'B1-BD-07', 'BD', 7, false),
    ('S001372', 'B1-BD-08', 'BD', 8, false),
    ('S001373', 'B1-BD-09', 'BD', 9, false),
    ('S001374', 'B1-BD-10', 'BD', 10, false),
    ('S001375', 'B1-BD-11', 'BD', 11, false),
    ('S001376', 'B1-BD-12', 'BD', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BE (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001377', 'B1-BE-01', 'BE', 1, false),
    ('S001378', 'B1-BE-02', 'BE', 2, false),
    ('S001379', 'B1-BE-03', 'BE', 3, false),
    ('S001380', 'B1-BE-04', 'BE', 4, false),
    ('S001381', 'B1-BE-05', 'BE', 5, false),
    ('S001382', 'B1-BE-06', 'BE', 6, false),
    ('S001383', 'B1-BE-07', 'BE', 7, false),
    ('S001384', 'B1-BE-08', 'BE', 8, false),
    ('S001385', 'B1-BE-09', 'BE', 9, false),
    ('S001386', 'B1-BE-10', 'BE', 10, false),
    ('S001387', 'B1-BE-11', 'BE', 11, false),
    ('S001388', 'B1-BE-12', 'BE', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BF (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001389', 'B1-BF-01', 'BF', 1, false),
    ('S001390', 'B1-BF-02', 'BF', 2, false),
    ('S001391', 'B1-BF-03', 'BF', 3, false),
    ('S001392', 'B1-BF-04', 'BF', 4, false),
    ('S001393', 'B1-BF-05', 'BF', 5, false),
    ('S001394', 'B1-BF-06', 'BF', 6, false),
    ('S001395', 'B1-BF-07', 'BF', 7, false),
    ('S001396', 'B1-BF-08', 'BF', 8, false),
    ('S001397', 'B1-BF-09', 'BF', 9, false),
    ('S001398', 'B1-BF-10', 'BF', 10, false),
    ('S001399', 'B1-BF-11', 'BF', 11, false),
    ('S001400', 'B1-BF-12', 'BF', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BG (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001401', 'B1-BG-01', 'BG', 1, false),
    ('S001402', 'B1-BG-02', 'BG', 2, false),
    ('S001403', 'B1-BG-03', 'BG', 3, false),
    ('S001404', 'B1-BG-04', 'BG', 4, false),
    ('S001405', 'B1-BG-05', 'BG', 5, false),
    ('S001406', 'B1-BG-06', 'BG', 6, false),
    ('S001407', 'B1-BG-07', 'BG', 7, false),
    ('S001408', 'B1-BG-08', 'BG', 8, false),
    ('S001409', 'B1-BG-09', 'BG', 9, false),
    ('S001410', 'B1-BG-10', 'BG', 10, false),
    ('S001411', 'B1-BG-11', 'BG', 11, false),
    ('S001412', 'B1-BG-12', 'BG', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BH (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001413', 'B1-BH-01', 'BH', 1, false),
    ('S001414', 'B1-BH-02', 'BH', 2, false),
    ('S001415', 'B1-BH-03', 'BH', 3, false),
    ('S001416', 'B1-BH-04', 'BH', 4, false),
    ('S001417', 'B1-BH-05', 'BH', 5, false),
    ('S001418', 'B1-BH-06', 'BH', 6, false),
    ('S001419', 'B1-BH-07', 'BH', 7, false),
    ('S001420', 'B1-BH-08', 'BH', 8, false),
    ('S001421', 'B1-BH-09', 'BH', 9, false),
    ('S001422', 'B1-BH-10', 'BH', 10, false),
    ('S001423', 'B1-BH-11', 'BH', 11, false),
    ('S001424', 'B1-BH-12', 'BH', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BJ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001425', 'B1-BJ-01', 'BJ', 1, false),
    ('S001426', 'B1-BJ-02', 'BJ', 2, false),
    ('S001427', 'B1-BJ-03', 'BJ', 3, false),
    ('S001428', 'B1-BJ-04', 'BJ', 4, false),
    ('S001429', 'B1-BJ-05', 'BJ', 5, false),
    ('S001430', 'B1-BJ-06', 'BJ', 6, false),
    ('S001431', 'B1-BJ-07', 'BJ', 7, false),
    ('S001432', 'B1-BJ-08', 'BJ', 8, false),
    ('S001433', 'B1-BJ-09', 'BJ', 9, false),
    ('S001434', 'B1-BJ-10', 'BJ', 10, false),
    ('S001435', 'B1-BJ-11', 'BJ', 11, false),
    ('S001436', 'B1-BJ-12', 'BJ', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BK (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001437', 'B1-BK-01', 'BK', 1, false),
    ('S001438', 'B1-BK-02', 'BK', 2, false),
    ('S001439', 'B1-BK-03', 'BK', 3, false),
    ('S001440', 'B1-BK-04', 'BK', 4, false),
    ('S001441', 'B1-BK-05', 'BK', 5, false),
    ('S001442', 'B1-BK-06', 'BK', 6, false),
    ('S001443', 'B1-BK-07', 'BK', 7, false),
    ('S001444', 'B1-BK-08', 'BK', 8, false),
    ('S001445', 'B1-BK-09', 'BK', 9, false),
    ('S001446', 'B1-BK-10', 'BK', 10, false),
    ('S001447', 'B1-BK-11', 'BK', 11, false),
    ('S001448', 'B1-BK-12', 'BK', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BL (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001449', 'B1-BL-01', 'BL', 1, false),
    ('S001450', 'B1-BL-02', 'BL', 2, false),
    ('S001451', 'B1-BL-03', 'BL', 3, false),
    ('S001452', 'B1-BL-04', 'BL', 4, false),
    ('S001453', 'B1-BL-05', 'BL', 5, false),
    ('S001454', 'B1-BL-06', 'BL', 6, false),
    ('S001455', 'B1-BL-07', 'BL', 7, false),
    ('S001456', 'B1-BL-08', 'BL', 8, false),
    ('S001457', 'B1-BL-09', 'BL', 9, false),
    ('S001458', 'B1-BL-10', 'BL', 10, false),
    ('S001459', 'B1-BL-11', 'BL', 11, false),
    ('S001460', 'B1-BL-12', 'BL', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BM (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001461', 'B1-BM-01', 'BM', 1, false),
    ('S001462', 'B1-BM-02', 'BM', 2, false),
    ('S001463', 'B1-BM-03', 'BM', 3, false),
    ('S001464', 'B1-BM-04', 'BM', 4, false),
    ('S001465', 'B1-BM-05', 'BM', 5, false),
    ('S001466', 'B1-BM-06', 'BM', 6, false),
    ('S001467', 'B1-BM-07', 'BM', 7, false),
    ('S001468', 'B1-BM-08', 'BM', 8, false),
    ('S001469', 'B1-BM-09', 'BM', 9, false),
    ('S001470', 'B1-BM-10', 'BM', 10, false),
    ('S001471', 'B1-BM-11', 'BM', 11, false),
    ('S001472', 'B1-BM-12', 'BM', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BN (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001473', 'B1-BN-01', 'BN', 1, false),
    ('S001474', 'B1-BN-02', 'BN', 2, false),
    ('S001475', 'B1-BN-03', 'BN', 3, false),
    ('S001476', 'B1-BN-04', 'BN', 4, false),
    ('S001477', 'B1-BN-05', 'BN', 5, false),
    ('S001478', 'B1-BN-06', 'BN', 6, false),
    ('S001479', 'B1-BN-07', 'BN', 7, false),
    ('S001480', 'B1-BN-08', 'BN', 8, false),
    ('S001481', 'B1-BN-09', 'BN', 9, false),
    ('S001482', 'B1-BN-10', 'BN', 10, false),
    ('S001483', 'B1-BN-11', 'BN', 11, false),
    ('S001484', 'B1-BN-12', 'BN', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BP (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001485', 'B1-BP-01', 'BP', 1, false),
    ('S001486', 'B1-BP-02', 'BP', 2, false),
    ('S001487', 'B1-BP-03', 'BP', 3, false),
    ('S001488', 'B1-BP-04', 'BP', 4, false),
    ('S001489', 'B1-BP-05', 'BP', 5, false),
    ('S001490', 'B1-BP-06', 'BP', 6, false),
    ('S001491', 'B1-BP-07', 'BP', 7, false),
    ('S001492', 'B1-BP-08', 'BP', 8, false),
    ('S001493', 'B1-BP-09', 'BP', 9, false),
    ('S001494', 'B1-BP-10', 'BP', 10, false),
    ('S001495', 'B1-BP-11', 'BP', 11, false),
    ('S001496', 'B1-BP-12', 'BP', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BQ (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001497', 'B1-BQ-01', 'BQ', 1, false),
    ('S001498', 'B1-BQ-02', 'BQ', 2, false),
    ('S001499', 'B1-BQ-03', 'BQ', 3, false),
    ('S001500', 'B1-BQ-04', 'BQ', 4, false),
    ('S001501', 'B1-BQ-05', 'BQ', 5, false),
    ('S001502', 'B1-BQ-06', 'BQ', 6, false),
    ('S001503', 'B1-BQ-07', 'BQ', 7, false),
    ('S001504', 'B1-BQ-08', 'BQ', 8, false),
    ('S001505', 'B1-BQ-09', 'BQ', 9, false),
    ('S001506', 'B1-BQ-10', 'BQ', 10, false),
    ('S001507', 'B1-BQ-11', 'BQ', 11, false),
    ('S001508', 'B1-BQ-12', 'BQ', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BR (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001509', 'B1-BR-01', 'BR', 1, false),
    ('S001510', 'B1-BR-02', 'BR', 2, false),
    ('S001511', 'B1-BR-03', 'BR', 3, false),
    ('S001512', 'B1-BR-04', 'BR', 4, false),
    ('S001513', 'B1-BR-05', 'BR', 5, false),
    ('S001514', 'B1-BR-06', 'BR', 6, false),
    ('S001515', 'B1-BR-07', 'BR', 7, false),
    ('S001516', 'B1-BR-08', 'BR', 8, false),
    ('S001517', 'B1-BR-09', 'BR', 9, false),
    ('S001518', 'B1-BR-10', 'BR', 10, false),
    ('S001519', 'B1-BR-11', 'BR', 11, false),
    ('S001520', 'B1-BR-12', 'BR', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BS (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001521', 'B1-BS-01', 'BS', 1, false),
    ('S001522', 'B1-BS-02', 'BS', 2, false),
    ('S001523', 'B1-BS-03', 'BS', 3, false),
    ('S001524', 'B1-BS-04', 'BS', 4, false),
    ('S001525', 'B1-BS-05', 'BS', 5, false),
    ('S001526', 'B1-BS-06', 'BS', 6, false),
    ('S001527', 'B1-BS-07', 'BS', 7, false),
    ('S001528', 'B1-BS-08', 'BS', 8, false),
    ('S001529', 'B1-BS-09', 'BS', 9, false),
    ('S001530', 'B1-BS-10', 'BS', 10, false),
    ('S001531', 'B1-BS-11', 'BS', 11, false),
    ('S001532', 'B1-BS-12', 'BS', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BT (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001533', 'B1-BT-01', 'BT', 1, false),
    ('S001534', 'B1-BT-02', 'BT', 2, false),
    ('S001535', 'B1-BT-03', 'BT', 3, false),
    ('S001536', 'B1-BT-04', 'BT', 4, false),
    ('S001537', 'B1-BT-05', 'BT', 5, false),
    ('S001538', 'B1-BT-06', 'BT', 6, false),
    ('S001539', 'B1-BT-07', 'BT', 7, false),
    ('S001540', 'B1-BT-08', 'BT', 8, false),
    ('S001541', 'B1-BT-09', 'BT', 9, false),
    ('S001542', 'B1-BT-10', 'BT', 10, false),
    ('S001543', 'B1-BT-11', 'BT', 11, false),
    ('S001544', 'B1-BT-12', 'BT', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BU (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001545', 'B1-BU-03', 'BU', 3, false),
    ('S001546', 'B1-BU-04', 'BU', 4, false),
    ('S001547', 'B1-BU-05', 'BU', 5, false),
    ('S001548', 'B1-BU-06', 'BU', 6, false),
    ('S001549', 'B1-BU-07', 'BU', 7, false),
    ('S001550', 'B1-BU-08', 'BU', 8, false),
    ('S001551', 'B1-BU-09', 'BU', 9, false),
    ('S001552', 'B1-BU-10', 'BU', 10, false),
    ('S001553', 'B1-BU-11', 'BU', 11, false),
    ('S001554', 'B1-BU-12', 'BU', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BV (10 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001555', 'B1-BV-03', 'BV', 3, false),
    ('S001556', 'B1-BV-04', 'BV', 4, false),
    ('S001557', 'B1-BV-05', 'BV', 5, false),
    ('S001558', 'B1-BV-06', 'BV', 6, false),
    ('S001559', 'B1-BV-07', 'BV', 7, false),
    ('S001560', 'B1-BV-08', 'BV', 8, false),
    ('S001561', 'B1-BV-09', 'BV', 9, false),
    ('S001562', 'B1-BV-10', 'BV', 10, false),
    ('S001563', 'B1-BV-11', 'BV', 11, false),
    ('S001564', 'B1-BV-12', 'BV', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BW (8 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001565', 'B1-BW-05', 'BW', 5, false),
    ('S001566', 'B1-BW-06', 'BW', 6, false),
    ('S001567', 'B1-BW-07', 'BW', 7, false),
    ('S001568', 'B1-BW-08', 'BW', 8, false),
    ('S001569', 'B1-BW-09', 'BW', 9, false),
    ('S001570', 'B1-BW-10', 'BW', 10, false),
    ('S001571', 'B1-BW-11', 'BW', 11, false),
    ('S001572', 'B1-BW-12', 'BW', 12, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B1'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);


-- ZONE B2 (492 seats)
-- Row BA (12 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001573', 'B2-BA-13', 'BA', 13, false),
    ('S001574', 'B2-BA-14', 'BA', 14, false),
    ('S001575', 'B2-BA-15', 'BA', 15, false),
    ('S001576', 'B2-BA-16', 'BA', 16, false),
    ('S001577', 'B2-BA-17', 'BA', 17, false),
    ('S001578', 'B2-BA-18', 'BA', 18, false),
    ('S001579', 'B2-BA-19', 'BA', 19, false),
    ('S001580', 'B2-BA-20', 'BA', 20, false),
    ('S001581', 'B2-BA-21', 'BA', 21, false),
    ('S001582', 'B2-BA-22', 'BA', 22, false),
    ('S001583', 'B2-BA-23', 'BA', 23, false),
    ('S001584', 'B2-BA-24', 'BA', 24, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BB (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001585', 'B2-BB-13', 'BB', 13, false),
    ('S001586', 'B2-BB-14', 'BB', 14, false),
    ('S001587', 'B2-BB-15', 'BB', 15, false),
    ('S001588', 'B2-BB-16', 'BB', 16, false),
    ('S001589', 'B2-BB-17', 'BB', 17, false),
    ('S001590', 'B2-BB-18', 'BB', 18, false),
    ('S001591', 'B2-BB-19', 'BB', 19, false),
    ('S001592', 'B2-BB-20', 'BB', 20, false),
    ('S001593', 'B2-BB-21', 'BB', 21, false),
    ('S001594', 'B2-BB-22', 'BB', 22, false),
    ('S001595', 'B2-BB-23', 'BB', 23, false),
    ('S001596', 'B2-BB-24', 'BB', 24, false),
    ('S001597', 'B2-BB-25', 'BB', 25, false),
    ('S001598', 'B2-BB-26', 'BB', 26, false),
    ('S001599', 'B2-BB-27', 'BB', 27, false),
    ('S001600', 'B2-BB-28', 'BB', 28, false),
    ('S001601', 'B2-BB-29', 'BB', 29, false),
    ('S001602', 'B2-BB-30', 'BB', 30, false),
    ('S001603', 'B2-BB-31', 'BB', 31, false),
    ('S001604', 'B2-BB-32', 'BB', 32, false),
    ('S001605', 'B2-BB-33', 'BB', 33, false),
    ('S001606', 'B2-BB-34', 'BB', 34, false),
    ('S001607', 'B2-BB-35', 'BB', 35, false),
    ('S001608', 'B2-BB-36', 'BB', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BC (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001609', 'B2-BC-13', 'BC', 13, false),
    ('S001610', 'B2-BC-14', 'BC', 14, false),
    ('S001611', 'B2-BC-15', 'BC', 15, false),
    ('S001612', 'B2-BC-16', 'BC', 16, false),
    ('S001613', 'B2-BC-17', 'BC', 17, false),
    ('S001614', 'B2-BC-18', 'BC', 18, false),
    ('S001615', 'B2-BC-19', 'BC', 19, false),
    ('S001616', 'B2-BC-20', 'BC', 20, false),
    ('S001617', 'B2-BC-21', 'BC', 21, false),
    ('S001618', 'B2-BC-22', 'BC', 22, false),
    ('S001619', 'B2-BC-23', 'BC', 23, false),
    ('S001620', 'B2-BC-24', 'BC', 24, false),
    ('S001621', 'B2-BC-25', 'BC', 25, false),
    ('S001622', 'B2-BC-26', 'BC', 26, false),
    ('S001623', 'B2-BC-27', 'BC', 27, false),
    ('S001624', 'B2-BC-28', 'BC', 28, false),
    ('S001625', 'B2-BC-29', 'BC', 29, false),
    ('S001626', 'B2-BC-30', 'BC', 30, false),
    ('S001627', 'B2-BC-31', 'BC', 31, false),
    ('S001628', 'B2-BC-32', 'BC', 32, false),
    ('S001629', 'B2-BC-33', 'BC', 33, false),
    ('S001630', 'B2-BC-34', 'BC', 34, false),
    ('S001631', 'B2-BC-35', 'BC', 35, false),
    ('S001632', 'B2-BC-36', 'BC', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BD (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001633', 'B2-BD-13', 'BD', 13, false),
    ('S001634', 'B2-BD-14', 'BD', 14, false),
    ('S001635', 'B2-BD-15', 'BD', 15, false),
    ('S001636', 'B2-BD-16', 'BD', 16, false),
    ('S001637', 'B2-BD-17', 'BD', 17, false),
    ('S001638', 'B2-BD-18', 'BD', 18, false),
    ('S001639', 'B2-BD-19', 'BD', 19, false),
    ('S001640', 'B2-BD-20', 'BD', 20, false),
    ('S001641', 'B2-BD-21', 'BD', 21, false),
    ('S001642', 'B2-BD-22', 'BD', 22, false),
    ('S001643', 'B2-BD-23', 'BD', 23, false),
    ('S001644', 'B2-BD-24', 'BD', 24, false),
    ('S001645', 'B2-BD-25', 'BD', 25, false),
    ('S001646', 'B2-BD-26', 'BD', 26, false),
    ('S001647', 'B2-BD-27', 'BD', 27, false),
    ('S001648', 'B2-BD-28', 'BD', 28, false),
    ('S001649', 'B2-BD-29', 'BD', 29, false),
    ('S001650', 'B2-BD-30', 'BD', 30, false),
    ('S001651', 'B2-BD-31', 'BD', 31, false),
    ('S001652', 'B2-BD-32', 'BD', 32, false),
    ('S001653', 'B2-BD-33', 'BD', 33, false),
    ('S001654', 'B2-BD-34', 'BD', 34, false),
    ('S001655', 'B2-BD-35', 'BD', 35, false),
    ('S001656', 'B2-BD-36', 'BD', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BE (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001657', 'B2-BE-13', 'BE', 13, false),
    ('S001658', 'B2-BE-14', 'BE', 14, false),
    ('S001659', 'B2-BE-15', 'BE', 15, false),
    ('S001660', 'B2-BE-16', 'BE', 16, false),
    ('S001661', 'B2-BE-17', 'BE', 17, false),
    ('S001662', 'B2-BE-18', 'BE', 18, false),
    ('S001663', 'B2-BE-19', 'BE', 19, false),
    ('S001664', 'B2-BE-20', 'BE', 20, false),
    ('S001665', 'B2-BE-21', 'BE', 21, false),
    ('S001666', 'B2-BE-22', 'BE', 22, false),
    ('S001667', 'B2-BE-23', 'BE', 23, false),
    ('S001668', 'B2-BE-24', 'BE', 24, false),
    ('S001669', 'B2-BE-25', 'BE', 25, false),
    ('S001670', 'B2-BE-26', 'BE', 26, false),
    ('S001671', 'B2-BE-27', 'BE', 27, false),
    ('S001672', 'B2-BE-28', 'BE', 28, false),
    ('S001673', 'B2-BE-29', 'BE', 29, false),
    ('S001674', 'B2-BE-30', 'BE', 30, false),
    ('S001675', 'B2-BE-31', 'BE', 31, false),
    ('S001676', 'B2-BE-32', 'BE', 32, false),
    ('S001677', 'B2-BE-33', 'BE', 33, false),
    ('S001678', 'B2-BE-34', 'BE', 34, false),
    ('S001679', 'B2-BE-35', 'BE', 35, false),
    ('S001680', 'B2-BE-36', 'BE', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BF (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001681', 'B2-BF-13', 'BF', 13, false),
    ('S001682', 'B2-BF-14', 'BF', 14, false),
    ('S001683', 'B2-BF-15', 'BF', 15, false),
    ('S001684', 'B2-BF-16', 'BF', 16, false),
    ('S001685', 'B2-BF-17', 'BF', 17, false),
    ('S001686', 'B2-BF-18', 'BF', 18, false),
    ('S001687', 'B2-BF-19', 'BF', 19, false),
    ('S001688', 'B2-BF-20', 'BF', 20, false),
    ('S001689', 'B2-BF-21', 'BF', 21, false),
    ('S001690', 'B2-BF-22', 'BF', 22, false),
    ('S001691', 'B2-BF-23', 'BF', 23, false),
    ('S001692', 'B2-BF-24', 'BF', 24, false),
    ('S001693', 'B2-BF-25', 'BF', 25, false),
    ('S001694', 'B2-BF-26', 'BF', 26, false),
    ('S001695', 'B2-BF-27', 'BF', 27, false),
    ('S001696', 'B2-BF-28', 'BF', 28, false),
    ('S001697', 'B2-BF-29', 'BF', 29, false),
    ('S001698', 'B2-BF-30', 'BF', 30, false),
    ('S001699', 'B2-BF-31', 'BF', 31, false),
    ('S001700', 'B2-BF-32', 'BF', 32, false),
    ('S001701', 'B2-BF-33', 'BF', 33, false),
    ('S001702', 'B2-BF-34', 'BF', 34, false),
    ('S001703', 'B2-BF-35', 'BF', 35, false),
    ('S001704', 'B2-BF-36', 'BF', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BG (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001705', 'B2-BG-13', 'BG', 13, false),
    ('S001706', 'B2-BG-14', 'BG', 14, false),
    ('S001707', 'B2-BG-15', 'BG', 15, false),
    ('S001708', 'B2-BG-16', 'BG', 16, false),
    ('S001709', 'B2-BG-17', 'BG', 17, false),
    ('S001710', 'B2-BG-18', 'BG', 18, false),
    ('S001711', 'B2-BG-19', 'BG', 19, false),
    ('S001712', 'B2-BG-20', 'BG', 20, false),
    ('S001713', 'B2-BG-21', 'BG', 21, false),
    ('S001714', 'B2-BG-22', 'BG', 22, false),
    ('S001715', 'B2-BG-23', 'BG', 23, false),
    ('S001716', 'B2-BG-24', 'BG', 24, false),
    ('S001717', 'B2-BG-25', 'BG', 25, false),
    ('S001718', 'B2-BG-26', 'BG', 26, false),
    ('S001719', 'B2-BG-27', 'BG', 27, false),
    ('S001720', 'B2-BG-28', 'BG', 28, false),
    ('S001721', 'B2-BG-29', 'BG', 29, false),
    ('S001722', 'B2-BG-30', 'BG', 30, false),
    ('S001723', 'B2-BG-31', 'BG', 31, false),
    ('S001724', 'B2-BG-32', 'BG', 32, false),
    ('S001725', 'B2-BG-33', 'BG', 33, false),
    ('S001726', 'B2-BG-34', 'BG', 34, false),
    ('S001727', 'B2-BG-35', 'BG', 35, false),
    ('S001728', 'B2-BG-36', 'BG', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BH (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001729', 'B2-BH-13', 'BH', 13, false),
    ('S001730', 'B2-BH-14', 'BH', 14, false),
    ('S001731', 'B2-BH-15', 'BH', 15, false),
    ('S001732', 'B2-BH-16', 'BH', 16, false),
    ('S001733', 'B2-BH-17', 'BH', 17, false),
    ('S001734', 'B2-BH-18', 'BH', 18, false),
    ('S001735', 'B2-BH-19', 'BH', 19, false),
    ('S001736', 'B2-BH-20', 'BH', 20, false),
    ('S001737', 'B2-BH-21', 'BH', 21, false),
    ('S001738', 'B2-BH-22', 'BH', 22, false),
    ('S001739', 'B2-BH-23', 'BH', 23, false),
    ('S001740', 'B2-BH-24', 'BH', 24, false),
    ('S001741', 'B2-BH-25', 'BH', 25, false),
    ('S001742', 'B2-BH-26', 'BH', 26, false),
    ('S001743', 'B2-BH-27', 'BH', 27, false),
    ('S001744', 'B2-BH-28', 'BH', 28, false),
    ('S001745', 'B2-BH-29', 'BH', 29, false),
    ('S001746', 'B2-BH-30', 'BH', 30, false),
    ('S001747', 'B2-BH-31', 'BH', 31, false),
    ('S001748', 'B2-BH-32', 'BH', 32, false),
    ('S001749', 'B2-BH-33', 'BH', 33, false),
    ('S001750', 'B2-BH-34', 'BH', 34, false),
    ('S001751', 'B2-BH-35', 'BH', 35, false),
    ('S001752', 'B2-BH-36', 'BH', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BJ (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001753', 'B2-BJ-13', 'BJ', 13, false),
    ('S001754', 'B2-BJ-14', 'BJ', 14, false),
    ('S001755', 'B2-BJ-15', 'BJ', 15, false),
    ('S001756', 'B2-BJ-16', 'BJ', 16, false),
    ('S001757', 'B2-BJ-17', 'BJ', 17, false),
    ('S001758', 'B2-BJ-18', 'BJ', 18, false),
    ('S001759', 'B2-BJ-19', 'BJ', 19, false),
    ('S001760', 'B2-BJ-20', 'BJ', 20, false),
    ('S001761', 'B2-BJ-21', 'BJ', 21, false),
    ('S001762', 'B2-BJ-22', 'BJ', 22, false),
    ('S001763', 'B2-BJ-23', 'BJ', 23, false),
    ('S001764', 'B2-BJ-24', 'BJ', 24, false),
    ('S001765', 'B2-BJ-25', 'BJ', 25, false),
    ('S001766', 'B2-BJ-26', 'BJ', 26, false),
    ('S001767', 'B2-BJ-27', 'BJ', 27, false),
    ('S001768', 'B2-BJ-28', 'BJ', 28, false),
    ('S001769', 'B2-BJ-29', 'BJ', 29, false),
    ('S001770', 'B2-BJ-30', 'BJ', 30, false),
    ('S001771', 'B2-BJ-31', 'BJ', 31, false),
    ('S001772', 'B2-BJ-32', 'BJ', 32, false),
    ('S001773', 'B2-BJ-33', 'BJ', 33, false),
    ('S001774', 'B2-BJ-34', 'BJ', 34, false),
    ('S001775', 'B2-BJ-35', 'BJ', 35, false),
    ('S001776', 'B2-BJ-36', 'BJ', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'
AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);

-- Row BK (24 seats)
INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)
SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked
FROM (
  VALUES
    ('S001777', 'B2-BK-13', 'BK', 13, false),
    ('S001778', 'B2-BK-14', 'BK', 14, false),
    ('S001779', 'B2-BK-15', 'BK', 15, false),
    ('S001780', 'B2-BK-16', 'BK', 16, false),
    ('S001781', 'B2-BK-17', 'BK', 17, false),
    ('S001782', 'B2-BK-18', 'BK', 18, false),
    ('S001783', 'B2-BK-19', 'BK', 19, false),
    ('S001784', 'B2-BK-20', 'BK', 20, false),
    ('S001785', 'B2-BK-21', 'BK', 21, false),
    ('S001786', 'B2-BK-22', 'BK', 22, false),
    ('S001787', 'B2-BK-23', 'BK', 23, false),
    ('S001788', 'B2-BK-24', 'BK', 24, false),
    ('S001789', 'B2-BK-25', 'BK', 25, false),
    ('S001790', 'B2-BK-26', 'BK', 26, false),
    ('S001791', 'B2-BK-27', 'BK', 27, false),
    ('S001792', 'B2-BK-28', 'BK', 28, false),
    ('S001793', 'B2-BK-29', 'BK', 29, false),
    ('S001794', 'B2-BK-30', 'BK', 30, false),
    ('S001795', 'B2-BK-31', 'BK', 31, false),
    ('S001796', 'B2-BK-32', 'BK', 32, false),
    ('S001797', 'B2-BK-33', 'BK', 33, false),
    ('S001798', 'B2-BK-34', 'BK', 34, false),
    ('S001799', 'B2-BK-35', 'BK', 35, false),
    ('S001800', 'B2-BK-36', 'BK', 36, false)
) AS v(id, code, row, number, is_booked)
CROSS JOIN zones z
WHERE z.name = 'ZONE B2'