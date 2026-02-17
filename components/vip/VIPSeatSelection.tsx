import React, { useState, useEffect } from 'react';
import { VIPRoom, VIPSeat } from '../../types/vip';
import { vipBookingService } from '../../lib/services/vipBookingService';
import { seatLockService, SeatAvailability } from '../../lib/services/seatLockService';
import { supabase } from '../../lib/supabase';
import { ChevronLeft, Armchair, Loader2, Users, ChevronRight } from 'lucide-react';
import Dialog from '../Dialog';
import { useDialog } from '../../hooks/useDialog';

interface Props {
  room: VIPRoom;
  onBack: () => void;
  onSubmit: (seats: VIPSeat[]) => void;
}

const VIPSeatSelection: React.FC<Props> = ({ room, onBack, onSubmit }) => {
  const [seats, setSeats] = useState<VIPSeat[]>([]);
  const [selectedSeats, setSelectedSeats] = useState<Set<string>>(new Set());
  const { dialogState, closeDialog, showWarning, showError } = useDialog();
  const [loading, setLoading] = useState(true);
  const [seatAvailability, setSeatAvailability] = useState<Record<string, SeatAvailability>>({});

  useEffect(() => {
    loadSeats();
  }, [room]);

  // Check seat availability with realtime updates
  useEffect(() => {
    if (seats.length === 0) return;

    const checkAvailability = async () => {
      const seatIds = seats.map(s => s.id);
      const availability = await seatLockService.checkAvailability(seatIds);
      
      const availabilityMap: Record<string, SeatAvailability> = {};
      availability.forEach(avail => {
        availabilityMap[avail.seatId] = avail;
      });
      
      setSeatAvailability(availabilityMap);
    };

    checkAvailability();
    
    // Set up realtime subscription for VIP seats
    const channel = supabase
      .channel('vip-seat-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'vip_seats',
          filter: `room_id=eq.${room.id}`
        },
        (payload) => {
          console.log('🔄 Real-time VIP seat change:', payload);
          checkAvailability();
        }
      )
      .subscribe();
    
    const interval = setInterval(checkAvailability, 5000);
    
    return () => {
      clearInterval(interval);
      supabase.removeChannel(channel);
    };
  }, [seats, room.id]);


  const loadSeats = async () => {
    setLoading(true);
    const data = await vipBookingService.getRoomSeats(room.id);
    setSeats(data);
    setLoading(false);
  };

  const toggleSeat = async (seatId: string, isLocked: boolean) => {
    if (isLocked) {
      showWarning('ที่นั่งถูกเลือกแล้ว กรุณาเลือกที่นั่งใหม่');
      return;
    }
    
    const newSelected = new Set(selectedSeats);
    if (newSelected.has(seatId)) {
      // Unlock when deselecting
      await seatLockService.unlockSeats([seatId]);
      newSelected.delete(seatId);
    } else {
      // Lock immediately when selecting
      const lockResult = await seatLockService.lockSeats([seatId], 5);
      
      if (!lockResult.success) {
        if (lockResult.alreadyLocked.length > 0) {
          showWarning('ที่นั่งถูกเลือกแล้ว กรุณาเลือกที่นั่งใหม่');
        } else if (lockResult.alreadyBooked.length > 0) {
          showError('ที่นั่งนี้ถูกจองแล้ว');
        }
        return;
      }
      
      newSelected.add(seatId);
    }
    setSelectedSeats(newSelected);
  };

  const handleSubmit = () => {
    const selected = seats.filter(s => selectedSeats.has(s.id));
    if (selected.length > 0) {
      onSubmit(selected);
    }
  };

  const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  const seatsByRow = seats.reduce((acc, seat) => {
    if (!acc[seat.row]) acc[seat.row] = [];
    acc[seat.row].push(seat);
    return acc;
  }, {} as Record<string, VIPSeat[]>);

  const selectedSeatsArray = Array.from(selectedSeats)
    .map(id => seats.find(s => s.id === id))
    .filter(Boolean) as VIPSeat[];

  return (
    <>
      {/* Step Indicator - Full Width */}
      <div className="mb-6">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">STEP 1 OF 3</p>
        <div className="flex items-center justify-between mb-2">
          <h2 className="text-xl font-black text-slate-900">เลือกที่นั่ง - Room {room.roomNumber}</h2>
          <p className="text-xs text-slate-400 font-medium">NEXT: <span className="text-slate-600 font-bold">กรอกชื่อ</span></p>
        </div>
        <div className="flex gap-1.5 h-1.5 w-full mb-6">
          <div className="flex-1 bg-[#E4002B] rounded-full shadow-sm shadow-red-500/20" />
          <div className="flex-1 bg-slate-200 rounded-full" />
          <div className="flex-1 bg-slate-200 rounded-full" />
        </div>
        <button
          onClick={onBack}
          className="flex items-center gap-2 text-slate-400 text-sm font-bold hover:text-[#E4002B] transition"
        >
          <span>←</span>
          <span>ย้อนกลับ</span>
        </button>
      </div>

      <div className="flex gap-6 pb-10">
        {/* Main Content */}
        <div className="flex-1 space-y-6">

      {loading ? (
        <div className="bg-white rounded-[32px] shadow-sm p-12 text-center border border-slate-100">
          <Loader2 className="w-12 h-12 text-[#E4002B] animate-spin mx-auto mb-4" />
          <p className="text-slate-600 font-medium">กำลังโหลดที่นั่ง...</p>
        </div>
      ) : seats.length === 0 ? (
        <div className="bg-white rounded-[32px] shadow-sm p-12 text-center border border-slate-100">
          <p className="text-slate-600 font-medium">ไม่พบข้อมูลที่นั่งในห้องนี้</p>
          <p className="text-sm text-slate-400 mt-2">กรุณาตรวจสอบว่าได้ import ข้อมูล CSV แล้ว</p>
        </div>
      ) : (
        <>

        {/* Seat Map Container */}
        <div className="bg-white rounded-[32px] shadow-sm p-6 mb-4 border border-slate-100">
          {/* Stage/Screen */}
          <div className="mb-8">
            <div className="w-full max-w-md mx-auto py-3 bg-slate-900 rounded-2xl">
              <p className="text-center text-white font-black text-xs uppercase tracking-[0.3em]">STAGE</p>
            </div>
          </div>

          {/* Seat Grid */}
          <div className="space-y-4 max-w-2xl mx-auto">
            {Object.keys(seatsByRow).sort().map((rowLetter) => {
              const rowSeats = seatsByRow[rowLetter] || [];
              if (rowSeats.length === 0) return null;

              return (
                <div key={rowLetter} className="flex items-center gap-3">
                  {/* Row Label */}
                  <div className="w-10 flex-shrink-0">
                    <div className="w-8 h-8 bg-slate-100 rounded-lg flex items-center justify-center">
                      <span className="font-black text-slate-700 text-sm">{rowLetter}</span>
                    </div>
                  </div>

                  {/* Seats */}
                  <div className="flex-1 flex gap-2 justify-center overflow-x-auto">
                    {rowSeats.sort((a, b) => a.number - b.number).map((seat) => {
                      const isSelected = selectedSeats.has(seat.id);
                      const isBooked = seat.isBooked;
                      const availability = seatAvailability[seat.id];
                      const isLocked = availability?.status === 'locked' && !isSelected;

                      return (
                        <button
                          key={seat.id}
                          onClick={() => !isBooked && !isLocked && toggleSeat(seat.id, isLocked)}
                          disabled={isBooked || isLocked}
                          className={`
                            w-12 h-12 rounded-xl flex flex-col items-center justify-center font-bold text-[10px] transition-all relative
                            ${isBooked || isLocked
                              ? 'bg-slate-400 text-slate-100 cursor-not-allowed border-2 border-slate-300'
                              : isSelected
                                ? 'bg-[#E4002B] text-white shadow-lg shadow-red-500/25 scale-105 border-2 border-[#E4002B]'
                                : 'bg-white border-2 border-slate-200 text-slate-700 hover:border-[#E4002B] hover:scale-105 active:scale-95'
                            }
                          `}
                        >
                          <Armchair className="w-5 h-5 mb-0.5" />
                          <span className="text-[9px]">{seat.number}</span>
                        </button>
                      );
                    })}
                  </div>
                </div>
              );
            })}
          </div>

          {/* Legend */}
          <div className="bg-slate-50 rounded-2xl p-4 mb-4 mt-8 border border-slate-100">
            <div className="flex justify-center gap-4 text-xs flex-wrap">
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-white border-2 border-slate-200 rounded-lg flex items-center justify-center">
                  <Armchair className="w-4 h-4 text-slate-700" />
                </div>
                <span className="font-bold text-slate-600">ว่าง</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-[#E4002B] rounded-lg flex items-center justify-center">
                  <Armchair className="w-4 h-4 text-white" />
                </div>
                <span className="font-bold text-slate-600">เลือก</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-slate-400 border-2 border-slate-300 rounded-lg flex items-center justify-center">
                  <Armchair className="w-4 h-4 text-slate-100" />
                </div>
                <span className="font-bold text-slate-600">เต็ม</span>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Submit Button - Mobile */}
        <div className="lg:hidden">
          <div className="bg-white rounded-[32px] shadow-sm p-5 border border-slate-100">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-[10px] font-bold text-slate-400 uppercase tracking-wider mb-1">ที่นั่งที่เลือก</p>
                <p className="text-2xl font-black text-slate-900">
                  {selectedSeats.size} <span className="text-sm text-slate-500 font-bold">ที่นั่ง</span>
                </p>
              </div>
              <button
                onClick={handleSubmit}
                disabled={selectedSeats.size === 0}
                className={`
                  px-6 py-3 rounded-2xl font-bold text-sm transition-all shadow-lg
                  ${selectedSeats.size > 0
                    ? 'bg-[#E4002B] text-white shadow-red-500/25 hover:bg-red-700 active:scale-95'
                    : 'bg-slate-200 text-slate-400 cursor-not-allowed shadow-none'
                  }
                `}
              >
                ดำเนินการต่อ ({selectedSeats.size})
              </button>
            </div>
          </div>
        </div>
        </>
        )}
      </div>

        {/* Sidebar - Booking Summary */}
        <div className="hidden lg:block w-80 flex-shrink-0">
          <div className="sticky top-6 space-y-4">
          {/* Booking Summary Card */}
          <div className="bg-white rounded-[32px] shadow-lg p-6 border border-slate-100">
            <div className="flex items-center gap-2 mb-4">
              <div className="w-10 h-10 bg-[#E4002B] rounded-full flex items-center justify-center">
                <Users className="w-5 h-5 text-white" />
              </div>
              <div>
                <p className="text-xs font-bold text-slate-400 uppercase tracking-wider">Booking Summary</p>
                <p className="text-sm font-black text-slate-900">VIP Room {room.roomNumber}</p>
              </div>
            </div>

            {/* Location Info */}
            <div className="bg-slate-50 rounded-2xl p-4 mb-4">
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Location</p>
              <p className="text-sm font-black text-slate-900">Main Arena - Level 2</p>
            </div>

            {/* Selected Seats List */}
            <div className="mb-4">
              <p className="text-xs font-bold text-slate-500 uppercase mb-3">Selected Seats</p>
              {selectedSeatsArray.length === 0 ? (
                <div className="text-center py-6 bg-slate-50 rounded-2xl">
                  <Armchair className="w-8 h-8 text-slate-300 mx-auto mb-2" />
                  <p className="text-xs text-slate-400 font-medium">No seats selected yet</p>
                </div>
              ) : (
                <div className="space-y-2 max-h-64 overflow-y-auto">
                  {selectedSeatsArray.map((seat) => (
                    <div
                      key={seat.id}
                      className="flex items-center justify-between bg-slate-50 rounded-xl p-3 group hover:bg-red-50 transition"
                    >
                      <div className="flex items-center gap-3">
                        <div className="w-8 h-8 bg-[#E4002B] rounded-lg flex items-center justify-center">
                          <Armchair className="w-4 h-4 text-white" />
                        </div>
                        <div>
                          <p className="text-sm font-black text-slate-900">Row {seat.row} - Seat {seat.number}</p>
                        </div>
                      </div>
                      <button
                        onClick={() => toggleSeat(seat.id, false)}
                        className="text-slate-400 hover:text-[#E4002B] transition opacity-0 group-hover:opacity-100"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                </div>
              )}
            </div>

            {/* Quantity */}
            <div className="border-t border-slate-100 pt-4 mb-4">
              <div className="flex items-center justify-between">
                <p className="text-sm font-bold text-slate-600">Guest by</p>
                <p className="text-2xl font-black text-slate-900">{selectedSeats.size} {selectedSeats.size === 1 ? 'Seat' : 'Seats'}</p>
              </div>
            </div>

            {/* Subtotal */}
            <div className="bg-slate-50 rounded-2xl p-4 mb-4">
              <div className="flex items-center justify-between">
                <p className="text-sm font-bold text-slate-600">Subtotal</p>
                <p className="text-lg font-black text-[#E4002B]">Included in VIP</p>
              </div>
            </div>

            {/* Submit Button */}
            <button
              onClick={handleSubmit}
              disabled={selectedSeats.size === 0}
              className={`
                w-full py-4 rounded-2xl font-black text-base transition-all shadow-lg flex items-center justify-center gap-2
                ${selectedSeats.size > 0
                  ? 'bg-[#E4002B] text-white shadow-red-500/25 hover:bg-red-700 active:scale-95'
                  : 'bg-slate-200 text-slate-400 cursor-not-allowed shadow-none'
                }
              `}
            >
              <span>Verify & Select Seats</span>
              <ChevronRight className="w-5 h-5" />
            </button>

            <p className="text-[10px] text-slate-400 text-center mt-3">
              By continuing, you agree to the terms and conditions
            </p>
            </div>
          </div>
        </div>
      </div>

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
    </>
  );
};

export default VIPSeatSelection;
