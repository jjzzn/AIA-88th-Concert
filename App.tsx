import React, { useState, useEffect, useRef } from 'react';
import { BookingStep, BookingState, Tier, Seat, Attendee, ContactInfo, UserType, AgentInfo } from './types';
import UserTypeSelection from './components/UserTypeSelection';
import AgentCodeEntry from './components/AgentCodeEntry';
import AgentSeatSelection from './components/AgentSeatSelection';
import CodeEntry from './components/CodeEntry';
import SeatSelection from './components/SeatSelection';
import DetailsForm from './components/DetailsForm';
import Confirmation from './components/Confirmation';
import TicketRetrievalModal from './components/TicketRetrievalModal';
import Dialog from './components/Dialog';
import { ChevronLeft } from 'lucide-react';
import { useBooking } from './lib/hooks';
import { bookingService, tierService } from './lib/services';
import { seatLockService } from './lib/services/seatLockService';
import { useDialog } from './lib/hooks/useDialog';

const App: React.FC = () => {
  const [step, setStep] = useState<BookingStep>('USER_TYPE_SELECTION');
  const [state, setState] = useState<BookingState>({
    userType: null,
    agentInfo: null,
    codes: [],
    selectedTier: null,
    selectedSeats: [],
    attendees: [],
    contact: { email: '', phone: '' },
  });
  const [isTicketModalOpen, setIsTicketModalOpen] = useState(false);
  const [bookingId, setBookingId] = useState<string | null>(null);

  const handleUserTypeSelect = (userType: UserType) => {
    setState(prev => ({ ...prev, userType }));
    if (userType === 'AGENT') {
      setStep('AGENT_CODE_ENTRY');
    } else {
      setStep('CODE_ENTRY');
    }
  };

  const handleAgentInfoSubmit = (agentInfo: AgentInfo) => {
    setState(prev => ({ ...prev, agentInfo }));
    // Agent goes to code entry
    setStep('CODE_ENTRY');
  };
  const [timeRemaining, setTimeRemaining] = useState<number | null>(null);
  const timerRef = useRef<NodeJS.Timeout | null>(null);
  const { createBooking, loading: bookingLoading } = useBooking();
  const dialog = useDialog();

  const handleCodesSubmit = (codes: string[], tier: Tier) => {
    setState(prev => ({ ...prev, codes, selectedTier: tier }));
    setStep('SEAT_SELECTION');
    // Start 5-minute countdown (300 seconds)
    setTimeRemaining(300);
  };

  const handleSeatsSubmit = async (seats: Seat[]) => {
    // Lock seats for 5 minutes
    const seatIds = seats.map(s => s.id);
    const lockResult = await seatLockService.lockSeats(seatIds, 5);
    
    if (!lockResult.success) {
      dialog.showError(lockResult.message || 'ไม่สามารถจองที่นั่งได้ กรุณาลองใหม่อีกครั้ง');
      // Remove unavailable seats
      const unavailable = [...lockResult.alreadyLocked, ...lockResult.alreadyBooked];
      const availableSeats = seats.filter(s => !unavailable.includes(s.id));
      
      if (availableSeats.length === 0) {
        return; // No seats available
      }
      
      // Update with only available seats
      setState(prev => ({ 
        ...prev, 
        selectedSeats: availableSeats,
        attendees: availableSeats.map(s => ({ firstName: '', lastName: '', seatId: s.id }))
      }));
    } else {
      setState(prev => ({ 
        ...prev, 
        selectedSeats: seats,
        attendees: seats.map(s => ({ firstName: '', lastName: '', seatId: s.id }))
      }));
    }
    
    setStep('DETAILS');
    // Start 5-minute timer (300 seconds)
    setTimeRemaining(300);
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
      userType: state.userType,
      agentInfo: state.agentInfo,
    });

    if (result.success && result.bookingId) {
      // Unlock seats (they're now booked)
      const seatIds = state.selectedSeats.map(s => s.id);
      await seatLockService.unlockSeats(seatIds);
      seatLockService.clearSession();
      
      // Fetch booking with qr_tokens
      const booking = await bookingService.getBooking(result.bookingId);
      
      console.log('App.tsx - Fetched booking:', booking);
      console.log('App.tsx - Booking seats:', booking?.booking_seats);
      
      if (booking && booking.booking_seats) {
        // Update attendees with qr_token
        const updatedAttendees = attendees.map((attendee, index) => {
          const qrToken = booking.booking_seats[index]?.qr_token || '';
          console.log(`App.tsx - Attendee ${index} qrToken:`, qrToken);
          return {
            ...attendee,
            qrToken,
          };
        });
        
        console.log('App.tsx - Updated attendees:', updatedAttendees);
        setState(prev => ({ ...prev, attendees: updatedAttendees }));
      } else {
        console.error('App.tsx - No booking or booking_seats found');
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
      dialog.showError('เกิดข้อผิดพลาดในการจอง: ' + (result.error || 'Unknown error'));
    }
  };

  const resetBooking = async () => {
    // Unlock seats if any were selected
    if (state.selectedSeats.length > 0) {
      const seatIds = state.selectedSeats.map(s => s.id);
      await seatLockService.unlockSeats(seatIds);
    }
    seatLockService.clearSession();
    
    setState({
      userType: null,
      agentInfo: null,
      codes: [],
      selectedTier: null,
      selectedSeats: [],
      attendees: [],
      contact: { email: '', phone: '' },
    });
    setBookingId(null);
    setStep('USER_TYPE_SELECTION');
    setTimeRemaining(null);
    if (timerRef.current) {
      clearInterval(timerRef.current);
      timerRef.current = null;
    }
  };

  const handleBack = async () => {
    if (step === 'AGENT_CODE_ENTRY') {
      setStep('USER_TYPE_SELECTION');
    }
    if (step === 'CODE_ENTRY') {
      if (state.userType === 'AGENT') {
        setStep('AGENT_CODE_ENTRY');
      } else {
        setStep('USER_TYPE_SELECTION');
      }
    }
    if (step === 'SEAT_SELECTION') {
      setStep('CODE_ENTRY');
      // Clear timer when going back to code entry
      setTimeRemaining(null);
      if (timerRef.current) {
        clearInterval(timerRef.current);
        timerRef.current = null;
      }
    }
    if (step === 'DETAILS') {
      // Unlock seats when going back to seat selection
      if (state.selectedSeats.length > 0) {
        const seatIds = state.selectedSeats.map(s => s.id);
        await seatLockService.unlockSeats(seatIds);
      }
      setStep('SEAT_SELECTION');
    }
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
            dialog.showWarning('หมดเวลาในการจอง กรุณาเริ่มใหม่อีกครั้ง', 'หมดเวลา');
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
          <button onClick={handleBack} className={`p-1 rounded-full transition ${step === 'USER_TYPE_SELECTION' || step === 'SEAT_SELECTION' ? 'opacity-0 pointer-events-none' : 'hover:bg-slate-50'}`}>
            <ChevronLeft className="w-6 h-6 text-slate-800" />
          </button>
          
          <div className="w-6" /> {/* Spacer */}
        </div>
        {/* Countdown Timer */}
        {timeRemaining !== null && step !== 'USER_TYPE_SELECTION' && step !== 'AGENT_CODE_ENTRY' && step !== 'CODE_ENTRY' && (
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
        {step === 'USER_TYPE_SELECTION' && (
          <UserTypeSelection 
            onSelectUserType={handleUserTypeSelect}
            onViewMyTicket={() => setIsTicketModalOpen(true)}
          />
        )}
        {step === 'AGENT_CODE_ENTRY' && (
          <AgentCodeEntry onSubmit={handleAgentInfoSubmit} />
        )}
        {step === 'CODE_ENTRY' && <CodeEntry onSubmit={handleCodesSubmit} />}
        {step === 'SEAT_SELECTION' && state.userType === 'AGENT' && (
          <AgentSeatSelection 
            onSubmit={handleSeatsSubmit} 
            onBack={handleBack}
            timeRemaining={timeRemaining}
          />
        )}
        {step === 'SEAT_SELECTION' && state.userType === 'SELF' && state.selectedTier && (
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

      {/* Ticket Retrieval Modal */}
      <TicketRetrievalModal 
        isOpen={isTicketModalOpen}
        onClose={() => setIsTicketModalOpen(false)}
      />

      {/* Dialog */}
      <Dialog
        isOpen={dialog.isOpen}
        onClose={dialog.closeDialog}
        title={dialog.config.title}
        message={dialog.config.message}
        type={dialog.config.type}
        confirmText={dialog.config.confirmText}
        cancelText={dialog.config.cancelText}
        onConfirm={dialog.config.onConfirm}
      />
    </div>
  );
};

export default App;
