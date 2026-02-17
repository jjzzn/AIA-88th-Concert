-- Enable Realtime for seats table
-- This allows real-time updates when seats are locked/unlocked/booked

-- Enable realtime for seats table
ALTER PUBLICATION supabase_realtime ADD TABLE seats;

-- Verify realtime is enabled
SELECT schemaname, tablename 
FROM pg_publication_tables 
WHERE pubname = 'supabase_realtime' 
AND tablename = 'seats';

-- Note: You may need to run this in Supabase SQL Editor
-- After running this, the seats table will broadcast changes in real-time
