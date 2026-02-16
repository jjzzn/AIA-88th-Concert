-- Test if anon role can access booking_seats
-- This simulates what the Supabase client does

-- Step 1: Check current role
SELECT current_user, current_role;

-- Step 2: Test as anon role (simulating Supabase client)
SET ROLE anon;

-- Step 3: Try to query booking_seats as anon
SELECT 
  id,
  booking_id,
  first_name,
  last_name,
  qr_token
FROM booking_seats
WHERE qr_token = 'AIA-927431';

-- Step 4: Check what policies apply to anon
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual
FROM pg_policies
WHERE tablename = 'booking_seats'
AND 'anon' = ANY(roles) OR 'public' = ANY(roles);

-- Step 5: Reset role
RESET ROLE;

-- Step 6: Grant explicit SELECT permission to anon role
GRANT SELECT ON booking_seats TO anon;
GRANT SELECT ON bookings TO anon;
GRANT SELECT ON seats TO anon;
GRANT SELECT ON zones TO anon;
GRANT SELECT ON tiers TO anon;

-- Step 7: Test again as anon
SET ROLE anon;

SELECT 
  bs.id,
  bs.booking_id,
  bs.first_name,
  bs.last_name,
  bs.qr_token,
  b.email,
  b.phone
FROM booking_seats bs
LEFT JOIN bookings b ON bs.booking_id = b.id
WHERE bs.qr_token = 'AIA-927431';

RESET ROLE;

-- Step 8: Verify grants
SELECT 
  grantee,
  table_schema,
  table_name,
  privilege_type
FROM information_schema.role_table_grants
WHERE table_name IN ('booking_seats', 'bookings', 'seats', 'zones', 'tiers')
AND grantee IN ('anon', 'authenticated', 'public')
ORDER BY table_name, grantee;
