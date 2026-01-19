import { createClient } from '@supabase/supabase-js';
import * as dotenv from 'dotenv';
import * as path from 'path';

dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.VITE_SUPABASE_URL!;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY!;
const supabase = createClient(supabaseUrl, supabaseKey);

async function fixZoneAssignments() {
  console.log('Starting zone assignment fix...');
  
  try {
    // Update ZONE C1 and C2 to CLASSIC tier
    const { error: updateC } = await supabase
      .from('zones')
      .update({ tier_id: '44444444-4444-4444-4444-444444444444' } as any)
      .in('name', ['ZONE C1', 'ZONE C2']);
    
    if (updateC) throw updateC;
    console.log('✓ Updated C1, C2 to CLASSIC tier');

    // Update ZONE D1 and D2 to SILVER tier
    const { error: updateD } = await supabase
      .from('zones')
      .update({ tier_id: '33333333-3333-3333-3333-333333333333' } as any)
      .in('name', ['ZONE D1', 'ZONE D2']);
    
    if (updateD) throw updateD;
    console.log('✓ Updated D1, D2 to SILVER tier');

    // Get zone IDs for C1 and C2
    const { data: cZones, error: cError } = await supabase
      .from('zones')
      .select('id')
      .in('name', ['ZONE C1', 'ZONE C2']);
    
    if (cError) throw cError;
    const cZoneIds = (cZones as any)?.map((z: any) => z.id) || [];

    // Update seats in C1 and C2 zones to CLASSIC tier
    const { error: updateCSeats } = await supabase
      .from('seats')
      .update({ tier_id: '44444444-4444-4444-4444-444444444444' } as any)
      .in('zone_id', cZoneIds);
    
    if (updateCSeats) throw updateCSeats;
    console.log('✓ Updated seats in C1, C2 to CLASSIC tier');

    // Get zone IDs for D1 and D2
    const { data: dZones, error: dError } = await supabase
      .from('zones')
      .select('id')
      .in('name', ['ZONE D1', 'ZONE D2']);
    
    if (dError) throw dError;
    const dZoneIds = (dZones as any)?.map((z: any) => z.id) || [];

    // Update seats in D1 and D2 zones to SILVER tier
    const { error: updateDSeats } = await supabase
      .from('seats')
      .update({ tier_id: '33333333-3333-3333-3333-333333333333' } as any)
      .in('zone_id', dZoneIds);
    
    if (updateDSeats) throw updateDSeats;
    console.log('✓ Updated seats in D1, D2 to SILVER tier');

    console.log('\n✅ Zone assignment fix completed successfully!');
    console.log('Current mapping:');
    console.log('  PLATINUM → A1, A2');
    console.log('  GOLD → B1, B2, B3');
    console.log('  SILVER → D1, D2');
    console.log('  CLASSIC → C1, C2');
    
  } catch (error) {
    console.error('❌ Error fixing zone assignments:', error);
  }
}

fixZoneAssignments();
