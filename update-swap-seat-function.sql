-- Update swap_seat function to:
-- 1. Track swap_count and original_seat_id
-- 2. Allow unlimited swaps for admin
-- 3. Allow only 1 swap for customers (future feature)

DROP FUNCTION IF EXISTS swap_seat(VARCHAR, VARCHAR, VARCHAR, TEXT, TEXT, VARCHAR);

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
    v_current_swap_count INTEGER;
    v_original_seat_id VARCHAR(20);
BEGIN
    -- Get current seat info and swap count
    SELECT seat_id, booking_id, swap_count, original_seat_id 
    INTO v_old_seat_id, v_booking_id, v_current_swap_count, v_original_seat_id
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
    
    -- Set original_seat_id if this is the first swap
    IF v_original_seat_id IS NULL THEN
        v_original_seat_id := v_old_seat_id;
    END IF;
    
    -- Perform atomic swap
    BEGIN
        -- Update booking_seats with new seat and increment swap_count
        UPDATE booking_seats
        SET 
            seat_id = p_new_seat_id,
            swap_count = COALESCE(swap_count, 0) + 1,
            original_seat_id = v_original_seat_id
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
            admin_ip,
            status
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
            p_admin_ip,
            'success'
        ) RETURNING id INTO v_swap_history_id;
        
        RETURN QUERY SELECT TRUE, 'Seat swapped successfully'::TEXT, v_swap_history_id;
        
    EXCEPTION WHEN OTHERS THEN
        -- Log failed swap
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
            admin_ip,
            status,
            error_message
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
            p_admin_ip,
            'failed',
            SQLERRM
        );
        
        RETURN QUERY SELECT FALSE, ('Error: ' || SQLERRM)::TEXT, NULL::VARCHAR(20);
    END;
END;
$$ LANGUAGE plpgsql;

-- Grant execute permission
GRANT EXECUTE ON FUNCTION swap_seat TO anon, authenticated;

-- Function updated successfully!
-- The swap_seat function now:
-- 1. Updates seat_id to the new seat
-- 2. Increments swap_count
-- 3. Tracks original_seat_id
-- 4. Allows unlimited swaps for admin
-- 5. Logs all swaps in seat_swap_history

-- To test, use the Seat Swap Portal with a real admin user ID
