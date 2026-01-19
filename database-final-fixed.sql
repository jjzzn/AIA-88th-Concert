-- AIA Concert Ticket Booking System - Final 8 Tiers
-- Code Format: XXXXXXXX (8 characters, no hyphen)
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

-- Access Codes Table (Format: XXXXXXXX - 8 characters, no hyphen)
CREATE TABLE access_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(8) UNIQUE NOT NULL,
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

-- Insert 8 Tiers (Based on your specification)
INSERT INTO tiers (id, code_prefix, name, level, price, color, description) VALUES
    ('11111111-1111-1111-1111-111111111111', 'PT', 'PLATINUM', 'ELITE PLUS', 8500.00, '#E5E4E2', 'Platinum Elite - Front row with exclusive VIP lounge access'),
    ('22222222-2222-2222-2222-222222222222', 'GD', 'GOLD', 'PREMIUM PLUS', 6500.00, '#FFD700', 'Gold Premium - Premium seating with excellent stage view'),
    ('33333333-3333-3333-3333-333333333333', 'PR', 'PRESTIGE', 'PRESTIGE', 5800.00, '#B87333', 'Prestige Section - Distinguished seating with premium amenities'),
    ('44444444-4444-4444-4444-444444444444', 'VP', 'VIP', 'VIP', 5000.00, '#C0C0C0', 'VIP Section - Special access with great acoustics'),
    ('55555555-5555-5555-5555-555555555555', 'SV', 'SILVER', 'PREMIUM', 4200.00, '#C9C0BB', 'Silver Premium - Comfortable seating with good view'),
    ('66666666-6666-6666-6666-666666666666', 'AG', 'AGENCY', 'STANDARD PLUS', 3500.00, '#708090', 'Agency Section - Quality seating for groups'),
    ('77777777-7777-7777-7777-777777777777', 'CL', 'CLASSIC', 'STANDARD', 2500.00, '#8B7355', 'Classic Section - Traditional concert experience'),
    ('88888888-8888-8888-8888-888888888888', 'OT', 'OTHER', 'BASIC', 1800.00, '#A9A9A9', 'Other Section - Budget-friendly option');

-- Insert Zones (2-3 zones per tier) - Fixed UUID format
INSERT INTO zones (id, name, tier_id, capacity) VALUES
    -- PLATINUM zones
    ('a1111111-1111-1111-1111-111111111111', 'ZONE PT-A', '11111111-1111-1111-1111-111111111111', 40),
    ('a2222222-2222-2222-2222-222222222222', 'ZONE PT-B', '11111111-1111-1111-1111-111111111111', 40),
    
    -- GOLD zones
    ('b1111111-1111-1111-1111-111111111111', 'ZONE GD-A', '22222222-2222-2222-2222-222222222222', 50),
    ('b2222222-2222-2222-2222-222222222222', 'ZONE GD-B', '22222222-2222-2222-2222-222222222222', 50),
    ('b3333333-3333-3333-3333-333333333333', 'ZONE GD-C', '22222222-2222-2222-2222-222222222222', 50),
    
    -- PRESTIGE zones
    ('c1111111-1111-1111-1111-111111111111', 'ZONE PR-A', '33333333-3333-3333-3333-333333333333', 60),
    ('c2222222-2222-2222-2222-222222222222', 'ZONE PR-B', '33333333-3333-3333-3333-333333333333', 60),
    
    -- VIP zones
    ('d1111111-1111-1111-1111-111111111111', 'ZONE VP-A', '44444444-4444-4444-4444-444444444444', 70),
    ('d2222222-2222-2222-2222-222222222222', 'ZONE VP-B', '44444444-4444-4444-4444-444444444444', 70),
    
    -- SILVER zones
    ('e1111111-1111-1111-1111-111111111111', 'ZONE SV-A', '55555555-5555-5555-5555-555555555555', 80),
    ('e2222222-2222-2222-2222-222222222222', 'ZONE SV-B', '55555555-5555-5555-5555-555555555555', 80),
    
    -- AGENCY zones
    ('f1111111-1111-1111-1111-111111111111', 'ZONE AG-A', '66666666-6666-6666-6666-666666666666', 100),
    ('f2222222-2222-2222-2222-222222222222', 'ZONE AG-B', '66666666-6666-6666-6666-666666666666', 100),
    
    -- CLASSIC zones (fixed: g -> c with unique suffix)
    ('c7111111-1111-1111-1111-111111111111', 'ZONE CL-A', '77777777-7777-7777-7777-777777777777', 120),
    ('c7222222-2222-2222-2222-222222222222', 'ZONE CL-B', '77777777-7777-7777-7777-777777777777', 120),
    
    -- OTHER zones (fixed: h -> c with unique suffix)
    ('c8111111-1111-1111-1111-111111111111', 'ZONE OT-A', '88888888-8888-8888-8888-888888888888', 150),
    ('c8222222-2222-2222-2222-222222222222', 'ZONE OT-B', '88888888-8888-8888-8888-888888888888', 150);

-- Generate Seats for all zones
DO $$
DECLARE
    zone_record RECORD;
    row_letter CHAR(1);
    seats_per_zone INTEGER;
