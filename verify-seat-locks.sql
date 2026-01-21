-- Quick verification script to check if seat locking system is installed

SELECT '========================================' as separator;
SELECT 'CHECKING SEAT LOCKING SYSTEM' as status;
SELECT '========================================' as separator;

-- Check if locked_until and locked_by columns exist
SELECT 
    'Checking columns...' as step,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM information_schema.columns 
            WHERE table_name = 'seats' 
            AND column_name = 'locked_until'
        ) THEN '✅ locked_until exists'
        ELSE '❌ locked_until NOT FOUND - Need to run database-add-seat-locks.sql'
    END as locked_until_status,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM information_schema.columns 
            WHERE table_name = 'seats' 
            AND column_name = 'locked_by'
        ) THEN '✅ locked_by exists'
        ELSE '❌ locked_by NOT FOUND - Need to run database-add-seat-locks.sql'
    END as locked_by_status;

-- Check if functions exist
SELECT 
    'Checking functions...' as step,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM pg_proc 
            WHERE proname = 'lock_seats'
        ) THEN '✅ lock_seats() exists'
        ELSE '❌ lock_seats() NOT FOUND - Need to run database-add-seat-locks.sql'
    END as lock_seats_status,
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM pg_proc 
            WHERE proname = 'check_seats_available'
        ) THEN '✅ check_seats_available() exists'
        ELSE '❌ check_seats_available() NOT FOUND - Need to run database-add-seat-locks.sql'
    END as check_available_status;

SELECT '========================================' as separator;
SELECT 'RESULT' as section;
SELECT '========================================' as separator;

SELECT 
    CASE 
        WHEN EXISTS (
            SELECT 1 
            FROM information_schema.columns 
            WHERE table_name = 'seats' 
            AND column_name IN ('locked_until', 'locked_by')
            HAVING COUNT(*) = 2
        ) AND EXISTS (
            SELECT 1 
            FROM pg_proc 
            WHERE proname IN ('lock_seats', 'check_seats_available')
            HAVING COUNT(*) >= 2
        ) THEN '✅ Seat locking system is INSTALLED'
        ELSE '❌ Seat locking system is NOT installed. Please run: database-add-seat-locks.sql'
    END as final_status;
