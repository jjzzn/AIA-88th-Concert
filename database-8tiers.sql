-- AIA Concert Ticket Booking System - 8 Tiers with New Code Format
-- Code Format: XX-XXXXXX (8 characters total)
-- Run this entire script in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop existing tables if they exist (for clean setup)
DROP TABLE IF EXISTS booking_codes CASCADE;
DROP TABLE IF EXISTS booking_seats CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS access_codes CASCADE;
DROP TABLE IF EXISTS seats CASCADE;
DROP TABLE IF EXISTS zones CASCADE;
DROP TABLE IF EXISTS tiers CASCADE;

-- Tiers Table (8 Tiers)
CREATE TABLE tiers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code_prefix VARCHAR(2) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    level VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Zones Table
CREATE TABLE zones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    tier_id UUID NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Seats Table
CREATE TABLE seats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    row VARCHAR(10) NOT NULL,
    number INTEGER NOT NULL,
    tier_id UUID NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    zone_id UUID NOT NULL REFERENCES zones(id) ON DELETE CASCADE,
    is_booked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(zone_id, row, number)
);

-- Access Codes Table (New Format: XX-XXXXXX)
CREATE TABLE access_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(9) UNIQUE NOT NULL,
    tier_id UUID NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    is_used BOOLEAN DEFAULT FALSE,
    used_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Bookings Table
CREATE TABLE bookings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'confirmed',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Booking Seats Table
CREATE TABLE booking_seats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    seat_id UUID NOT NULL REFERENCES seats(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(booking_id, seat_id)
);

-- Booking Codes Table
CREATE TABLE booking_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    code_id UUID NOT NULL REFERENCES access_codes(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(booking_id, code_id)
);

-- Create Indexes
CREATE INDEX idx_seats_tier_id ON seats(tier_id);
CREATE INDEX idx_seats_zone_id ON seats(zone_id);
CREATE INDEX idx_seats_is_booked ON seats(is_booked);
CREATE INDEX idx_access_codes_code ON access_codes(code);
CREATE INDEX idx_access_codes_tier_id ON access_codes(tier_id);
CREATE INDEX idx_access_codes_is_used ON access_codes(is_used);
CREATE INDEX idx_bookings_email ON bookings(email);
CREATE INDEX idx_booking_seats_booking_id ON booking_seats(booking_id);
CREATE INDEX idx_booking_codes_booking_id ON booking_codes(booking_id);
CREATE INDEX idx_tiers_code_prefix ON tiers(code_prefix);

-- ============================================================================
-- INSERT DATA - 8 TIERS
-- ============================================================================

-- Insert 8 Tiers
INSERT INTO tiers (id, code_prefix, name, level, price, color, description) VALUES
    ('11111111-1111-1111-1111-111111111111', 'PT', 'PLATINUM', 'ELITE PLUS', 8500.00, '#E5E4E2', 'Platinum Elite - Front row with exclusive VIP lounge access'),
    ('22222222-2222-2222-2222-222222222222', 'GD', 'GOLD', 'PREMIUM PLUS', 6500.00, '#FFD700', 'Gold Premium - Premium seating with excellent stage view'),
    ('33333333-3333-3333-3333-333333333333', 'VP', 'VIP', 'VIP', 5500.00, '#C0C0C0', 'VIP Section - Special access with great acoustics'),
    ('44444444-4444-4444-4444-444444444444', 'SV', 'SILVER', 'PREMIUM', 4500.00, '#C9C0BB', 'Silver Premium - Comfortable seating with good view'),
    ('55555555-5555-5555-5555-555555555555', 'BR', 'BRONZE', 'STANDARD PLUS', 3500.00, '#CD7F32', 'Bronze Standard - Quality seating at great value'),
    ('66666666-6666-6666-6666-666666666666', 'ST', 'STANDARD', 'STANDARD', 2500.00, '#94B49F', 'Standard Section - Good overall experience'),
    ('77777777-7777-7777-7777-777777777777', 'EC', 'ECONOMY', 'BASIC PLUS', 1800.00, '#B4B4B8', 'Economy Plus - Affordable with decent view'),
    ('88888888-8888-8888-8888-888888888888', 'BS', 'BASIC', 'BASIC', 1200.00, '#D3D3D3', 'Basic Section - Budget-friendly option');

