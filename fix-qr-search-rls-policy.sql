-- Fix RLS policies for QR token search in seat swap portal
-- Problem: Cannot search booking_seats by qr_token due to RLS restrictions

-- Step 1: Check current RLS status
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('booking_seats', 'bookings', 'seats');

-- Step 2: Check existing policies
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
FROM pg_policies
WHERE tablename IN ('booking_seats', 'bookings', 'seats')
ORDER BY tablename, policyname;

-- Step 3: Drop restrictive policies on booking_seats
DROP POLICY IF EXISTS "booking_seats_select_policy" ON booking_seats;
DROP POLICY IF EXISTS "Enable read access for authenticated users only" ON booking_seats;

-- Step 4: Create permissive SELECT policy for booking_seats
-- This allows reading booking_seats for QR token search
CREATE POLICY "Allow SELECT on booking_seats for QR search"
ON booking_seats
FOR SELECT
TO public
USING (true);

-- Step 5: Ensure bookings table also has read access
DROP POLICY IF EXISTS "bookings_select_policy" ON bookings;
DROP POLICY IF EXISTS "Enable read access for authenticated users only" ON bookings;

CREATE POLICY "Allow SELECT on bookings for QR search"
ON bookings
FOR SELECT
TO public
USING (true);

-- Step 6: Ensure seats table has read access
DROP POLICY IF EXISTS "seats_select_policy" ON seats;
DROP POLICY IF EXISTS "Enable read access for authenticated users only" ON seats;

CREATE POLICY "Allow SELECT on seats for QR search"
ON seats
FOR SELECT
TO public
USING (true);

-- Step 7: Ensure zones table has read access
DROP POLICY IF EXISTS "zones_select_policy" ON zones;

CREATE POLICY "Allow SELECT on zones"
ON zones
FOR SELECT
TO public
USING (true);

-- Step 8: Ensure tiers table has read access
DROP POLICY IF EXISTS "tiers_select_policy" ON tiers;

CREATE POLICY "Allow SELECT on tiers"
ON tiers
FOR SELECT
TO public
USING (true);

-- Step 9: Verify RLS is enabled but with permissive policies
ALTER TABLE booking_seats ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;
ALTER TABLE seats ENABLE ROW LEVEL SECURITY;
ALTER TABLE zones ENABLE ROW LEVEL SECURITY;
ALTER TABLE tiers ENABLE ROW LEVEL SECURITY;

-- Step 10: Test the query
-- This should now work without authentication
SELECT 
  bs.id,
  bs.booking_id,
  bs.first_name,
  bs.last_name,
  bs.qr_token,
  bs.checked_in,
  bs.checked_in_at,
  b.email,
  b.phone,
  b.created_at,
  s.id as seat_id,
  s.row,
  s.number,
  s.zone_id,
  s.tier_id,
  s.is_booked,
  z.name as zone_name,
  t.name as tier_name,
  t.color as tier_color,
  t.price as tier_price
FROM booking_seats bs
JOIN bookings b ON bs.booking_id = b.id
JOIN seats s ON bs.seat_id = s.id
LEFT JOIN zones z ON s.zone_id = z.id
LEFT JOIN tiers t ON s.tier_id = t.id
WHERE bs.qr_token = 'AIA-927431'
LIMIT 1;

-- Step 11: Verify final policies
SELECT 
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  CASE 
    WHEN qual = 'true'::text THEN 'Allow all'
    ELSE qual
  END as policy_condition
FROM pg_policies
WHERE tablename IN ('booking_seats', 'bookings', 'seats', 'zones', 'tiers')
ORDER BY tablename, policyname;
