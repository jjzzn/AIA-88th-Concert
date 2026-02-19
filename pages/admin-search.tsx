import React, { useState } from 'react';
import { Search, Loader2, AlertCircle, User, Phone, Hash, X, CheckCircle2, XCircle, Clock } from 'lucide-react';
import { ticketManagementService, TicketInfo } from '../lib/services/ticketManagementService';
import { useDialog } from '../lib/hooks/useDialog';
import Dialog from '../components/Dialog';
import AdminLogin from '../components/admin/AdminLogin';
import { AdminUser } from '../types/admin';

interface SearchPortalProps {
  adminUser: AdminUser;
}

const SearchPortal: React.FC<SearchPortalProps> = ({ adminUser }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [searchType, setSearchType] = useState<'booking_number' | 'phone' | 'name'>('booking_number');
  const [loading, setLoading] = useState(false);
  const [results, setResults] = useState<TicketInfo[]>([]);
  const [error, setError] = useState<string | null>(null);
  const dialog = useDialog();

  // Auto-fill search term from URL query parameter
  React.useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    const qrToken = urlParams.get('qr');
    
    if (qrToken) {
      setSearchTerm(qrToken);
      setSearchType('booking_number');
      // Trigger search automatically after a short delay
      setTimeout(() => {
        handleSearchWithTerm(qrToken, 'booking_number');
      }, 100);
    }
  }, []);

  const handleSearchWithTerm = async (term: string, type: 'booking_number' | 'phone' | 'name') => {
    if (!term.trim()) {
      setError('กรุณากรอกข้อมูลที่ต้องการค้นหา');
      return;
    }

    setLoading(true);
    setError(null);
    setResults([]);

    try {
      const tickets = await ticketManagementService.searchTickets({
        searchTerm: term.trim(),
        searchType: type,
      });

      if (tickets.length === 0) {
        setError('ไม่พบข้อมูลตั๋วที่ค้นหา');
      } else {
        setResults(tickets);
      }
    } catch (err) {
      setError('เกิดข้อผิดพลาดในการค้นหา');
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = async () => {
    await handleSearchWithTerm(searchTerm, searchType);
  };

  const handleReset = () => {
    setSearchTerm('');
    setResults([]);
    setError(null);
  };

  const getStatusBadge = (ticket: TicketInfo) => {
    if (ticket.is_cancelled) {
      return (
        <span className="px-3 py-1 bg-red-100 text-red-700 rounded-full text-xs font-bold flex items-center gap-1">
          <XCircle className="w-3 h-3" />
          ยกเลิกแล้ว
        </span>
      );
    }
    if (ticket.checked_in) {
      return (
        <span className="px-3 py-1 bg-green-100 text-green-700 rounded-full text-xs font-bold flex items-center gap-1">
          <CheckCircle2 className="w-3 h-3" />
          เช็คอินแล้ว
        </span>
      );
    }
    return (
      <span className="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-xs font-bold flex items-center gap-1">
        <Clock className="w-3 h-3" />
        ใช้งานได้
      </span>
    );
  };

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-black text-slate-900">ค้นหาข้อมูลตั๋ว</h1>
              <p className="text-sm text-slate-500">Ticket Search System</p>
            </div>
            {results.length > 0 && (
              <button
                onClick={handleReset}
                className="flex items-center gap-2 px-4 py-2 bg-slate-100 hover:bg-slate-200 rounded-[16px] font-bold text-slate-700 transition"
              >
                <X className="w-4 h-4" />
                ล้างผลการค้นหา
              </button>
            )}
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-7xl mx-auto px-6 py-8">
        {/* Search Form */}
        <div className="bg-white rounded-[24px] p-8 shadow-sm border border-slate-100 mb-6">
          <div className="max-w-3xl mx-auto">
            <div className="text-center mb-8">
              <div className="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <Search className="w-8 h-8 text-blue-600" />
              </div>
              <h2 className="text-2xl font-black text-slate-900 mb-2">
                ค้นหาข้อมูลตั๋ว
              </h2>
              <p className="text-slate-600">
                เลือกประเภทการค้นหาและกรอกข้อมูล
              </p>
            </div>

            {/* Search Type Selector */}
            <div className="flex gap-3 mb-6">
              <button
                onClick={() => setSearchType('booking_number')}
                className={`flex-1 py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                  searchType === 'booking_number'
                    ? 'bg-blue-600 text-white'
                    : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                }`}
              >
                <Hash className="w-4 h-4" />
                Booking Number
              </button>
              <button
                onClick={() => setSearchType('phone')}
                className={`flex-1 py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                  searchType === 'phone'
                    ? 'bg-blue-600 text-white'
                    : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                }`}
              >
                <Phone className="w-4 h-4" />
                เบอร์โทร
              </button>
              <button
                onClick={() => setSearchType('name')}
                className={`flex-1 py-3 px-4 rounded-[16px] font-bold text-sm transition flex items-center justify-center gap-2 ${
                  searchType === 'name'
                    ? 'bg-blue-600 text-white'
                    : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                }`}
              >
                <User className="w-4 h-4" />
                ชื่อผู้เข้าร่วม
              </button>
            </div>

            {/* Search Input */}
            <div className="space-y-4">
              <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                  placeholder={
                    searchType === 'booking_number'
                      ? 'กรอก Booking Number (เช่น AIA-123456)'
                      : searchType === 'phone'
                      ? 'กรอกเบอร์โทร (เช่น 0812345678)'
                      : 'กรอกชื่อหรือนามสกุล'
                  }
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
                onClick={handleSearch}
                disabled={loading || !searchTerm.trim()}
                className="w-full py-4 bg-blue-600 hover:bg-blue-700 text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 transition disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? (
                  <>
                    <Loader2 className="w-6 h-6 animate-spin" />
                    <span>กำลังค้นหา...</span>
                  </>
                ) : (
                  <>
                    <Search className="w-6 h-6" />
                    <span>ค้นหา</span>
                  </>
                )}
              </button>
            </div>
          </div>
        </div>

        {/* Search Results */}
        {results.length > 0 && (
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <h3 className="text-xl font-black text-slate-900">
                ผลการค้นหา ({results.length} ตั๋ว)
              </h3>
            </div>

            {results.map((ticket) => (
              <div
                key={ticket.booking_seat_id}
                className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100 hover:shadow-md transition"
              >
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h4 className="text-lg font-black text-slate-900 mb-1">
                      {ticket.first_name} {ticket.last_name}
                    </h4>
                    <p className="text-sm text-slate-500">
                      Booking: <span className="font-mono font-bold text-blue-600">{ticket.booking_number}</span>
                    </p>
                  </div>
                  {getStatusBadge(ticket)}
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">ที่นั่ง</p>
                    <p className="text-sm font-black text-slate-900">
                      {ticket.tier_name} - {ticket.zone_name}
                    </p>
                    <p className="text-lg font-black text-blue-600">
                      แถว {ticket.seat_row} ที่ {ticket.seat_number.toString().padStart(2, '0')}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">ติดต่อ</p>
                    <p className="text-sm text-slate-700">{ticket.email}</p>
                    <p className="text-sm font-medium text-slate-900">{ticket.phone}</p>
                  </div>
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">QR Code</p>
                    <p className="text-sm font-mono font-bold text-slate-900">{ticket.qr_token}</p>
                  </div>
                </div>

                <div className="flex items-center gap-4 pt-4 border-t border-slate-100">
                  <div className="flex items-center gap-2 text-xs text-slate-600">
                    <span className="font-bold">ยกเลิก:</span>
                    <span>{ticket.cancel_count} ครั้ง</span>
                  </div>
                  <div className="flex items-center gap-2 text-xs text-slate-600">
                    <span className="font-bold">เปลี่ยนที่นั่ง:</span>
                    <span>{ticket.swap_count} ครั้ง</span>
                  </div>
                  {ticket.cancelled_at && (
                    <div className="flex items-center gap-2 text-xs text-red-600">
                      <span className="font-bold">ยกเลิกเมื่อ:</span>
                      <span>{new Date(ticket.cancelled_at).toLocaleString('th-TH')}</span>
                    </div>
                  )}
                </div>
              </div>
            ))}
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

const AdminSearchPage: React.FC = () => {
  const [currentUser, setCurrentUser] = useState<AdminUser | null>(null);

  React.useEffect(() => {
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

  if (!currentUser) {
    return <AdminLogin onLoginSuccess={handleLoginSuccess} />;
  }

  return <SearchPortal adminUser={currentUser} />;
};

export default AdminSearchPage;
