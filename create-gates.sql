-- Create Gates for Check-In System

-- Step 1: Check if gates already exist
SELECT '========================================' as info;
SELECT 'STEP 1: Checking existing gates' as info;
SELECT '========================================' as info;

SELECT * FROM gates;

-- Step 2: Create gates if they don't exist
SELECT '========================================' as info;
SELECT 'STEP 2: Creating gates' as info;
SELECT '========================================' as info;

-- Delete existing gates (if any)
DELETE FROM gates;

-- Insert gates
INSERT INTO gates (code, name, description, is_active) VALUES
('GATE-A', 'Gate A - Main Entrance', 'ประตูหลัก สำหรับ Platinum และ Gold', true),
('GATE-B', 'Gate B - East Entrance', 'ประตูด้านตะวันออก สำหรับ Silver', true),
('GATE-C', 'Gate C - West Entrance', 'ประตูด้านตะวันตก สำหรับ Classic', true),
('GATE-VIP', 'Gate VIP', 'ประตู VIP สำหรับแขกพิเศษ', true);

-- Step 3: Show created gates
SELECT '========================================' as info;
SELECT 'STEP 3: Gates created successfully' as info;
SELECT '========================================' as info;

SELECT 
  id,
  code,
  name,
  description,
  is_active
FROM gates
ORDER BY code;

-- Step 4: Check admin users
SELECT '========================================' as info;
SELECT 'STEP 4: Checking admin users' as info;
SELECT '========================================' as info;

SELECT 
  id,
  username,
  full_name,
  gate_id,
  role,
  is_active
FROM admin_users;

-- Step 5: Assign Gate A to first admin user (if exists)
SELECT '========================================' as info;
SELECT 'STEP 5: Assigning gate to admin user' as info;
SELECT '========================================' as info;

UPDATE admin_users
SET gate_id = (SELECT id FROM gates WHERE code = 'GATE-A' LIMIT 1)
WHERE id = (SELECT id FROM admin_users LIMIT 1);

-- Show updated admin users
SELECT 
  au.id,
  au.username,
  au.full_name,
  au.gate_id,
  g.code as gate_code,
  g.name as gate_name
FROM admin_users au
LEFT JOIN gates g ON au.gate_id = g.id;

SELECT '========================================' as info;
SELECT '✅ Gates created and assigned!' as info;
SELECT '========================================' as info;

SELECT 'Next: Refresh browser and try check-in again' as instruction;
