-- Migration: Add user_type and agent information to bookings table
-- Run this script in Supabase SQL Editor

-- Add new columns to bookings table
ALTER TABLE bookings 
ADD COLUMN IF NOT EXISTS user_type VARCHAR(20) CHECK (user_type IN ('SELF', 'AGENT')),
ADD COLUMN IF NOT EXISTS agent_code VARCHAR(100),
ADD COLUMN IF NOT EXISTS agent_name VARCHAR(255);

-- Create index for faster queries on user_type
CREATE INDEX IF NOT EXISTS idx_bookings_user_type ON bookings(user_type);

-- Create index for agent_code for faster lookups
CREATE INDEX IF NOT EXISTS idx_bookings_agent_code ON bookings(agent_code);

-- Add comments to document the columns
COMMENT ON COLUMN bookings.user_type IS 'Type of user making the booking: SELF (using own privilege) or AGENT (booking on behalf of customer)';
COMMENT ON COLUMN bookings.agent_code IS 'Agent code/ID when user_type is AGENT';
COMMENT ON COLUMN bookings.agent_name IS 'Agent name when user_type is AGENT';