-- Insert Zones (2-3 zones per tier)
INSERT INTO zones (id, name, tier_id, capacity) VALUES
    -- PLATINUM zones
    ('a1111111-1111-1111-1111-111111111111', 'ZONE PT-A', '11111111-1111-1111-1111-111111111111', 40),
    ('a2222222-2222-2222-2222-222222222222', 'ZONE PT-B', '11111111-1111-1111-1111-111111111111', 40),
    
    -- GOLD zones
    ('b1111111-1111-1111-1111-111111111111', 'ZONE GD-A', '22222222-2222-2222-2222-222222222222', 50),
    ('b2222222-2222-2222-2222-222222222222', 'ZONE GD-B', '22222222-2222-2222-2222-222222222222', 50),
    ('b3333333-3333-3333-3333-333333333333', 'ZONE GD-C', '22222222-2222-2222-2222-222222222222', 50),
    
    -- VIP zones
    ('c1111111-1111-1111-1111-111111111111', 'ZONE VP-A', '33333333-3333-3333-3333-333333333333', 60),
    ('c2222222-2222-2222-2222-222222222222', 'ZONE VP-B', '33333333-3333-3333-3333-333333333333', 60),
    
    -- SILVER zones
    ('d1111111-1111-1111-1111-111111111111', 'ZONE SV-A', '44444444-4444-4444-4444-444444444444', 80),
    ('d2222222-2222-2222-2222-222222222222', 'ZONE SV-B', '44444444-4444-4444-4444-444444444444', 80),
    
    -- BRONZE zones
    ('e1111111-1111-1111-1111-111111111111', 'ZONE BR-A', '55555555-5555-5555-5555-555555555555', 100),
    ('e2222222-2222-2222-2222-222222222222', 'ZONE BR-B', '55555555-5555-5555-5555-555555555555', 100),
    
    -- STANDARD zones
    ('f1111111-1111-1111-1111-111111111111', 'ZONE ST-A', '66666666-6666-6666-6666-666666666666', 120),
    ('f2222222-2222-2222-2222-222222222222', 'ZONE ST-B', '66666666-6666-6666-6666-666666666666', 120),
    
    -- ECONOMY zones
    ('g1111111-1111-1111-1111-111111111111', 'ZONE EC-A', '77777777-7777-7777-7777-777777777777', 150),
    ('g2222222-2222-2222-2222-222222222222', 'ZONE EC-B', '77777777-7777-7777-7777-777777777777', 150),
    
    -- BASIC zones
    ('h1111111-1111-1111-1111-111111111111', 'ZONE BS-A', '88888888-8888-8888-8888-888888888888', 200),
    ('h2222222-2222-2222-2222-222222222222', 'ZONE BS-B', '88888888-8888-8888-8888-888888888888', 200);

-- Generate Seats for all zones
DO $$
DECLARE
    zone_record RECORD;
    row_letter CHAR(1);
    seats_per_zone INTEGER;
BEGIN
    FOR zone_record IN SELECT id, tier_id, capacity FROM zones LOOP
        -- Calculate rows based on capacity (10 seats per row)
        seats_per_zone := zone_record.capacity;
        
        FOR row_num IN 1..(seats_per_zone / 10) LOOP
            row_letter := CHR(64 + row_num); -- A, B, C, etc.
            FOR seat_num IN 1..10 LOOP
                INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
                VALUES (row_letter, seat_num, zone_record.tier_id, zone_record.id, FALSE);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

