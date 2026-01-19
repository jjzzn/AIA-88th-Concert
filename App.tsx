
import React, { useState } from 'react';
import { BookingStep, BookingState, Tier, Seat, Attendee, ContactInfo } from './types';
import CodeEntry from './components/CodeEntry';
import SeatSelection from './components/SeatSelection';
import DetailsForm from './components/DetailsForm';
import Confirmation from './components/Confirmation';
import { ChevronLeft } from 'lucide-react';

const App: React.FC = () => {
  const [step, setStep] = useState<BookingStep>('CODE_ENTRY');
  const [state, setState] = useState<BookingState>({
    codes: [],
    selectedTier: null,
    selectedSeats: [],
    attendees: [],
    contact: { email: '', phone: '' },
  });

  const handleCodesSubmit = (codes: string[], tier: Tier) => {
    setState(prev => ({ ...prev, codes, selectedTier: tier }));
    setStep('SEAT_SELECTION');
  };

  const handleSeatsSubmit = (seats: Seat[]) => {
    setState(prev => ({ 
      ...prev, 
      selectedSeats: seats,
      attendees: seats.map(s => ({ firstName: '', lastName: '', seatId: s.id }))
    }));
    setStep('DETAILS');
  };

  const handleDetailsSubmit = (attendees: Attendee[], contact: ContactInfo) => {
    setState(prev => ({ ...prev, attendees, contact }));
    setStep('CONFIRMATION');
  };

  const resetBooking = () => {
    setState({
      codes: [],
      selectedTier: null,
      selectedSeats: [],
      attendees: [],
      contact: { email: '', phone: '' },
    });
    setStep('CODE_ENTRY');
  };

  const handleBack = () => {
    if (step === 'SEAT_SELECTION') setStep('CODE_ENTRY');
    if (step === 'DETAILS') setStep('SEAT_SELECTION');
  };

  return (
    <div className="min-h-screen max-w-md mx-auto bg-white flex flex-col relative overflow-hidden shadow-xl">
      {/* Dynamic Header based on Step */}
      <header className={`px-4 pt-6 pb-4 bg-white sticky top-0 z-50 ${step === 'CONFIRMATION' ? 'hidden' : ''}`}>
        <div className="flex items-center justify-between mb-2">
          <button onClick={handleBack} className={`p-1 rounded-full transition ${step === 'CODE_ENTRY' ? 'opacity-0 pointer-events-none' : 'hover:bg-slate-50'}`}>
            <ChevronLeft className="w-6 h-6 text-slate-800" />
          </button>
          <h1 className="text-lg font-bold text-slate-900">
            {step === 'CODE_ENTRY' ? 'Enter Code' : step === 'SEAT_SELECTION' ? 'Seat Selection' : 'Attendee Details'}
          </h1>
          <div className="w-6" /> {/* Spacer */}
        </div>
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
          />
        )}
        {step === 'DETAILS' && (
          <div className="px-4 py-6">
            <DetailsForm 
              seats={state.selectedSeats} 
              onSubmit={handleDetailsSubmit} 
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
