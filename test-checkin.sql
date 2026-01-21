-- Test check-in system

-- Step 1: Check if there are any booking_seats with QR tokens
SELECT '========================================' as info;
SELECT 'STEP 1: Checking booking_seats with QR tokens' as info;
SELECT '========================================' as info;

SELECT 
  id,
  first_name,
  last_name,
  qr_token,
  checked_in,
  seat_id
FROM booking_seats
LIMIT 5;

-- Step 2: If no data, create a test booking
SELECT '========================================' as info;
SELECT 'STEP 2: QR Token format for testing' as info;
SELECT '========================================' as info;

SELECT 
  'Use this QR token to test:' as instruction,
  qr_token as qr_token_value,
  '{"qrToken":"' || qr_token || '"}' as json_format_for_scanner
FROM booking_seats
WHERE checked_in = false
LIMIT 1;

SELECT '========================================' as info;
SELECT 'Copy the json_format_for_scanner value' as instruction;
SELECT 'Paste it into the Check-In Scanner' as instruction;
SELECT '========================================' as info;
