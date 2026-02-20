-- Function to generate 10-digit access codes (2-digit prefix + 8-digit autorun number)
-- This function should be run in Supabase SQL Editor

-- First, create a function to generate the next code for a given tier prefix
CREATE OR REPLACE FUNCTION generate_access_code(tier_prefix VARCHAR(2))
RETURNS VARCHAR(10) AS $$
DECLARE
    next_number INTEGER;
    new_code VARCHAR(10);
BEGIN
    -- Get the highest number for this prefix
    SELECT COALESCE(MAX(CAST(SUBSTRING(code FROM 3) AS INTEGER)), 0) + 1
    INTO next_number
    FROM access_codes
    WHERE code LIKE tier_prefix || '%';
    
    -- Format as 10-digit code: prefix + 8-digit number with leading zeros
    new_code := tier_prefix || LPAD(next_number::TEXT, 8, '0');
    
    RETURN new_code;
END;
$$ LANGUAGE plpgsql;

-- Example usage to insert new access codes:
-- INSERT INTO access_codes (code, tier_id, is_used) 
-- VALUES (generate_access_code('PT'), 'platinum-tier-uuid', FALSE);

-- Batch insert example - Generate 10 codes for each tier:
-- Method 1: Auto-generate for all tiers (requires tiers table to have data)
-- DO $$
-- DECLARE
--     tier_record RECORD;
--     i INTEGER;
-- BEGIN
--     FOR tier_record IN SELECT id, code_prefix FROM tiers LOOP
--         FOR i IN 1..10 LOOP
--             INSERT INTO access_codes (code, tier_id, is_used)
--             VALUES (
--                 generate_access_code(tier_record.code_prefix),
--                 tier_record.id,
--                 FALSE
--             );
--         END LOOP;
--     END LOOP;
-- END $$;

-- Method 2: Manual insert for specific tier (replace tier_id with actual UUID)
-- Generate 10 codes for PLATINUM tier (PT prefix):
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT 
--     generate_access_code('PT'),
--     '11111111-1111-1111-1111-111111111111'::uuid,
--     FALSE
-- FROM generate_series(1, 10);

-- Generate codes for all 8 tiers manually:
-- PLATINUM (PT)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('PT'), '11111111-1111-1111-1111-111111111111'::uuid, FALSE
-- FROM generate_series(1, 10);

-- GOLD (GD)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('GD'), '22222222-2222-2222-2222-222222222222'::uuid, FALSE
-- FROM generate_series(1, 10);

-- PRESTIGE (PR)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('PR'), '33333333-3333-3333-3333-333333333333'::uuid, FALSE
-- FROM generate_series(1, 10);

-- VIP (VP)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('VP'), '44444444-4444-4444-4444-444444444444'::uuid, FALSE
-- FROM generate_series(1, 10);

-- SILVER (SV)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('SV'), '55555555-5555-5555-5555-555555555555'::uuid, FALSE
-- FROM generate_series(1, 10);

-- AGENCY (AG)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('AG'), '66666666-6666-6666-6666-666666666666'::uuid, FALSE
-- FROM generate_series(1, 10);

-- CLASSIC (CL)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('CL'), '77777777-7777-7777-7777-777777777777'::uuid, FALSE
-- FROM generate_series(1, 10);

-- OTHER (OT)
-- INSERT INTO access_codes (code, tier_id, is_used)
-- SELECT generate_access_code('OT'), '88888888-8888-8888-8888-888888888888'::uuid, FALSE
-- FROM generate_series(1, 10);
