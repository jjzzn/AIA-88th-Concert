-- Test swap_seat function to debug why admin swap doesn't update database

-- Step 1: Check current booking_seats data
SELECT 
    id,
    booking_id,
    seat_id,
    first_name,
    last_name,
    qr_token,
    swap_count,
    original_seat_id
FROM booking_seats
WHERE qr_token = 'AIA-927431';

-- Step 2: Check available seats to swap to
SELECT id, row, number, zone_id, tier_id, is_booked
FROM seats
WHERE tier_id = 'PT'  -- Same tier as current seat
AND is_booked = false
LIMIT 5;

-- Step 3: Get a real admin user ID
SELECT id, username, full_name
FROM admin_users
WHERE is_active = true
LIMIT 1;

-- Step 4: Test the swap_seat function with real data
-- Replace the values below with actual data from steps 1-3
-- Example:
-- SELECT * FROM swap_seat(
--     'BSEAT-Z0O93',  -- booking_seat_id from step 1
--     'S000005',       -- new_seat_id from step 2 (pick an available seat)
--     'ADM-XXXXX',     -- admin_user_id from step 3
--     'Test swap from admin portal',
--     'Testing database update',
--     '127.0.0.1'
-- );

-- Step 5: After running the swap, verify the update
-- SELECT 
--     id,
--     seat_id,  -- Should be the new seat
--     swap_count,  -- Should be incremented
--     original_seat_id  -- Should be set
-- FROM booking_seats
-- WHERE qr_token = 'AIA-927431';

-- Step 6: Check seat status
-- SELECT id, is_booked FROM seats WHERE id IN ('S000004', 'S000005');

-- Step 7: Check swap history
-- SELECT * FROM seat_swap_history ORDER BY created_at DESC LIMIT 3;

-- Step 8: Check if there are any triggers or policies blocking the update
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement
FROM information_schema.triggers
WHERE event_object_table = 'booking_seats';

-- Step 9: Check RLS policies on booking_seats
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE tablename = 'booking_seats';

-- Step 10: Check if UPDATE permission is granted
SELECT 
    grantee,
    table_name,
    privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'booking_seats'
AND privilege_type = 'UPDATE'
AND grantee IN ('anon', 'authenticated', 'postgres');
