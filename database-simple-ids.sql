-- AIA Concert Ticket Booking System - Simple Integer IDs
-- This script uses SERIAL/BIGSERIAL for simple, readable IDs
-- WARNING: This will DELETE ALL DATA!

-- Drop all tables in correct order (reverse dependency order)
DROP TABLE IF EXISTS check_ins CASCADE;
DROP TABLE IF EXISTS booking_codes CASCADE;
DROP TABLE IF EXISTS booking_seats CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS access_codes CASCADE;
DROP TABLE IF EXISTS seats CASCADE;
DROP TABLE IF EXISTS zones CASCADE;
DROP TABLE IF EXISTS admin_users CASCADE;
DROP TABLE IF EXISTS gates CASCADE;
DROP TABLE IF EXISTS tiers CASCADE;

-- ============================================================================
-- CREATE TABLES WITH SIMPLE IDs
-- ============================================================================

-- Tiers Table (8 Tiers) - Simple ID
CREATE TABLE tiers (
    id SERIAL PRIMARY KEY,
    code VARCHAR(2) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    level VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Zones Table - Simple ID
CREATE TABLE zones (
    id SERIAL PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    tier_id INTEGER NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Seats Table - Simple ID
CREATE TABLE seats (
    id SERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    row VARCHAR(10) NOT NULL,
    number INTEGER NOT NULL,
    tier_id INTEGER NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    zone_id INTEGER NOT NULL REFERENCES zones(id) ON DELETE CASCADE,
    is_booked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(zone_id, row, number)
);

-- Access Codes Table - Simple ID
CREATE TABLE access_codes (
    id SERIAL PRIMARY KEY,
    code VARCHAR(8) UNIQUE NOT NULL,
    tier_id INTEGER NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    is_used BOOLEAN DEFAULT FALSE,
    used_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Bookings Table - Simple ID with Booking Number
CREATE TABLE bookings (
    id BIGSERIAL PRIMARY KEY,
    booking_number VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    status VARCHAR(50) DEFAULT 'confirmed',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Booking Seats Table - Simple ID
CREATE TABLE booking_seats (
    id BIGSERIAL PRIMARY KEY,
    booking_id BIGINT NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    seat_id INTEGER NOT NULL REFERENCES seats(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    qr_token VARCHAR(255) UNIQUE,
    checked_in BOOLEAN DEFAULT FALSE,
    checked_in_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    note TEXT,
    UNIQUE(booking_id, seat_id)
);

-- Booking Codes Table - Simple ID
CREATE TABLE booking_codes (
    id SERIAL PRIMARY KEY,
    booking_id BIGINT NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    code_id INTEGER NOT NULL REFERENCES access_codes(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(booking_id, code_id)
);

-- Gates Table - Simple ID
CREATE TABLE gates (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Admin Users Table - Simple ID
CREATE TABLE admin_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    gate_id INTEGER REFERENCES gates(id),
    role VARCHAR(50) DEFAULT 'staff',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP WITH TIME ZONE
);

-- Check-ins Table - Simple ID
CREATE TABLE check_ins (
    id BIGSERIAL PRIMARY KEY,
    booking_seat_id BIGINT NOT NULL UNIQUE REFERENCES booking_seats(id) ON DELETE CASCADE,
    admin_user_id INTEGER NOT NULL REFERENCES admin_users(id),
    gate_id INTEGER NOT NULL REFERENCES gates(id),
    checked_in_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);

-- ============================================================================
-- CREATE INDEXES
-- ============================================================================

CREATE INDEX idx_seats_tier_id ON seats(tier_id);
CREATE INDEX idx_seats_zone_id ON seats(zone_id);
CREATE INDEX idx_seats_is_booked ON seats(is_booked);
CREATE INDEX idx_seats_code ON seats(code);
CREATE INDEX idx_access_codes_code ON access_codes(code);
CREATE INDEX idx_access_codes_tier_id ON access_codes(tier_id);
CREATE INDEX idx_access_codes_is_used ON access_codes(is_used);
CREATE INDEX idx_bookings_email ON bookings(email);
CREATE INDEX idx_bookings_phone ON bookings(phone);
CREATE INDEX idx_bookings_booking_number ON bookings(booking_number);
CREATE INDEX idx_booking_seats_booking_id ON booking_seats(booking_id);
CREATE INDEX idx_booking_seats_qr_token ON booking_seats(qr_token);
CREATE INDEX idx_booking_seats_checked_in ON booking_seats(checked_in);
CREATE INDEX idx_booking_codes_booking_id ON booking_codes(booking_id);
CREATE INDEX idx_tiers_code ON tiers(code);
CREATE INDEX idx_zones_code ON zones(code);
CREATE INDEX idx_check_ins_booking_seat_id ON check_ins(booking_seat_id);
CREATE INDEX idx_check_ins_gate_id ON check_ins(gate_id);
CREATE INDEX idx_admin_users_username ON admin_users(username);
CREATE INDEX idx_gates_code ON gates(code);

-- ============================================================================
-- INSERT DATA - 8 TIERS (Simple IDs: 1-8)
-- ============================================================================

INSERT INTO tiers (code, name, level, price, color, description) VALUES
    ('PT', 'PLATINUM', 'ELITE PLUS', 8500.00, '#E5E4E2', 'Platinum Elite - Front row with exclusive VIP lounge access'),
    ('GD', 'GOLD', 'PREMIUM PLUS', 6500.00, '#FFD700', 'Gold Premium - Premium seating with excellent stage view'),
    ('PR', 'PRESTIGE', 'PRESTIGE', 5800.00, '#B87333', 'Prestige Section - Distinguished seating with premium amenities'),
    ('VP', 'VIP', 'VIP', 5000.00, '#8B00FF', 'VIP Section - Special access with great acoustics'),
    ('SV', 'SILVER', 'PREMIUM', 4200.00, '#C0C0C0', 'Silver Premium - Comfortable seating with good view'),
    ('AG', 'AGENCY', 'STANDARD PLUS', 3500.00, '#708090', 'Agency Section - Quality seating for groups'),
    ('CL', 'CLASSIC', 'STANDARD', 2500.00, '#8B7355', 'Classic Section - Traditional concert experience'),
    ('OT', 'OTHER', 'BASIC', 1800.00, '#A9A9A9', 'Other Section - Budget-friendly option');

-- Insert Zones with simple codes (IDs: 1-18)
INSERT INTO zones (code, name, tier_id, capacity) VALUES
    -- PLATINUM zones (tier_id: 1)
    ('PT-A', 'ZONE PT-A', 1, 40),
    ('PT-B', 'ZONE PT-B', 1, 40),
    
    -- GOLD zones (tier_id: 2)
    ('GD-A', 'ZONE GD-A', 2, 50),
    ('GD-B', 'ZONE GD-B', 2, 50),
    ('GD-C', 'ZONE GD-C', 2, 50),
    
    -- PRESTIGE zones (tier_id: 3)
    ('PR-A', 'ZONE PR-A', 3, 60),
    ('PR-B', 'ZONE PR-B', 3, 60),
    
    -- VIP zones (tier_id: 4)
    ('VP-A', 'ZONE VP-A', 4, 70),
    ('VP-B', 'ZONE VP-B', 4, 70),
    
    -- SILVER zones (tier_id: 5)
    ('SV-A', 'ZONE SV-A', 5, 80),
    ('SV-B', 'ZONE SV-B', 5, 80),
    
    -- AGENCY zones (tier_id: 6)
    ('AG-A', 'ZONE AG-A', 6, 100),
    ('AG-B', 'ZONE AG-B', 6, 100),
    
    -- CLASSIC zones (tier_id: 7)
    ('CL-A', 'ZONE CL-A', 7, 120),
    ('CL-B', 'ZONE CL-B', 7, 120),
    
    -- OTHER zones (tier_id: 8)
    ('OT-A', 'ZONE OT-A', 8, 150),
    ('OT-B', 'ZONE OT-B', 8, 150);

-- Generate Seats with readable codes (e.g., PT-A-A01, PT-A-A02)
DO $$
DECLARE
    zone_record RECORD;
    row_letter CHAR(1);
    seats_per_zone INTEGER;
    seat_code VARCHAR(20);
    zone_code VARCHAR(10);
BEGIN
    FOR zone_record IN SELECT id, code, tier_id, capacity FROM zones LOOP
        seats_per_zone := zone_record.capacity;
        zone_code := zone_record.code;
        
        FOR row_num IN 1..(seats_per_zone / 10) LOOP
            row_letter := CHR(64 + row_num);
            FOR seat_num IN 1..10 LOOP
                seat_code := zone_code || '-' || row_letter || LPAD(seat_num::TEXT, 2, '0');
                INSERT INTO seats (code, row, number, tier_id, zone_id, is_booked)
                VALUES (seat_code, row_letter, seat_num, zone_record.tier_id, zone_record.id, FALSE);
            END LOOP;
        END LOOP;
    END LOOP;
END $$;

-- Insert Access Codes
INSERT INTO access_codes (code, tier_id) VALUES
    -- PLATINUM (tier_id: 1)
    ('PT4K7M2N', 1), ('PT9R3QT5', 1), ('PT6F1XD7', 1),
    ('PT2H8WP4', 1), ('PT5L9VK3', 1), ('PT7M4NK8', 1),
    
    -- GOLD (tier_id: 2)
    ('GD9R3QT5', 2), ('GD7M4NK8', 2), ('GD3P6RL2', 2),
    ('GD8Q1TF9', 2), ('GD4W7XJ6', 2), ('GD2K5NH3', 2),
    
    -- PRESTIGE (tier_id: 3)
    ('PR2H8WP4', 3), ('PR6F1XD7', 3), ('PR9K4ML5', 3),
    ('PR3N7QR2', 3), ('PR8T2VW6', 3), ('PR5J9LK1', 3),
    
    -- VIP (tier_id: 4)
    ('VP6F1XD7', 4), ('VP2K9MP5', 4), ('VP8N4QR3', 4),
    ('VP5T7WL1', 4), ('VP9H3VK8', 4), ('VP4M6NJ2', 4),
    
    -- SILVER (tier_id: 5)
    ('SV5M9KR2', 5), ('SV3M7NK2', 5), ('SV8P4QL9', 5),
    ('SV6R1TF5', 5), ('SV2W9XJ7', 5), ('SV7K5VL4', 5),
    
    -- AGENCY (tier_id: 6)
    ('AG8T4NH6', 6), ('AG4N8MK3', 6), ('AG9Q2RL6', 6),
    ('AG5T7WF1', 6), ('AG3X4JL8', 6), ('AG8H6VK2', 6),
    
    -- CLASSIC (tier_id: 7)
    ('CL3Q7BV9', 7), ('CL7M3NK9', 7), ('CL2P8QL4', 7),
    ('CL6R5TF1', 7), ('CL9W1XJ7', 7), ('CL4K7VL3', 7),
    
    -- OTHER (tier_id: 8)
    ('OT1Y5JC8', 8), ('OT5N9MK2', 8), ('OT3Q6RL8', 8),
    ('OT8T2WF5', 8), ('OT6X4JL1', 8), ('OT2H8VK9', 8);

-- Insert Sample Gates (IDs: 1-3)
INSERT INTO gates (code, name, description) VALUES
    ('GATE-A', 'Gate A', 'Main entrance gate'),
    ('GATE-B', 'Gate B', 'Side entrance gate'),
    ('GATE-C', 'Gate C', 'VIP entrance gate');

-- ============================================================================
-- HELPER FUNCTION: Generate Booking Number
-- ============================================================================

CREATE OR REPLACE FUNCTION generate_booking_number()
RETURNS TEXT AS $$
DECLARE
    date_part TEXT;
    sequence_part TEXT;
    next_id BIGINT;
BEGIN
    -- Get date part (YYYYMMDD)
    date_part := TO_CHAR(CURRENT_DATE, 'YYYYMMDD');
    
    -- Get next sequence number for today
    SELECT COALESCE(MAX(CAST(SUBSTRING(booking_number FROM 12) AS INTEGER)), 0) + 1
    INTO next_id
    FROM bookings
    WHERE booking_number LIKE 'BK-' || date_part || '-%';
    
    -- Format: BK-YYYYMMDD-XXXX (e.g., BK-20250121-0001)
    sequence_part := LPAD(next_id::TEXT, 4, '0');
    
    RETURN 'BK-' || date_part || '-' || sequence_part;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- TRIGGER: Auto-generate booking number
-- ============================================================================

CREATE OR REPLACE FUNCTION set_booking_number()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.booking_number IS NULL THEN
        NEW.booking_number := generate_booking_number();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_set_booking_number
BEFORE INSERT ON bookings
FOR EACH ROW
EXECUTE FUNCTION set_booking_number();

-- ============================================================================
-- VERIFY DATA
-- ============================================================================

SELECT '========================================' as separator;
SELECT 'DATA SUMMARY' as info;
SELECT '========================================' as separator;

SELECT 
    'Tiers' as table_name,
    COUNT(*) as count,
    'ID range: ' || MIN(id)::TEXT || ' - ' || MAX(id)::TEXT as id_range
FROM tiers
UNION ALL
SELECT 
    'Zones',
    COUNT(*),
    'ID range: ' || MIN(id)::TEXT || ' - ' || MAX(id)::TEXT
FROM zones
UNION ALL
SELECT 
    'Seats',
    COUNT(*),
    'ID range: ' || MIN(id)::TEXT || ' - ' || MAX(id)::TEXT
FROM seats
UNION ALL
SELECT 
    'Access Codes',
    COUNT(*),
    'ID range: ' || MIN(id)::TEXT || ' - ' || MAX(id)::TEXT
FROM access_codes
UNION ALL
SELECT 
    'Gates',
    COUNT(*),
    'ID range: ' || MIN(id)::TEXT || ' - ' || MAX(id)::TEXT
FROM gates;

SELECT '========================================' as separator;
SELECT 'TIER DATA (Simple IDs)' as section;
SELECT '========================================' as separator;

SELECT 
    id,
    code,
    name,
    level,
    price,
    color 
FROM tiers 
ORDER BY id;

SELECT '========================================' as separator;
SELECT 'SAMPLE ZONES (Simple IDs)' as section;
SELECT '========================================' as separator;

SELECT 
    z.id,
    z.code,
    z.name,
    t.code as tier_code,
    z.capacity
FROM zones z
JOIN tiers t ON z.tier_id = t.id
ORDER BY z.id
LIMIT 10;

SELECT '========================================' as separator;
SELECT 'SAMPLE SEATS (Readable Codes)' as section;
SELECT '========================================' as separator;

SELECT 
    s.id,
    s.code,
    s.row,
    s.number,
    t.code as tier_code,
    z.code as zone_code
FROM seats s
JOIN tiers t ON s.tier_id = t.id
JOIN zones z ON s.zone_id = z.id
ORDER BY s.id
LIMIT 20;

SELECT '========================================' as separator;
SELECT 'SAMPLE ACCESS CODES' as section;
SELECT '========================================' as separator;

SELECT 
    ac.id,
    ac.code,
    t.code as tier_code,
    t.name as tier_name,
    ac.is_used
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
ORDER BY ac.id
LIMIT 20;

SELECT '========================================' as separator;
SELECT '✅ Database with Simple IDs created!' as status;
SELECT '========================================' as separator;

-- Show ID comparison
SELECT '========================================' as separator;
SELECT 'ID COMPARISON' as section;
SELECT '========================================' as separator;

SELECT 
    'OLD (UUID)' as id_type,
    '11111111-1111-1111-1111-111111111111' as example,
    '36 characters' as length
UNION ALL
SELECT 
    'NEW (Integer)',
    '1',
    '1-10 characters';

SELECT '========================================' as separator;
SELECT 'BOOKING NUMBER FORMAT' as section;
SELECT '========================================' as separator;

SELECT 
    'Format' as field,
    'BK-YYYYMMDD-XXXX' as value
UNION ALL
SELECT 
    'Example',
    'BK-20250121-0001'
UNION ALL
SELECT 
    'Auto-generated',
    'Yes (via trigger)';
