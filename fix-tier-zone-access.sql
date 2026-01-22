-- Fix tier zone access according to requirements
-- AGENCY: Can book Zone A (A1-A2) and Zone B (B1-B3)
-- PRESTIGE: Can book Zone B (B1-B3)
-- OTHER: Can book Zone B (B1-B3)
-- VIP: Needs 20 special VIP-only seats

-- Step 1: Check current zone structure
SELECT '========================================' as info;
SELECT 'STEP 1: Current Zones' as info;
SELECT '========================================' as info;

SELECT 
  z.id,
  z.name as zone_name,
  t.name as tier_name,
  t.id as tier_id,
  z.capacity,
  COUNT(s.id) as seat_count
FROM zones z
LEFT JOIN tiers t ON z.tier_id = t.id
LEFT JOIN seats s ON z.id = s.zone_id
GROUP BY z.id, z.name, t.name, t.id, z.capacity
ORDER BY t.name, z.name;

-- Step 2: Create VIP Zone with 20 seats
SELECT '========================================' as info;
SELECT 'STEP 2: Creating VIP Zone' as info;
SELECT '========================================' as info;

-- Create VIP zone
INSERT INTO zones (name, tier_id, capacity, code)
SELECT 
  'ZONE VIP',
  'VP',
  20,
  'VIP-01'
WHERE NOT EXISTS (
  SELECT 1 FROM zones WHERE code = 'VIP-01'
);

-- Get the VIP zone ID
DO $$
DECLARE
  vip_zone_id VARCHAR(20);
  vip_tier_id VARCHAR(2) := 'VP';
BEGIN
  -- Get VIP zone ID
  SELECT id INTO vip_zone_id
  FROM zones
  WHERE code = 'VIP-01';

  -- Create 20 VIP seats if they don't exist
  IF vip_zone_id IS NOT NULL THEN
    -- Create seats in 2 rows (A and B), 10 seats each
    FOR i IN 1..10 LOOP
      INSERT INTO seats (code, row, number, tier_id, zone_id, is_booked)
      SELECT 
        'VIP-A-' || LPAD(i::TEXT, 2, '0'),
        'A',
        i,
        vip_tier_id,
        vip_zone_id,
        FALSE
      WHERE NOT EXISTS (
        SELECT 1 FROM seats WHERE code = 'VIP-A-' || LPAD(i::TEXT, 2, '0')
      );
    END LOOP;

    FOR i IN 1..10 LOOP
      INSERT INTO seats (code, row, number, tier_id, zone_id, is_booked)
      SELECT 
        'VIP-B-' || LPAD(i::TEXT, 2, '0'),
        'B',
        i,
        vip_tier_id,
        vip_zone_id,
        FALSE
      WHERE NOT EXISTS (
        SELECT 1 FROM seats WHERE code = 'VIP-B-' || LPAD(i::TEXT, 2, '0')
      );
    END LOOP;
  END IF;
END $$;

-- Step 3: Verify VIP zone and seats
SELECT '========================================' as info;
SELECT 'STEP 3: Verifying VIP Zone' as info;
SELECT '========================================' as info;

SELECT 
  z.name as zone_name,
  z.code as zone_code,
  COUNT(s.id) as seat_count,
  STRING_AGG(DISTINCT s.row, ', ' ORDER BY s.row) as rows
FROM zones z
LEFT JOIN seats s ON z.id = s.zone_id
WHERE z.code = 'VIP-01'
GROUP BY z.id, z.name, z.code;

-- Step 4: Summary of zone access per tier
SELECT '========================================' as info;
SELECT 'STEP 4: Zone Access Summary' as info;
SELECT '========================================' as info;

SELECT 
  'PLATINUM (PT)' as tier,
  'Can book: ZONE A1, ZONE A2' as zone_access
UNION ALL
SELECT 
  'GOLD (GD)' as tier,
  'Can book: ZONE B1, ZONE B2, ZONE B3' as zone_access
UNION ALL
SELECT 
  'SILVER (SV)' as tier,
  'Can book: ZONE D1, ZONE D2' as zone_access
UNION ALL
SELECT 
  'CLASSIC (CL)' as tier,
  'Can book: ZONE C1, ZONE C2' as zone_access
UNION ALL
SELECT 
  'AGENCY (AG)' as tier,
  'Can book: ZONE A1, ZONE A2, ZONE B1, ZONE B2, ZONE B3' as zone_access
UNION ALL
SELECT 
  'PRESTIGE (PR)' as tier,
  'Can book: ZONE B1, ZONE B2, ZONE B3' as zone_access
UNION ALL
SELECT 
  'OTHER (OT)' as tier,
  'Can book: ZONE B1, ZONE B2, ZONE B3' as zone_access
UNION ALL
SELECT 
  'VIP (VP)' as tier,
  'Can book: ZONE VIP (20 exclusive seats)' as zone_access;

SELECT '========================================' as info;
SELECT '✅ VIP zone created!' as info;
SELECT '========================================' as info;

SELECT 'Note: AGENCY, PRESTIGE, and OTHER tiers will access existing zones' as note;
SELECT 'Frontend needs to filter zones based on tier access rules' as note;
