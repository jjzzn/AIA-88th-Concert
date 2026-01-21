-- AIA Concert Ticket Booking System - Custom Readable IDs
-- Tier ID = Tier Code (PT, GD, PR, etc.)
-- Other IDs = TablePrefix + Random 5 chars (e.g., ZONE-A1B2C, SEAT-X9Y8Z)
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

-- Drop existing functions if they exist
DROP FUNCTION IF EXISTS generate_zone_id();
DROP FUNCTION IF EXISTS generate_seat_id();
DROP FUNCTION IF EXISTS generate_code_id();
DROP FUNCTION IF EXISTS generate_booking_id();
DROP FUNCTION IF EXISTS generate_bseat_id();
DROP FUNCTION IF EXISTS generate_bcode_id();
DROP FUNCTION IF EXISTS generate_gate_id();
DROP FUNCTION IF EXISTS generate_admin_id();
DROP FUNCTION IF EXISTS generate_checkin_id();

-- ============================================================================
-- HELPER FUNCTIONS: Generate Random IDs
-- ============================================================================

-- Generate random 5-character alphanumeric string (uppercase)
CREATE OR REPLACE FUNCTION random_id(length INTEGER DEFAULT 5)
RETURNS TEXT AS $$
DECLARE
    chars TEXT := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    result TEXT := '';
    i INTEGER;
BEGIN
    FOR i IN 1..length LOOP
        result := result || substr(chars, floor(random() * length(chars) + 1)::INTEGER, 1);
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- Zone ID generator
CREATE OR REPLACE FUNCTION generate_zone_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'ZONE-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM zones WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Seat ID generator
CREATE OR REPLACE FUNCTION generate_seat_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'SEAT-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM seats WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Access Code ID generator
CREATE OR REPLACE FUNCTION generate_code_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'CODE-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM access_codes WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Booking ID generator
CREATE OR REPLACE FUNCTION generate_booking_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'BOOK-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM bookings WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Booking Seat ID generator
CREATE OR REPLACE FUNCTION generate_bseat_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'BSEAT-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM booking_seats WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Booking Code ID generator
CREATE OR REPLACE FUNCTION generate_bcode_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'BCODE-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM booking_codes WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Gate ID generator
CREATE OR REPLACE FUNCTION generate_gate_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'GATE-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM gates WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Admin User ID generator
CREATE OR REPLACE FUNCTION generate_admin_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'ADMIN-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM admin_users WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Check-in ID generator
CREATE OR REPLACE FUNCTION generate_checkin_id()
RETURNS TEXT AS $$
DECLARE
    new_id TEXT;
BEGIN
    LOOP
        new_id := 'CHECKIN-' || random_id(5);
        EXIT WHEN NOT EXISTS (SELECT 1 FROM check_ins WHERE id = new_id);
    END LOOP;
    RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- CREATE TABLES WITH CUSTOM IDs
-- ============================================================================

