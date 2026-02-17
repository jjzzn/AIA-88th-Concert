import React, { useState, useEffect } from 'react';
import { X, AlertTriangle, RefreshCw, Armchair, Loader2, CheckCircle2, ArrowRight } from 'lucide-react';
import { ticketManagementService } from '../lib/services/ticketManagementService';
import { seatService } from '../lib/services';

interface Attendee {
  firstName: string;
  lastName: string;
  seatId: string;
  qrToken: string;
  bookingSeatId?: string;
  isCheckedIn?: boolean;
  cancelCount?: number;
  swapCount?: number;
  isCancelled?: boolean;
}

interface Seat {
  id: string;
  row: string;
  number: number;
  tier_id: string;
  zone_id: string;
  zones?: {
    id: string;
    name: string;
  };
}

interface Props {
  isOpen: boolean;
  onClose: () => void;
  attendee: Attendee;
  seat: Seat;
  onSuccess: () => void;
}

type SwapStep = 'info' | 'select' | 'confirm' | 'processing' | 'success';

const SwapConfirmationModal: React.FC<Props> = ({ isOpen, onClose, attendee, seat, onSuccess }) => {
  const [step, setStep] = useState<SwapStep>('info');
  const [error, setError] = useState<string | null>(null);
  const [availableSeats, setAvailableSeats] = useState<any[]>([]);
  const [selectedNewSeat, setSelectedNewSeat] = useState<any | null>(null);
  const [isLoading, setIsLoading] = useState(false);

  const handleLoadSeats = async () => {
    setIsLoading(true);
    setError(null);

    // Check if already swapped
    if ((attendee as any).swapCount >= 1) {
      setError('คุณได้เปลี่ยนแปลงที่นั่งไปแล้ว 1 ครั้ง (สูงสุด 1 ครั้ง)');
      setIsLoading(false);
      return;
    }

    try {
      // Get all seats in the zone (not just available ones)
      const allSeatsInZone = await seatService.getSeatsByZones([seat.zone_id]);
      
      if (allSeatsInZone.length === 0) {
        setError('ไม่พบที่นั่งในโซนนี้');
        setIsLoading(false);
        return;
      }

      setAvailableSeats(allSeatsInZone);
      setStep('select');
    } catch (err) {
      setError('เกิดข้อผิดพลาดในการโหลดที่นั่ง');
    }
    
    setIsLoading(false);
  };

  const handleConfirmSwap = () => {
    if (selectedNewSeat) {
      setStep('confirm');
    }
  };

  const handleSwap = async () => {
    if (!selectedNewSeat || !attendee.bookingSeatId) {
      setError('กรุณาเลือกที่นั่งใหม่');
      return;
    }

    setStep('processing');
    setError(null);

    const result = await ticketManagementService.swapSeat({
      bookingSeatId: attendee.bookingSeatId,
      currentSeatId: seat.id,
      newSeatId: selectedNewSeat.id,
      qrToken: attendee.qrToken,
    });

    if (result.success) {
      setStep('success');
      setTimeout(() => {
        onSuccess();
        handleClose();
      }, 3000);
    } else {
      setError(result.error || 'เกิดข้อผิดพลาด');
      setStep('confirm');
    }
  };

  const handleClose = () => {
    setStep('info');
    setError(null);
    setAvailableSeats([]);
    setSelectedNewSeat(null);
    onClose();
  };

  if (!isOpen) return null;

  // Group seats by row for seat map display
  const seatsByRow = availableSeats.reduce((acc, seat) => {
    if (!acc[seat.row]) acc[seat.row] = [];
    acc[seat.row].push(seat);
    return acc;
  }, {} as Record<string, any[]>);

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center px-6 animate-in fade-in duration-300">
      <div 
        className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" 
        onClick={step !== 'processing' ? handleClose : undefined}
      />
      
      <div className="relative bg-white w-full max-w-2xl rounded-[40px] overflow-hidden shadow-2xl animate-in zoom-in-95 duration-300 max-h-[90vh] overflow-y-auto">
        <div className="px-8 pt-10 pb-10">
          {/* Header */}
          <div className="flex items-center justify-between mb-6">
            <h3 className="text-2xl font-black text-slate-900">
              {step === 'info' && 'เปลี่ยนแปลงที่นั่ง'}
              {step === 'select' && 'เลือกที่นั่งใหม่'}
              {step === 'confirm' && 'ยืนยันการเปลี่ยนแปลง'}
              {step === 'processing' && 'กำลังเปลี่ยนแปลงที่นั่ง'}
              {step === 'success' && 'เปลี่ยนแปลงสำเร็จ'}
            </h3>
            {step !== 'processing' && (
              <button 
                onClick={handleClose} 
                className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition"
              >
                <X className="w-5 h-5 text-slate-500" />
              </button>
            )}
          </div>

          {step === 'info' && (
            <>
              {/* Current Ticket Info */}
              <div className="bg-slate-50 rounded-2xl p-5 mb-6 border border-slate-100">
                <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-3">ตั๋วปัจจุบัน</p>
                <div className="flex items-center justify-between mb-4">
                  <div>
                    <p className="text-xl font-black text-slate-900">{attendee.firstName} {attendee.lastName}</p>
                    <p className="text-sm text-slate-500 font-bold">แถว {seat.row} ที่นั่ง {seat.number}</p>
                  </div>
                  <div className="w-12 h-12 bg-white rounded-xl flex items-center justify-center border-2 border-slate-200">
                    <Armchair className="w-6 h-6 text-slate-700" />
                  </div>
                </div>
                {seat.zones && (
                  <div className="pt-3 border-t border-slate-200">
                    <p className="text-xs text-slate-400 font-bold">โซน: {seat.zones.name}</p>
                  </div>
                )}
              </div>

              {/* Info */}
              <div className="bg-blue-50 border-2 border-blue-200 rounded-2xl p-5 mb-6">
                <div className="flex items-start gap-3">
                  <AlertTriangle className="w-6 h-6 text-blue-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-black text-blue-900 mb-2">ข้อมูลการเปลี่ยนแปลงที่นั่ง</p>
                    <p className="text-sm text-blue-700 font-medium leading-relaxed">
                      คุณสามารถเลือกที่นั่งว่างในโซน <strong>{seat.zones?.name || 'ZONE A1'}</strong> เท่านั้น 
                      เมื่อเปลี่ยนแล้วที่นั่งเก่าจะกลับเข้าระบบ
                    </p>
                  </div>
                </div>
              </div>

              {/* Error Message */}
              {error && (
                <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-4 mb-6 flex items-start gap-3">
                  <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                  <p className="text-sm font-bold text-red-700">{error}</p>
                </div>
              )}

              {/* Buttons */}
              <div className="flex gap-3">
                <button
                  onClick={handleClose}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ยกเลิก
                </button>
                <button
                  onClick={handleLoadSeats}
                  disabled={isLoading}
                  className="flex-1 py-4 bg-blue-600 text-white rounded-2xl font-bold hover:bg-blue-700 transition flex items-center justify-center gap-2"
                >
                  {isLoading ? (
                    <Loader2 className="w-5 h-5 animate-spin" />
                  ) : (
                    <>
                      <RefreshCw className="w-5 h-5" />
                      <span>เลือกที่นั่งใหม่</span>
                    </>
                  )}
                </button>
              </div>
            </>
          )}

          {step === 'select' && (
            <>
              {/* Current Seat (compact) */}
              <div className="bg-slate-50 rounded-xl p-4 mb-6 border border-slate-100">
                <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-1">ที่นั่งปัจจุบัน</p>
                <p className="text-sm font-black text-slate-900">
                  {attendee.firstName} {attendee.lastName} • แถว {seat.row} ที่นั่ง {seat.number}
                </p>
              </div>

              {/* Seat Map */}
              <div className="bg-white rounded-2xl border-2 border-slate-100 p-6 mb-6">
                {/* Stage */}
                <div className="bg-slate-100 rounded-full py-2 mb-6 text-center">
                  <p className="text-slate-500 text-sm font-bold uppercase tracking-widest">STAGE</p>
                </div>

                {/* Seat Grid */}
                <div className="space-y-4 max-h-96 overflow-y-auto">
                  {Object.keys(seatsByRow).sort().map((row) => (
                    <div key={row} className="flex items-center gap-3">
                      <div className="w-8 flex-shrink-0">
                        <p className="text-xs font-black text-slate-500 text-center">{row}</p>
                      </div>
                      <div className="flex-1 flex gap-2 flex-wrap justify-center">
                        {seatsByRow[row].sort((a, b) => a.number - b.number).map((seatItem) => {
                          const isCurrentSeat = seatItem.id === seat.id;
                          const isBooked = seatItem.is_booked && !isCurrentSeat;
                          const isSelected = selectedNewSeat?.id === seatItem.id;
                          const isAvailable = !isBooked && !isCurrentSeat;

                          return (
                            <button
                              key={seatItem.id}
                              onClick={() => isAvailable && setSelectedNewSeat(seatItem)}
                              disabled={isBooked || isCurrentSeat}
                              className={`w-14 h-14 rounded-2xl flex items-center justify-center font-bold text-xs transition-all ${
                                isCurrentSeat
                                  ? 'bg-yellow-400 text-slate-900 cursor-default'
                                  : isBooked
                                    ? 'bg-slate-300 text-slate-500 cursor-not-allowed'
                                  : isSelected
                                    ? 'bg-red-500 text-white shadow-lg'
                                    : 'bg-slate-900 text-white hover:bg-slate-700 active:scale-95'
                              }`}
                            >
                              <span className="font-black">{seatItem.row}{seatItem.number}</span>
                            </button>
                          );
                        })}
                      </div>
                    </div>
                  ))}
                </div>

                {/* Legend */}
                <div className="mt-6 pt-4 border-t border-slate-100">
                  <div className="grid grid-cols-2 gap-3 text-sm">
                    <div className="flex items-center gap-2">
                      <div className="w-3 h-3 bg-slate-900 rounded-full" />
                      <span className="font-medium text-slate-700">ว่าง</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <div className="w-3 h-3 bg-red-500 rounded-full" />
                      <span className="font-medium text-slate-700">ที่นั่งใหม่ที่เลือก</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <div className="w-3 h-3 bg-yellow-400 rounded-full" />
                      <span className="font-medium text-slate-700">ที่นั่งของคุณ</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <div className="w-3 h-3 bg-slate-300 rounded-full" />
                      <span className="font-medium text-slate-700">เต็ม</span>
                    </div>
                  </div>
                </div>
              </div>

              {/* Selected Seat Info */}
              {selectedNewSeat && (
                <div className="bg-blue-50 border-2 border-blue-200 rounded-2xl p-4 mb-6">
                  <p className="text-xs font-bold text-blue-600 uppercase tracking-wider mb-2">ที่นั่งที่เลือก</p>
                  <p className="text-lg font-black text-blue-900">
                    แถว {selectedNewSeat.row} ที่นั่ง {selectedNewSeat.number}
                  </p>
                </div>
              )}

              {/* Buttons */}
              <div className="flex gap-3">
                <button
                  onClick={() => {
                    setStep('info');
                    setSelectedNewSeat(null);
                  }}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ย้อนกลับ
                </button>
                <button
                  onClick={handleConfirmSwap}
                  disabled={!selectedNewSeat}
                  className="flex-1 py-4 bg-blue-600 text-white rounded-2xl font-bold hover:bg-blue-700 transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                >
                  <span>ยืนยันการสลับ</span>
                  <ArrowRight className="w-5 h-5" />
                </button>
              </div>
            </>
          )}

          {step === 'confirm' && selectedNewSeat && (
            <>
              {/* Swap Comparison */}
              <div className="bg-slate-50 rounded-2xl p-6 mb-6 border border-slate-100">
                <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-4 text-center">
                  การเปลี่ยนแปลง
                </p>
                
                {/* Desktop: Side by side, Mobile: Stacked */}
                <div className="flex flex-col md:flex-row items-center gap-4">
                  {/* Old Seat */}
                  <div className="w-full md:flex-1 bg-white rounded-xl p-4 border-2 border-red-200">
                    <p className="text-xs font-bold text-red-600 uppercase tracking-wider mb-2">ที่นั่งเดิม</p>
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-red-100 rounded-lg flex items-center justify-center">
                        <Armchair className="w-5 h-5 text-red-600" />
                      </div>
                      <div>
                        <p className="text-base font-black text-slate-900">แถว {seat.row}</p>
                        <p className="text-sm text-slate-600 font-bold">ที่นั่ง {seat.number}</p>
                      </div>
                    </div>
                  </div>

                  {/* Arrow - horizontal on desktop, vertical on mobile */}
                  <ArrowRight className="w-6 h-6 text-slate-400 flex-shrink-0 rotate-90 md:rotate-0" />

                  {/* New Seat */}
                  <div className="w-full md:flex-1 bg-white rounded-xl p-4 border-2 border-blue-200">
                    <p className="text-xs font-bold text-blue-600 uppercase tracking-wider mb-2">ที่นั่งใหม่</p>
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                        <Armchair className="w-5 h-5 text-blue-600" />
                      </div>
                      <div>
                        <p className="text-base font-black text-slate-900">แถว {selectedNewSeat.row}</p>
                        <p className="text-sm text-slate-600 font-bold">ที่นั่ง {selectedNewSeat.number}</p>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="mt-4 pt-4 border-t border-slate-200">
                  <p className="text-sm font-bold text-slate-900">{attendee.firstName} {attendee.lastName}</p>
                  <p className="text-xs text-slate-500">โซน: {seat.zones?.name}</p>
                </div>
              </div>

              {/* Warning */}
              <div className="bg-blue-50 border-2 border-blue-200 rounded-2xl p-4 mb-6">
                <div className="flex items-start gap-3">
                  <AlertTriangle className="w-5 h-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <p className="text-sm text-blue-700 font-medium">
                    กรุณาตรวจสอบข้อมูลให้ถูกต้องก่อนยืนยัน การเปลี่ยนแปลงที่นั่งสามารถทำได้เพียง <strong>1 ครั้งเท่านั้น</strong>
                  </p>
                </div>
              </div>

              {/* Error Message */}
              {error && (
                <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-4 mb-6 flex items-start gap-3">
                  <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                  <p className="text-sm font-bold text-red-700">{error}</p>
                </div>
              )}

              {/* Buttons */}
              <div className="flex gap-3">
                <button
                  onClick={() => setStep('select')}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ย้อนกลับ
                </button>
                <button
                  onClick={handleSwap}
                  className="flex-1 py-4 bg-blue-600 text-white rounded-2xl font-bold hover:bg-blue-700 transition flex items-center justify-center gap-2"
                >
                  <CheckCircle2 className="w-5 h-5" />
                  <span>ยืนยันเปลี่ยนแปลงที่นั่ง</span>
                </button>
              </div>
            </>
          )}

          {step === 'processing' && (
            <div className="text-center py-8">
              <Loader2 className="w-16 h-16 text-blue-600 animate-spin mx-auto mb-4" />
              <p className="text-lg font-bold text-slate-900">กำลังเปลี่ยนแปลงที่นั่ง...</p>
              <p className="text-sm text-slate-500 mt-2">กรุณารอสักครู่</p>
            </div>
          )}

          {step === 'success' && selectedNewSeat && (
            <div className="text-center py-8">
              <div className="w-20 h-20 bg-blue-50 rounded-full flex items-center justify-center mx-auto mb-4 border-2 border-blue-200">
                <CheckCircle2 className="w-10 h-10 text-blue-600" />
              </div>
              <h4 className="text-2xl font-black text-slate-900 mb-2">เปลี่ยนแปลงที่นั่งสำเร็จ!</h4>
              <p className="text-sm text-slate-500 mb-6">ที่นั่งของคุณถูกเปลี่ยนเรียบร้อยแล้ว</p>
              
              {/* New Ticket Info */}
              <div className="bg-gradient-to-br from-blue-50 to-blue-100 rounded-2xl p-6 border-2 border-blue-200">
                <p className="text-xs font-bold text-blue-600 uppercase tracking-wider mb-3">ตั๋วใหม่ของคุณ</p>
                <div className="bg-white rounded-xl p-5 shadow-sm">
                  <p className="text-xl font-black text-slate-900 mb-2">{attendee.firstName} {attendee.lastName}</p>
                  <div className="flex items-center justify-center gap-4 mb-3">
                    <div className="text-center">
                      <p className="text-xs text-slate-400 font-bold mb-1">แถว</p>
                      <p className="text-2xl font-black text-blue-600">{selectedNewSeat.row}</p>
                    </div>
                    <div className="text-slate-300">•</div>
                    <div className="text-center">
                      <p className="text-xs text-slate-400 font-bold mb-1">ที่นั่ง</p>
                      <p className="text-2xl font-black text-blue-600">{selectedNewSeat.number}</p>
                    </div>
                  </div>
                  <p className="text-xs text-slate-500 font-bold">โซน: {seat.zones?.name}</p>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default SwapConfirmationModal;
