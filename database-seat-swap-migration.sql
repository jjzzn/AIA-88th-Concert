-- Migration: Add Seat Swap System
-- This migration adds support for seat swapping functionality with audit trail

-- Step 1: Ensure booking_seats.id is UUID (fix if needed)
-- Check and fix the id column type if it's not UUID
DO $$ 
BEGIN
    -- Check if id column is not UUID
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'booking_seats' 
        AND column_name = 'id' 
        AND data_type != 'uuid'
    ) THEN
        -- This should not happen in production, but just in case
        RAISE NOTICE 'Warning: booking_seats.id is not UUID type. Please fix manually.';
    END IF;
END $$;

-- Step 2: Add qr_token to booking_seats if not exists
ALTER TABLE booking_seats ADD COLUMN IF NOT EXISTS qr_token VARCHAR(50) UNIQUE;
ALTER TABLE booking_seats ADD COLUMN IF NOT EXISTS checked_in BOOLEAN DEFAULT FALSE;
ALTER TABLE booking_seats ADD COLUMN IF NOT EXISTS checked_in_at TIMESTAMP WITH TIME ZONE;

-- Step 3: Create seat_swap_history table for audit trail
CREATE TABLE IF NOT EXISTS seat_swap_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_seat_id UUID NOT NULL REFERENCES booking_seats(id) ON DELETE CASCADE,
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    old_seat_id UUID NOT NULL REFERENCES seats(id),
    new_seat_id UUID NOT NULL REFERENCES seats(id),
    swapped_by UUID NOT NULL REFERENCES admin_users(id),
    swapped_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    reason TEXT,
    admin_notes TEXT,
    admin_ip VARCHAR(45),
    status VARCHAR(20) DEFAULT 'success' CHECK (status IN ('success', 'failed', 'rollback')),
    error_message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_booking_seats_qr_token ON booking_seats(qr_token);
CREATE INDEX IF NOT EXISTS idx_booking_seats_checked_in ON booking_seats(checked_in);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_booking_id ON seat_swap_history(booking_id);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_booking_seat_id ON seat_swap_history(booking_seat_id);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_swapped_by ON seat_swap_history(swapped_by);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_swapped_at ON seat_swap_history(swapped_at);
CREATE INDEX IF NOT EXISTS idx_seat_swap_history_status ON seat_swap_history(status);

-- Step 4: Create function to generate unique QR token
CREATE OR REPLACE FUNCTION generate_qr_token()
RETURNS VARCHAR(50) AS $$
DECLARE
    new_token VARCHAR(50);
    token_exists BOOLEAN;
BEGIN
    LOOP
        -- Generate token in format: AIA-XXXXXX (6 random digits)
        new_token := 'AIA-' || LPAD(FLOOR(RANDOM() * 1000000)::TEXT, 6, '0');
        
        -- Check if token already exists
        SELECT EXISTS(SELECT 1 FROM booking_seats WHERE qr_token = new_token) INTO token_exists;
        
        -- Exit loop if token is unique
        EXIT WHEN NOT token_exists;
    END LOOP;
    
    RETURN new_token;
END;
$$ LANGUAGE plpgsql;

-- Step 5: Update existing booking_seats with QR tokens if they don't have one
UPDATE booking_seats 
SET qr_token = generate_qr_token()
WHERE qr_token IS NULL;

-- Step 6: Make qr_token NOT NULL after populating
ALTER TABLE booking_seats ALTER COLUMN qr_token SET NOT NULL;

-- Step 7: Create function for atomic seat swap
CREATE OR REPLACE FUNCTION swap_seat(
    p_booking_seat_id UUID,
    p_new_seat_id UUID,
    p_admin_user_id UUID,
    p_reason TEXT DEFAULT NULL,
    p_admin_notes TEXT DEFAULT NULL,
    p_admin_ip VARCHAR(45) DEFAULT NULL
)
RETURNS TABLE(
    success BOOLEAN,
    message TEXT,
    swap_history_id UUID
) AS $$
DECLARE
    v_old_seat_id UUID;
    v_booking_id UUID;
    v_new_seat_booked BOOLEAN;
    v_swap_history_id UUID;
    v_old_tier_id UUID;
    v_new_tier_id UUID;