-- Tiers Table - ID is the tier code itself (PT, GD, PR, etc.)
CREATE TABLE tiers (
    id VARCHAR(2) PRIMARY KEY,  -- PT, GD, PR, VP, SV, AG, CL, OT
    name VARCHAR(100) NOT NULL,
    level VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Zones Table - ID format: ZONE-XXXXX
CREATE TABLE zones (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_zone_id(),
    code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    tier_id VARCHAR(2) NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Seats Table - ID format: SEAT-XXXXX
CREATE TABLE seats (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_seat_id(),
    code VARCHAR(20) NOT NULL UNIQUE,
    row VARCHAR(10) NOT NULL,
    number INTEGER NOT NULL,
    tier_id VARCHAR(2) NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    zone_id VARCHAR(20) NOT NULL REFERENCES zones(id) ON DELETE CASCADE,
    is_booked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(zone_id, row, number)
);

-- Access Codes Table - ID format: CODE-XXXXX
CREATE TABLE access_codes (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_code_id(),
    code VARCHAR(8) UNIQUE NOT NULL,
    tier_id VARCHAR(2) NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    is_used BOOLEAN DEFAULT FALSE,
    used_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Bookings Table - ID format: BOOK-XXXXX
CREATE TABLE bookings (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_booking_id(),
    booking_number VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    status VARCHAR(50) DEFAULT 'confirmed',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Booking Seats Table - ID format: BSEAT-XXXXX
CREATE TABLE booking_seats (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_bseat_id(),
    booking_id VARCHAR(20) NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    seat_id VARCHAR(20) NOT NULL REFERENCES seats(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    qr_token VARCHAR(255) UNIQUE,
    checked_in BOOLEAN DEFAULT FALSE,
    checked_in_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    note TEXT,
    UNIQUE(booking_id, seat_id)
);

-- Booking Codes Table - ID format: BCODE-XXXXX
CREATE TABLE booking_codes (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_bcode_id(),
    booking_id VARCHAR(20) NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    code_id VARCHAR(20) NOT NULL REFERENCES access_codes(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(booking_id, code_id)
);

-- Gates Table - ID format: GATE-XXXXX
CREATE TABLE gates (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_gate_id(),
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Admin Users Table - ID format: ADMIN-XXXXX
CREATE TABLE admin_users (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_admin_id(),
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    gate_id VARCHAR(20) REFERENCES gates(id),
    role VARCHAR(50) DEFAULT 'staff',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP WITH TIME ZONE
);

-- Check-ins Table - ID format: CHECKIN-XXXXX
CREATE TABLE check_ins (
    id VARCHAR(20) PRIMARY KEY DEFAULT generate_checkin_id(),
    booking_seat_id VARCHAR(20) NOT NULL UNIQUE REFERENCES booking_seats(id) ON DELETE CASCADE,
    admin_user_id VARCHAR(20) NOT NULL REFERENCES admin_users(id),
    gate_id VARCHAR(20) NOT NULL REFERENCES gates(id),
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
CREATE INDEX idx_zones_code ON zones(code);
CREATE INDEX idx_check_ins_booking_seat_id ON check_ins(booking_seat_id);
CREATE INDEX idx_check_ins_gate_id ON check_ins(gate_id);
CREATE INDEX idx_admin_users_username ON admin_users(username);
CREATE INDEX idx_gates_code ON gates(code);

-- ============================================================================
-- INSERT DATA - 8 TIERS (ID = Tier Code)
-- ============================================================================

INSERT INTO tiers (id, name, level, price, color, description) VALUES
    ('PT', 'PLATINUM', 'ELITE PLUS', 8500.00, '#E5E4E2', 'Platinum Elite - Front row with exclusive VIP lounge access'),
    ('GD', 'GOLD', 'PREMIUM PLUS', 6500.00, '#FFD700', 'Gold Premium - Premium seating with excellent stage view'),
    ('PR', 'PRESTIGE', 'PRESTIGE', 5800.00, '#B87333', 'Prestige Section - Distinguished seating with premium amenities'),
    ('VP', 'VIP', 'VIP', 5000.00, '#8B00FF', 'VIP Section - Special access with great acoustics'),
    ('SV', 'SILVER', 'PREMIUM', 4200.00, '#C0C0C0', 'Silver Premium - Comfortable seating with good view'),
    ('AG', 'AGENCY', 'STANDARD PLUS', 3500.00, '#708090', 'Agency Section - Quality seating for groups'),
    ('CL', 'CLASSIC', 'STANDARD', 2500.00, '#8B7355', 'Classic Section - Traditional concert experience'),
    ('OT', 'OTHER', 'BASIC', 1800.00, '#A9A9A9', 'Other Section - Budget-friendly option');

-- Insert Zones with custom IDs (ZONE-XXXXX)
INSERT INTO zones (code, name, tier_id, capacity) VALUES
    -- PLATINUM zones
    ('PT-A', 'ZONE PT-A', 'PT', 40),
    ('PT-B', 'ZONE PT-B', 'PT', 40),
    
    -- GOLD zones
    ('GD-A', 'ZONE GD-A', 'GD', 50),
    ('GD-B', 'ZONE GD-B', 'GD', 50),
    ('GD-C', 'ZONE GD-C', 'GD', 50),
    
    -- PRESTIGE zones
    ('PR-A', 'ZONE PR-A', 'PR', 60),
    ('PR-B', 'ZONE PR-B', 'PR', 60),
    
    -- VIP zones
    ('VP-A', 'ZONE VP-A', 'VP', 70),
    ('VP-B', 'ZONE VP-B', 'VP', 70),
    
    -- SILVER zones
    ('SV-A', 'ZONE SV-A', 'SV', 80),
    ('SV-B', 'ZONE SV-B', 'SV', 80),
    
    -- AGENCY zones
    ('AG-A', 'ZONE AG-A', 'AG', 100),
    ('AG-B', 'ZONE AG-B', 'AG', 100),
    
    -- CLASSIC zones
    ('CL-A', 'ZONE CL-A', 'CL', 120),
    ('CL-B', 'ZONE CL-B', 'CL', 120),
    
    -- OTHER zones
    ('OT-A', 'ZONE OT-A', 'OT', 150),
    ('OT-B', 'ZONE OT-B', 'OT', 150);

-- Generate Seats with readable codes (e.g., PT-A-A01)
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
    -- PLATINUM
    ('PT4K7M2N', 'PT'), ('PT9R3QT5', 'PT'), ('PT6F1XD7', 'PT'),
    ('PT2H8WP4', 'PT'), ('PT5L9VK3', 'PT'), ('PT7M4NK8', 'PT'),
    
    -- GOLD
    ('GD9R3QT5', 'GD'), ('GD7M4NK8', 'GD'), ('GD3P6RL2', 'GD'),
    ('GD8Q1TF9', 'GD'), ('GD4W7XJ6', 'GD'), ('GD2K5NH3', 'GD'),
    
    -- PRESTIGE
    ('PR2H8WP4', 'PR'), ('PR6F1XD7', 'PR'), ('PR9K4ML5', 'PR'),
    ('PR3N7QR2', 'PR'), ('PR8T2VW6', 'PR'), ('PR5J9LK1', 'PR'),
    
    -- VIP
    ('VP6F1XD7', 'VP'), ('VP2K9MP5', 'VP'), ('VP8N4QR3', 'VP'),
    ('VP5T7WL1', 'VP'), ('VP9H3VK8', 'VP'), ('VP4M6NJ2', 'VP'),
    
    -- SILVER
    ('SV5M9KR2', 'SV'), ('SV3M7NK2', 'SV'), ('SV8P4QL9', 'SV'),
    ('SV6R1TF5', 'SV'), ('SV2W9XJ7', 'SV'), ('SV7K5VL4', 'SV'),
    
    -- AGENCY
    ('AG8T4NH6', 'AG'), ('AG4N8MK3', 'AG'), ('AG9Q2RL6', 'AG'),
    ('AG5T7WF1', 'AG'), ('AG3X4JL8', 'AG'), ('AG8H6VK2', 'AG'),
    
    -- CLASSIC
    ('CL3Q7BV9', 'CL'), ('CL7M3NK9', 'CL'), ('CL2P8QL4', 'CL'),
    ('CL6R5TF1', 'CL'), ('CL9W1XJ7', 'CL'), ('CL4K7VL3', 'CL'),
    
    -- OTHER
    ('OT1Y5JC8', 'OT'), ('OT5N9MK2', 'OT'), ('OT3Q6RL8', 'OT'),
    ('OT8T2WF5', 'OT'), ('OT6X4JL1', 'OT'), ('OT2H8VK9', 'OT');

-- Insert Sample Gates
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
    next_id INTEGER;
BEGIN
    date_part := TO_CHAR(CURRENT_DATE, 'YYYYMMDD');
    
    SELECT COALESCE(MAX(CAST(SUBSTRING(booking_number FROM 12) AS INTEGER)), 0) + 1
    INTO next_id
    FROM bookings
    WHERE booking_number LIKE 'BK-' || date_part || '-%';
    
    sequence_part := LPAD(next_id::TEXT, 4, '0');
    
    RETURN 'BK-' || date_part || '-' || sequence_part;
END;
$$ LANGUAGE plpgsql;

-- Trigger to auto-generate booking number
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
SELECT 'DATA SUMMARY - CUSTOM IDs' as info;
SELECT '========================================' as separator;

SELECT 
    'Tiers' as table_name,
    COUNT(*) as count,
    'ID format: Tier Code (PT, GD, PR...)' as id_format
FROM tiers
UNION ALL
SELECT 
    'Zones',
    COUNT(*),
    'ID format: ZONE-XXXXX (5 random chars)'
FROM zones
UNION ALL
SELECT 
    'Seats',
    COUNT(*),
    'ID format: SEAT-XXXXX (5 random chars)'
FROM seats
UNION ALL
SELECT 
    'Access Codes',
    COUNT(*),
    'ID format: CODE-XXXXX (5 random chars)'
FROM access_codes
UNION ALL
SELECT 
    'Gates',
    COUNT(*),
    'ID format: GATE-XXXXX (5 random chars)'
FROM gates;

SELECT '========================================' as separator;
SELECT 'TIER DATA (ID = Tier Code)' as section;
SELECT '========================================' as separator;

SELECT 
    id as tier_id,
    name,
    level,
    price,
    color 
FROM tiers 
ORDER BY price DESC;

SELECT '========================================' as separator;
SELECT 'SAMPLE ZONES (Custom IDs)' as section;
SELECT '========================================' as separator;

SELECT 
    z.id as zone_id,
    z.code,
    z.name,
    z.tier_id,
    t.name as tier_name,
    z.capacity
FROM zones z
JOIN tiers t ON z.tier_id = t.id
ORDER BY z.tier_id, z.code
LIMIT 10;

SELECT '========================================' as separator;
SELECT 'SAMPLE SEATS (Custom IDs)' as section;
SELECT '========================================' as separator;

SELECT 
    s.id as seat_id,
    s.code as seat_code,
    s.row,
    s.number,
    s.tier_id,
    z.code as zone_code
FROM seats s
JOIN zones z ON s.zone_id = z.id
ORDER BY s.tier_id, s.zone_id, s.row, s.number
LIMIT 20;

SELECT '========================================' as separator;
SELECT 'SAMPLE ACCESS CODES (Custom IDs)' as section;
SELECT '========================================' as separator;

SELECT 
    ac.id as code_id,
    ac.code,
    ac.tier_id,
    t.name as tier_name,
    ac.is_used
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
ORDER BY ac.tier_id, ac.code
LIMIT 20;

SELECT '========================================' as separator;
SELECT '✅ Database with Custom IDs created!' as status;
SELECT '========================================' as separator;

-- Show ID format examples
SELECT '========================================' as separator;
SELECT 'ID FORMAT EXAMPLES' as section;
SELECT '========================================' as separator;

SELECT 
    'Tier ID' as id_type,
    'PT, GD, PR, VP...' as format,
    'Tier code itself' as description
UNION ALL
SELECT 
    'Zone ID',
    'ZONE-A1B2C',
    'ZONE- + 5 random chars'
UNION ALL
SELECT 
    'Seat ID',
    'SEAT-X9Y8Z',
    'SEAT- + 5 random chars'
UNION ALL
SELECT 
    'Booking ID',
    'BOOK-M3N4P',
    'BOOK- + 5 random chars'
UNION ALL
SELECT 
    'Code ID',
    'CODE-Q5R6S',
    'CODE- + 5 random chars'
UNION ALL
SELECT 
    'Gate ID',
    'GATE-T7U8V',
    'GATE- + 5 random chars'
UNION ALL
SELECT 
    'Admin ID',
    'ADMIN-W9X0Y',
    'ADMIN- + 5 random chars'
UNION ALL
SELECT 
    'Check-in ID',
    'CHECKIN-Z1A2B',
    'CHECKIN- + 5 random chars';