BEGIN
    FOR zone_record IN SELECT id, tier_id, capacity FROM zones LOOP
        seats_per_zone := zone_record.capacity;
        
        FOR row_num IN 1..(seats_per_zone / 10) LOOP
            row_letter := CHR(64 + row_num);
            FOR seat_num IN 1..10 LOOP
                INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
                VALUES (row_letter, seat_num, zone_record.tier_id, zone_record.id, FALSE);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

-- Insert Access Codes (Format: XXXXXXXX - 8 characters, no hyphen)
INSERT INTO access_codes (code, tier_id) VALUES
    -- PLATINUM (PT)
    ('PT4K7M2N', '11111111-1111-1111-1111-111111111111'),
    ('PT9R3QT5', '11111111-1111-1111-1111-111111111111'),
    ('PT6F1XD7', '11111111-1111-1111-1111-111111111111'),
    ('PT2H8WP4', '11111111-1111-1111-1111-111111111111'),
    ('PT5L9VK3', '11111111-1111-1111-1111-111111111111'),
    ('PT7M4NK8', '11111111-1111-1111-1111-111111111111'),
    
    -- GOLD (GD)
    ('GD9R3QT5', '22222222-2222-2222-2222-222222222222'),
    ('GD7M4NK8', '22222222-2222-2222-2222-222222222222'),
    ('GD3P6RL2', '22222222-2222-2222-2222-222222222222'),
    ('GD8Q1TF9', '22222222-2222-2222-2222-222222222222'),
    ('GD4W7XJ6', '22222222-2222-2222-2222-222222222222'),
    ('GD2K5NH3', '22222222-2222-2222-2222-222222222222'),
    
    -- PRESTIGE (PR)
    ('PR2H8WP4', '33333333-3333-3333-3333-333333333333'),
    ('PR6F1XD7', '33333333-3333-3333-3333-333333333333'),
    ('PR9K4ML5', '33333333-3333-3333-3333-333333333333'),
    ('PR3N7QR2', '33333333-3333-3333-3333-333333333333'),
    ('PR8T2VW6', '33333333-3333-3333-3333-333333333333'),
    ('PR5J9LK1', '33333333-3333-3333-3333-333333333333'),
    
    -- VIP (VP)
    ('VP6F1XD7', '44444444-4444-4444-4444-444444444444'),
    ('VP2K9MP5', '44444444-4444-4444-4444-444444444444'),
    ('VP8N4QR3', '44444444-4444-4444-4444-444444444444'),
    ('VP5T7WL1', '44444444-4444-4444-4444-444444444444'),
    ('VP9H3VK8', '44444444-4444-4444-4444-444444444444'),
    ('VP4M6NJ2', '44444444-4444-4444-4444-444444444444'),
    
    -- SILVER (SV)
    ('SV5M9KR2', '55555555-5555-5555-5555-555555555555'),
    ('SV3M7NK2', '55555555-5555-5555-5555-555555555555'),
    ('SV8P4QL9', '55555555-5555-5555-5555-555555555555'),
    ('SV6R1TF5', '55555555-5555-5555-5555-555555555555'),
    ('SV2W9XJ7', '55555555-5555-5555-5555-555555555555'),
    ('SV7K5VL4', '55555555-5555-5555-5555-555555555555'),
    
    -- AGENCY (AG)
    ('AG8T4NH6', '66666666-6666-6666-6666-666666666666'),
    ('AG4N8MK3', '66666666-6666-6666-6666-666666666666'),
    ('AG9Q2RL6', '66666666-6666-6666-6666-666666666666'),
    ('AG5T7WF1', '66666666-6666-6666-6666-666666666666'),
    ('AG3X4JL8', '66666666-6666-6666-6666-666666666666'),
    ('AG8H6VK2', '66666666-6666-6666-6666-666666666666'),
    
    -- CLASSIC (CL)
    ('CL3Q7BV9', '77777777-7777-7777-7777-777777777777'),
    ('CL7M3NK9', '77777777-7777-7777-7777-777777777777'),
    ('CL2P8QL4', '77777777-7777-7777-7777-777777777777'),
    ('CL6R5TF1', '77777777-7777-7777-7777-777777777777'),
    ('CL9W1XJ7', '77777777-7777-7777-7777-777777777777'),
    ('CL4K7VL3', '77777777-7777-7777-7777-777777777777'),
    
    -- OTHER (OT)
    ('OT1Y5JC8', '88888888-8888-8888-8888-888888888888'),
    ('OT5N9MK2', '88888888-8888-8888-8888-888888888888'),
    ('OT3Q6RL8', '88888888-8888-8888-8888-888888888888'),
    ('OT8T2WF5', '88888888-8888-8888-8888-888888888888'),
    ('OT6X4JL1', '88888888-8888-8888-8888-888888888888'),
    ('OT2H8VK9', '88888888-8888-8888-8888-888888888888');

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
SELECT code_prefix, name, level, price, color 
FROM tiers 
ORDER BY price DESC;

-- Show sample codes
SELECT 'SAMPLE ACCESS CODES' as section;
SELECT t.code_prefix, t.name, ac.code, ac.is_used
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
ORDER BY t.price DESC, ac.code;
