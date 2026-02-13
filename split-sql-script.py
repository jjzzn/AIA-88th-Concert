#!/usr/bin/env python3
"""
Split the large SQL file into smaller chunks for easier execution in Supabase
"""

# Read the SQL file
with open('database-seating-from-json.sql', 'r') as f:
    content = f.read()

# Split into parts
parts = []

# Part 1: Schema setup and zones
part1_end = content.find('-- Level 1 - Zone A1:')
part1 = content[:part1_end]
parts.append(('1-setup-and-zones', part1))

# Part 2: Level 1 seats
part2_start = part1_end
part2_end = content.find('-- Level 2 - Zone SB:')
part2 = content[part2_start:part2_end]
parts.append(('2-level1-seats', part2))

# Part 3: Level 2 seats
part3_start = part2_end
part3_end = content.find('-- Level 3 - Zone B:')
part3 = content[part3_start:part3_end]
parts.append(('3-level2-seats', part3))

# Part 4: Level 3 seats and verification
part4_start = part3_end
part4 = content[part4_start:]
parts.append(('4-level3-seats-and-verify', part4))

# Write parts to separate files
for i, (name, part_content) in enumerate(parts, 1):
    filename = f'database-seating-part{i}-{name}.sql'
    with open(filename, 'w') as f:
        f.write(part_content)
    print(f"Created: {filename} ({len(part_content.splitlines())} lines)")

print("\n✓ SQL script split into 4 parts")
print("\nRun these files in order in Supabase SQL Editor:")
for i, (name, _) in enumerate(parts, 1):
    print(f"  {i}. database-seating-part{i}-{name}.sql")
