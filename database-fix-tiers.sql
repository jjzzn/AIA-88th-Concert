-- Fix Tier Data - Remove duplicates and correct mappings
-- Run this to update existing database

-- Update tier colors to be correct
UPDATE tiers SET color = '#8B00FF' WHERE code_prefix = 'VP'; -- VIP = Purple
UPDATE tiers SET color = '#C0C0C0' WHERE code_prefix = 'SV'; -- SILVER = Silver

-- Verify tiers are correct
SELECT code_prefix, name, level, price, color 
FROM tiers 
ORDER BY price DESC;

-- Expected result:
-- PT = PLATINUM
-- GD = GOLD  
-- PR = PRESTIGE
-- VP = VIP
-- SV = SILVER
-- AG = AGENCY
-- CL = CLASSIC
-- OT = OTHER
