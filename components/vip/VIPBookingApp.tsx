import React, { useState } from 'react';
import { VIPBookingStep, VIPBookingState, VIPRoom, VIPSeat, VIPAttendee } from '../../types/vip';
import { vipBookingService } from '../../lib/services/vipBookingService';
import VIPRoomSelection from './VIPRoomSelection';
import VIPSeatSelection from './VIPSeatSelection';
import VIPAttendeeForm from './VIPAttendeeForm';
import VIPConfirmation from './VIPConfirmation';
import Dialog from '../Dialog';
import { useDialog } from '../../hooks/useDialog';

const VIPBookingApp: React.FC = () => {
  const [step, setStep] = useState<VIPBookingStep>('ROOM_SELECTION');
  const [state, setState] = useState<VIPBookingState>({
    selectedRoom: null,
    selectedSeats: [],
    attendees: [],
  });
  const [qrTokens, setQrTokens] = useState<Record<string, string>>({});
  const { dialogState, closeDialog, showError } = useDialog();

  const handleRoomSelect = (room: VIPRoom) => {
    setState(prev => ({ ...prev, selectedRoom: room }));
    setStep('SEAT_SELECTION');
  };

  const handleSeatsSubmit = (seats: VIPSeat[]) => {
    setState(prev => ({ ...prev, selectedSeats: seats }));
    setStep('ATTENDEE_DETAILS');
  };

  const handleAttendeesSubmit = async (attendees: VIPAttendee[]) => {
    setState(prev => ({ ...prev, attendees }));
    
    // Save to database
    if (state.selectedRoom && attendees.length > 0) {
      try {
        // Use first attendee's phone as booking phone for retrieval
        const bookingPhone = attendees[0].phone;
        
        const result = await vipBookingService.createBooking({
          roomId: state.selectedRoom.id,
          phone: bookingPhone,
          attendees: attendees,
        });

        if (result.success) {
          console.log('VIP Booking created successfully:', result.bookingId);
          if (result.qrTokens) {
            setQrTokens(result.qrTokens);
          }
          setStep('CONFIRMATION');
        } else {
          console.error('Failed to create VIP booking:', result.error);
          showError('เกิดข้อผิดพลาดในการจอง: ' + (result.error || 'กรุณาลองใหม่อีกครั้ง'));
        }
      } catch (error) {
        console.error('Error creating VIP booking:', error);
        showError('เกิดข้อผิดพลาดในการจอง กรุณาลองใหม่อีกครั้ง');
      }
    }
  };

  const handleReset = () => {
    setState({
      selectedRoom: null,
      selectedSeats: [],
      attendees: [],
    });
    setQrTokens({});
    setStep('ROOM_SELECTION');
  };

  const handleBackToRoomSelection = () => {
    setState(prev => ({ ...prev, selectedSeats: [], attendees: [] }));
    setStep('ROOM_SELECTION');
  };

  const handleBackToSeatSelection = () => {
    setState(prev => ({ ...prev, attendees: [] }));
    setStep('SEAT_SELECTION');
  };

  return (
    <div className="min-h-screen">
      {step === 'ROOM_SELECTION' && (
        <VIPRoomSelection onSelectRoom={handleRoomSelect} />
      )}
      
      {step === 'SEAT_SELECTION' && state.selectedRoom && (
        <VIPSeatSelection
          room={state.selectedRoom}
          onBack={handleBackToRoomSelection}
          onSubmit={handleSeatsSubmit}
        />
      )}
      
      {step === 'ATTENDEE_DETAILS' && state.selectedSeats.length > 0 && (
        <VIPAttendeeForm
          seats={state.selectedSeats}
          onBack={handleBackToSeatSelection}
          onSubmit={handleAttendeesSubmit}
        />
      )}
      
      {step === 'CONFIRMATION' && state.selectedRoom && (
        <VIPConfirmation
          room={state.selectedRoom}
          seats={state.selectedSeats}
          attendees={state.attendees}
          qrTokens={qrTokens}
          onReset={handleReset}
        />
      )}

      <Dialog
        isOpen={dialogState.isOpen}
        onClose={closeDialog}
        title={dialogState.title}
        message={dialogState.message}
        type={dialogState.type}
        confirmText={dialogState.confirmText}
        onConfirm={dialogState.onConfirm}
        cancelText={dialogState.cancelText}
      />
    </div>
  );
};

export default VIPBookingApp;
