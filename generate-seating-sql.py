#!/usr/bin/env python3
"""
Generate SQL migration script from concert_seating_final_verified.json
This script analyzes the JSON seating data and creates a comprehensive SQL migration
"""

import json
from collections import defaultdict

# Read the JSON file
with open('concert_seating_final_verified.json', 'r') as f:
    content = f.read()
    # Remove the export statement if present
    if content.startswith('export const rawSeatData ='):
        content = content.replace('export const rawSeatData =', '').strip()
        if content.endswith(';'):
            content = content[:-1]
    data = json.loads(content)

# Analyze the data structure
zones_by_level = defaultdict(lambda: defaultdict(set))
zone_capacities = defaultdict(int)
zone_rows = defaultdict(set)
zone_seat_ranges = defaultdict(lambda: {'min': float('inf'), 'max': 0})

for seat in data:
    level = seat['level']
    zone = seat['zone']
    row = seat['row']
    number = int(seat['number'])
    
    zones_by_level[level][zone].add(row)
    zone_capacities[f"{level}_{zone}"] += 1
    zone_rows[f"{level}_{zone}"].add(row)
    
    key = f"{level}_{zone}"
    if number < zone_seat_ranges[key]['min']:
        zone_seat_ranges[key]['min'] = number
    if number > zone_seat_ranges[key]['max']:
        zone_seat_ranges[key]['max'] = number

# Print analysis
print("=" * 80)
print("SEATING DATA ANALYSIS")
print("=" * 80)

for level in sorted(zones_by_level.keys()):
    print(f"\n{level}:")
    for zone in sorted(zones_by_level[level].keys()):
        key = f"{level}_{zone}"
        rows = sorted(zones_by_level[level][zone])
        capacity = zone_capacities[key]
        seat_range = zone_seat_ranges[key]
        print(f"  {zone}: {capacity} seats, rows {rows[0]}-{rows[-1]} ({len(rows)} rows), seats {seat_range['min']}-{seat_range['max']}")

# Generate SQL script
sql_output = []

sql_output.append("""-- AIA 88th Concert - Complete Seating Layout
-- Generated from concert_seating_final_verified.json
-- Run this script in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop the view that depends on seats.row column
DROP VIEW IF EXISTS seat_swap_history_detailed CASCADE;

-- Ensure row column can handle 2-character row names (AA, AB, etc.)
DO $$ 
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'seats' AND column_name = 'row' 
        AND character_maximum_length < 10
    ) THEN
        ALTER TABLE seats ALTER COLUMN row TYPE VARCHAR(10);
    END IF;
END $$;

-- Add level column to zones if not exists
ALTER TABLE zones ADD COLUMN IF NOT EXISTS level INTEGER DEFAULT 1;

-- Recreate the view after altering the column
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
    b.email as booking_email,
    b.phone as booking_phone,
    bs.first_name || ' ' || bs.last_name as attendee_name,
    bs.qr_token,
    os.row as old_row,
    os.number as old_number,
    oz.name as old_zone,
    ot.name as old_tier,
    ns.row as new_row,
    ns.number as new_number,
    nz.name as new_zone,
    nt.name as new_tier,
    b.booking_number
FROM seat_swap_history ssh
LEFT JOIN booking_seats bs ON ssh.booking_seat_id = bs.id
LEFT JOIN bookings b ON ssh.booking_id = b.id
LEFT JOIN seats os ON ssh.old_seat_id = os.id
LEFT JOIN zones oz ON os.zone_id = oz.id
LEFT JOIN tiers ot ON os.tier_id = ot.id
LEFT JOIN seats ns ON ssh.new_seat_id = ns.id
LEFT JOIN zones nz ON ns.zone_id = nz.id
LEFT JOIN tiers nt ON ns.tier_id = nt.id;

-- Clear existing seats and zones
DELETE FROM seats;
DELETE FROM zones;

""")

# Define tier mapping based on level
tier_mapping = {
    'Level 1': '11111111-1111-1111-1111-111111111111',  # Platinum
    'Level 2': '22222222-2222-2222-2222-222222222222',  # Gold
    'Level 3': '66666666-6666-6666-6666-666666666666',  # Silver
}

level_numbers = {
    'Level 1': 1,
    'Level 2': 2,
    'Level 3': 3,
}

# Generate zone UUIDs and insert statements
sql_output.append("-- Insert Zones\n")
sql_output.append("INSERT INTO zones (id, name, tier_id, capacity, level) VALUES\n")

