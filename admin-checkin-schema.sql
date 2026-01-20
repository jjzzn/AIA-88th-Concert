-- ============================================================================
-- Admin Check-in System Schema
-- ============================================================================
-- Tables: admin_users, check_ins, gates
-- ============================================================================

BEGIN;

-- Gates Table (ประตูต่างๆ ของงาน)
CREATE TABLE IF NOT EXISTS gates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Admin Users Table (เจ้าหน้าที่ที่ประตูต่างๆ)
CREATE TABLE IF NOT EXISTS admin_users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    gate_id UUID REFERENCES gates(id) ON DELETE SET NULL,
    role VARCHAR(50) DEFAULT 'staff',
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP WITH TIME ZONE
);

-- Check-ins Table (บันทึกการ check-in)
CREATE TABLE IF NOT EXISTS check_ins (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_seat_id UUID NOT NULL REFERENCES booking_seats(id) ON DELETE CASCADE,
    admin_user_id UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
    gate_id UUID NOT NULL REFERENCES gates(id) ON DELETE CASCADE,
    checked_in_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    UNIQUE(booking_seat_id)
);

-- Add index for faster queries
CREATE INDEX IF NOT EXISTS idx_check_ins_booking_seat ON check_ins(booking_seat_id);
CREATE INDEX IF NOT EXISTS idx_check_ins_admin_user ON check_ins(admin_user_id);
CREATE INDEX IF NOT EXISTS idx_check_ins_gate ON check_ins(gate_id);
CREATE INDEX IF NOT EXISTS idx_check_ins_checked_in_at ON check_ins(checked_in_at);

-- Insert default gates
INSERT INTO gates (id, name, code, description) VALUES
    ('a1111111-1111-1111-1111-111111111111', 'Main Entrance', 'MAIN', 'ประตูหลัก'),
    ('a2222222-2222-2222-2222-222222222222', 'VIP Entrance', 'VIP', 'ประตู VIP'),
    ('a3333333-3333-3333-3333-333333333333', 'Side Entrance A', 'SIDE-A', 'ประตูด้านข้าง A'),
    ('a4444444-4444-4444-4444-444444444444', 'Side Entrance B', 'SIDE-B', 'ประตูด้านข้าง B')
ON CONFLICT (id) DO NOTHING;

-- Insert default admin users (password: admin123)
-- Note: In production, use proper password hashing with bcrypt
INSERT INTO admin_users (id, username, password_hash, full_name, gate_id, role) VALUES
    ('b1111111-1111-1111-1111-111111111111', 'admin', '$2a$10$rKzE8qxGxqxGxqxGxqxGxO8qxGxqxGxqxGxqxGxqxGxqxGxqxGxqx', 'Admin User', NULL, 'admin'),
    ('b2222222-2222-2222-2222-222222222222', 'staff_main', '$2a$10$rKzE8qxGxqxGxqxGxqxGxO8qxGxqxGxqxGxqxGxqxGxqxGxqxGxqx', 'Staff Main Gate', 'a1111111-1111-1111-1111-111111111111', 'staff'),
    ('b3333333-3333-3333-3333-333333333333', 'staff_vip', '$2a$10$rKzE8qxGxqxGxqxGxqxGxO8qxGxqxGxqxGxqxGxqxGxqxGxqxGxqx', 'Staff VIP Gate', 'a2222222-2222-2222-2222-222222222222', 'staff')
ON CONFLICT (id) DO NOTHING;

COMMIT;

-- ============================================================================
-- Useful Queries
-- ============================================================================

-- Get total check-ins
-- SELECT COUNT(*) as total_checked_in FROM check_ins;

-- Get check-ins by tier
-- SELECT t.name as tier_name, COUNT(ci.id) as count
-- FROM check_ins ci
-- JOIN booking_seats bs ON ci.booking_seat_id = bs.id
-- JOIN seats s ON bs.seat_id = s.id
-- JOIN tiers t ON s.tier_id = t.id
-- GROUP BY t.name, t.level
-- ORDER BY t.level;

-- Get recent check-ins
-- SELECT 
--     bs.first_name || ' ' || bs.last_name as attendee_name,
--     t.name as tier_name,
--     s.row || s.number as seat,
--     ci.checked_in_at,
--     au.full_name as staff_name
-- FROM check_ins ci
-- JOIN booking_seats bs ON ci.booking_seat_id = bs.id
-- JOIN seats s ON bs.seat_id = s.id
-- JOIN tiers t ON s.tier_id = t.id
-- JOIN admin_users au ON ci.admin_user_id = au.id
-- ORDER BY ci.checked_in_at DESC
-- LIMIT 10;
