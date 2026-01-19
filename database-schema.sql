-- AIA Concert Ticket Booking System Database Schema

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tiers Table (VIP, Premium, Standard, etc.)
CREATE TABLE IF NOT EXISTS tiers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    level VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Zones Table (Seating zones within each tier)
CREATE TABLE IF NOT EXISTS zones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    tier_id UUID NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    capacity INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Seats Table
CREATE TABLE IF NOT EXISTS seats (
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
CREATE TABLE IF NOT EXISTS access_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(50) UNIQUE NOT NULL,
    tier_id UUID NOT NULL REFERENCES tiers(id) ON DELETE CASCADE,
    is_used BOOLEAN DEFAULT FALSE,
    used_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS bookings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'confirmed',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Booking Seats Table (Links bookings to seats with attendee info)
CREATE TABLE IF NOT EXISTS booking_seats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    seat_id UUID NOT NULL REFERENCES seats(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(booking_id, seat_id)
);

-- Booking Codes Table (Links bookings to access codes used)
CREATE TABLE IF NOT EXISTS booking_codes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    code_id UUID NOT NULL REFERENCES access_codes(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(booking_id, code_id)
);

-- Indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_seats_tier_id ON seats(tier_id);
CREATE INDEX IF NOT EXISTS idx_seats_zone_id ON seats(zone_id);
CREATE INDEX IF NOT EXISTS idx_seats_is_booked ON seats(is_booked);
CREATE INDEX IF NOT EXISTS idx_access_codes_code ON access_codes(code);
CREATE INDEX IF NOT EXISTS idx_access_codes_tier_id ON access_codes(tier_id);
CREATE INDEX IF NOT EXISTS idx_access_codes_is_used ON access_codes(is_used);
CREATE INDEX IF NOT EXISTS idx_bookings_email ON bookings(email);
CREATE INDEX IF NOT EXISTS idx_booking_seats_booking_id ON booking_seats(booking_id);
CREATE INDEX IF NOT EXISTS idx_booking_codes_booking_id ON booking_codes(booking_id);

-- Sample Data (Optional - for testing)

-- Insert sample tiers
INSERT INTO tiers (id, name, level, price, color, description) VALUES
    ('11111111-1111-1111-1111-111111111111', 'VIP', 'Premium Plus', 5000.00, '#FFD700', 'VIP seating with exclusive benefits'),
    ('22222222-2222-2222-2222-222222222222', 'Premium', 'Premium', 3000.00, '#C0C0C0', 'Premium seating with great view'),
    ('33333333-3333-3333-3333-333333333333', 'Standard', 'Standard', 1500.00, '#CD7F32', 'Standard seating')
ON CONFLICT (id) DO NOTHING;

-- Insert sample zones
INSERT INTO zones (name, tier_id, capacity) VALUES
    ('VIP Zone A', '11111111-1111-1111-1111-111111111111', 50),
    ('VIP Zone B', '11111111-1111-1111-1111-111111111111', 50),
    ('Premium Zone A', '22222222-2222-2222-2222-222222222222', 100),
    ('Premium Zone B', '22222222-2222-2222-2222-222222222222', 100),
    ('Standard Zone A', '33333333-3333-3333-3333-333333333333', 200),
    ('Standard Zone B', '33333333-3333-3333-3333-333333333333', 200)
ON CONFLICT DO NOTHING;

-- Insert sample access codes
INSERT INTO access_codes (code, tier_id) VALUES
    ('VIP2024-001', '11111111-1111-1111-1111-111111111111'),
    ('VIP2024-002', '11111111-1111-1111-1111-111111111111'),
    ('PREMIUM2024-001', '22222222-2222-2222-2222-222222222222'),
    ('PREMIUM2024-002', '22222222-2222-2222-2222-222222222222'),
    ('STANDARD2024-001', '33333333-3333-3333-3333-333333333333'),
    ('STANDARD2024-002', '33333333-3333-3333-3333-333333333333')
ON CONFLICT (code) DO NOTHING;

-- Note: You'll need to generate seats based on your venue layout
-- Example seat generation for one zone:
-- DO $$
-- DECLARE
--     zone_id UUID := (SELECT id FROM zones WHERE name = 'VIP Zone A' LIMIT 1);
--     tier_id UUID := (SELECT tier_id FROM zones WHERE id = zone_id);
-- BEGIN
--     FOR row_letter IN 65..69 LOOP -- A to E
--         FOR seat_num IN 1..10 LOOP
--             INSERT INTO seats (row, number, tier_id, zone_id)
--             VALUES (CHR(row_letter), seat_num, tier_id, zone_id)
--             ON CONFLICT DO NOTHING;
--         END LOOP;
--     END LOOP;
-- END $$;
