-- Run this to check the data types of id columns in bookings and booking_seats tables

SELECT 
    table_name,
    column_name,
    data_type,
    udt_name
FROM information_schema.columns
WHERE table_name IN ('bookings', 'booking_seats', 'admin_users')
AND column_name = 'id'
ORDER BY table_name;
