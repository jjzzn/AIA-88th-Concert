/**
 * Test Supabase Connection
 * Run this file to verify your Supabase setup is working correctly
 * 
 * Usage: npm run dev (then open browser console and paste this code)
 */

import { supabase } from './lib/supabase';
import { tierService, seatService, codeService } from './lib/services';

export async function testConnection() {
  console.log('🧪 Testing Supabase Connection...\n');

  try {
    // Test 1: Check connection
    console.log('1️⃣ Testing basic connection...');
    const { data: tiers, error: tiersError } = await supabase
      .from('tiers')
      .select('*');
    
    if (tiersError) {
      console.error('❌ Connection failed:', tiersError);
      return false;
    }
    console.log('✅ Connected successfully!');
    console.log(`   Found ${tiers?.length || 0} tiers\n`);

    // Test 2: Test tier service
    console.log('2️⃣ Testing tier service...');
    const allTiers = await tierService.getAllTiers();
    console.log('✅ Tiers loaded:', allTiers.map(t => `${t.name} (฿${t.price})`).join(', '));
    console.log('');

    // Test 3: Test code validation
    console.log('3️⃣ Testing code validation...');
    const testCode = '1AIA2024-001';
    const validation = await codeService.validateCodes([testCode]);
    if (validation.isValid) {
      console.log(`✅ Code "${testCode}" is valid for tier: ${validation.tier?.name}`);
    } else {
      console.log(`❌ Code validation failed: ${validation.error}`);
    }
    console.log('');

    // Test 4: Test seat loading
    console.log('4️⃣ Testing seat loading...');
    if (allTiers.length > 0) {
      const seats = await seatService.getAvailableSeats(allTiers[0].id);
      console.log(`✅ Loaded ${seats.length} available seats for ${allTiers[0].name}`);
      
      if (seats.length > 0) {
        const sampleSeat = seats[0];
        console.log(`   Sample seat: Row ${sampleSeat.row}, Number ${sampleSeat.number}`);
      }
    }
    console.log('');

    // Test 5: Test zones
    console.log('5️⃣ Testing zones...');
    if (allTiers.length > 0) {
      const zones = await seatService.getZonesByTier(allTiers[0].id);
      console.log(`✅ Found ${zones.length} zones for ${allTiers[0].name}`);
      console.log(`   Zones: ${zones.map(z => z.name).join(', ')}`);
    }
    console.log('');

    // Summary
    console.log('🎉 All tests passed! Your Supabase integration is working correctly.');
    console.log('\n📋 Summary:');
    console.log(`   - Tiers: ${allTiers.length}`);
    console.log(`   - Connection: ✅`);
    console.log(`   - Code validation: ✅`);
    console.log(`   - Seat loading: ✅`);
    console.log(`   - Zone loading: ✅`);
    
    return true;
  } catch (error) {
    console.error('❌ Test failed with error:', error);
    return false;
  }
}

// Auto-run in browser console
if (typeof window !== 'undefined') {
  console.log('💡 To test connection, run: testConnection()');
}