zone_inserts = []
zone_uuid_map = {}

for level in sorted(zones_by_level.keys()):
    tier_id = tier_mapping[level]
    level_num = level_numbers[level]
    
    for zone in sorted(zones_by_level[level].keys()):
        key = f"{level}_{zone}"
        capacity = zone_capacities[key]
        
        # Generate UUID for zone
        zone_uuid = f"z{level_num}{ord(zone[0]):02d}{ord(zone[-1]) if len(zone) > 1 else 0:02d}{'0' * 26}"[:36]
        zone_uuid = zone_uuid[:8] + '-' + zone_uuid[8:12] + '-' + zone_uuid[12:16] + '-' + zone_uuid[16:20] + '-' + zone_uuid[20:32]
        zone_uuid_map[key] = zone_uuid
        
        zone_inserts.append(f"    ('{zone_uuid}', '{zone}', '{tier_id}', {capacity}, {level_num})")

sql_output.append(",\n".join(zone_inserts) + ";\n\n")

# Generate seat insert statements by zone
sql_output.append("-- Insert Seats by Zone\n\n")

for level in sorted(zones_by_level.keys()):
    tier_id = tier_mapping[level]
    
    for zone in sorted(zones_by_level[level].keys()):
        key = f"{level}_{zone}"
        zone_uuid = zone_uuid_map[key]
        
        # Get all seats for this zone
        zone_seats = [s for s in data if s['level'] == level and s['zone'] == zone]
        
        # Group by row
        rows_dict = defaultdict(list)
        for seat in zone_seats:
            rows_dict[seat['row']].append(int(seat['number']))
        
        sql_output.append(f"-- {level} - Zone {zone}: {len(zone_seats)} seats\n")
        sql_output.append(f"DO $$\n")
        sql_output.append(f"DECLARE\n")
        sql_output.append(f"    zone_id UUID := '{zone_uuid}';\n")
        sql_output.append(f"    tier_id UUID := '{tier_id}';\n")
        
        # Generate row arrays
        for row_name in sorted(rows_dict.keys()):
            seat_numbers = sorted(rows_dict[row_name])
            sql_output.append(f"    row_{row_name}_seats INTEGER[] := ARRAY{seat_numbers};\n")
        
        sql_output.append(f"    seat_num INTEGER;\n")
        sql_output.append(f"BEGIN\n")
        
        # Insert seats for each row
        for row_name in sorted(rows_dict.keys()):
            sql_output.append(f"    -- Row {row_name}\n")
            sql_output.append(f"    FOREACH seat_num IN ARRAY row_{row_name}_seats LOOP\n")
            sql_output.append(f"        INSERT INTO seats (row, number, tier_id, zone_id, is_booked)\n")
            sql_output.append(f"        VALUES ('{row_name}', seat_num, tier_id, zone_id, FALSE);\n")
            sql_output.append(f"    END LOOP;\n\n")
        
        sql_output.append(f"END $$;\n\n")

# Add verification queries
sql_output.append("""
-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Verify seat counts per zone
SELECT 'ZONE SEAT COUNTS' as info;
SELECT 
    z.level,
    z.name as zone,
    COUNT(s.id) as seat_count,
    z.capacity as expected_capacity,
    CASE 
        WHEN COUNT(s.id) = z.capacity THEN '✓ CORRECT'
        ELSE '✗ MISMATCH'
    END as status
FROM zones z
LEFT JOIN seats s ON z.id = s.zone_id
GROUP BY z.level, z.name, z.capacity
ORDER BY z.level, z.name;

-- Total seats by level
SELECT 'TOTAL SEATS BY LEVEL' as info;
SELECT 
    z.level,
    COUNT(s.id) as total_seats
FROM zones z
LEFT JOIN seats s ON z.id = s.zone_id
GROUP BY z.level
ORDER BY z.level;

-- Grand total
SELECT 'GRAND TOTAL' as info;
SELECT COUNT(*) as total_seats FROM seats;
""")

# Write SQL file
with open('database-seating-from-json.sql', 'w') as f:
    f.write(''.join(sql_output))

print("\n" + "=" * 80)
print("SQL MIGRATION SCRIPT GENERATED: database-seating-from-json.sql")
print("=" * 80)
print(f"\nTotal seats in JSON: {len(data)}")
print(f"Total zones: {len(zone_uuid_map)}")
print("\nRun this SQL script in Supabase SQL Editor to populate the database.")
