import React, { useState, useEffect, useRef } from 'react';
import { BookingStep, BookingState, Tier, Seat, Attendee, ContactInfo } from './types';
import CodeEntry from './components/CodeEntry';
import SeatSelection from './components/SeatSelection';
import DetailsForm from './components/DetailsForm';
import Confirmation from './components/Confirmation';
import { ChevronLeft } from 'lucide-react';
import { useBooking } from './lib/hooks';
import { bookingService } from './lib/services';

const App: React.FC = () => {
  const [step, setStep] = useState<BookingStep>('CODE_ENTRY');
  const [state, setState] = useState<BookingState>({
    codes: [],
    selectedTier: null,
    selectedSeats: [],
    attendees: [],
    contact: { email: '', phone: '' },
  });
  const [bookingId, setBookingId] = useState<string | null>(null);
  const [timeRemaining, setTimeRemaining] = useState<number | null>(null);
  const timerRef = useRef<NodeJS.Timeout | null>(null);
  const { createBooking, loading: bookingLoading } = useBooking();

  const handleCodesSubmit = (codes: string[], tier: Tier) => {
    setState(prev => ({ ...prev, codes, selectedTier: tier }));
    setStep('SEAT_SELECTION');
    // Start 5-minute countdown (300 seconds)
    setTimeRemaining(300);
  };

  const handleSeatsSubmit = (seats: Seat[]) => {
    setState(prev => ({ 
      ...prev, 
      selectedSeats: seats,
      attendees: seats.map(s => ({ firstName: '', lastName: '', seatId: s.id }))
    }));
    setStep('DETAILS');
  };

  const handleDetailsSubmit = async (attendees: Attendee[], contact: ContactInfo) => {
    setState(prev => ({ ...prev, attendees, contact }));
    
    if (!state.selectedTier) return;
    
    const result = await createBooking({
      email: contact.email,
      phone: contact.phone,
      codes: state.codes,
      seats: attendees.map(a => ({
        seatId: a.seatId,
        firstName: a.firstName,
        lastName: a.lastName,
      })),
    });

    if (result.success && result.bookingId) {
      // Fetch booking with qr_tokens
      const booking = await bookingService.getBooking(result.bookingId);
      
      if (booking && booking.booking_seats) {
        // Update attendees with qr_token
        const updatedAttendees = attendees.map((attendee, index) => ({
          ...attendee,
          qrToken: booking.booking_seats[index]?.qr_token || '',
        }));
        
        setState(prev => ({ ...prev, attendees: updatedAttendees }));
      }
      
      setBookingId(result.bookingId);
      setStep('CONFIRMATION');
      // Clear timer on successful booking
      setTimeRemaining(null);
      if (timerRef.current) {
        clearInterval(timerRef.current);
        timerRef.current = null;
      }
    } else {
      alert('เกิดข้อผิดพลาดในการจอง: ' + (result.error || 'Unknown error'));
    }
  };

  const resetBooking = () => {
    setState({
      codes: [],
      selectedTier: null,
      selectedSeats: [],
      attendees: [],
      contact: { email: '', phone: '' },
    });
    setBookingId(null);
    setStep('CODE_ENTRY');
    setTimeRemaining(null);
    if (timerRef.current) {
      clearInterval(timerRef.current);
      timerRef.current = null;
    }
  };

  const handleBack = () => {
    if (step === 'SEAT_SELECTION') {
      setStep('CODE_ENTRY');
      // Clear timer when going back to code entry
      setTimeRemaining(null);
      if (timerRef.current) {
        clearInterval(timerRef.current);
        timerRef.current = null;
      }
    }
    if (step === 'DETAILS') setStep('SEAT_SELECTION');
  };

  // Timer countdown effect
  useEffect(() => {
    if (timeRemaining !== null && timeRemaining > 0) {
      timerRef.current = setInterval(() => {
        setTimeRemaining(prev => {
          if (prev === null || prev <= 1) {
            // Time's up - reset booking
            if (timerRef.current) {
              clearInterval(timerRef.current);
              timerRef.current = null;
            }
            alert('หมดเวลาในการจอง กรุณาเริ่มใหม่อีกครั้ง');
            resetBooking();
            return null;
          }
          return prev - 1;
        });
      }, 1000);
    }

    return () => {
      if (timerRef.current) {
        clearInterval(timerRef.current);
        timerRef.current = null;
      }
    };
  }, [timeRemaining]);

  // Format time as MM:SS
  const formatTime = (seconds: number): string => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <div className="min-h-screen max-w-md mx-auto bg-white flex flex-col relative overflow-hidden shadow-xl">
      {/* Dynamic Header based on Step */}
      <header className={`px-4 pt-6 pb-4 bg-white sticky top-0 z-50 ${step === 'CONFIRMATION' ? 'hidden' : ''}`}>
        <div className="flex items-center justify-between mb-2">
          <button onClick={handleBack} className={`p-1 rounded-full transition ${step === 'CODE_ENTRY' ? 'opacity-0 pointer-events-none' : 'hover:bg-slate-50'}`}>
            <ChevronLeft className="w-6 h-6 text-slate-800" />
          </button>
          
          <div className="w-6" /> {/* Spacer */}
        </div>
        {/* Countdown Timer */}
        {timeRemaining !== null && step !== 'CODE_ENTRY' && (
          <div className="mt-3 flex items-center justify-center gap-2 bg-gradient-to-r from-red-50 to-orange-50 border border-red-200 rounded-xl py-2 px-4">
            <div className="flex items-center gap-2">
              <div className="w-2 h-2 bg-red-500 rounded-full animate-pulse" />
              <span className="text-sm font-bold text-slate-600">เวลาที่เหลือ:</span>
              <span className={`text-lg font-black tabular-nums ${
                timeRemaining <= 60 ? 'text-red-600 animate-pulse' : 'text-slate-900'
              }`}>
                {formatTime(timeRemaining)}
              </span>
            </div>
          </div>
        )}
      </header>

      {/* Content Area */}
      <main className="flex-1 overflow-y-auto bg-white">
        {step === 'CODE_ENTRY' && <CodeEntry onSubmit={handleCodesSubmit} />}
        {step === 'SEAT_SELECTION' && state.selectedTier && (
          <SeatSelection 
            tier={state.selectedTier} 
            maxSeats={state.codes.length} 
            onSubmit={handleSeatsSubmit} 
            onBack={handleBack}
            timeRemaining={timeRemaining}
          />
        )}
        {step === 'DETAILS' && (
          <div className="px-4 py-6">
            <DetailsForm 
              seats={state.selectedSeats} 
              onSubmit={handleDetailsSubmit}
              timeRemaining={timeRemaining}
            />
          </div>
        )}
        {step === 'CONFIRMATION' && (
          <div className="px-4 py-6">
            <Confirmation state={state} onReset={resetBooking} />
          </div>
        )}
      </main>
    </div>
  );
};

export default App;
