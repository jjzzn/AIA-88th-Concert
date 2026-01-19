-- AIA Concert Ticket Booking System - Complete Database Setup
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

-- Tiers Table
CREATE TABLE tiers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
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

-- Access Codes Table
CREATE TABLE access_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(50) UNIQUE NOT NULL,
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

-- ============================================================================
-- INSERT DATA
-- ============================================================================

-- Insert Tiers (matching your constants.ts)
INSERT INTO tiers (id, name, level, price, color, description) VALUES
    ('11111111-1111-1111-1111-111111111111', 'PLATINUM', 'ELITE', 6500.00, '#9f1239', 'Exclusive access to Front Row sections'),
    ('22222222-2222-2222-2222-222222222222', 'GOLD', 'PREMIUM', 4500.00, '#be123c', 'Great views from the middle sections'),
    ('33333333-3333-3333-3333-333333333333', 'SILVER', 'STANDARD', 3500.00, '#fb7185', 'Balanced view and value'),
    ('44444444-4444-4444-4444-444444444444', 'CLASSIC', 'BASIC', 2500.00, '#ffe4e6', 'Standard arena seating');

-- Insert Zones (matching your constants.ts)
INSERT INTO zones (id, name, tier_id, capacity) VALUES
    ('a1111111-1111-1111-1111-111111111111', 'ZONE A1', '11111111-1111-1111-1111-111111111111', 50),
    ('a2222222-2222-2222-2222-222222222222', 'ZONE A2', '11111111-1111-1111-1111-111111111111', 50),
    ('b1111111-1111-1111-1111-111111111111', 'ZONE B1', '22222222-2222-2222-2222-222222222222', 50),
    ('b2222222-2222-2222-2222-222222222222', 'ZONE B2', '22222222-2222-2222-2222-222222222222', 50),
    ('b3333333-3333-3333-3333-333333333333', 'ZONE B3', '22222222-2222-2222-2222-222222222222', 50),
    ('c1111111-1111-1111-1111-111111111111', 'ZONE C1', '33333333-3333-3333-3333-333333333333', 50),
    ('c2222222-2222-2222-2222-222222222222', 'ZONE C2', '33333333-3333-3333-3333-333333333333', 50),
    ('d1111111-1111-1111-1111-111111111111', 'ZONE D1', '44444444-4444-4444-4444-444444444444', 50),
    ('d2222222-2222-2222-2222-222222222222', 'ZONE D2', '44444444-4444-4444-4444-444444444444', 50);

-- Generate Seats for all zones (5 rows x 10 seats = 50 seats per zone)
DO $$
DECLARE
    zone_record RECORD;
    row_letter CHAR(1);
BEGIN
    FOR zone_record IN SELECT id, tier_id FROM zones LOOP
        FOR row_letter IN SELECT CHR(i) FROM generate_series(65, 69) i LOOP -- A to E
            FOR seat_num IN 1..10 LOOP
                INSERT INTO seats (row, number, tier_id, zone_id, is_booked)
                VALUES (row_letter, seat_num, zone_record.tier_id, zone_record.id, FALSE);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

-- Insert Access Codes (matching your code validation logic)
-- Code format: First digit determines tier (1=PLATINUM, 2=GOLD, 3=SILVER, 4-5=CLASSIC)
INSERT INTO access_codes (code, tier_id) VALUES
    -- PLATINUM codes (start with 1)
    ('1AIA2024-001', '11111111-1111-1111-1111-111111111111'),
    ('1AIA2024-002', '11111111-1111-1111-1111-111111111111'),
    ('1AIA2024-003', '11111111-1111-1111-1111-111111111111'),
    ('1AIA2024-004', '11111111-1111-1111-1111-111111111111'),
    ('1AIA2024-005', '11111111-1111-1111-1111-111111111111'),
    ('1PLAT-VIP-01', '11111111-1111-1111-1111-111111111111'),
    ('1PLAT-VIP-02', '11111111-1111-1111-1111-111111111111'),
    ('1PLAT-VIP-03', '11111111-1111-1111-1111-111111111111'),
    
    -- GOLD codes (start with 2)
    ('2AIA2024-001', '22222222-2222-2222-2222-222222222222'),
    ('2AIA2024-002', '22222222-2222-2222-2222-222222222222'),
    ('2AIA2024-003', '22222222-2222-2222-2222-222222222222'),
    ('2AIA2024-004', '22222222-2222-2222-2222-222222222222'),
    ('2AIA2024-005', '22222222-2222-2222-2222-222222222222'),
    ('2GOLD-PRE-01', '22222222-2222-2222-2222-222222222222'),
    ('2GOLD-PRE-02', '22222222-2222-2222-2222-222222222222'),
    ('2GOLD-PRE-03', '22222222-2222-2222-2222-222222222222'),
    
    -- SILVER codes (start with 3)
    ('3AIA2024-001', '33333333-3333-3333-3333-333333333333'),
    ('3AIA2024-002', '33333333-3333-3333-3333-333333333333'),
    ('3AIA2024-003', '33333333-3333-3333-3333-333333333333'),
    ('3AIA2024-004', '33333333-3333-3333-3333-333333333333'),
    ('3AIA2024-005', '33333333-3333-3333-3333-333333333333'),
    ('3SILV-STD-01', '33333333-3333-3333-3333-333333333333'),
    ('3SILV-STD-02', '33333333-3333-3333-3333-333333333333'),
    ('3SILV-STD-03', '33333333-3333-3333-3333-333333333333'),
    
    -- CLASSIC codes (start with 4 or 5)
    ('4AIA2024-001', '44444444-4444-4444-4444-444444444444'),
    ('4AIA2024-002', '44444444-4444-4444-4444-444444444444'),
    ('4AIA2024-003', '44444444-4444-4444-4444-444444444444'),
    ('5AIA2024-001', '44444444-4444-4444-4444-444444444444'),
    ('5AIA2024-002', '44444444-4444-4444-4444-444444444444'),
    ('5AIA2024-003', '44444444-4444-4444-4444-444444444444'),
    ('4CLAS-BAS-01', '44444444-4444-4444-4444-444444444444'),
    ('5CLAS-BAS-02', '44444444-4444-4444-4444-444444444444');

-- Verify data
SELECT 'Tiers created:' as info, COUNT(*) as count FROM tiers
UNION ALL
SELECT 'Zones created:', COUNT(*) FROM zones
UNION ALL
SELECT 'Seats created:', COUNT(*) FROM seats
UNION ALL
SELECT 'Access codes created:', COUNT(*) FROM access_codes;

-- Show sample data
SELECT 'TIER DATA:' as section;
SELECT name, level, price, color FROM tiers ORDER BY price DESC;

SELECT 'ZONE DATA:' as section;
SELECT z.name, t.name as tier_name, z.capacity 
FROM zones z 
JOIN tiers t ON z.tier_id = t.id 
ORDER BY t.price DESC, z.name;

SELECT 'SAMPLE SEATS:' as section;
SELECT s.row, s.number, z.name as zone_name, t.name as tier_name
FROM seats s
JOIN zones z ON s.zone_id = z.id
JOIN tiers t ON s.tier_id = t.id
WHERE z.name = 'ZONE A1'
ORDER BY s.row, s.number
LIMIT 10;

SELECT 'SAMPLE ACCESS CODES:' as section;
SELECT code, t.name as tier_name, is_used
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
ORDER BY t.price DESC, code
LIMIT 10;
