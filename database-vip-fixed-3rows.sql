-- VIP Sample Data - แก้ไขให้ทุกห้องมี 3 แถว และเลขที่นั่งเรียงตามลำดับ
-- รันสคริปต์นี้เพื่อแก้ไขข้อมูลที่นั่ง

-- Drop existing data
DELETE FROM vip_booking_seats;
DELETE FROM vip_bookings;
DELETE FROM vip_seats;
DELETE FROM vip_rooms;

-- Insert VIP Rooms (10 ห้อง: Room 14-23) - แต่ละห้องมีจำนวนที่นั่งต่างกัน
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

-- สร้างที่นั่งสำหรับทุกห้อง (3 แถว แต่จำนวนที่นั่งต่อแถวแตกต่างกันตาม capacity)
DO $$
DECLARE
    room_rec RECORD;
    seats_per_row INTEGER;
    remaining_seats INTEGER;
    row_a_seats INTEGER;
    row_b_seats INTEGER;
    row_c_seats INTEGER;
    seat_num INTEGER;
BEGIN
    -- Loop through each room
    FOR room_rec IN SELECT id, room_number, capacity FROM vip_rooms ORDER BY room_number LOOP
        -- คำนวณจำนวนที่นั่งต่อแถว (แบ่งเท่าๆ กัน 3 แถว)
        seats_per_row := room_rec.capacity / 3;
        remaining_seats := room_rec.capacity % 3;
        
        -- แจกที่นั่งส่วนเกินให้แถวแรกๆ
        row_a_seats := seats_per_row + CASE WHEN remaining_seats >= 1 THEN 1 ELSE 0 END;
        row_b_seats := seats_per_row + CASE WHEN remaining_seats >= 2 THEN 1 ELSE 0 END;
        row_c_seats := seats_per_row;
        
        -- Row A
        FOR seat_num IN 1..row_a_seats LOOP
            INSERT INTO vip_seats (id, room_id, row, number, is_booked)
            VALUES (gen_random_uuid(), room_rec.id, 'A', seat_num, false);
        END LOOP;
        
        -- Row B
        FOR seat_num IN 1..row_b_seats LOOP
            INSERT INTO vip_seats (id, room_id, row, number, is_booked)
            VALUES (gen_random_uuid(), room_rec.id, 'B', seat_num, false);
        END LOOP;
        
        -- Row C
        FOR seat_num IN 1..row_c_seats LOOP
            INSERT INTO vip_seats (id, room_id, row, number, is_booked)
            VALUES (gen_random_uuid(), room_rec.id, 'C', seat_num, false);
        END LOOP;
        
        RAISE NOTICE 'Created % seats for Room % (A:%, B:%, C:%)', 
            room_rec.capacity, room_rec.room_number, row_a_seats, row_b_seats, row_c_seats;
    END LOOP;
END $$;

-- Verify the data
SELECT 'VIP Rooms Created' as info, COUNT(*) as count FROM vip_rooms;
SELECT 'VIP Seats Created' as info, COUNT(*) as count FROM vip_seats;

-- Show seats per room
SELECT 
    vr.room_number,
    vr.name,
    vr.capacity as expected,
    COUNT(vs.id) as actual_seats,
    COUNT(DISTINCT vs.row) as rows,
    CASE 
        WHEN COUNT(vs.id) = vr.capacity THEN '✓ OK'
        ELSE '✗ MISMATCH'
    END as status
FROM vip_rooms vr
LEFT JOIN vip_seats vs ON vs.room_id = vr.id
GROUP BY vr.room_number, vr.name, vr.capacity
ORDER BY vr.room_number;

-- Show sample seats for Room 22 to verify ordering
SELECT 
    'Room 22 Sample' as info,
    row,
    number,
    is_booked
FROM vip_seats
WHERE room_id = (SELECT id FROM vip_rooms WHERE room_number = 22)
ORDER BY row, number;