BEGIN
    -- Get current seat info
    SELECT seat_id, booking_id INTO v_old_seat_id, v_booking_id
    FROM booking_seats
    WHERE id = p_booking_seat_id;
    
    -- Check if booking_seat exists
    IF v_old_seat_id IS NULL THEN
        RETURN QUERY SELECT FALSE, 'Booking seat not found'::TEXT, NULL::UUID;
        RETURN;
    END IF;
    
    -- Check if trying to swap to the same seat
    IF v_old_seat_id = p_new_seat_id THEN
        RETURN QUERY SELECT FALSE, 'Cannot swap to the same seat'::TEXT, NULL::UUID;
        RETURN;
    END IF;
    
    -- Check if new seat is available
    SELECT is_booked INTO v_new_seat_booked
    FROM seats
    WHERE id = p_new_seat_id;
    
    IF v_new_seat_booked IS NULL THEN
        RETURN QUERY SELECT FALSE, 'New seat not found'::TEXT, NULL::UUID;
        RETURN;
    END IF;
    
    IF v_new_seat_booked = TRUE THEN
        RETURN QUERY SELECT FALSE, 'New seat is already booked'::TEXT, NULL::UUID;
        RETURN;
    END IF;
    
    -- Get tier IDs for validation
    SELECT tier_id INTO v_old_tier_id FROM seats WHERE id = v_old_seat_id;
    SELECT tier_id INTO v_new_tier_id FROM seats WHERE id = p_new_seat_id;
    
    -- Perform atomic swap
    BEGIN
        -- Update booking_seats with new seat (KEEP qr_token unchanged)
        UPDATE booking_seats
        SET seat_id = p_new_seat_id
        WHERE id = p_booking_seat_id;
        
        -- Update old seat status to available
        UPDATE seats
        SET is_booked = FALSE
        WHERE id = v_old_seat_id;
        
        -- Update new seat status to booked
        UPDATE seats
        SET is_booked = TRUE
        WHERE id = p_new_seat_id;
        
        -- Create audit log entry
        INSERT INTO seat_swap_history (
            booking_seat_id,
            booking_id,
            old_seat_id,
            new_seat_id,
            swapped_by,
            reason,
            admin_notes,
            admin_ip,
            status
        ) VALUES (
            p_booking_seat_id,
            v_booking_id,
            v_old_seat_id,
            p_new_seat_id,
            p_admin_user_id,
            p_reason,
            p_admin_notes,
            p_admin_ip,
            'success'
        ) RETURNING id INTO v_swap_history_id;
        
        RETURN QUERY SELECT TRUE, 'Seat swap successful'::TEXT, v_swap_history_id;
        
    EXCEPTION WHEN OTHERS THEN
        -- Log failed attempt
        INSERT INTO seat_swap_history (
            booking_seat_id,
            booking_id,
            old_seat_id,
            new_seat_id,
            swapped_by,
            reason,
            admin_notes,
            admin_ip,
            status,
            error_message
        ) VALUES (
            p_booking_seat_id,
            v_booking_id,
            v_old_seat_id,
            p_new_seat_id,
            p_admin_user_id,
            p_reason,
            p_admin_notes,
            p_admin_ip,
            'failed',
            SQLERRM
        ) RETURNING id INTO v_swap_history_id;
        
        RETURN QUERY SELECT FALSE, ('Swap failed: ' || SQLERRM)::TEXT, v_swap_history_id;
    END;
END;
$$ LANGUAGE plpgsql;

-- Step 8: Create view for easy seat swap history lookup
CREATE OR REPLACE VIEW seat_swap_history_detailed AS
SELECT 
    ssh.id,
    ssh.booking_seat_id,
    ssh.booking_id,
    b.email as booking_email,
    b.phone as booking_phone,
    bs.first_name || ' ' || bs.last_name as attendee_name,
    bs.qr_token,
    -- Old seat details
    os.row as old_row,
    os.number as old_number,
    oz.name as old_zone,
    ot.name as old_tier,
    -- New seat details
    ns.row as new_row,
    ns.number as new_number,
    nz.name as new_zone,
    nt.name as new_tier,
    -- Admin details
    au.full_name as admin_name,
    au.username as admin_username,
    ssh.swapped_at,
    ssh.reason,
    ssh.admin_notes,
    ssh.admin_ip,
    ssh.status,
    ssh.error_message
FROM seat_swap_history ssh
JOIN booking_seats bs ON ssh.booking_seat_id = bs.id
JOIN bookings b ON ssh.booking_id = b.id
JOIN seats os ON ssh.old_seat_id = os.id
JOIN seats ns ON ssh.new_seat_id = ns.id
JOIN zones oz ON os.zone_id = oz.id
JOIN zones nz ON ns.zone_id = nz.id
JOIN tiers ot ON os.tier_id = ot.id
JOIN tiers nt ON ns.tier_id = nt.id
JOIN admin_users au ON ssh.swapped_by = au.id
ORDER BY ssh.swapped_at DESC;

-- Step 9: Grant necessary permissions (adjust as needed)
-- GRANT SELECT, INSERT ON seat_swap_history TO authenticated;
-- GRANT EXECUTE ON FUNCTION swap_seat TO authenticated;

-- Verification queries
-- SELECT * FROM seat_swap_history_detailed LIMIT 10;
-- SELECT * FROM booking_seats WHERE qr_token IS NOT NULL LIMIT 5;
