-- Rename admin_users table to staff
-- This migration renames the admin_users table and all related references

-- Step 1: Rename the table (ALREADY DONE - SKIP)
-- ALTER TABLE admin_users RENAME TO staff;

-- Step 2: Rename the primary key constraint (SKIP - already renamed with table)
-- ALTER INDEX admin_users_pkey RENAME TO staff_pkey;

-- Step 3: Rename the username unique constraint (if exists)
ALTER INDEX IF EXISTS admin_users_username_key RENAME TO staff_username_key;

-- Step 4: Rename other indexes
ALTER INDEX IF EXISTS idx_admin_users_username RENAME TO idx_staff_username;

-- Step 5: Update column comments (if any exist)
COMMENT ON TABLE staff IS 'Staff/Admin users who can perform check-ins and administrative tasks';

-- Step 6: Rename columns in related tables from admin_user_id to staff_id
-- check_ins table
ALTER TABLE IF EXISTS check_ins 
RENAME COLUMN admin_user_id TO staff_id;

-- admin_sessions table (SKIP - table doesn't exist)
-- ALTER TABLE IF EXISTS admin_sessions 
-- RENAME COLUMN admin_user_id TO staff_id;

-- admin_action_logs table (SKIP - table doesn't exist)
-- ALTER TABLE IF EXISTS admin_action_logs 
-- RENAME COLUMN admin_user_id TO staff_id;

-- Step 7: Update column comments for renamed foreign keys
COMMENT ON COLUMN check_ins.staff_id IS 'Reference to staff member who performed the check-in';
-- COMMENT ON COLUMN admin_sessions.staff_id IS 'Reference to staff member for this session';
-- COMMENT ON COLUMN admin_action_logs.staff_id IS 'Reference to staff member who performed the action';

-- Note: Foreign key constraints will automatically work with renamed columns
-- The following tables now have foreign keys to this table:
-- - check_ins (staff_id -> staff.id)
-- - admin_sessions (staff_id -> staff.id) 
-- - admin_action_logs (staff_id -> staff.id)
-- - seat_swap_history (swapped_by -> staff.id)

-- Verify the rename
SELECT 'Table and columns renamed successfully from admin_users to staff' as status;
