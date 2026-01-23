-- Create seat_swap_history table for seat swap audit trail

-- Step 1: Create seat_swap_history table
CREATE TABLE IF NOT EXISTS seat_swap_history (
    id VARCHAR(20) PRIMARY KEY DEFAULT ('SWAP-' || UPPER(SUBSTRING(MD5(RANDOM()::TEXT) FROM 1 FOR 5))),
    booking_seat_id VARCHAR(20) NOT NULL REFERENCES booking_seats(id) ON DELETE CASCADE,
    booking_id VARCHAR(20) NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    old_seat_id VARCHAR(20) NOT NULL REFERENCES seats(id),
    new_seat_id VARCHAR(20) NOT NULL REFERENCES seats(id),
    old_tier_id VARCHAR(2) REFERENCES tiers(id),
    new_tier_id VARCHAR(2) REFERENCES tiers(id),
    swapped_by VARCHAR(20) NOT NULL REFERENCES admin_users(id),
    swapped_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    reason TEXT,
    admin_notes TEXT,
    admin_ip VARCHAR(45),
    status VARCHAR(20) DEFAULT 'success' CHECK (status IN ('success', 'failed', 'rollback')),
    error_message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_booking_id ON seat_swap_history(booking_id);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_booking_seat_id ON seat_swap_history(booking_seat_id);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_swapped_by ON seat_swap_history(swapped_by);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_swapped_at ON seat_swap_history(swapped_at);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_status ON seat_swap_history(status);

-- Step 3: Create detailed view for easy querying
CREATE OR REPLACE VIEW seat_swap_history_detailed AS
SELECT 
    ssh.id,
    ssh.booking_seat_id,
    ssh.booking_id,
    ssh.old_seat_id,
    ssh.new_seat_id,
    ssh.swapped_by,
    ssh.swapped_at,
    ssh.reason,
    ssh.admin_notes,
    ssh.admin_ip,
    ssh.status,
    ssh.error_message,
    -- Booking info
    b.email as booking_email,
    b.phone as booking_phone,
    -- Attendee info
    bs.first_name || ' ' || bs.last_name as attendee_name,
    bs.qr_token,
    -- Old seat info
    os.row as old_row,
    os.number as old_number,
    oz.name as old_zone,
    ot.name as old_tier,
    -- New seat info
    ns.row as new_row,
    ns.number as new_number,
    nz.name as new_zone,
    nt.name as new_tier,
    -- Admin info
    au.full_name as admin_name,
    au.username as admin_username
FROM seat_swap_history ssh
LEFT JOIN booking_seats bs ON ssh.booking_seat_id = bs.id
LEFT JOIN bookings b ON ssh.booking_id = b.id
LEFT JOIN seats os ON ssh.old_seat_id = os.id
LEFT JOIN seats ns ON ssh.new_seat_id = ns.id
LEFT JOIN zones oz ON os.zone_id = oz.id
LEFT JOIN zones nz ON ns.zone_id = nz.id
LEFT JOIN tiers ot ON ssh.old_tier_id = ot.id
LEFT JOIN tiers nt ON ssh.new_tier_id = nt.id
LEFT JOIN admin_users au ON ssh.swapped_by = au.id
ORDER BY ssh.swapped_at DESC;

-- Verification
SELECT 'seat_swap_history table created successfully' as status;