-- Insert Access Codes (Format: XX-XXXXXX)
-- Generate random codes for each tier
INSERT INTO access_codes (code, tier_id) VALUES
    -- PLATINUM (PT-XXXXXX)
    ('PT-4K7M2N', '11111111-1111-1111-1111-111111111111'),
    ('PT-9R3QT5', '11111111-1111-1111-1111-111111111111'),
    ('PT-6F1XD7', '11111111-1111-1111-1111-111111111111'),
    ('PT-2H8WP4', '11111111-1111-1111-1111-111111111111'),
    ('PT-5L9VK3', '11111111-1111-1111-1111-111111111111'),
    
    -- GOLD (GD-XXXXXX)
    ('GD-9R3QT5', '22222222-2222-2222-2222-222222222222'),
    ('GD-7M4NK8', '22222222-2222-2222-2222-222222222222'),
    ('GD-3P6RL2', '22222222-2222-2222-2222-222222222222'),
    ('GD-8Q1TF9', '22222222-2222-2222-2222-222222222222'),
    ('GD-4W7XJ6', '22222222-2222-2222-2222-222222222222'),
    
    -- VIP (VP-XXXXXX)
    ('VP-6F1XD7', '33333333-3333-3333-3333-333333333333'),
    ('VP-2K9MP5', '33333333-3333-3333-3333-333333333333'),
    ('VP-8N4QR3', '33333333-3333-3333-3333-333333333333'),
    ('VP-5T7WL1', '33333333-3333-3333-3333-333333333333'),
    ('VP-9H3VK8', '33333333-3333-3333-3333-333333333333'),
    
    -- SILVER (SV-XXXXXX)
    ('SV-3M7NK2', '44444444-4444-4444-4444-444444444444'),
    ('SV-8P4QL9', '44444444-4444-4444-4444-444444444444'),
    ('SV-6R1TF5', '44444444-4444-4444-4444-444444444444'),
    ('SV-2W9XJ7', '44444444-4444-4444-4444-444444444444'),
    ('SV-7K5VL4', '44444444-4444-4444-4444-444444444444'),
    
    -- BRONZE (BR-XXXXXX)
    ('BR-4N8MK3', '55555555-5555-5555-5555-555555555555'),
    ('BR-9Q2RL6', '55555555-5555-5555-5555-555555555555'),
    ('BR-5T7WF1', '55555555-5555-5555-5555-555555555555'),
    ('BR-3X4JL8', '55555555-5555-5555-5555-555555555555'),
    ('BR-8H6VK2', '55555555-5555-5555-5555-555555555555'),
    
    -- STANDARD (ST-XXXXXX)
    ('ST-7M3NK9', '66666666-6666-6666-6666-666666666666'),
    ('ST-2P8QL4', '66666666-6666-6666-6666-666666666666'),
    ('ST-6R5TF1', '66666666-6666-6666-6666-666666666666'),
    ('ST-9W1XJ7', '66666666-6666-6666-6666-666666666666'),
    ('ST-4K7VL3', '66666666-6666-6666-6666-666666666666'),
    
    -- ECONOMY (EC-XXXXXX)
    ('EC-5N9MK2', '77777777-7777-7777-7777-777777777777'),
    ('EC-3Q6RL8', '77777777-7777-7777-7777-777777777777'),
    ('EC-8T2WF5', '77777777-7777-7777-7777-777777777777'),
    ('EC-6X4JL1', '77777777-7777-7777-7777-777777777777'),
    ('EC-2H8VK9', '77777777-7777-7777-7777-777777777777'),
    
    -- BASIC (BS-XXXXXX)
    ('BS-9M4NK7', '88888888-8888-8888-8888-888888888888'),
    ('BS-5P2QL3', '88888888-8888-8888-8888-888888888888'),
    ('BS-3R8TF6', '88888888-8888-8888-8888-888888888888'),
    ('BS-7W6XJ1', '88888888-8888-8888-8888-888888888888'),
    ('BS-4K1VL9', '88888888-8888-8888-8888-888888888888');

-- Verify data
SELECT 'DATA SUMMARY' as info;
SELECT 'Tiers created:' as info, COUNT(*) as count FROM tiers
UNION ALL
SELECT 'Zones created:', COUNT(*) FROM zones
UNION ALL
SELECT 'Seats created:', COUNT(*) FROM seats
UNION ALL
SELECT 'Access codes created:', COUNT(*) FROM access_codes;

-- Show tier data
SELECT 'TIER DATA' as section;
SELECT code_prefix, name, level, price, color, description 
FROM tiers 
ORDER BY price DESC;

-- Show sample codes
SELECT 'SAMPLE ACCESS CODES' as section;
SELECT t.code_prefix, t.name, ac.code, ac.is_used
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
ORDER BY t.price DESC, ac.code
LIMIT 20;
