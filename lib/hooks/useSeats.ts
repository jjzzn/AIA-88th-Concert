import { useState, useEffect } from 'react';
import { seatService, SeatWithZone } from '../services/seatService';

export const useSeats = (tierId: string | null) => {
  const [seats, setSeats] = useState<SeatWithZone[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!tierId) return;

    const fetchSeats = async () => {
      setLoading(true);
      setError(null);

      try {
        const data = await seatService.getAvailableSeats(tierId);
        setSeats(data);
      } catch (err) {
        setError('Failed to load seats');
        console.error(err);
      } finally {
        setLoading(false);
      }
    };

    fetchSeats();
  }, [tierId]);

  const refreshSeats = async () => {
    if (!tierId) return;
    
    setLoading(true);
    try {
      const data = await seatService.getAvailableSeats(tierId);
      setSeats(data);
    } catch (err) {
      setError('Failed to refresh seats');
    } finally {
      setLoading(false);
    }
  };

  return { seats, loading, error, refreshSeats };
};
