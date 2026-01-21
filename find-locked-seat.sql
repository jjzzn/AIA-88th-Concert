-- Find which zone the locked seat belongs to

SELECT 
  s.id as seat_id,
  s.code as seat_code,
  s.row,
  s.number,
  z.id as zone_id,
  z.code as zone_code,
  z.name as zone_name,
  t.id as tier_id,
  t.name as tier_name,
  s.locked_by,
  s.locked_until,
  EXTRACT(EPOCH FROM (s.locked_until - NOW())) as seconds_remaining
FROM seats s
JOIN zones z ON s.zone_id = z.id
JOIN tiers t ON s.tier_id = t.id
WHERE s.id = 'SEAT-3F50L';

-- Also show all locked seats
SELECT '========================================' as separator;
SELECT 'ALL LOCKED SEATS' as section;
SELECT '========================================' as separator;

SELECT 
  s.id as seat_id,
  s.code as seat_code,
  z.code as zone_code,
  s.locked_by,
  s.locked_until
FROM seats s
JOIN zones z ON s.zone_id = z.id
WHERE s.locked_until IS NOT NULL
  AND s.locked_until > NOW()
ORDER BY s.locked_until DESC;
