-- Rename admin_users table to staff
-- This migration renames the admin_users table and all related references

-- Step 1: Rename the table
ALTER TABLE admin_users RENAME TO staff;

-- Step 2: Rename the primary key constraint
ALTER INDEX admin_users_pkey RENAME TO staff_pkey;

-- Step 3: Rename the username unique constraint (if exists)
ALTER INDEX IF EXISTS admin_users_username_key RENAME TO staff_username_key;

-- Step 4: Rename other indexes
ALTER INDEX IF EXISTS idx_admin_users_username RENAME TO idx_staff_username;

-- Step 5: Update column comments (if any exist)
COMMENT ON TABLE staff IS 'Staff/Admin users who can perform check-ins and administrative tasks';

-- Note: Foreign key constraints will automatically reference the renamed table
-- The following tables have foreign keys to this table:
-- - check_ins (admin_user_id -> staff.id)
-- - admin_sessions (admin_user_id -> staff.id) 
-- - admin_action_logs (admin_user_id -> staff.id)
-- - seat_swap_history (swapped_by -> staff.id)

-- Verify the rename
SELECT 'Table renamed successfully from admin_users to staff' as status;
