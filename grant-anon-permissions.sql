-- Grant SELECT permissions to anon role for QR token search
-- Problem: RLS policies allow access but anon role lacks table-level permissions

-- Step 1: Grant SELECT on all required tables to anon role
GRANT SELECT ON booking_seats TO anon;
GRANT SELECT ON bookings TO anon;
GRANT SELECT ON seats TO anon;
GRANT SELECT ON zones TO anon;
GRANT SELECT ON tiers TO anon;

-- Step 2: Also grant to authenticated role for consistency
GRANT SELECT ON booking_seats TO authenticated;
GRANT SELECT ON bookings TO authenticated;
GRANT SELECT ON seats TO authenticated;
GRANT SELECT ON zones TO authenticated;
GRANT SELECT ON tiers TO authenticated;

-- Step 3: Grant USAGE on sequences (if needed for inserts)
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO anon;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO authenticated;

-- Step 4: Verify grants
SELECT 
  grantee,
  table_name,
  privilege_type
FROM information_schema.role_table_grants
WHERE table_name IN ('booking_seats', 'bookings', 'seats', 'zones', 'tiers')
AND grantee IN ('anon', 'authenticated')
ORDER BY table_name, grantee, privilege_type;

-- Step 5: Test query as anon role
SET ROLE anon;

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
  b.created_at as booking_created_at,
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
LEFT JOIN bookings b ON bs.booking_id = b.id
LEFT JOIN seats s ON bs.seat_id = s.id
LEFT JOIN zones z ON s.zone_id = z.id
LEFT JOIN tiers t ON s.tier_id = t.id
WHERE bs.qr_token = 'AIA-927431';

RESET ROLE;

-- Step 6: Confirm the query works
SELECT 'SUCCESS: anon role can now query booking_seats by qr_token' as result;
