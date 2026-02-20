-- Create admin_managers table for ticket management system
-- This is separate from the staff table (used for check-ins)

-- Create sequence for admin_managers IDs first
CREATE SEQUENCE IF NOT EXISTS admin_managers_id_seq START WITH 1;

-- Create admin_managers table
CREATE TABLE IF NOT EXISTS admin_managers (
    id VARCHAR(20) PRIMARY KEY DEFAULT ('MGR-' || LPAD(nextval('admin_managers_id_seq')::TEXT, 5, '0')),
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    role VARCHAR(20) DEFAULT 'manager' CHECK (role IN ('manager', 'superadmin')),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP WITH TIME ZONE
);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_admin_managers_username ON admin_managers(username);
CREATE INDEX IF NOT EXISTS idx_admin_managers_is_active ON admin_managers(is_active);

-- Add comments
COMMENT ON TABLE admin_managers IS 'Admin users for ticket management system (separate from staff check-in users)';
COMMENT ON COLUMN admin_managers.id IS 'Manager ID in format MGR-XXXXX';
COMMENT ON COLUMN admin_managers.username IS 'Unique username for login';
COMMENT ON COLUMN admin_managers.password_hash IS 'Bcrypt hashed password';
COMMENT ON COLUMN admin_managers.role IS 'manager or superadmin';

-- Insert sample admin manager (password: admin123 - CHANGE IN PRODUCTION!)
-- Note: This is a placeholder hash. In production, use bcrypt to hash passwords properly
INSERT INTO admin_managers (username, password_hash, full_name, email, role) VALUES
('admin', '$2a$10$YourHashedPasswordHere', 'Admin Manager', 'admin@aia.com', 'superadmin')
ON CONFLICT (username) DO NOTHING;

-- Create admin_manager_sessions table for session management
CREATE TABLE IF NOT EXISTS admin_manager_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    manager_id VARCHAR(20) NOT NULL REFERENCES admin_managers(id) ON DELETE CASCADE,
    session_token VARCHAR(255) UNIQUE NOT NULL,
    ip_address VARCHAR(50),
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    last_activity TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create index for session lookups
CREATE INDEX IF NOT EXISTS idx_admin_manager_sessions_token ON admin_manager_sessions(session_token);
CREATE INDEX IF NOT EXISTS idx_admin_manager_sessions_manager_id ON admin_manager_sessions(manager_id);

-- Verify
SELECT 'Admin managers table created successfully' as status;
