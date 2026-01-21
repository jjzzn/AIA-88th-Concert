-- Remove price-related columns since tickets are free
-- Run this on existing database

-- Remove total_amount from bookings table
ALTER TABLE bookings DROP COLUMN IF EXISTS total_amount;

-- Remove price from tiers table (optional - keep for reference but not used)
-- ALTER TABLE tiers DROP COLUMN IF EXISTS price;
