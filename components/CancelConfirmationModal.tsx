import React, { useState } from 'react';
import { X, AlertTriangle, Trash2, Armchair, Loader2, CheckCircle2 } from 'lucide-react';
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

type CancelStep = 'warning' | 'confirm' | 'processing' | 'success';

const CancelConfirmationModal: React.FC<Props> = ({ isOpen, onClose, attendee, seat, onSuccess }) => {
  const [step, setStep] = useState<CancelStep>('warning');
  const [error, setError] = useState<string | null>(null);

  const handleCancel = async () => {
    if (!attendee.bookingSeatId) {
      setError('ไม่พบข้อมูล booking seat ID');
      return;
    }

    // Check if already cancelled
    if ((attendee as any).cancelCount >= 1) {
      setError('คุณได้ยกเลิกตั๋วไปแล้ว 1 ครั้ง (สูงสุด 1 ครั้ง)');
      return;
    }

    setStep('processing');
    setError(null);

    const result = await ticketManagementService.cancelTicket({
      bookingSeatId: attendee.bookingSeatId,
      qrToken: attendee.qrToken,
    });

    if (result.success) {
      setStep('success');
      setTimeout(() => {
        onSuccess();
        handleClose();
      }, 2500);
    } else {
      setError(result.error || 'เกิดข้อผิดพลาด');
      setStep('confirm');
    }
  };

  const handleClose = () => {
    setStep('warning');
    setError(null);
    onClose();
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center px-6 animate-in fade-in duration-300">
      <div 
        className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" 
        onClick={step !== 'processing' ? handleClose : undefined}
      />
      
      <div className="relative bg-white w-full max-w-md rounded-[40px] overflow-hidden shadow-2xl animate-in zoom-in-95 duration-300">
        <div className="px-8 pt-10 pb-10">
          {/* Header */}
          <div className="flex items-center justify-between mb-6">
            <h3 className="text-2xl font-black text-slate-900">ยืนยันการยกเลิก</h3>
            {step !== 'processing' && (
              <button 
                onClick={handleClose} 
                className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition"
              >
                <X className="w-5 h-5 text-slate-500" />
              </button>
            )}
          </div>

          {step === 'warning' && (
            <>
              {/* Ticket Info */}
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

              {/* Warning */}
              <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-5 mb-6">
                <div className="flex items-start gap-3">
                  <AlertTriangle className="w-6 h-6 text-red-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-black text-red-900 mb-2">คำเตือน</p>
                    <p className="text-sm text-red-700 font-medium leading-relaxed">
                      เมื่อยกเลิกตั๋วแล้ว <strong>QR Code และรหัสที่แลกมา</strong> จะไม่สามารถใช้งานได้อีกต่อไป 
                      และที่นั่งจะถูกคืนเข้าระบบ
                    </p>
                  </div>
                </div>
              </div>

              {/* Buttons */}
              <div className="flex gap-3">
                <button
                  onClick={handleClose}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ยกเลิก
                </button>
                <button
                  onClick={() => setStep('confirm')}
                  className="flex-1 py-4 bg-red-600 text-white rounded-2xl font-bold hover:bg-red-700 transition flex items-center justify-center gap-2"
                >
                  <Trash2 className="w-5 h-5" />
                  <span>ยืนยันการยกเลิก</span>
                </button>
              </div>
            </>
          )}

          {step === 'confirm' && (
            <>
              {/* Final Confirmation */}
              <div className="text-center py-6">
                <div className="w-16 h-16 bg-red-50 rounded-full flex items-center justify-center mx-auto mb-4 border-2 border-red-200">
                  <AlertTriangle className="w-8 h-8 text-red-600" />
                </div>
                <h4 className="text-xl font-black text-slate-900 mb-3">ต้องการยกเลิกตั๋วนี้ใช่ไหม?</h4>
                {/*<p className="text-sm text-slate-600 mb-6">คุณต้องการยกเลิกตั๋วนี้จริงๆ ใช่ไหม?</p> */}
                
                {/* Ticket Summary */}
                <div className="bg-slate-50 rounded-2xl p-4 mb-6 border border-slate-100">
                  <p className="text-lg font-black text-slate-900">{attendee.firstName} {attendee.lastName}</p>
                  <p className="text-sm text-slate-500 font-bold">แถว {seat.row} ที่นั่ง {seat.number}</p>
                  {seat.zones && (
                    <p className="text-xs text-slate-400 font-bold mt-2">โซน: {seat.zones.name}</p>
                  )}
                </div>

                {/* Error Message */}
                {error && (
                  <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-4 mb-6 flex items-start gap-3">
                    <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                    <p className="text-sm font-bold text-red-700">{error}</p>
                  </div>
                )}
              </div>

              {/* Buttons */}
              <div className="flex gap-3">
                <button
                  onClick={() => setStep('warning')}
                  className="flex-1 py-4 bg-slate-100 text-slate-700 rounded-2xl font-bold hover:bg-slate-200 transition"
                >
                  ย้อนกลับ
                </button>
                <button
                  onClick={handleCancel}
                  className="flex-1 py-4 bg-red-600 text-white rounded-2xl font-bold hover:bg-red-700 transition flex items-center justify-center gap-2"
                >
                  <Trash2 className="w-5 h-5" />
                  <span>ยืนยันยกเลิก</span>
                </button>
              </div>
            </>
          )}

          {step === 'processing' && (
            <div className="text-center py-8">
              <Loader2 className="w-16 h-16 text-red-600 animate-spin mx-auto mb-4" />
              <p className="text-lg font-bold text-slate-900">กำลังยกเลิกตั๋ว...</p>
              <p className="text-sm text-slate-500 mt-2">กรุณารอสักครู่</p>
            </div>
          )}

          {step === 'success' && (
            <div className="text-center py-8">
              <div className="w-20 h-20 bg-emerald-50 rounded-full flex items-center justify-center mx-auto mb-4 border-2 border-emerald-200">
                <CheckCircle2 className="w-10 h-10 text-emerald-600" />
              </div>
              <h4 className="text-2xl font-black text-slate-900 mb-2">ยกเลิกสำเร็จ!</h4>
              <p className="text-sm text-slate-500">ตั๋วของคุณถูกยกเลิกเรียบร้อยแล้ว</p>
              <div className="mt-6 bg-slate-50 rounded-2xl p-4 border border-slate-100">
                <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-2">ตั๋วที่ยกเลิก</p>
                <p className="text-lg font-black text-slate-900">{attendee.firstName} {attendee.lastName}</p>
                <p className="text-sm text-slate-500 font-bold">แถว {seat.row} ที่นั่ง {seat.number}</p>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default CancelConfirmationModal;
