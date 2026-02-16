-- Fix admin swap not updating database
-- Problem: swap_seat function runs but booking_seats doesn't update

-- Step 1: Grant UPDATE permission on booking_seats to anon and authenticated
GRANT UPDATE ON booking_seats TO anon;
GRANT UPDATE ON booking_seats TO authenticated;

-- Step 2: Grant UPDATE permission on seats to anon and authenticated
GRANT UPDATE ON seats TO anon;
GRANT UPDATE ON seats TO authenticated;

-- Step 3: Grant INSERT permission on seat_swap_history
GRANT INSERT ON seat_swap_history TO anon;
GRANT INSERT ON seat_swap_history TO authenticated;

-- Step 4: Create or update RLS policy for UPDATE on booking_seats
DROP POLICY IF EXISTS "Allow UPDATE on booking_seats" ON booking_seats;

CREATE POLICY "Allow UPDATE on booking_seats"
ON booking_seats
FOR UPDATE
TO public
USING (true)
WITH CHECK (true);

-- Step 5: Create or update RLS policy for UPDATE on seats
DROP POLICY IF EXISTS "Allow UPDATE on seats" ON seats;

CREATE POLICY "Allow UPDATE on seats"
ON seats
FOR UPDATE
TO public
USING (true)
WITH CHECK (true);

-- Step 6: Create or update RLS policy for INSERT on seat_swap_history
DROP POLICY IF EXISTS "Allow INSERT on seat_swap_history" ON seat_swap_history;

CREATE POLICY "Allow INSERT on seat_swap_history"
ON seat_swap_history
FOR INSERT
TO public
WITH CHECK (true);

-- Step 7: Verify permissions
SELECT 
    grantee,
    table_name,
    privilege_type
FROM information_schema.role_table_grants
WHERE table_name IN ('booking_seats', 'seats', 'seat_swap_history')
AND grantee IN ('anon', 'authenticated')
AND privilege_type IN ('SELECT', 'UPDATE', 'INSERT')
ORDER BY table_name, grantee, privilege_type;

-- Step 8: Verify RLS policies
SELECT 
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    CASE 
        WHEN qual = 'true'::text THEN 'Allow all'
        ELSE qual
    END as using_condition,
    CASE 
        WHEN with_check = 'true'::text THEN 'Allow all'
        ELSE with_check
    END as check_condition
FROM pg_policies
WHERE tablename IN ('booking_seats', 'seats', 'seat_swap_history')
ORDER BY tablename, cmd, policyname;

-- Step 9: Test message
SELECT 'Permissions and policies updated successfully!' as status,
       'Admin swap should now update the database correctly' as message;
