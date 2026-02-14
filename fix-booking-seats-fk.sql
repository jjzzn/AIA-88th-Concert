-- Fix foreign key relationship between booking_seats and seats

-- 1. Check if foreign key constraint exists
SELECT 
    tc.constraint_name, 
    tc.table_name, 
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
      AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
      AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY' 
  AND tc.table_name='booking_seats'
  AND kcu.column_name='seat_id';

-- 2. Drop existing constraint if it exists (with wrong type)
ALTER TABLE booking_seats DROP CONSTRAINT IF EXISTS booking_seats_seat_id_fkey;

-- 3. Recreate the foreign key constraint with correct types
ALTER TABLE booking_seats 
ADD CONSTRAINT booking_seats_seat_id_fkey 
FOREIGN KEY (seat_id) REFERENCES seats(id) ON DELETE CASCADE;

-- 4. Verify the constraint was created
SELECT 
    tc.constraint_name, 
    tc.table_name, 
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
      AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
      AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY' 
  AND tc.table_name='booking_seats'
  AND kcu.column_name='seat_id';
