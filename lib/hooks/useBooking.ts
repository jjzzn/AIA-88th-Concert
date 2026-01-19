import { useState } from 'react';
import { bookingService, BookingData, BookingResult } from '../services/bookingService';

export const useBooking = () => {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const createBooking = async (bookingData: BookingData): Promise<BookingResult> => {
    setLoading(true);
    setError(null);

    try {
      const result = await bookingService.createBooking(bookingData);
      
      if (!result.success) {
        setError(result.error || 'Booking failed');
      }
      
      return result;
    } catch (err) {
      const errorMessage = 'Failed to create booking';
      setError(errorMessage);
      return { success: false, error: errorMessage };
    } finally {
      setLoading(false);
    }
  };

  return { createBooking, loading, error };
};
