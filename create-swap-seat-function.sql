-- Create swap_seat function for seat swapping feature

-- Drop old function if exists (with UUID parameters)
DROP FUNCTION IF EXISTS swap_seat(UUID, UUID, UUID, TEXT, TEXT, VARCHAR);

CREATE OR REPLACE FUNCTION swap_seat(
    p_booking_seat_id VARCHAR(20),
    p_new_seat_id VARCHAR(20),
    p_admin_user_id VARCHAR(20),
    p_reason TEXT DEFAULT NULL,
    p_admin_notes TEXT DEFAULT NULL,
    p_admin_ip VARCHAR(45) DEFAULT NULL
)
RETURNS TABLE(
    success BOOLEAN,
    message TEXT,
    swap_history_id VARCHAR(20)
) AS $$
DECLARE
    v_old_seat_id VARCHAR(20);
    v_booking_id VARCHAR(20);
    v_new_seat_booked BOOLEAN;
    v_swap_history_id VARCHAR(20);
    v_old_tier_id VARCHAR(2);
    v_new_tier_id VARCHAR(2);
BEGIN
    -- Get current seat info
    SELECT seat_id, booking_id INTO v_old_seat_id, v_booking_id
    FROM booking_seats
    WHERE id = p_booking_seat_id;
    
    -- Check if booking_seat exists
    IF v_old_seat_id IS NULL THEN
        RETURN QUERY SELECT FALSE, 'Booking seat not found'::TEXT, NULL::VARCHAR(20);
        RETURN;
    END IF;
    
    -- Check if trying to swap to the same seat
    IF v_old_seat_id = p_new_seat_id THEN
        RETURN QUERY SELECT FALSE, 'Cannot swap to the same seat'::TEXT, NULL::VARCHAR(20);
        RETURN;
    END IF;
    
    -- Check if new seat is available
    SELECT is_booked INTO v_new_seat_booked
    FROM seats
    WHERE id = p_new_seat_id;
    
    IF v_new_seat_booked IS NULL THEN
        RETURN QUERY SELECT FALSE, 'New seat not found'::TEXT, NULL::VARCHAR(20);
        RETURN;
    END IF;
    
    IF v_new_seat_booked = TRUE THEN
        RETURN QUERY SELECT FALSE, 'New seat is already booked'::TEXT, NULL::VARCHAR(20);
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
            old_tier_id,
            new_tier_id,
            swapped_by,
            reason,
            admin_notes,
            admin_ip
        ) VALUES (
            p_booking_seat_id,
            v_booking_id,
            v_old_seat_id,
            p_new_seat_id,
            v_old_tier_id,
            v_new_tier_id,
            p_admin_user_id,
            p_reason,
            p_admin_notes,
            p_admin_ip
        ) RETURNING id INTO v_swap_history_id;
        
        RETURN QUERY SELECT TRUE, 'Seat swapped successfully'::TEXT, v_swap_history_id;
        
    EXCEPTION WHEN OTHERS THEN
        RETURN QUERY SELECT FALSE, ('Error: ' || SQLERRM)::TEXT, NULL::VARCHAR(20);
    END;
END;
$$ LANGUAGE plpgsql;

-- Grant execute permission
GRANT EXECUTE ON FUNCTION swap_seat TO anon, authenticated;
