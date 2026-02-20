import React, { useState, useEffect } from 'react';
import { Search, Loader2, AlertTriangle, AlertCircle, CheckCircle2, X, Trash2, RefreshCw, Hash, Phone, User, Mail } from 'lucide-react';
import { ticketManagementService } from '../lib/services/ticketManagementService';
import { useDialog } from '../lib/hooks/useDialog';
import Dialog from '../components/Dialog';
import AdminLogin from '../components/admin/AdminLogin';
import { AdminUser } from '../types/admin';

interface AdminBookingInfo {
  booking_id: string;
  booking_number: string;
  first_name: string;
  last_name: string;
  email: string;
  phone: string;
  qr_token: string;
  seat_row: string;
  seat_number: number;
  zone_name: string;
  tier_name: string;
  is_checked_in: boolean;
}

interface CancelPortalProps {
  adminUser: AdminUser;
}

const CancelPortal: React.FC<CancelPortalProps> = ({ adminUser }) => {
  const [qrCode, setQrCode] = useState('');
  const [searchType, setSearchType] = useState<'qr_code' | 'phone' | 'name' | 'email'>('qr_code');
  const [loading, setLoading] = useState(false);
  const [bookingInfo, setBookingInfo] = useState<AdminBookingInfo | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [showConfirmation, setShowConfirmation] = useState(false);
  const [cancelling, setCancelling] = useState(false);
  const dialog = useDialog();

  const handleSearch = async () => {
    if (!qrCode.trim()) {
      setError('กรุณากรอกข้อมูลที่ต้องการค้นหา');
      return;
    }

    setLoading(true);
    setError(null);
    setBookingInfo(null);

    try {
      // Search using ticketManagementService
      const tickets = await ticketManagementService.searchTickets({
        searchTerm: qrCode.trim(),
        searchType: searchType
      });

      if (tickets && tickets.length > 0) {
        const ticket = tickets[0];
        // Convert TicketInfo to AdminBookingInfo format
        const info: AdminBookingInfo = {
          booking_id: ticket.booking_id,
          booking_number: ticket.booking_number,
          first_name: ticket.first_name,
          last_name: ticket.last_name,
          email: ticket.email,
          phone: ticket.phone,
          qr_token: ticket.qr_token,
          seat_row: ticket.seat_row,
          seat_number: ticket.seat_number,
          zone_name: ticket.zone_name,
          tier_name: ticket.tier_name,
          is_checked_in: ticket.checked_in || false,
        };
        setBookingInfo(info);
      } else {
        setError('ไม่พบข้อมูลการจอง');
      }
    } catch (err) {
      setError('เกิดข้อผิดพลาดในการค้นหา');
    } finally {
      setLoading(false);
    }
  };

  const handleCancel = async () => {
    if (!bookingInfo) return;

    setCancelling(true);
    try {
      // Find booking_seat_id from the booking
      const { data: bookingSeat, error: fetchError } = await (await import('../lib/supabase')).supabase
        .from('booking_seats')
        .select('id')
        .eq('qr_token', bookingInfo.qr_token)
        .single() as { data: { id: string } | null; error: any };

      if (fetchError || !bookingSeat) {
        dialog.showError('ไม่พบข้อมูลการจอง');
        setCancelling(false);
        return;
      }

      const result = await ticketManagementService.cancelTicket({
        bookingSeatId: bookingSeat.id,
        qrToken: bookingInfo.qr_token,
      });

      if (result.success) {
        setQrCode('');
        setBookingInfo(null);
        setShowConfirmation(false);
        dialog.showSuccess('ยกเลิกตั๋วสำเร็จ!', 'สำเร็จ');
      } else {
        dialog.showError('ไม่สามารถยกเลิกตั๋วได้: ' + result.error);
      }
    } catch (err) {
      dialog.showError('เกิดข้อผิดพลาดในการยกเลิกตั๋ว');
    } finally {
      setCancelling(false);
    }
  };

  const handleReset = () => {
    setQrCode('');
    setBookingInfo(null);
    setError(null);
    setShowConfirmation(false);
  };

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-black text-slate-900">ระบบยกเลิกตั๋ว</h1>
              <p className="text-sm text-slate-500">Ticket Cancellation System</p>
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

      {/* Content */}
      <div className="max-w-7xl mx-auto px-6 py-8">
        {!bookingInfo ? (
          <div className="bg-white rounded-[24px] p-8 shadow-sm border border-slate-100">
            <div className="max-w-2xl mx-auto">
              <div className="text-center mb-8">
                <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Search className="w-8 h-8 text-red-600" />
                </div>
                <h2 className="text-2xl font-black text-slate-900 mb-2">
                  ค้นหาการจอง
                </h2>
                <p className="text-slate-600">
                  เลือกประเภทการค้นหาและกรอกข้อมูล
                </p>
              </div>

              <div className="space-y-4">
                {/* Search Type Selector */}
                <div className="grid grid-cols-2 gap-2">
                  <button
                    onClick={() => setSearchType('qr_code')}
                    className={`py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                      searchType === 'qr_code'
                        ? 'bg-red-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    <Hash className="w-4 h-4" />
                    QR Code
                  </button>
                  <button
                    onClick={() => setSearchType('phone')}
                    className={`py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                      searchType === 'phone'
                        ? 'bg-red-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    <Phone className="w-4 h-4" />
                    เบอร์โทร
                  </button>
                  <button
                    onClick={() => setSearchType('name')}
                    className={`py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                      searchType === 'name'
                        ? 'bg-red-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    <User className="w-4 h-4" />
                    ชื่อผู้นั่ง
                  </button>
                  <button
                    onClick={() => setSearchType('email')}
                    className={`py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                      searchType === 'email'
                        ? 'bg-red-600 text-white'
                        : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                    }`}
                  >
                    <Mail className="w-4 h-4" />
                    Email
                  </button>
                </div>

                <div className="relative">
                  <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                  <input
                    type="text"
                    value={qrCode}
                    onChange={(e) => setQrCode(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                    placeholder={
                      searchType === 'qr_code'
                        ? 'กรอก QR Code (เช่น AIA-123456)'
                        : searchType === 'phone'
                        ? 'กรอกเบอร์โทรศัพท์'
                        : searchType === 'name'
                        ? 'กรอกชื่อหรือนามสกุล'
                        : 'กรอก Email'
                    }
                    className="w-full pl-12 pr-4 py-4 bg-slate-50 border-2 border-slate-200 rounded-[20px] text-lg font-medium text-slate-900 focus:border-red-500 focus:bg-white outline-none transition"
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
                  onClick={handleSearch}
                  disabled={loading || !qrCode.trim()}
                  className="w-full py-4 bg-red-600 hover:bg-red-700 text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 transition disabled:opacity-50 disabled:cursor-not-allowed"
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
        ) : (
          <div className="space-y-6">
            {/* Booking Info */}
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
                      <span className="text-lg font-black uppercase text-slate-900">
                        {bookingInfo.tier_name}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Zone</span>
                      <span className="text-lg font-black text-slate-900">
                        {bookingInfo.zone_name}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Row</span>
                      <span className="text-2xl font-black text-slate-900">
                        {bookingInfo.seat_row}
                      </span>
                    </div>
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-600">Seat</span>
                      <span className="text-2xl font-black text-red-600">
                        {bookingInfo.seat_number.toString().padStart(2, '0')}
                      </span>
                    </div>
                  </div>
                </div>
              </div>

              {bookingInfo.is_checked_in && (
                <div className="mt-4 bg-amber-50 border-2 border-amber-200 rounded-[16px] p-4">
                  <div className="flex items-start gap-3">
                    <AlertTriangle className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" />
                    <div>
                      <p className="text-sm font-bold text-amber-900">ตั๋วนี้เช็คอินแล้ว</p>
                      <p className="text-xs text-amber-700 mt-1">
                        กรุณาตรวจสอบให้แน่ใจก่อนยกเลิก
                      </p>
                    </div>
                  </div>
                </div>
              )}
            </div>

            {/* Action Button */}
            {!showConfirmation ? (
              <button
                onClick={() => setShowConfirmation(true)}
                className="w-full py-4 bg-red-600 hover:bg-red-700 text-white rounded-[24px] font-black text-lg flex items-center justify-center gap-3 transition shadow-lg hover:shadow-xl"
              >
                <Trash2 className="w-6 h-6" />
                <span>ยกเลิกตั๋ว</span>
              </button>
            ) : (
              <div className="bg-white rounded-[24px] p-6 shadow-sm border-2 border-red-200">
                <div className="text-center mb-6">
                  <div className="w-16 h-16 bg-red-50 rounded-full flex items-center justify-center mx-auto mb-4 border-2 border-red-200">
                    <AlertTriangle className="w-8 h-8 text-red-600" />
                  </div>
                  <h3 className="text-xl font-black text-slate-900 mb-2">ยืนยันการยกเลิกตั๋ว</h3>
                  <p className="text-sm text-slate-600">
                    คุณแน่ใจหรือไม่ว่าต้องการยกเลิกตั๋วนี้?
                  </p>
                </div>

                <div className="bg-red-50 border-2 border-red-200 rounded-[16px] p-4 mb-6">
                  <div className="flex items-start gap-3">
                    <AlertTriangle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
                    <div>
                      <p className="text-sm font-bold text-red-900 mb-1">คำเตือน</p>
                      <p className="text-sm text-red-700">
                        เมื่อยกเลิกตั๋วแล้ว <strong>QR Code</strong> จะไม่สามารถใช้งานได้อีกต่อไป 
                        และที่นั่งจะถูกคืนเข้าระบบทันที
                      </p>
                    </div>
                  </div>
                </div>

                <div className="flex gap-3">
                  <button
                    onClick={() => setShowConfirmation(false)}
                    disabled={cancelling}
                    className="flex-1 py-3 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-[16px] font-bold transition disabled:opacity-50"
                  >
                    ยกเลิก
                  </button>
                  <button
                    onClick={handleCancel}
                    disabled={cancelling}
                    className="flex-1 py-3 bg-red-600 hover:bg-red-700 text-white rounded-[16px] font-bold flex items-center justify-center gap-2 transition disabled:opacity-50"
                  >
                    {cancelling ? (
                      <>
                        <Loader2 className="w-5 h-5 animate-spin" />
                        <span>กำลังยกเลิก...</span>
                      </>
                    ) : (
                      <>
                        <Trash2 className="w-5 h-5" />
                        <span>ยืนยันการยกเลิก</span>
                      </>
                    )}
                  </button>
                </div>
              </div>
            )}
          </div>
        )}

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

const AdminCancelPage: React.FC = () => {
  const [currentUser, setCurrentUser] = useState<AdminUser | null>(null);

  useEffect(() => {
    // Check if user is already logged in (from localStorage)
    const savedUser = localStorage.getItem('admin_user');
    if (savedUser) {
      try {
        setCurrentUser(JSON.parse(savedUser));
      } catch (e) {
        localStorage.removeItem('admin_user');
      }
    }
  }, []);

  const handleLoginSuccess = (user: AdminUser) => {
    setCurrentUser(user);
    localStorage.setItem('admin_user', JSON.stringify(user));
  };

  const handleLogout = () => {
    setCurrentUser(null);
    localStorage.removeItem('admin_user');
  };

  if (!currentUser) {
    return <AdminLogin onLoginSuccess={handleLoginSuccess} />;
  }

  return <CancelPortal adminUser={currentUser} />;
};

export default AdminCancelPage;
