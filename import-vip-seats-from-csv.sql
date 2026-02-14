-- Import VIP Seats from CSV files
-- This script imports pre-existing VIP seat data with specific UUIDs

-- Clear existing VIP seats data
DELETE FROM vip_booking_seats;
DELETE FROM vip_bookings;
DELETE FROM vip_seats;

-- Note: You need to import the CSV files manually in Supabase
-- Go to: Table Editor > vip_seats > Import data via spreadsheet

-- Steps to import:
-- 1. Download all 3 CSV files:
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows.csv
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows%20%281%29.csv
--    - https://in2it-service.com/IN2IT/AIA/vip_seats_rows%20%282%29.csv

-- 2. In Supabase Dashboard:
--    - Go to Table Editor
--    - Select 'vip_seats' table
--    - Click 'Insert' > 'Import data via spreadsheet'
--    - Upload each CSV file one by one
--    - Map columns: id, room_id, row, number, is_booked, created_at

-- 3. Verify import:
SELECT 'Total VIP Seats Imported' as info, COUNT(*) as count FROM vip_seats;

SELECT 'Seats by Room' as info;
SELECT 
    vr.room_number,
    vr.name,
    COUNT(vs.id) as seat_count
FROM vip_rooms vr
LEFT JOIN vip_seats vs ON vs.room_id = vr.id
GROUP BY vr.room_number, vr.name
ORDER BY vr.room_number;

-- Alternative: If you want to import via SQL (requires downloading CSV first)
-- You can use COPY command in PostgreSQL:
-- COPY vip_seats(id, room_id, row, number, is_booked, created_at)
-- FROM '/path/to/vip_seats_rows.csv'
-- DELIMITER ','
-- CSV HEADER;
