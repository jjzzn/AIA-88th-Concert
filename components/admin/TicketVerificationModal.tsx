import React, { useState, useEffect } from 'react';
import { X, CheckCircle2, AlertCircle, Loader2, UserCheck, Clock } from 'lucide-react';
import { AdminUser, TicketVerification } from '../../types/admin';
import { adminService } from '../../lib/services/adminService';
import Dialog from '../Dialog';
import { useDialog } from '../../lib/hooks/useDialog';

interface Props {
  qrToken: string;
  adminUser: AdminUser;
  onClose: () => void;
  onCheckInComplete: () => void;
}

const TicketVerificationModal: React.FC<Props> = ({ qrToken, adminUser, onClose, onCheckInComplete }) => {
  const [verification, setVerification] = useState<TicketVerification | null>(null);
  const [loading, setLoading] = useState(true);
  const [checkingIn, setCheckingIn] = useState(false);
  const [checkInSuccess, setCheckInSuccess] = useState(false);
  const dialog = useDialog();

  useEffect(() => {
    verifyTicket();
  }, [qrToken]);

  const verifyTicket = async () => {
    setLoading(true);
    const result = await adminService.verifyTicket(qrToken);
    setVerification(result);
    setLoading(false);
  };

  const handleCheckIn = async () => {
    console.log('🎯 Check-in button clicked');
    console.log('Verification:', verification);
    console.log('Admin User:', adminUser);
    
    if (!verification?.valid || !verification.booking_seat_id || verification.already_checked_in) {
      console.error('❌ Check-in validation failed:', {
        valid: verification?.valid,
        booking_seat_id: verification?.booking_seat_id,
        already_checked_in: verification?.already_checked_in
      });
      return;
    }

    if (!adminUser.gate_id) {
      console.error('❌ Admin user has no gate_id');
      dialog.showError('ไม่สามารถ Check-in ได้: ไม่พบข้อมูล Gate\nกรุณาติดต่อผู้ดูแลระบบ');
      return;
    }

    console.log('✅ Starting check-in...');
    setCheckingIn(true);
    
    const success = await adminService.checkIn(
      verification.booking_seat_id,
      adminUser.id,
      adminUser.gate_id
    );

    console.log('Check-in result:', success);
    setCheckingIn(false);
    
    if (success) {
      console.log('✅ Check-in successful!');
      // Update verification to show checked in
      setVerification({
        ...verification,
        already_checked_in: true,
        checked_in_at: new Date().toISOString()
      });
      
      // Show success state
      setCheckInSuccess(true);
      
      // Notify parent immediately
      onCheckInComplete();
    } else {
      console.error('❌ Check-in failed');
      dialog.showError('เกิดข้อผิดพลาดในการ Check-in\nกรุณาลองอีกครั้ง');
    }
  };

  return (
    <div 
      className="fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-6 animate-in fade-in duration-300"
      onClick={onClose}
    >
      <div 
        className="relative w-full max-w-md animate-in zoom-in-95 duration-300"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Close Button */}
        <button
          onClick={(e) => {
            e.stopPropagation();
            onClose();
          }}
          className="absolute -top-12 right-0 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center transition z-10 cursor-pointer"
        >
          <X className="w-6 h-6 text-white" />
        </button>

        <div className="bg-white rounded-[32px] overflow-hidden shadow-2xl relative z-0">
          {loading ? (
            <div className="p-12 text-center">
              <Loader2 className="w-12 h-12 text-[#E4002B] animate-spin mx-auto mb-4" />
              <p className="text-lg font-bold text-slate-900">กำลังตรวจสอบตั๋ว...</p>
            </div>
          ) : verification?.valid ? (
            <>
              {/* Header */}
              <div className={`p-6 text-center ${checkInSuccess ? 'bg-gradient-to-br from-emerald-50 to-white' : verification.already_checked_in ? 'bg-gradient-to-br from-amber-50 to-white' : 'bg-gradient-to-br from-blue-50 to-white'}`}>
                <div className={`w-16 h-16 ${checkInSuccess ? 'bg-emerald-100' : verification.already_checked_in ? 'bg-amber-100' : 'bg-blue-100'} rounded-full flex items-center justify-center mx-auto mb-4`}>
                  {checkInSuccess ? (
                    <CheckCircle2 className="w-8 h-8 text-emerald-600" />
                  ) : verification.already_checked_in ? (
                    <AlertCircle className="w-8 h-8 text-amber-600" />
                  ) : (
                    <Clock className="w-8 h-8 text-blue-500" />
                  )}
                </div>
                <h3 className={`text-2xl font-black mb-2 ${checkInSuccess ? 'text-slate-900' : verification.already_checked_in ? 'text-amber-600' : 'text-slate-900'}`}>
                  {checkInSuccess ? 'Check-in Success' : verification.already_checked_in ? 'ถูกใช้แล้ว (USED)' : 'Verification'}
                </h3>
                {!checkInSuccess && !verification.already_checked_in && (
                  <p className="text-xs text-slate-500 font-medium uppercase tracking-wider">
                    TICKET ID: #{qrToken}
                  </p>
                )}
                {!checkInSuccess && verification.already_checked_in && (
                  <p className="text-sm font-medium text-slate-600">
                    ตั๋วนี้ได้ทำการ Check-in แล้ว
                  </p>
                )}
              </div>

              {/* Ticket Details */}
              <div className="p-6 space-y-4">
                {/* Attendee Photo Placeholder */}
                <div className="flex justify-center mb-4">
                  <div className="w-20 h-20 bg-slate-100 rounded-full flex items-center justify-center">
                    <UserCheck className="w-10 h-10 text-slate-400" />
                  </div>
                </div>

                {/* Attendee Name */}
                <div className="text-center mb-6">
                  <h4 className="text-2xl font-black text-slate-900 mb-1">
                    {verification.attendee_name}
                  </h4>
                  <p className="text-xs text-slate-500 font-medium uppercase tracking-wider">
                    TICKET ID: #{qrToken}
                  </p>
                </div>

                {/* Ticket Info Grid */}
                <div className="grid grid-cols-2 gap-4">
                  <div className="bg-slate-50 rounded-[16px] p-4">
                    <p className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-1">Tier</p>
                    <p className="text-lg font-black uppercase" style={{ color: verification.tier_color }}>
                      {verification.tier_name}
                    </p>
                  </div>
                  <div className="bg-slate-50 rounded-[16px] p-4">
                    <p className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-1">Section</p>
                    <p className="text-lg font-black text-slate-900">
                      {verification.zone_name}
                    </p>
                  </div>
                  <div className="bg-slate-50 rounded-[16px] p-4">
                    <p className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-1">Row</p>
                    <p className="text-2xl font-black text-slate-900">
                      {verification.row}
                    </p>
                  </div>
                  <div className="bg-slate-50 rounded-[16px] p-4">
                    <p className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-1">Seat</p>
                    <p className="text-2xl font-black text-[#E4002B]">
                      {verification.seat.toString().padStart(2, '0')}
                    </p>
                  </div>
                </div>

                {/* Action Buttons */}
                {checkInSuccess ? (
                  <button
                    onClick={onClose}
                    className="w-full py-4 bg-slate-100 text-slate-700 rounded-[20px] font-bold text-base hover:bg-slate-200 transition cursor-pointer relative z-10"
                  >
                    กลับสู่หน้าหลัก
                  </button>
                ) : verification.already_checked_in ? (
                  <button
                    onClick={onClose}
                    className="w-full py-4 bg-slate-200 text-slate-700 rounded-[20px] font-black text-lg hover:bg-slate-300 transition cursor-pointer relative z-10"
                  >
                    ปิด
                  </button>
                ) : (
                  <button
                    onClick={handleCheckIn}
                    disabled={checkingIn}
                    className="w-full py-4 bg-[#E4002B] text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 hover:bg-red-700 active:scale-[0.98] transition shadow-lg disabled:opacity-50 disabled:cursor-not-allowed cursor-pointer relative z-10"
                  >
                    {checkingIn ? (
                      <>
                        <Loader2 className="w-6 h-6 animate-spin" />
                        <span>กำลัง Check-in...</span>
                      </>
                    ) : (
                      <>
                        <UserCheck className="w-6 h-6" />
                        <span>Confirm Check-in</span>
                      </>
                    )}
                  </button>
                )}
              </div>
            </>
          ) : (
            <>
              {/* Error Header */}
              <div className="p-6 text-center bg-gradient-to-br from-red-50 to-white">
                <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <AlertCircle className="w-8 h-8 text-red-600" />
                </div>
                <h3 className="text-2xl font-black text-red-600 mb-2">Invalid Ticket</h3>
                <p className="text-sm font-medium text-slate-600">VERIFICATION FAILED</p>
              </div>

              {/* Error Message */}
              <div className="p-6">
                <div className="bg-red-50 border-2 border-red-100 rounded-[20px] p-6 text-center mb-4">
                  <p className="text-lg font-bold text-red-900 mb-2">ไม่พบตั๋วในระบบ</p>
                  <p className="text-sm text-red-600">
                    {verification?.error || 'กรุณาตรวจสอบ QR Code อีกครั้ง'}
                  </p>
                </div>

                <button
                  onClick={onClose}
                  className="w-full py-4 bg-slate-200 text-slate-700 rounded-[20px] font-black text-lg hover:bg-slate-300 transition cursor-pointer relative z-10"
                >
                  ปิด
                </button>
              </div>
            </>
          )}
        </div>
      </div>

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

export default TicketVerificationModal;
