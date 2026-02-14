-- VIP Booking System Setup - Using Existing CSV Data
-- This script creates tables to work with imported CSV seat data

-- Step 1: Create VIP rooms table (to map room_id from CSV)
CREATE TABLE IF NOT EXISTS vip_rooms (
    id UUID PRIMARY KEY,
    room_number INTEGER NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Step 2: Create VIP seats table (will be populated from CSV)
CREATE TABLE IF NOT EXISTS vip_seats (
    id UUID PRIMARY KEY,
    room_id UUID NOT NULL REFERENCES vip_rooms(id) ON DELETE CASCADE,
    row VARCHAR(2) NOT NULL,
    number INTEGER NOT NULL,
    is_booked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(room_id, row, number)
);

-- Step 3: Create VIP bookings table
CREATE TABLE IF NOT EXISTS vip_bookings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    room_id UUID NOT NULL REFERENCES vip_rooms(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Step 4: Create VIP booking seats table (attendee details)
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

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_vip_seats_room_id ON vip_seats(room_id);
CREATE INDEX IF NOT EXISTS idx_vip_seats_is_booked ON vip_seats(is_booked);
CREATE INDEX IF NOT EXISTS idx_vip_booking_seats_booking_id ON vip_booking_seats(booking_id);
CREATE INDEX IF NOT EXISTS idx_vip_booking_seats_seat_id ON vip_booking_seats(seat_id);
CREATE INDEX IF NOT EXISTS idx_vip_booking_seats_email ON vip_booking_seats(email);

-- ========================================
-- IMPORTANT: MANUAL STEPS REQUIRED
-- ========================================

-- After running this script, you need to:

-- 1. Download CSV files:
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows.csv
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows%20%281%29.csv
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows%20%282%29.csv

-- 2. First, extract unique room_ids from CSV and insert into vip_rooms:
--    You'll need to identify the room_ids from CSV and map them to room numbers 14-23
--    Then insert them manually or via the next step

-- 3. Import CSV data into vip_seats table via Supabase Dashboard:
--    - Go to Table Editor > vip_seats
--    - Click Insert > Import data via spreadsheet
--    - Upload each CSV file
--    - Map columns: id, room_id, row, number, is_booked, created_at

-- 4. After import, update vip_rooms with correct room numbers and names:
--    Run the mapping script below after you identify which room_id corresponds to which room number

-- Verification queries (run after import):
SELECT 'Total VIP Seats' as info, COUNT(*) as count FROM vip_seats;
SELECT 'Total VIP Rooms' as info, COUNT(*) as count FROM vip_rooms;

SELECT 'Seats by Room' as info;
SELECT 
    vr.room_number,
    vr.name,
    COUNT(vs.id) as seat_count
FROM vip_rooms vr
LEFT JOIN vip_seats vs ON vs.room_id = vr.id
GROUP BY vr.room_number, vr.name
ORDER BY vr.room_number;
