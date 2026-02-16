-- Fix RLS policies for booking_seats table to allow QR token search
-- This enables the seat swap portal to search by QR token

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Allow public read access to booking_seats" ON booking_seats;
DROP POLICY IF EXISTS "Allow read access to booking_seats" ON booking_seats;
DROP POLICY IF EXISTS "Enable read access for all users" ON booking_seats;

-- Create a new policy that allows reading booking_seats by qr_token
-- This is needed for the seat swap portal to search by QR code
CREATE POLICY "Allow read booking_seats by qr_token"
ON booking_seats
FOR SELECT
USING (true);

-- Also ensure bookings table has proper read access
DROP POLICY IF EXISTS "Allow public read access to bookings" ON bookings;
DROP POLICY IF EXISTS "Allow read access to bookings" ON bookings;
DROP POLICY IF EXISTS "Enable read access for all users" ON bookings;

CREATE POLICY "Allow read bookings for seat swap"
ON bookings
FOR SELECT
USING (true);

-- Verify RLS is enabled
ALTER TABLE booking_seats ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings ENABLE ROW LEVEL SECURITY;

-- Check current policies
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
FROM pg_policies
WHERE tablename IN ('booking_seats', 'bookings')
ORDER BY tablename, policyname;
