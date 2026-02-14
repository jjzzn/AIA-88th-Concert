import fs from 'fs';

// Read the JSON file
const jsonContent = fs.readFileSync('./concert_seating_final_verified.json', 'utf8');

// Remove the export statement and parse
let jsonData = jsonContent.replace('export const rawSeatData =', '').trim();

// Remove trailing semicolon if exists
if (jsonData.endsWith(';')) {
  jsonData = jsonData.slice(0, -1);
}

// Try to parse, handling potential errors
let seats;
try {
  seats = JSON.parse(jsonData);
} catch (error) {
  console.error('JSON parsing error:', error.message);
  console.log('Trying to fix common issues...');
  
  // Try to extract just the array part
  const arrayMatch = jsonData.match(/\[[\s\S]*\]/);
  if (arrayMatch) {
    seats = JSON.parse(arrayMatch[0]);
  } else {
    throw error;
  }
}

console.log(`Total seats found: ${seats.length}`);

// Group by zone to get zone info
const zoneMap = new Map();
seats.forEach(seat => {
  const zoneName = `ZONE ${seat.zone}`;
  if (!zoneMap.has(zoneName)) {
    zoneMap.set(zoneName, {
      name: zoneName,
      code: seat.zone,
      level: seat.level,
      seats: []
    });
  }
  zoneMap.get(zoneName).seats.push(seat);
});

console.log(`\nZones found: ${zoneMap.size}`);
console.log('Zone breakdown:');
Array.from(zoneMap.entries()).forEach(([name, info]) => {
  console.log(`  ${name}: ${info.seats.length} seats`);
});

// Generate SQL with sequential IDs
let sql = `-- Import seats from JSON
-- Generated on ${new Date().toISOString()}

-- First, clear existing seats
DELETE FROM seats;

`;

let seatIdCounter = 1;

// Group seats by zone for batch inserts
zoneMap.forEach((zoneInfo, zoneName) => {
  sql += `\n-- ${zoneName} (${zoneInfo.seats.length} seats)\n`;
  
  // Group by row for better organization
  const rowMap = new Map();
  zoneInfo.seats.forEach(seat => {
    if (!rowMap.has(seat.row)) {
      rowMap.set(seat.row, []);
    }
    rowMap.get(seat.row).push(seat);
  });
  
  // Sort rows
  const sortedRows = Array.from(rowMap.keys()).sort();
  
  sortedRows.forEach(row => {
    const rowSeats = rowMap.get(row);
    // Sort seats by number
    rowSeats.sort((a, b) => parseInt(a.number) - parseInt(b.number));
    
    sql += `-- Row ${row} (${rowSeats.length} seats)\n`;
    
    // Generate batch INSERT with VALUES clause for better performance
    sql += `INSERT INTO seats (id, code, zone_id, tier_id, row, number, is_booked)\n`;
    sql += `SELECT v.id, v.code, z.id, z.tier_id, v.row, v.number, v.is_booked\n`;
    sql += `FROM (\n  VALUES\n`;
    
    const values = rowSeats.map(seat => {
      const seatId = `S${seatIdCounter.toString().padStart(6, '0')}`;
      // Generate code: zone_code-row-number (e.g., A1-AA-01)
      const zoneCode = zoneInfo.code;
      const seatCode = `${zoneCode}-${row}-${seat.number.toString().padStart(2, '0')}`;
      seatIdCounter++;
      return `    ('${seatId}', '${seatCode}', '${row}', ${seat.number}, false)`;
    }).join(',\n');
    
    sql += values;
    sql += `\n) AS v(id, code, row, number, is_booked)\n`;
    sql += `CROSS JOIN zones z\n`;
    sql += `WHERE z.name = '${zoneName}'\n`;
    sql += `AND NOT EXISTS (SELECT 1 FROM seats WHERE seats.code = v.code);\n\n`;
  });
});

// Split into multiple files if too large
const MAX_LINES_PER_FILE = 3000;
const lines = sql.split('\n');

if (lines.length > MAX_LINES_PER_FILE) {
  console.log(`\n📦 Splitting into multiple files (${lines.length} lines total)...`);
  
  // Write header file with DELETE
  const headerLines = lines.slice(0, 6); // Just the header and DELETE
  fs.writeFileSync('./import-seats-1-setup.sql', headerLines.join('\n'));
  console.log('✅ Created: import-seats-1-setup.sql (setup & delete)');
  
  // Split remaining content into chunks
  const contentLines = lines.slice(6);
  let fileNum = 2;
  let currentChunk = [];
  let currentZone = '';
  
  for (let i = 0; i < contentLines.length; i++) {
    const line = contentLines[i];
    currentChunk.push(line);
    
    // Track zone changes
    if (line.startsWith('-- ZONE ')) {
      currentZone = line;
    }
    
    // Write chunk when it reaches size limit or end of file
    if (currentChunk.length >= MAX_LINES_PER_FILE || i === contentLines.length - 1) {
      const filename = `./import-seats-${fileNum}-data.sql`;
      fs.writeFileSync(filename, currentChunk.join('\n'));
      console.log(`✅ Created: import-seats-${fileNum}-data.sql (${currentChunk.length} lines)`);
      fileNum++;
      currentChunk = [];
    }
  }
  
  console.log(`\n📋 Total files created: ${fileNum - 1}`);
  console.log('\n🚀 Run these files IN ORDER in Supabase SQL Editor:');
  for (let i = 1; i < fileNum; i++) {
    const name = i === 1 ? 'import-seats-1-setup.sql' : `import-seats-${i}-data.sql`;
    console.log(`   ${i}. ${name}`);
  }
} else {
  // Write single file
  fs.writeFileSync('./import-seats-from-json.sql', sql);
  console.log('\n✅ SQL file generated: import-seats-from-json.sql');
  console.log('Run this file in your Supabase SQL editor to import the seats.');
}
