import { useState, useEffect } from 'react';
import { seatService, SeatWithZone } from '../services/seatService';

export const useSeats = (tierId: string | null, zoneIds?: string[]) => {
  const [seats, setSeats] = useState<SeatWithZone[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!tierId) return;

    const fetchSeats = async () => {
      setLoading(true);
      setError(null);

      try {
        let data: SeatWithZone[];
        
        console.log('🔍 useSeats - Fetching seats for tier:', tierId);
        console.log('🔍 useSeats - Zone IDs:', zoneIds);
        
        // If zone IDs are provided, fetch seats by zones (for shared zone access)
        if (zoneIds && zoneIds.length > 0) {
          console.log('✅ useSeats - Fetching by zones:', zoneIds);
          data = await seatService.getSeatsByZones(zoneIds);
          console.log('📊 useSeats - Fetched', data.length, 'seats by zones');
        } else {
          // Otherwise, fetch by tier (original behavior)
          console.log('✅ useSeats - Fetching by tier:', tierId);
          data = await seatService.getAvailableSeats(tierId);
          console.log('📊 useSeats - Fetched', data.length, 'seats by tier');
        }
        
        setSeats(data);
      } catch (err) {
        setError('Failed to load seats');
        console.error('❌ useSeats - Error:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchSeats();
  }, [tierId, zoneIds?.join(',')]);

  const refreshSeats = async () => {
    if (!tierId) return;
    
    setLoading(true);
    try {
      let data: SeatWithZone[];
      
      if (zoneIds && zoneIds.length > 0) {
        data = await seatService.getSeatsByZones(zoneIds);
      } else {
        data = await seatService.getAvailableSeats(tierId);
      }
      
      setSeats(data);
    } catch (err) {
      setError('Failed to refresh seats');
    } finally {
      setLoading(false);
    }
  };

  return { seats, loading, error, refreshSeats };
};
