-- Admin Tracking System (Fixed Version)
-- Run this in Supabase SQL Editor

-- Drop existing tables if they exist (to avoid conflicts)
DROP TABLE IF EXISTS admin_action_logs CASCADE;
DROP TABLE IF EXISTS admin_sessions CASCADE;
DROP TABLE IF EXISTS admin_users CASCADE;
DROP VIEW IF EXISTS admin_action_history CASCADE;

-- Admin Users Table
CREATE TABLE admin_users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'admin',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Admin Action Logs Table
CREATE TABLE admin_action_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    admin_user_id UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
    action_type VARCHAR(50) NOT NULL,
    booking_id UUID REFERENCES bookings(id) ON DELETE SET NULL,
    booking_seat_id UUID REFERENCES booking_seats(id) ON DELETE SET NULL,
    details JSONB,
    ip_address VARCHAR(50),
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Admin Sessions Table
CREATE TABLE admin_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    admin_user_id UUID NOT NULL REFERENCES admin_users(id) ON DELETE CASCADE,
    session_token VARCHAR(255) UNIQUE NOT NULL,
    ip_address VARCHAR(50),
    user_agent TEXT,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_activity_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Indexes
CREATE INDEX idx_admin_action_logs_admin_user_id ON admin_action_logs(admin_user_id);
CREATE INDEX idx_admin_action_logs_action_type ON admin_action_logs(action_type);
CREATE INDEX idx_admin_action_logs_created_at ON admin_action_logs(created_at);
CREATE INDEX idx_admin_sessions_admin_user_id ON admin_sessions(admin_user_id);
CREATE INDEX idx_admin_sessions_session_token ON admin_sessions(session_token);
CREATE INDEX idx_admin_sessions_expires_at ON admin_sessions(expires_at);

-- Insert sample admin users
-- IMPORTANT: Change these passwords in production!
-- These are placeholder hashes - you need to replace them with real bcrypt hashes
INSERT INTO admin_users (username, full_name, email, password_hash, role) VALUES
('admin1', 'Admin User 1', 'admin1@aia.com', '$2a$10$placeholder1', 'admin'),
('admin2', 'Admin User 2', 'admin2@aia.com', '$2a$10$placeholder2', 'admin'),
('superadmin', 'Super Admin', 'superadmin@aia.com', '$2a$10$placeholder3', 'superadmin');

-- Function to log admin actions
CREATE OR REPLACE FUNCTION log_admin_action(
    p_admin_user_id UUID,
    p_action_type VARCHAR(50),
    p_booking_id UUID DEFAULT NULL,
    p_booking_seat_id UUID DEFAULT NULL,
    p_details JSONB DEFAULT NULL,
    p_ip_address VARCHAR(50) DEFAULT NULL,
    p_user_agent TEXT DEFAULT NULL
)
RETURNS UUID AS $$
DECLARE
    v_log_id UUID;
BEGIN
    INSERT INTO admin_action_logs (
        admin_user_id,
        action_type,
        booking_id,
        booking_seat_id,
        details,
        ip_address,
        user_agent
    ) VALUES (
        p_admin_user_id,
        p_action_type,
        p_booking_id,
        p_booking_seat_id,
        p_details,
        p_ip_address,
        p_user_agent
    ) RETURNING id INTO v_log_id;
    
    RETURN v_log_id;
END;
$$ LANGUAGE plpgsql;

-- Function to create admin session
CREATE OR REPLACE FUNCTION create_admin_session(
    p_admin_user_id UUID,
    p_session_token VARCHAR(255),
    p_ip_address VARCHAR(50) DEFAULT NULL,
    p_user_agent TEXT DEFAULT NULL,
    p_expires_in_hours INTEGER DEFAULT 24
)
RETURNS UUID AS $$
DECLARE
    v_session_id UUID;
BEGIN
    INSERT INTO admin_sessions (
        admin_user_id,
        session_token,
        ip_address,
        user_agent,
        expires_at
    ) VALUES (
        p_admin_user_id,
        p_session_token,
        p_ip_address,
        p_user_agent,
        NOW() + (p_expires_in_hours || ' hours')::INTERVAL
    ) RETURNING id INTO v_session_id;
    
    RETURN v_session_id;
END;
$$ LANGUAGE plpgsql;

-- Function to validate admin session
CREATE OR REPLACE FUNCTION validate_admin_session(p_session_token VARCHAR(255))
RETURNS TABLE(
    admin_user_id UUID,
    username VARCHAR(100),
    full_name VARCHAR(200),
    email VARCHAR(255),
    role VARCHAR(50),
    is_valid BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        au.id,
        au.username,
        au.full_name,
        au.email,
        au.role,
        (s.expires_at > NOW() AND au.is_active) as is_valid
    FROM admin_sessions s
    JOIN admin_users au ON s.admin_user_id = au.id
    WHERE s.session_token = p_session_token;
    
    -- Update last activity
    UPDATE admin_sessions 
    SET last_activity_at = NOW() 
    WHERE session_token = p_session_token;
END;
$$ LANGUAGE plpgsql;

-- View for admin action history
CREATE OR REPLACE VIEW admin_action_history AS
SELECT 
    aal.id,
    aal.action_type,
    au.username,
    au.full_name as admin_name,
    aal.booking_id,
    aal.booking_seat_id,
    bs.first_name || ' ' || bs.last_name as attendee_name,
    aal.details,
    aal.ip_address,
    aal.created_at
FROM admin_action_logs aal
JOIN admin_users au ON aal.admin_user_id = au.id
LEFT JOIN bookings b ON aal.booking_id = b.id
LEFT JOIN booking_seats bs ON aal.booking_seat_id = bs.id
ORDER BY aal.created_at DESC;
