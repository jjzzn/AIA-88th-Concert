-- VIP Sample Data - สร้างข้อมูลตัวอย่างเพื่อทดสอบระบบ
-- รันสคริปต์นี้ถ้ายังไม่มีข้อมูล CSV

-- Drop existing data
DELETE FROM vip_booking_seats;
DELETE FROM vip_bookings;
DELETE FROM vip_seats;
DELETE FROM vip_rooms;

-- Insert VIP Rooms (10 ห้อง: Room 14-23)
INSERT INTO vip_rooms (id, room_number, name, capacity) VALUES
    (gen_random_uuid(), 14, 'VIP Room 14', 18),
    (gen_random_uuid(), 15, 'VIP Room 15', 25),
    (gen_random_uuid(), 16, 'VIP Room 16', 25),
    (gen_random_uuid(), 17, 'VIP Room 17', 25),
    (gen_random_uuid(), 18, 'VIP Room 18', 24),
    (gen_random_uuid(), 19, 'VIP Room 19', 36),
    (gen_random_uuid(), 20, 'VIP Room 20', 18),
    (gen_random_uuid(), 21, 'VIP Room 21', 18),
    (gen_random_uuid(), 22, 'VIP Room 22', 18),
    (gen_random_uuid(), 23, 'VIP Room 23', 18);

-- Insert VIP Seats for Room 14 (18 seats: 3 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 14),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Insert VIP Seats for Room 15 (25 seats: 5 rows x 5 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 15),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'D' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'E' as row_letter, generate_series(1, 5) as seat_num
) seats;

-- Insert VIP Seats for Room 16 (25 seats: 5 rows x 5 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 16),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'D' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'E' as row_letter, generate_series(1, 5) as seat_num
) seats;

-- Insert VIP Seats for Room 17 (25 seats: 5 rows x 5 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 17),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'D' as row_letter, generate_series(1, 5) as seat_num
    UNION ALL
    SELECT 'E' as row_letter, generate_series(1, 5) as seat_num
) seats;

-- Insert VIP Seats for Room 18 (24 seats: 4 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 18),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'D' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Insert VIP Seats for Room 19 (36 seats: 6 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 19),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'D' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'E' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'F' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Insert VIP Seats for Room 20 (18 seats: 3 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 20),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Insert VIP Seats for Room 21 (18 seats: 3 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 21),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Insert VIP Seats for Room 22 (18 seats: 3 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 22),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Insert VIP Seats for Room 23 (18 seats: 3 rows x 6 seats)
INSERT INTO vip_seats (id, room_id, row, number, is_booked)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM vip_rooms WHERE room_number = 23),
    row_letter,
    seat_num,
    false
FROM (
    SELECT 'A' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'B' as row_letter, generate_series(1, 6) as seat_num
    UNION ALL
    SELECT 'C' as row_letter, generate_series(1, 6) as seat_num
) seats;

-- Verify the data
SELECT 'VIP Rooms Created' as info, COUNT(*) as count FROM vip_rooms;
SELECT 'VIP Seats Created' as info, COUNT(*) as count FROM vip_seats;

SELECT 
    vr.room_number,
    vr.name,
    vr.capacity as expected,
    COUNT(vs.id) as actual_seats
FROM vip_rooms vr
LEFT JOIN vip_seats vs ON vs.room_id = vr.id
GROUP BY vr.room_number, vr.name, vr.capacity
ORDER BY vr.room_number;
