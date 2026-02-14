-- VIP Rooms Setup for AIA 88th Concert
-- This script creates VIP rooms and their seats

-- Create VIP rooms table if not exists
CREATE TABLE IF NOT EXISTS vip_rooms (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    room_number INTEGER NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create VIP seats table if not exists
CREATE TABLE IF NOT EXISTS vip_seats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    room_id UUID NOT NULL REFERENCES vip_rooms(id) ON DELETE CASCADE,
    row VARCHAR(2) NOT NULL,
    number INTEGER NOT NULL,
    is_booked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(room_id, row, number)
);

-- Create VIP bookings table if not exists
CREATE TABLE IF NOT EXISTS vip_bookings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    room_id UUID NOT NULL REFERENCES vip_rooms(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create VIP booking seats table (attendee details)
CREATE TABLE IF NOT EXISTS vip_booking_seats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL REFERENCES vip_bookings(id) ON DELETE CASCADE,
    seat_id UUID NOT NULL REFERENCES vip_seats(id),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    qr_token VARCHAR(255) UNIQUE,
    checked_in BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Clear existing VIP data (if any)
DELETE FROM vip_booking_seats;
DELETE FROM vip_bookings;
DELETE FROM vip_seats;
DELETE FROM vip_rooms;

-- Insert VIP Rooms
INSERT INTO vip_rooms (room_number, name, capacity) VALUES
    (14, 'VIP Room 14', 18),
    (15, 'VIP Room 15', 25),
    (16, 'VIP Room 16', 25),
    (17, 'VIP Room 17', 25),
    (18, 'VIP Room 18', 24),
    (19, 'VIP Room 19', 36),
    (20, 'VIP Room 20', 18),
    (21, 'VIP Room 21', 18),
    (22, 'VIP Room 22', 18),
    (23, 'VIP Room 23', 18);

-- Insert VIP Seats for Room 14 (18 seats: 3 rows x 6 seats)
DO $$
DECLARE
    room_id UUID;
    rows TEXT[] := ARRAY['A', 'B', 'C'];
    row_letter TEXT;
    seat_num INTEGER;
BEGIN
    SELECT id INTO room_id FROM vip_rooms WHERE room_number = 14;
    FOREACH row_letter IN ARRAY rows LOOP
        FOR seat_num IN 1..6 LOOP
            INSERT INTO vip_seats (room_id, row, number, is_booked)
            VALUES (room_id, row_letter, seat_num, FALSE);
        END LOOP;
    END LOOP;
END $$;

-- Insert VIP Seats for Room 15, 16, 17 (25 seats each: 5 rows x 5 seats)
DO $$
DECLARE
    room_numbers INTEGER[] := ARRAY[15, 16, 17];
    room_num INTEGER;
    room_id UUID;
    rows TEXT[] := ARRAY['A', 'B', 'C', 'D', 'E'];
    row_letter TEXT;
    seat_num INTEGER;
BEGIN
    FOREACH room_num IN ARRAY room_numbers LOOP
        SELECT id INTO room_id FROM vip_rooms WHERE room_number = room_num;
        FOREACH row_letter IN ARRAY rows LOOP
            FOR seat_num IN 1..5 LOOP
                INSERT INTO vip_seats (room_id, row, number, is_booked)
                VALUES (room_id, row_letter, seat_num, FALSE);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

-- Insert VIP Seats for Room 18 (24 seats: 4 rows x 6 seats)
DO $$
DECLARE
    room_id UUID;
    rows TEXT[] := ARRAY['A', 'B', 'C', 'D'];
    row_letter TEXT;
    seat_num INTEGER;
BEGIN
    SELECT id INTO room_id FROM vip_rooms WHERE room_number = 18;
    FOREACH row_letter IN ARRAY rows LOOP
        FOR seat_num IN 1..6 LOOP
            INSERT INTO vip_seats (room_id, row, number, is_booked)
            VALUES (room_id, row_letter, seat_num, FALSE);
        END LOOP;
    END LOOP;
END $$;

-- Insert VIP Seats for Room 19 (36 seats: 6 rows x 6 seats)
DO $$
DECLARE
    room_id UUID;
    rows TEXT[] := ARRAY['A', 'B', 'C', 'D', 'E', 'F'];
    row_letter TEXT;
    seat_num INTEGER;
BEGIN
    SELECT id INTO room_id FROM vip_rooms WHERE room_number = 19;
    FOREACH row_letter IN ARRAY rows LOOP
        FOR seat_num IN 1..6 LOOP
            INSERT INTO vip_seats (room_id, row, number, is_booked)
            VALUES (room_id, row_letter, seat_num, FALSE);
        END LOOP;
    END LOOP;
END $$;

-- Insert VIP Seats for Rooms 20, 21, 22, 23 (18 seats each: 3 rows x 6 seats)
DO $$
DECLARE
    room_numbers INTEGER[] := ARRAY[20, 21, 22, 23];
    room_num INTEGER;
    room_id UUID;
    rows TEXT[] := ARRAY['A', 'B', 'C'];
    row_letter TEXT;
    seat_num INTEGER;
BEGIN
    FOREACH room_num IN ARRAY room_numbers LOOP
        SELECT id INTO room_id FROM vip_rooms WHERE room_number = room_num;
        FOREACH row_letter IN ARRAY rows LOOP
            FOR seat_num IN 1..6 LOOP
                INSERT INTO vip_seats (room_id, row, number, is_booked)
                VALUES (room_id, row_letter, seat_num, FALSE);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_vip_seats_room_id ON vip_seats(room_id);
CREATE INDEX IF NOT EXISTS idx_vip_seats_is_booked ON vip_seats(is_booked);
CREATE INDEX IF NOT EXISTS idx_vip_booking_seats_booking_id ON vip_booking_seats(booking_id);
CREATE INDEX IF NOT EXISTS idx_vip_booking_seats_seat_id ON vip_booking_seats(seat_id);
CREATE INDEX IF NOT EXISTS idx_vip_booking_seats_email ON vip_booking_seats(email);

-- Verification queries
SELECT 'VIP ROOMS' as info;
SELECT room_number, name, capacity, 
       (SELECT COUNT(*) FROM vip_seats WHERE room_id = vip_rooms.id) as actual_seats
FROM vip_rooms
ORDER BY room_number;

SELECT 'TOTAL VIP SEATS' as info;
SELECT COUNT(*) as total_vip_seats FROM vip_seats;
