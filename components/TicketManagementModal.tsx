import React, { useState } from 'react';
import { X, AlertTriangle, RefreshCw, Trash2, Armchair, Loader2, CheckCircle2 } from 'lucide-react';
import { ticketManagementService } from '../lib/services/ticketManagementService';

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

type ManagementAction = 'menu' | 'cancel' | 'swap' | 'swap-select';

const TicketManagementModal: React.FC<Props> = ({ isOpen, onClose, attendee, seat, onSuccess }) => {
  const [action, setAction] = useState<ManagementAction>('menu');
  const [isProcessing, setIsProcessing] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [availableSeats, setAvailableSeats] = useState<any[]>([]);
  const [selectedNewSeat, setSelectedNewSeat] = useState<string | null>(null);

  const handleCancelTicket = async () => {
    if (!attendee.bookingSeatId) {
      setError('ไม่พบข้อมูล booking seat ID');
      return;
    }

    setIsProcessing(true);
    setError(null);

    const result = await ticketManagementService.cancelTicket({
      bookingSeatId: attendee.bookingSeatId,
      qrToken: attendee.qrToken,
    });

    setIsProcessing(false);

    if (result.success) {
      setSuccess(result.message || 'ยกเลิกตั๋วเรียบร้อยแล้ว');
      setTimeout(() => {
        onSuccess();
        onClose();
      }, 2000);
    } else {
      setError(result.error || 'เกิดข้อผิดพลาด');
    }
  };

  const handleLoadAvailableSeats = async () => {
    setIsProcessing(true);
    setError(null);

    const seats = await ticketManagementService.getAvailableSeatsForSwap({
      tierId: seat.tier_id,
      zoneId: seat.zone_id,
    });

    setIsProcessing(false);

    if (seats.length === 0) {
      setError('ไม่มีที่นั่งว่างในโซนนี้');
      return;
    }

    setAvailableSeats(seats);
    setAction('swap-select');
  };

  const handleSwapSeat = async () => {
    if (!selectedNewSeat || !attendee.bookingSeatId) {
      setError('กรุณาเลือกที่นั่งใหม่');
      return;
    }

    setIsProcessing(true);
    setError(null);

    const result = await ticketManagementService.swapSeat({
      bookingSeatId: attendee.bookingSeatId,
      currentSeatId: seat.id,
      newSeatId: selectedNewSeat,
      qrToken: attendee.qrToken,
    });

    setIsProcessing(false);

    if (result.success) {
      setSuccess(result.message || 'สลับที่นั่งเรียบร้อยแล้ว');
      setTimeout(() => {
        onSuccess();
        onClose();
      }, 2000);
    } else {
      setError(result.error || 'เกิดข้อผิดพลาด');
    }
  };

  const resetModal = () => {
    setAction('menu');
    setError(null);
    setSuccess(null);
    setAvailableSeats([]);
    setSelectedNewSeat(null);
  };

  const handleClose = () => {
    resetModal();
    onClose();
  };

  if (!isOpen) return null;

  const canCancel = !attendee.isCancelled && (attendee.cancelCount || 0) < 1;
  const canSwap = !attendee.isCancelled && (attendee.swapCount || 0) < 1;

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center px-6 animate-in fade-in duration-300">
      <div 
        className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" 
        onClick={handleClose}
      />
      
      <div className="relative bg-white w-full max-w-md rounded-[40px] overflow-hidden shadow-2xl animate-in zoom-in-95 duration-300">
        <div className="px-8 pt-10 pb-10">
          {/* Header */}
          <div className="flex items-center justify-between mb-6">
            <h3 className="text-2xl font-black text-slate-900">
              {action === 'menu' && 'จัดการการจอง'}
              {action === 'cancel' && 'ยกเลิกตั๋ว'}
              {action === 'swap' && 'สลับที่นั่ง'}
              {action === 'swap-select' && 'เลือกที่นั่งใหม่'}
            </h3>
            <button 
              onClick={handleClose} 
              className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition"
            >
              <X className="w-5 h-5 text-slate-500" />
            </button>
          </div>

          {/* Current Ticket Info */}
          <div className="bg-slate-50 rounded-2xl p-4 mb-6 border border-slate-100">
            <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-2">ตั๋วปัจจุบัน</p>
            <div className="flex items-center justify-between">
              <div>
                <p className="text-lg font-black text-slate-900">{attendee.firstName} {attendee.lastName}</p>
                <p className="text-sm text-slate-500 font-bold">แถว {seat.row} ที่นั่ง {seat.number}</p>
              </div>
              <div className="w-12 h-12 bg-white rounded-xl flex items-center justify-center border-2 border-slate-200">
                <Armchair className="w-6 h-6 text-slate-700" />
              </div>
            </div>
          </div>

          {/* Success Message */}
          {success && (
            <div className="bg-emerald-50 border-2 border-emerald-200 rounded-2xl p-4 mb-6 flex items-start gap-3">
              <CheckCircle2 className="w-5 h-5 text-emerald-600 flex-shrink-0 mt-0.5" />
              <p className="text-sm font-bold text-emerald-700">{success}</p>
            </div>
          )}

          {/* Error Message */}
          {error && (
            <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-4 mb-6 flex items-start gap-3">
              <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
              <p className="text-sm font-bold text-red-700">{error}</p>
            </div>
          )}

          {/* Menu */}
          {action === 'menu' && (
            <div className="space-y-3">
              {/* Cancel Ticket Button */}
              <button
                onClick={() => setAction('cancel')}
                disabled={!canCancel || attendee.isCheckedIn}
                className={`w-full p-5 rounded-2xl border-2 transition text-left ${
                  canCancel && !attendee.isCheckedIn
                    ? 'border-slate-200 hover:border-red-500 hover:bg-red-50 group'
                    : 'border-slate-100 bg-slate-50 opacity-50 cursor-not-allowed'
                }`}
              >
                <div className="flex items-center gap-4">
                  <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${
                    canCancel && !attendee.isCheckedIn ? 'bg-red-100 group-hover:bg-red-200' : 'bg-slate-200'
                  }`}>
                    <Trash2 className={`w-6 h-6 ${canCancel && !attendee.isCheckedIn ? 'text-red-600' : 'text-slate-400'}`} />
                  </div>
                  <div className="flex-1">
                    <p className={`text-lg font-black ${canCancel && !attendee.isCheckedIn ? 'text-slate-900 group-hover:text-red-600' : 'text-slate-400'}`}>
                      ยกเลิกตั๋ว
                    </p>
                    <p className="text-xs text-slate-500 font-medium">
                      {attendee.isCheckedIn 
                        ? 'ไม่สามารถยกเลิกตั๋วที่เช็คอินแล้ว'
                        : !canCancel 
                          ? `ใช้งานแล้ว ${attendee.cancelCount || 0}/1 ครั้ง`
                          : 'คืนที่นั่งเข้าระบบ (ใช้ได้ 1 ครั้ง)'
                      }
                    </p>
                  </div>
                </div>
              </button>

              {/* Swap Seat Button */}
              <button
                onClick={() => setAction('swap')}
                disabled={!canSwap || attendee.isCheckedIn}
                className={`w-full p-5 rounded-2xl border-2 transition text-left ${
                  canSwap && !attendee.isCheckedIn
                    ? 'border-slate-200 hover:border-blue-500 hover:bg-blue-50 group'
                    : 'border-slate-100 bg-slate-50 opacity-50 cursor-not-allowed'
                }`}
              >
                <div className="flex items-center gap-4">
                  <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${
                    canSwap && !attendee.isCheckedIn ? 'bg-blue-100 group-hover:bg-blue-200' : 'bg-slate-200'
                  }`}>
                    <RefreshCw className={`w-6 h-6 ${canSwap && !attendee.isCheckedIn ? 'text-blue-600' : 'text-slate-400'}`} />
                  </div>
                  <div className="flex-1">
                    <p className={`text-lg font-black ${canSwap && !attendee.isCheckedIn ? 'text-slate-900 group-hover:text-blue-600' : 'text-slate-400'}`}>
                      สลับที่นั่ง
                    </p>
                    <p className="text-xs text-slate-500 font-medium">
                      {attendee.isCheckedIn
                        ? 'ไม่สามารถสลับที่นั่งที่เช็คอินแล้ว'
                        : !canSwap
                          ? `ใช้งานแล้ว ${attendee.swapCount || 0}/1 ครั้ง`
                          : 'เปลี่ยนที่นั่งในโซนเดียวกัน (ใช้ได้ 1 ครั้ง)'
                      }
                    </p>
                  </div>
                </div>
              </button>
            </div>
          )}

          {/* Cancel Confirmation */}
          {action === 'cancel' && (
            <div className="space-y-6">
              <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-5">
                <div className="flex items-start gap-3 mb-3">
                  <AlertTriangle className="w-6 h-6 text-red-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-black text-red-900 mb-2">คำเตือน</p>
                    <p className="text-sm text-red-700 font-medium leading-relaxed">
                      เมื่อยกเลิกตั๋วแล้ว <strong>QR Code และโค้ดที่แลกมา</strong> จะไม่สามารถใช้งานได้อีกต่อไป 
                      และที่นั่งจะถูกคืนเข้าระบบ
                    </p>
                  </div>
                </div>
              </div>

              <div className="flex gap-3">
                <button
                  onClick={() => setAction('menu')}
                  disabled={isProcessing}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ยกเลิก
                </button>
                <button
                  onClick={handleCancelTicket}
                  disabled={isProcessing}
                  className="flex-1 py-4 bg-red-600 text-white rounded-2xl font-bold hover:bg-red-700 transition flex items-center justify-center gap-2"
                >
                  {isProcessing ? (
                    <Loader2 className="w-5 h-5 animate-spin" />
                  ) : (
                    <>
                      <Trash2 className="w-5 h-5" />
                      <span>ยืนยันยกเลิก</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          )}

          {/* Swap Confirmation */}
          {action === 'swap' && (
            <div className="space-y-6">
              <div className="bg-blue-50 border-2 border-blue-200 rounded-2xl p-5">
                <div className="flex items-start gap-3 mb-3">
                  <AlertTriangle className="w-6 h-6 text-blue-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-black text-blue-900 mb-2">ข้อมูลการสลับที่นั่ง</p>
                    <p className="text-sm text-blue-700 font-medium leading-relaxed">
                      คุณสามารถเลือกที่นั่งว่างในโซน <strong>{seat.zones?.name || 'เดียวกัน'}</strong> เท่านั้น 
                      เมื่อสลับแล้วที่นั่งเก่าจะกลับเข้าระบบ
                    </p>
                  </div>
                </div>
              </div>

              <div className="flex gap-3">
                <button
                  onClick={() => setAction('menu')}
                  disabled={isProcessing}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ยกเลิก
                </button>
                <button
                  onClick={handleLoadAvailableSeats}
                  disabled={isProcessing}
                  className="flex-1 py-4 bg-blue-600 text-white rounded-2xl font-bold hover:bg-blue-700 transition flex items-center justify-center gap-2"
                >
                  {isProcessing ? (
                    <Loader2 className="w-5 h-5 animate-spin" />
                  ) : (
                    <>
                      <RefreshCw className="w-5 h-5" />
                      <span>เลือกที่นั่งใหม่</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          )}

          {/* Seat Selection */}
          {action === 'swap-select' && (
            <div className="space-y-6">
              <div className="bg-slate-50 rounded-2xl p-4 border border-slate-100">
                <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-3">
                  ที่นั่งว่าง ({availableSeats.length} ที่นั่ง)
                </p>
                <div className="max-h-64 overflow-y-auto space-y-2 no-scrollbar">
                  {availableSeats.map((availableSeat) => (
                    <button
                      key={availableSeat.id}
                      onClick={() => setSelectedNewSeat(availableSeat.id)}
                      className={`w-full p-3 rounded-xl border-2 transition text-left ${
                        selectedNewSeat === availableSeat.id
                          ? 'border-blue-500 bg-blue-50'
                          : 'border-slate-200 hover:border-blue-300 bg-white'
                      }`}
                    >
                      <div className="flex items-center justify-between">
                        <div>
                          <p className="text-sm font-black text-slate-900">
                            แถว {availableSeat.row} ที่นั่ง {availableSeat.number}
                          </p>
                          <p className="text-xs text-slate-500 font-medium">
                            {availableSeat.zones?.name}
                          </p>
                        </div>
                        <div className={`w-8 h-8 rounded-lg flex items-center justify-center ${
                          selectedNewSeat === availableSeat.id ? 'bg-blue-100' : 'bg-slate-100'
                        }`}>
                          <Armchair className={`w-4 h-4 ${
                            selectedNewSeat === availableSeat.id ? 'text-blue-600' : 'text-slate-500'
                          }`} />
                        </div>
                      </div>
                    </button>
                  ))}
                </div>
              </div>

              <div className="flex gap-3">
                <button
                  onClick={() => {
                    setAction('swap');
                    setSelectedNewSeat(null);
                    setAvailableSeats([]);
                  }}
                  disabled={isProcessing}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ย้อนกลับ
                </button>
                <button
                  onClick={handleSwapSeat}
                  disabled={isProcessing || !selectedNewSeat}
                  className="flex-1 py-4 bg-blue-600 text-white rounded-2xl font-bold hover:bg-blue-700 transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                >
                  {isProcessing ? (
                    <Loader2 className="w-5 h-5 animate-spin" />
                  ) : (
                    <>
                      <CheckCircle2 className="w-5 h-5" />
                      <span>ยืนยันสลับ</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default TicketManagementModal;
