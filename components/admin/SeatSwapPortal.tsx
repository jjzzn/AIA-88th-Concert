import React, { useState } from 'react';
import { Search, ArrowRight, AlertCircle, CheckCircle2, Loader2, RefreshCw } from 'lucide-react';
import { AdminUser } from '../../types/admin';
import { BookingInfo, SeatInfo } from '../../types/seat-swap';
import { seatSwapService } from '../../lib/services/seatSwapService';
import SeatSwapZoneMap from './SeatSwapZoneMap';
import SwapConfirmationDialog from './SwapConfirmationDialog';

interface Props {
  adminUser: AdminUser;
}

const SeatSwapPortal: React.FC<Props> = ({ adminUser }) => {
  const [qrCode, setQrCode] = useState('');
  const [loading, setLoading] = useState(false);
  const [bookingInfo, setBookingInfo] = useState<BookingInfo | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [selectedSeat, setSelectedSeat] = useState<SeatInfo | null>(null);
  const [showConfirmation, setShowConfirmation] = useState(false);
  const [swapping, setSwapping] = useState(false);

  const handleVerify = async () => {
    if (!qrCode.trim()) {
      setError('กรุณากรอก QR Code หรือ Booking Code');
      return;
    }

    setLoading(true);
    setError(null);
    setBookingInfo(null);
    setSelectedSeat(null);

    try {
      const result = await seatSwapService.verifyCode({ code: qrCode.trim() });
      
      if (result.success && result.booking_info) {
        setBookingInfo(result.booking_info);
      } else {
        setError(result.message);
      }
    } catch (err) {
      setError('เกิดข้อผิดพลาดในการตรวจสอบ');
    } finally {
      setLoading(false);
    }
  };

  const handleSeatSelect = (seat: SeatInfo) => {
    setSelectedSeat(seat);
    setShowConfirmation(true);
  };

  const handleConfirmSwap = async (reason?: string, notes?: string) => {
    if (!bookingInfo || !selectedSeat) return;

    setSwapping(true);
    try {
      const result = await seatSwapService.swapSeat(
        {
          booking_seat_id: bookingInfo.booking_seat_id,
          new_seat_id: selectedSeat.seat_id,
          reason,
          admin_notes: notes
        },
        adminUser.id,
        window.location.hostname
      );

      if (result.success) {
        // Reset form
        setQrCode('');
        setBookingInfo(null);
        setSelectedSeat(null);
        setShowConfirmation(false);
        alert('สลับที่นั่งสำเร็จ!');
      } else {
        alert('ไม่สามารถสลับที่นั่งได้: ' + result.message);
      }
    } catch (err) {
      alert('เกิดข้อผิดพลาดในการสลับที่นั่ง');
    } finally {
      setSwapping(false);
    }
  };

  const handleReset = () => {
    setQrCode('');
    setBookingInfo(null);
    setSelectedSeat(null);
    setError(null);
  };

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-black text-slate-900">ระบบสลับที่นั่ง</h1>
              <p className="text-sm text-slate-500">Seat Swap Management System</p>
            </div>
            {bookingInfo && (
              <button
                onClick={handleReset}
                className="flex items-center gap-2 px-4 py-2 bg-slate-100 hover:bg-slate-200 rounded-[16px] font-bold text-slate-700 transition"
              >
                <RefreshCw className="w-4 h-4" />
                เริ่มใหม่
              </button>
            )}
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 py-8">
        {/* Step 1: Verify Code */}
        {!bookingInfo && (
          <div className="bg-white rounded-[24px] p-8 shadow-sm border border-slate-100">
            <div className="max-w-2xl mx-auto">
              <div className="text-center mb-8">
                <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Search className="w-8 h-8 text-blue-600" />
                </div>
                <h2 className="text-2xl font-black text-slate-900 mb-2">
                  ค้นหาการจอง
                </h2>
                <p className="text-slate-600">
                  กรอก QR Code หรือ Booking Code เพื่อเริ่มต้น
                </p>
              </div>

              <div className="space-y-4">
                <div className="relative">
                  <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                  <input
                    type="text"
                    value={qrCode}
                    onChange={(e) => setQrCode(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && handleVerify()}
                    placeholder="กรอก QR Code (เช่น AIA-123456)"
                    className="w-full pl-12 pr-4 py-4 bg-slate-50 border-2 border-slate-200 rounded-[20px] text-lg font-medium text-slate-900 focus:border-blue-500 focus:bg-white outline-none transition"
                    disabled={loading}
                  />
                </div>

                {error && (
                  <div className="flex items-start gap-3 p-4 bg-red-50 border-2 border-red-100 rounded-[16px]">
                    <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                    <p className="text-sm font-medium text-red-900">{error}</p>
                  </div>
                )}

                <button
                  onClick={handleVerify}
                  disabled={loading || !qrCode.trim()}
                  className="w-full py-4 bg-blue-600 hover:bg-blue-700 text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 transition disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? (
                    <>
                      <Loader2 className="w-6 h-6 animate-spin" />
                      <span>กำลังตรวจสอบ...</span>
                    </>
                  ) : (
                    <>
                      <Search className="w-6 h-6" />
                      <span>ค้นหาการจอง</span>
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Step 2: Show Booking Info & Seat Selection */}
        {bookingInfo && (
          <div className="space-y-6">
            {/* Current Booking Info */}
            <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-xl font-black text-slate-900">ข้อมูลการจองปัจจุบัน</h2>
                <span className="px-3 py-1 bg-green-100 text-green-700 rounded-full text-sm font-bold">
                  พบข้อมูล
                </span>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {/* Attendee Info */}
                <div className="space-y-4">
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">ชื่อผู้เข้าร่วม</p>
                    <p className="text-lg font-black text-slate-900">
                      {bookingInfo.first_name} {bookingInfo.last_name}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">อีเมล</p>
                    <p className="text-sm font-medium text-slate-700">{bookingInfo.email}</p>
                  </div>
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">เบอร์โทร</p>
                    <p className="text-sm font-medium text-slate-700">{bookingInfo.phone}</p>
                  </div>
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">QR Code</p>
                    <p className="text-sm font-mono font-bold text-blue-600">{bookingInfo.qr_token}</p>
                  </div>
                </div>

                {/* Current Seat Info */}
                <div className="bg-gradient-to-br from-slate-50 to-white rounded-[20px] p-6 border-2 border-slate-100">
                  <p className="text-xs font-bold text-slate-500 uppercase mb-4">ที่นั่งปัจจุบัน</p>
                  <div className="space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Tier</span>
                      <span 
                        className="text-lg font-black uppercase"
                        style={{ color: bookingInfo.current_seat.tier_color }}
                      >
                        {bookingInfo.current_seat.tier_name}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Zone</span>
                      <span className="text-lg font-black text-slate-900">
                        {bookingInfo.current_seat.zone_name}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Row</span>
                      <span className="text-2xl font-black text-slate-900">
                        {bookingInfo.current_seat.row}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Seat</span>
                      <span className="text-2xl font-black text-blue-600">
                        {bookingInfo.current_seat.number.toString().padStart(2, '0')}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Seat Selection */}
            <SeatSwapZoneMap
              currentSeatId={bookingInfo.current_seat.seat_id}
              currentSeatInfo={bookingInfo.current_seat}
              onSeatSelect={handleSeatSelect}
              onBack={handleReset}
            />
          </div>
        )}
      </div>

      {/* Confirmation Dialog */}
      {showConfirmation && bookingInfo && selectedSeat && (
        <SwapConfirmationDialog
          bookingInfo={bookingInfo}
          oldSeat={bookingInfo.current_seat}
          newSeat={selectedSeat}
          onConfirm={handleConfirmSwap}
          onCancel={() => setShowConfirmation(false)}
          loading={swapping}
        />
      )}
    </div>
  );
};

export default SeatSwapPortal;
