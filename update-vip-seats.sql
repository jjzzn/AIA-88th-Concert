-- Clear existing VIP booking seats first (foreign key dependency)
DELETE FROM vip_booking_seats;

-- Clear existing VIP seats
DELETE FROM vip_seats;

-- Drop the foreign key constraint first
ALTER TABLE vip_booking_seats DROP CONSTRAINT IF EXISTS vip_booking_seats_seat_id_fkey;

-- Change vip_seats.id column type from UUID to VARCHAR
ALTER TABLE vip_seats ALTER COLUMN id TYPE VARCHAR(50);

-- Also update the foreign key column in vip_booking_seats
ALTER TABLE vip_booking_seats ALTER COLUMN seat_id TYPE VARCHAR(50);

-- Recreate the foreign key constraint with new types
ALTER TABLE vip_booking_seats 
ADD CONSTRAINT vip_booking_seats_seat_id_fkey 
FOREIGN KEY (seat_id) REFERENCES vip_seats(id) ON DELETE CASCADE;

-- Insert VIP seats with new ID format (V000001, V000002, etc.)
-- Total: 100 VIP seats across 10 rooms

-- Room 1: cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8 (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000001', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'A', 1, false, NOW()),
('V000002', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'A', 3, false, NOW()),
('V000003', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'A', 5, false, NOW()),
('V000004', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'A', 6, false, NOW()),
('V000005', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'B', 5, false, NOW()),
('V000006', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'B', 6, false, NOW()),
('V000007', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'C', 1, false, NOW()),
('V000008', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'C', 4, false, NOW()),
('V000009', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'C', 6, false, NOW()),
('V000010', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'D', 1, false, NOW()),
('V000011', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'D', 2, false, NOW()),
('V000012', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'D', 3, false, NOW()),
('V000013', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'D', 4, false, NOW()),
('V000014', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'E', 1, false, NOW()),
('V000015', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'E', 5, false, NOW()),
('V000016', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'E', 6, false, NOW()),
('V000017', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'F', 2, false, NOW()),
('V000018', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'F', 4, false, NOW()),
('V000019', 'cbfe7bfb-d91b-4fab-83d1-85c5afcbf1a8', 'F', 5, false, NOW());

-- Room 2: 8116e153-8bd2-46c7-91f1-7a102210598e (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000020', '8116e153-8bd2-46c7-91f1-7a102210598e', 'A', 2, false, NOW()),
('V000021', '8116e153-8bd2-46c7-91f1-7a102210598e', 'A', 4, false, NOW()),
('V000022', '8116e153-8bd2-46c7-91f1-7a102210598e', 'A', 5, false, NOW()),
('V000023', '8116e153-8bd2-46c7-91f1-7a102210598e', 'B', 1, false, NOW()),
('V000024', '8116e153-8bd2-46c7-91f1-7a102210598e', 'B', 3, false, NOW()),
('V000025', '8116e153-8bd2-46c7-91f1-7a102210598e', 'B', 5, false, NOW()),
('V000026', '8116e153-8bd2-46c7-91f1-7a102210598e', 'C', 1, false, NOW()),
('V000027', '8116e153-8bd2-46c7-91f1-7a102210598e', 'C', 6, false, NOW());

-- Room 3: 33731fea-c84b-45fe-bc16-adb9468b67ce (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000028', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'A', 3, false, NOW()),
('V000029', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'A', 4, false, NOW()),
('V000030', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'B', 3, false, NOW()),
('V000031', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'B', 5, false, NOW()),
('V000032', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'B', 6, false, NOW()),
('V000033', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'C', 3, false, NOW()),
('V000034', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'C', 5, false, NOW()),
('V000035', '33731fea-c84b-45fe-bc16-adb9468b67ce', 'C', 6, false, NOW());

-- Room 4: 15b80c30-543a-40be-b6f7-5196ce1849f6 (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000036', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'A', 3, false, NOW()),
('V000037', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'A', 4, false, NOW()),
('V000038', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'A', 5, false, NOW()),
('V000039', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'A', 6, false, NOW()),
('V000040', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'B', 2, false, NOW()),
('V000041', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'B', 4, false, NOW()),
('V000042', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'C', 1, false, NOW()),
('V000043', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'D', 1, false, NOW()),
('V000044', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'D', 2, false, NOW()),
('V000045', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'D', 3, false, NOW()),
('V000046', '15b80c30-543a-40be-b6f7-5196ce1849f6', 'D', 4, false, NOW());

-- Room 5: 90188789-0801-4e4d-bec2-77fed0fb4c0e (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000047', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'A', 2, false, NOW()),
('V000048', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'A', 3, false, NOW()),
('V000049', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'A', 6, false, NOW()),
('V000050', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'B', 2, false, NOW()),
('V000051', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'B', 5, false, NOW()),
('V000052', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'C', 1, false, NOW()),
('V000053', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'C', 3, false, NOW()),
('V000054', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'C', 4, false, NOW()),
('V000055', '90188789-0801-4e4d-bec2-77fed0fb4c0e', 'C', 5, false, NOW());

-- Room 6: a36d59d8-b537-4ad8-a5b8-0c42b5d65834 (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000056', 'a36d59d8-b537-4ad8-a5b8-0c42b5d65834', 'A', 3, false, NOW()),
('V000057', 'a36d59d8-b537-4ad8-a5b8-0c42b5d65834', 'A', 6, false, NOW()),
('V000058', 'a36d59d8-b537-4ad8-a5b8-0c42b5d65834', 'B', 3, false, NOW()),
('V000059', 'a36d59d8-b537-4ad8-a5b8-0c42b5d65834', 'B', 6, false, NOW()),
('V000060', 'a36d59d8-b537-4ad8-a5b8-0c42b5d65834', 'C', 1, false, NOW()),
('V000061', 'a36d59d8-b537-4ad8-a5b8-0c42b5d65834', 'C', 2, false, NOW());

-- Room 7: 719cd25a-65cb-4db6-90a3-6e06de3d1c20 (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000062', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'A', 2, false, NOW()),
('V000063', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'A', 3, false, NOW()),
('V000064', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'A', 6, false, NOW()),
('V000065', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'B', 1, false, NOW()),
('V000066', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'C', 2, false, NOW()),
('V000067', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'C', 3, false, NOW()),
('V000068', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'C', 4, false, NOW()),
('V000069', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'C', 5, false, NOW()),
('V000070', '719cd25a-65cb-4db6-90a3-6e06de3d1c20', 'C', 6, false, NOW());

-- Room 8: 6266bba3-7825-4735-a5c7-3eaacc96027f (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000071', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'A', 3, false, NOW()),
('V000072', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'A', 4, false, NOW()),
('V000073', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'B', 1, false, NOW()),
('V000074', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'B', 3, false, NOW()),
('V000075', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'C', 1, false, NOW()),
('V000076', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'C', 5, false, NOW()),
('V000077', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'D', 1, false, NOW()),
('V000078', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'D', 4, false, NOW()),
('V000079', '6266bba3-7825-4735-a5c7-3eaacc96027f', 'E', 1, false, NOW());

-- Room 9: c873efc3-19b0-42be-9062-2baae3162860 (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000080', 'c873efc3-19b0-42be-9062-2baae3162860', 'A', 1, false, NOW()),
('V000081', 'c873efc3-19b0-42be-9062-2baae3162860', 'A', 4, false, NOW()),
('V000082', 'c873efc3-19b0-42be-9062-2baae3162860', 'A', 5, false, NOW()),
('V000083', 'c873efc3-19b0-42be-9062-2baae3162860', 'B', 3, false, NOW()),
('V000084', 'c873efc3-19b0-42be-9062-2baae3162860', 'B', 4, false, NOW()),
('V000085', 'c873efc3-19b0-42be-9062-2baae3162860', 'D', 2, false, NOW()),
('V000086', 'c873efc3-19b0-42be-9062-2baae3162860', 'D', 3, false, NOW()),
('V000087', 'c873efc3-19b0-42be-9062-2baae3162860', 'D', 4, false, NOW()),
('V000088', 'c873efc3-19b0-42be-9062-2baae3162860', 'E', 2, false, NOW()),
('V000089', 'c873efc3-19b0-42be-9062-2baae3162860', 'E', 4, false, NOW()),
('V000090', 'c873efc3-19b0-42be-9062-2baae3162860', 'E', 5, false, NOW());

-- Room 10: d4d1ff39-36d1-4bf6-921e-27f1a64f4c80 (12 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked, created_at) VALUES
('V000091', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'A', 5, false, NOW()),
('V000092', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'B', 3, false, NOW()),
('V000093', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'B', 4, false, NOW()),
('V000094', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'B', 5, false, NOW()),
('V000095', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'C', 2, false, NOW()),
('V000096', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'C', 4, false, NOW()),
('V000097', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'C', 5, false, NOW()),
('V000098', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'D', 5, false, NOW()),
('V000099', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'E', 2, false, NOW()),
('V000100', 'd4d1ff39-36d1-4bf6-921e-27f1a64f4c80', 'E', 3, false, NOW());

-- Verify count
SELECT COUNT(*) as total_vip_seats FROM vip_seats;
