import React, { useState } from 'react';
import { X, ArrowRight, AlertTriangle, CheckCircle2, Loader2 } from 'lucide-react';
import { BookingInfo, SeatInfo } from '../../types/seat-swap';

interface Props {
  bookingInfo: BookingInfo;
  oldSeat: SeatInfo;
  newSeat: SeatInfo;
  onConfirm: (reason?: string, notes?: string) => void;
  onCancel: () => void;
  loading?: boolean;
}

const SwapConfirmationDialog: React.FC<Props> = ({
  bookingInfo,
  oldSeat,
  newSeat,
  onConfirm,
  onCancel,
  loading = false
}) => {
  const [reason, setReason] = useState('');
  const [notes, setNotes] = useState('');

  const tierChange = oldSeat.tier_id !== newSeat.tier_id;
  const zoneChange = oldSeat.zone_id !== newSeat.zone_id;

  const handleConfirm = () => {
    onConfirm(reason.trim() || undefined, notes.trim() || undefined);
  };

  return (
    <div 
      className="fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 animate-in fade-in duration-300 overflow-y-auto"
      onClick={onCancel}
    >
      <div 
        className="relative w-full max-w-2xl my-auto animate-in zoom-in-95 duration-300"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Close Button */}
        <button
          onClick={onCancel}
          disabled={loading}
          className="absolute -top-12 right-0 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center transition z-10 cursor-pointer disabled:opacity-50"
        >
          <X className="w-6 h-6 text-white" />
        </button>

        <div className="bg-white rounded-[32px] overflow-hidden shadow-2xl">
          {/* Header */}
          <div className="p-4 bg-gradient-to-br from-amber-50 to-white border-b border-amber-100">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
                <AlertTriangle className="w-5 h-5 text-amber-600" />
              </div>
              <div>
                <h3 className="text-xl font-black text-slate-900">ยืนยันการเปลี่ยนแปลงที่นั่ง</h3>
                <p className="text-xs text-slate-600">กรุณาตรวจสอบข้อมูลก่อนดำเนินการ</p>
              </div>
            </div>
          </div>

          <div className="p-4 space-y-4">
            {/* Attendee Info */}
            <div className="bg-slate-50 rounded-[16px] p-3">
              <p className="text-[10px] font-bold text-slate-500 uppercase mb-2">ข้อมูลผู้เข้าร่วม</p>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <p className="text-xs font-medium text-slate-600">ชื่อ</p>
                  <p className="text-sm font-black text-slate-900">
                    {bookingInfo.first_name} {bookingInfo.last_name}
                  </p>
                </div>
                <div>
                  <p className="text-xs font-medium text-slate-600">QR Code</p>
                  <p className="text-sm font-mono font-bold text-blue-600">{bookingInfo.qr_token}</p>
                </div>
              </div>
            </div>

            {/* Seat Comparison */}
            <div className="grid grid-cols-[1fr_auto_1fr] gap-3 items-center">
              {/* Old Seat */}
              <div className="bg-red-50 rounded-[20px] p-4 border-2 border-red-100">
                <p className="text-[10px] font-bold text-red-600 uppercase mb-3">ที่นั่งเดิม</p>
                <div className="space-y-3">
                  <div>
                    <p className="text-[10px] font-bold text-slate-500 uppercase mb-1">ZONE</p>
                    <p className="text-base font-black text-slate-900">{oldSeat.zone_name}</p>
                  </div>
                  <div className="flex gap-4">
                    <div className="flex-1">
                      <p className="text-[10px] font-bold text-slate-500 uppercase mb-1">ROW</p>
                      <p className="text-2xl font-black text-slate-900">{oldSeat.row}</p>
                    </div>
                    <div className="flex-1">
                      <p className="text-[10px] font-bold text-slate-500 uppercase mb-1">SEAT</p>
                      <p className="text-2xl font-black text-red-600">
                        {oldSeat.number.toString().padStart(2, '0')}
                      </p>
                    </div>
                  </div>
                </div>
              </div>

              {/* Arrow */}
              <div className="flex items-center justify-center">
                <ArrowRight className="w-8 h-8 text-slate-300" />
              </div>

              {/* New Seat */}
              <div className="bg-green-50 rounded-[20px] p-4 border-2 border-green-200">
                <p className="text-[10px] font-bold text-green-600 uppercase mb-3">ที่นั่งใหม่</p>
                <div className="space-y-3">
                  <div>
                    <p className="text-[10px] font-bold text-slate-500 uppercase mb-1">ZONE</p>
                    <p className="text-base font-black text-slate-900">{newSeat.zone_name}</p>
                  </div>
                  <div className="flex gap-4">
                    <div className="flex-1">
                      <p className="text-[10px] font-bold text-slate-500 uppercase mb-1">ROW</p>
                      <p className="text-2xl font-black text-slate-900">{newSeat.row}</p>
                    </div>
                    <div className="flex-1">
                      <p className="text-[10px] font-bold text-slate-500 uppercase mb-1">SEAT</p>
                      <p className="text-2xl font-black text-green-600">
                        {newSeat.number.toString().padStart(2, '0')}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Change Warnings */}
            {zoneChange && (
              <div className="bg-amber-50 border-2 border-amber-200 rounded-[16px] p-4">
                <div className="flex items-start gap-3">
                  <AlertTriangle className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <p className="text-sm font-bold text-amber-900 mb-1">การเปลี่ยนแปลง</p>
                    <ul className="text-sm text-amber-800 space-y-1">
                      <li>• เปลี่ยน Zone จาก <strong>{oldSeat.zone_name}</strong> เป็น <strong>{newSeat.zone_name}</strong></li>
                    </ul>
                  </div>
                </div>
              </div>
            )}

            {/* Reason (Optional) */}
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1.5">
                เหตุผลในการเปลี่ยนแปลงที่นั่ง (ไม่บังคับ)
              </label>
              <textarea
                value={reason}
                onChange={(e) => setReason(e.target.value)}
                placeholder="เช่น ผู้ใช้ขอเปลี่ยนเนื่องจาก..."
                className="w-full px-3 py-2 bg-slate-50 border-2 border-slate-200 rounded-[12px] text-sm text-slate-900 font-medium focus:border-blue-500 focus:bg-white outline-none transition resize-none"
                rows={2}
                disabled={loading}
              />
            </div>

            {/* Admin Notes (Optional) */}
            <div>
              <label className="block text-xs font-bold text-slate-700 mb-1.5">
                บันทึกของ Admin (ไม่บังคับ)
              </label>
              <textarea
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
                placeholder="บันทึกเพิ่มเติมสำหรับ internal use..."
                className="w-full px-3 py-2 bg-slate-50 border-2 border-slate-200 rounded-[12px] text-sm text-slate-900 font-medium focus:border-blue-500 focus:bg-white outline-none transition resize-none"
                rows={2}
                disabled={loading}
              />
            </div>

            {/* Important Notice */}
            <div className="bg-blue-50 border-2 border-blue-200 rounded-[12px] p-3">
              <div className="flex items-start gap-2">
                <CheckCircle2 className="w-4 h-4 text-blue-600 flex-shrink-0 mt-0.5" />
                <div>
                  <p className="text-xs font-bold text-blue-900 mb-1">สิ่งที่จะเกิดขึ้น</p>
                  <ul className="text-xs text-blue-800 space-y-0.5">
                    <li>• ที่นั่งจะถูกเปลี่ยนในระบบทันที</li>
                    <li>• QR Code ยังคงเหมือนเดิม (ไม่เปลี่ยนแปลง)</li>
                    <li>• ระบบจะส่งอีเมลแจ้งเตือนไปยังผู้ใช้อัตโนมัติ</li>
                    <li>• การเปลี่ยนแปลงจะถูกบันทึกใน audit log</li>
                  </ul>
                </div>
              </div>
            </div>

            {/* Action Buttons */}
            <div className="flex gap-2">
              <button
                onClick={onCancel}
                disabled={loading}
                className="flex-1 py-3 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-[16px] font-bold text-sm transition disabled:opacity-50 disabled:cursor-not-allowed"
              >
                ยกเลิก
              </button>
              <button
                onClick={handleConfirm}
                disabled={loading}
                className="flex-1 py-3 bg-green-600 hover:bg-green-700 text-white rounded-[16px] font-black text-sm flex items-center justify-center gap-2 transition disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? (
                  <>
                    <Loader2 className="w-5 h-5 animate-spin" />
                    <span>กำลังดำเนินการ...</span>
                  </>
                ) : (
                  <>
                    <CheckCircle2 className="w-5 h-5" />
                    <span>ยืนยันการเปลี่ยนแปลง</span>
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SwapConfirmationDialog;
