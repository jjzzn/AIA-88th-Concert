import React, { useState } from 'react';
import { Search, Loader2, AlertCircle, RefreshCw, AlertTriangle, CheckCircle2 } from 'lucide-react';
import { ticketManagementService, TicketInfo } from '../lib/services/ticketManagementService';
import { useDialog } from '../lib/hooks/useDialog';
import Dialog from '../components/Dialog';
import AdminLogin from '../components/admin/AdminLogin';
import { AdminUser } from '../types/admin';

interface RestorePortalProps {
  adminUser: AdminUser;
}

const RestorePortal: React.FC<RestorePortalProps> = ({ adminUser }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [loading, setLoading] = useState(false);
  const [cancelledTickets, setCancelledTickets] = useState<TicketInfo[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [restoring, setRestoring] = useState<string | null>(null);
  const dialog = useDialog();

  const handleSearch = async () => {
    if (!searchTerm.trim()) {
      setError('กรุณากรอกเบอร์โทรหรือ Booking Number');
      return;
    }

    setLoading(true);
    setError(null);
    setCancelledTickets([]);

    try {
      // Search by phone first
      let tickets = await ticketManagementService.searchTickets({
        searchTerm: searchTerm.trim(),
        searchType: 'phone',
      });

      // If no results, try booking number
      if (tickets.length === 0) {
        tickets = await ticketManagementService.searchTickets({
          searchTerm: searchTerm.trim(),
          searchType: 'booking_number',
        });
      }

      // Filter only cancelled tickets
      const cancelled = tickets.filter(t => t.is_cancelled);

      if (cancelled.length === 0) {
        setError('ไม่พบตั๋วที่ถูกยกเลิก');
      } else {
        setCancelledTickets(cancelled);
      }
    } catch (err) {
      setError('เกิดข้อผิดพลาดในการค้นหา');
    } finally {
      setLoading(false);
    }
  };

  const handleRestore = async (ticket: TicketInfo) => {
    setRestoring(ticket.booking_seat_id);

    try {
      // Get seat_id from the ticket
      const { data: bookingSeat } = await (await import('../lib/supabase')).supabase
        .from('booking_seats')
        .select('seat_id')
        .eq('id', ticket.booking_seat_id)
        .single() as { data: { seat_id: string } | null };

      if (!bookingSeat) {
        dialog.showError('ไม่พบข้อมูลที่นั่ง');
        setRestoring(null);
        return;
      }

      const result = await ticketManagementService.restoreTicket({
        bookingSeatId: ticket.booking_seat_id,
        seatId: bookingSeat.seat_id,
      });

      if (result.success) {
        dialog.showSuccess(result.message || 'คืนตั๋วสำเร็จ!', 'สำเร็จ');
        // Refresh the list
        handleSearch();
      } else {
        dialog.showError(result.error || 'ไม่สามารถคืนตั๋วได้');
      }
    } catch (err) {
      dialog.showError('เกิดข้อผิดพลาดในการคืนตั๋ว');
    } finally {
      setRestoring(null);
    }
  };

  const handleReset = () => {
    setSearchTerm('');
    setCancelledTickets([]);
    setError(null);
  };

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-black text-slate-900">คืนตั๋วที่ยกเลิกผิด</h1>
              <p className="text-sm text-slate-500">Restore Cancelled Tickets</p>
            </div>
            {cancelledTickets.length > 0 && (
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
        {/* Search Form */}
        <div className="bg-white rounded-[24px] p-8 shadow-sm border border-slate-100 mb-6">
          <div className="max-w-2xl mx-auto">
            <div className="text-center mb-8">
              <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <RefreshCw className="w-8 h-8 text-green-600" />
              </div>
              <h2 className="text-2xl font-black text-slate-900 mb-2">
                ค้นหาตั๋วที่ยกเลิก
              </h2>
              <p className="text-slate-600">
                กรอกเบอร์โทรหรือ Booking Number เพื่อค้นหาตั๋วที่ถูกยกเลิก
              </p>
            </div>

            <div className="space-y-4">
              <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                  placeholder="กรอกเบอร์โทรหรือ Booking Number"
                  className="w-full pl-12 pr-4 py-4 bg-slate-50 border-2 border-slate-200 rounded-[20px] text-lg font-medium text-slate-900 focus:border-green-500 focus:bg-white outline-none transition"
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
                className="w-full py-4 bg-green-600 hover:bg-green-700 text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 transition disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {loading ? (
                  <>
                    <Loader2 className="w-6 h-6 animate-spin" />
                    <span>กำลังค้นหา...</span>
                  </>
                ) : (
                  <>
                    <Search className="w-6 h-6" />
                    <span>ค้นหาตั๋วที่ยกเลิก</span>
                  </>
                )}
              </button>
            </div>

            {/* Info Box */}
            <div className="mt-6 bg-amber-50 border-2 border-amber-200 rounded-[16px] p-4">
              <div className="flex items-start gap-3">
                <AlertTriangle className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" />
                <div>
                  <p className="text-sm font-bold text-amber-900 mb-1">ข้อควรระวัง</p>
                  <p className="text-sm text-amber-700">
                    สามารถคืนตั๋วได้เฉพาะกรณีที่<strong>ที่นั่งยังว่าง</strong>เท่านั้น 
                    หากที่นั่งถูกจองไปแล้ว จะไม่สามารถคืนตั๋วได้
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Cancelled Tickets List */}
        {cancelledTickets.length > 0 && (
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <h3 className="text-xl font-black text-slate-900">
                ตั๋วที่ถูกยกเลิก ({cancelledTickets.length} ตั๋ว)
              </h3>
            </div>

            {cancelledTickets.map((ticket) => (
              <div
                key={ticket.booking_seat_id}
                className="bg-white rounded-[24px] p-6 shadow-sm border-2 border-red-200"
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
                  <span className="px-3 py-1 bg-red-100 text-red-700 rounded-full text-xs font-bold">
                    ยกเลิกแล้ว
                  </span>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">ที่นั่ง</p>
                    <p className="text-sm font-black text-slate-900">
                      {ticket.tier_name} - {ticket.zone_name}
                    </p>
                    <p className="text-lg font-black text-red-600">
                      แถว {ticket.seat_row} ที่ {ticket.seat_number.toString().padStart(2, '0')}
                    </p>
                  </div>
                  <div>
                    <p className="text-xs font-bold text-slate-500 uppercase mb-1">ยกเลิกเมื่อ</p>
                    <p className="text-sm font-medium text-red-700">
                      {ticket.cancelled_at 
                        ? new Date(ticket.cancelled_at).toLocaleString('th-TH')
                        : 'ไม่ทราบ'}
                    </p>
                  </div>
                </div>

                <div className="flex items-center gap-3 pt-4 border-t border-slate-100">
                  <button
                    onClick={() => handleRestore(ticket)}
                    disabled={restoring === ticket.booking_seat_id}
                    className="flex-1 py-3 bg-green-600 hover:bg-green-700 text-white rounded-[16px] font-bold flex items-center justify-center gap-2 transition disabled:opacity-50"
                  >
                    {restoring === ticket.booking_seat_id ? (
                      <>
                        <Loader2 className="w-5 h-5 animate-spin" />
                        <span>กำลังคืนตั๋ว...</span>
                      </>
                    ) : (
                      <>
                        <CheckCircle2 className="w-5 h-5" />
                        <span>คืนตั๋ว</span>
                      </>
                    )}
                  </button>
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

const AdminRestorePage: React.FC = () => {
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

  return <RestorePortal adminUser={currentUser} />;
};

export default AdminRestorePage;
