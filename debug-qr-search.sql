-- Debug QR token search issue
-- RLS policies are correct but still cannot find the booking

-- Step 1: Check if the QR token exists in booking_seats
SELECT 
  id,
  booking_id,
  seat_id,
  first_name,
  last_name,
  qr_token,
  checked_in,
  created_at
FROM booking_seats
WHERE qr_token = 'AIA-927431';

-- Step 2: Check if there are any booking_seats at all
SELECT COUNT(*) as total_booking_seats
FROM booking_seats;

-- Step 3: Check if QR tokens exist (sample)
SELECT qr_token, first_name, last_name
FROM booking_seats
LIMIT 10;

-- Step 4: Check for case sensitivity or whitespace issues
SELECT 
  id,
  qr_token,
  LENGTH(qr_token) as token_length,
  first_name,
  last_name
FROM booking_seats
WHERE qr_token ILIKE '%927431%';

-- Step 5: Check if the booking exists
SELECT 
  b.id,
  b.email,
  b.phone,
  b.status,
  COUNT(bs.id) as seat_count
FROM bookings b
LEFT JOIN booking_seats bs ON b.id = bs.booking_id
GROUP BY b.id, b.email, b.phone, b.status
HAVING COUNT(bs.id) > 0
LIMIT 10;

-- Step 6: Test the full query that the app uses
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
  z.id as zone_id_full,
  z.name as zone_name,
  t.id as tier_id_full,
  t.name as tier_name,
  t.color as tier_color,
  t.price as tier_price
FROM booking_seats bs
LEFT JOIN bookings b ON bs.booking_id = b.id
LEFT JOIN seats s ON bs.seat_id = s.id
LEFT JOIN zones z ON s.zone_id = z.id
LEFT JOIN tiers t ON s.tier_id = t.id
WHERE bs.qr_token = 'AIA-927431';

-- Step 7: Check if there's a foreign key issue
SELECT 
  bs.id,
  bs.booking_id,
  bs.seat_id,
  bs.qr_token,
  b.id as booking_exists,
  s.id as seat_exists
FROM booking_seats bs
LEFT JOIN bookings b ON bs.booking_id = b.id
LEFT JOIN seats s ON bs.seat_id = s.id
WHERE bs.qr_token = 'AIA-927431';
