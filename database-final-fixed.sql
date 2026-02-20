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

-- Access Codes Table (Format: XXXXXXXXXX - 10 characters: 2 prefix + 8 autorun)
CREATE TABLE access_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(10) UNIQUE NOT NULL,
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
    status VARCHAR(50) DEFAULT 'confirmed',
    is_booking_for_others BOOLEAN DEFAULT FALSE,
    grantor_first_name VARCHAR(100),
    grantor_last_name VARCHAR(100),
    grantor_phone VARCHAR(20),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Booking Seats Table
CREATE TABLE booking_seats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    seat_id UUID NOT NULL REFERENCES seats(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    qr_token VARCHAR(255) UNIQUE,
    checked_in BOOLEAN DEFAULT FALSE,
    checked_in_at TIMESTAMP WITH TIME ZONE,
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
CREATE INDEX idx_bookings_phone ON bookings(phone);
CREATE INDEX idx_booking_seats_booking_id ON booking_seats(booking_id);
CREATE INDEX idx_booking_seats_qr_token ON booking_seats(qr_token);
CREATE INDEX idx_booking_seats_checked_in ON booking_seats(checked_in);
CREATE INDEX idx_booking_codes_booking_id ON booking_codes(booking_id);
CREATE INDEX idx_tiers_code_prefix ON tiers(code_prefix);

-- ============================================================================
-- INSERT DATA - 8 TIERS
-- ============================================================================

-- Insert 8 Tiers (Code Prefix matches Name)
INSERT INTO tiers (id, code_prefix, name, level, price, color, description) VALUES
    ('11111111-1111-1111-1111-111111111111', 'PT', 'PLATINUM', 'ELITE PLUS', 8500.00, '#E5E4E2', 'Platinum Elite - Front row with exclusive VIP lounge access'),
    ('22222222-2222-2222-2222-222222222222', 'GD', 'GOLD', 'PREMIUM PLUS', 6500.00, '#FFD700', 'Gold Premium - Premium seating with excellent stage view'),
    ('33333333-3333-3333-3333-333333333333', 'PR', 'PRESTIGE', 'PRESTIGE', 5800.00, '#B87333', 'Prestige Section - Distinguished seating with premium amenities'),
    ('44444444-4444-4444-4444-444444444444', 'VP', 'VIP', 'VIP', 5000.00, '#8B00FF', 'VIP Section - Special access with great acoustics'),
    ('55555555-5555-5555-5555-555555555555', 'SV', 'SILVER', 'PREMIUM', 4200.00, '#C0C0C0', 'Silver Premium - Comfortable seating with good view'),
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

-- Insert Access Codes (Format: XXXXXXXXXX - 10 characters: 2 prefix + 8 autorun)
INSERT INTO access_codes (code, tier_id) VALUES
    -- PLATINUM (PT)
    ('PT00000001', '11111111-1111-1111-1111-111111111111'),
    ('PT00000002', '11111111-1111-1111-1111-111111111111'),
    ('PT00000003', '11111111-1111-1111-1111-111111111111'),
    ('PT00000004', '11111111-1111-1111-1111-111111111111'),
    ('PT00000005', '11111111-1111-1111-1111-111111111111'),
    ('PT00000006', '11111111-1111-1111-1111-111111111111'),
    
    -- GOLD (GD)
    ('GD00000001', '22222222-2222-2222-2222-222222222222'),
    ('GD00000002', '22222222-2222-2222-2222-222222222222'),
    ('GD00000003', '22222222-2222-2222-2222-222222222222'),
    ('GD00000004', '22222222-2222-2222-2222-222222222222'),
    ('GD00000005', '22222222-2222-2222-2222-222222222222'),
    ('GD00000006', '22222222-2222-2222-2222-222222222222'),
    
    -- PRESTIGE (PR)
    ('PR00000001', '33333333-3333-3333-3333-333333333333'),
    ('PR00000002', '33333333-3333-3333-3333-333333333333'),
    ('PR00000003', '33333333-3333-3333-3333-333333333333'),
    ('PR00000004', '33333333-3333-3333-3333-333333333333'),
    ('PR00000005', '33333333-3333-3333-3333-333333333333'),
    ('PR00000006', '33333333-3333-3333-3333-333333333333'),
    
    -- VIP (VP)
    ('VP00000001', '44444444-4444-4444-4444-444444444444'),
    ('VP00000002', '44444444-4444-4444-4444-444444444444'),
    ('VP00000003', '44444444-4444-4444-4444-444444444444'),
    ('VP00000004', '44444444-4444-4444-4444-444444444444'),
    ('VP00000005', '44444444-4444-4444-4444-444444444444'),
    ('VP00000006', '44444444-4444-4444-4444-444444444444'),
    
    -- SILVER (SV)
    ('SV00000001', '55555555-5555-5555-5555-555555555555'),
    ('SV00000002', '55555555-5555-5555-5555-555555555555'),
    ('SV00000003', '55555555-5555-5555-5555-555555555555'),
    ('SV00000004', '55555555-5555-5555-5555-555555555555'),
    ('SV00000005', '55555555-5555-5555-5555-555555555555'),
    ('SV00000006', '55555555-5555-5555-5555-555555555555'),
    
    -- AGENCY (AG)
    ('AG00000001', '66666666-6666-6666-6666-666666666666'),
    ('AG00000002', '66666666-6666-6666-6666-666666666666'),
    ('AG00000003', '66666666-6666-6666-6666-666666666666'),
    ('AG00000004', '66666666-6666-6666-6666-666666666666'),
    ('AG00000005', '66666666-6666-6666-6666-666666666666'),
    ('AG00000006', '66666666-6666-6666-6666-666666666666'),
    
    -- CLASSIC (CL)
    ('CL00000001', '77777777-7777-7777-7777-777777777777'),
    ('CL00000002', '77777777-7777-7777-7777-777777777777'),
    ('CL00000003', '77777777-7777-7777-7777-777777777777'),
    ('CL00000004', '77777777-7777-7777-7777-777777777777'),
    ('CL00000005', '77777777-7777-7777-7777-777777777777'),
    ('CL00000006', '77777777-7777-7777-7777-777777777777'),
    
    -- OTHER (OT)
    ('OT00000001', '88888888-8888-8888-8888-888888888888'),
    ('OT00000002', '88888888-8888-8888-8888-888888888888'),
    ('OT00000003', '88888888-8888-8888-8888-888888888888'),
    ('OT00000004', '88888888-8888-8888-8888-888888888888'),
    ('OT00000005', '88888888-8888-8888-8888-888888888888'),
    ('OT00000006', '88888888-8888-8888-8888-888888888888');

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
