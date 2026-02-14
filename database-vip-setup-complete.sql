-- VIP Booking System - Complete Setup with CSV Import
-- This creates tables and prepares for CSV data import

-- Drop existing VIP tables if they exist
DROP TABLE IF EXISTS vip_booking_seats CASCADE;
DROP TABLE IF EXISTS vip_bookings CASCADE;
DROP TABLE IF EXISTS vip_seats CASCADE;
DROP TABLE IF EXISTS vip_rooms CASCADE;

-- Create VIP rooms table
CREATE TABLE vip_rooms (
    id UUID PRIMARY KEY,
    room_number INTEGER NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create VIP seats table
CREATE TABLE vip_seats (
    id UUID PRIMARY KEY,
    room_id UUID NOT NULL REFERENCES vip_rooms(id) ON DELETE CASCADE,
    row VARCHAR(2) NOT NULL,
    number INTEGER NOT NULL,
    is_booked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(room_id, row, number)
);

-- Create VIP bookings table
CREATE TABLE vip_bookings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    room_id UUID NOT NULL REFERENCES vip_rooms(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create VIP booking seats table (attendee details)
CREATE TABLE vip_booking_seats (
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

-- Insert VIP Rooms (based on CSV analysis, these are the room_ids found)
-- You need to map these UUIDs to room numbers after analyzing the CSV
-- For now, inserting placeholder rooms - UPDATE THESE AFTER CSV IMPORT

INSERT INTO vip_rooms (id, room_number, name, capacity) VALUES
    ('68ee839c-959c-4946-b614-988bab102cfc', 14, 'VIP Room 14', 18),
    ('9e7eec78-910e-43d9-95fa-c17a5f7e9ac4', 15, 'VIP Room 15', 25),
    ('fa5d86be-7ecf-40be-80b8-8a5ee659953e', 16, 'VIP Room 16', 25),
    ('002355ad-cc2d-4386-85db-9fa9dfd9f06d', 17, 'VIP Room 17', 25),
    ('82d4fa7d-26ea-4a3c-84ba-bc89b7296f08', 18, 'VIP Room 18', 24),
    ('daf66cdc-058d-4afa-929e-f9ed7636656e', 19, 'VIP Room 19', 36),
    ('cd15be82-d0be-4848-a843-111f2ff5a9f2', 20, 'VIP Room 20', 18),
    ('cf488864-b97b-4d0c-8d12-0897d01ec89c', 21, 'VIP Room 21', 18),
    ('92df77cc-7f30-4894-9fed-92bce7ebb23e', 22, 'VIP Room 22', 18),
    ('235f8c79-cc26-4165-9e0f-9b6c3822db17', 23, 'VIP Room 23', 18);

-- Create indexes
CREATE INDEX idx_vip_seats_room_id ON vip_seats(room_id);
CREATE INDEX idx_vip_seats_is_booked ON vip_seats(is_booked);
CREATE INDEX idx_vip_booking_seats_booking_id ON vip_booking_seats(booking_id);
CREATE INDEX idx_vip_booking_seats_seat_id ON vip_booking_seats(seat_id);
CREATE INDEX idx_vip_booking_seats_email ON vip_booking_seats(email);

-- ========================================
-- NEXT STEPS - IMPORT CSV DATA
-- ========================================

-- 1. Download the 3 CSV files from:
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows.csv
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows%20%281%29.csv
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows%20%282%29.csv

-- 2. In Supabase Dashboard:
--    - Go to Table Editor
--    - Select 'vip_seats' table
--    - Click 'Insert' > 'Import data via spreadsheet'
--    - Upload each CSV file (one at a time)
--    - Map columns: id, room_id, row, number, is_booked, created_at

-- 3. Verify the import:
SELECT 'Total VIP Rooms' as info, COUNT(*) as count FROM vip_rooms;
SELECT 'Total VIP Seats' as info, COUNT(*) as count FROM vip_seats;

SELECT 'Seats per Room' as info;
SELECT 
    vr.room_number,
    vr.name,
    vr.capacity as expected_capacity,
    COUNT(vs.id) as actual_seats
FROM vip_rooms vr
LEFT JOIN vip_seats vs ON vs.room_id = vr.id
GROUP BY vr.room_number, vr.name, vr.capacity
ORDER BY vr.room_number;
