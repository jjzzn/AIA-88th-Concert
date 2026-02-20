import React, { useState, useEffect } from 'react';
import { Users, Ticket, TrendingUp, Calendar, Search, Eye } from 'lucide-react';
import { getDashboardStats } from '../../lib/services/adminService';

interface BookingStats {
  totalBookings: number;
  totalSeats: number;
  totalCheckedIn: number;
  recentBookings: RecentBooking[];
}

interface RecentBooking {
  id: string;
  booking_number: string;
  booker_name: string;
  phone: string;
  seat_count: number;
  tier_name: string;
  created_at: string;
  is_booking_for_others: boolean;
}

interface Props {
  onViewBooking?: (bookingId: string) => void;
}

const AdminDashboard: React.FC<Props> = ({ onViewBooking }) => {
  const [stats, setStats] = useState<BookingStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 25;

  useEffect(() => {
    fetchDashboardStats();
  }, []);

  const fetchDashboardStats = async () => {
    setLoading(true);
    try {
      const data = await getDashboardStats();
      setStats(data);
    } catch (error) {
      console.error('Error fetching dashboard stats:', error);
    } finally {
      setLoading(false);
    }
  };

  const filteredBookings = stats?.recentBookings.filter(booking => 
    booking.booking_number.toLowerCase().includes(searchTerm.toLowerCase()) ||
    booking.booker_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    booking.phone.includes(searchTerm)
  ) || [];

  // Pagination calculations
  const totalPages = Math.ceil(filteredBookings.length / itemsPerPage);
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const currentBookings = filteredBookings.slice(startIndex, endIndex);

  // Reset to page 1 when search term changes
  useEffect(() => {
    setCurrentPage(1);
  }, [searchTerm]);

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-[#E4002B] border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-slate-500 font-medium">กำลังโหลดข้อมูล...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 p-6">
      <div className="max-w-7xl mx-auto space-y-6">
        {/* Header */}
        <div className="bg-white rounded-2xl shadow-lg p-6 border border-slate-200">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-black text-slate-900">Dashboard</h1>
              <p className="text-slate-500 mt-1">ภาพรวมการจองตั๋วคอนเสิร์ต</p>
            </div>
            <div className="w-16 h-16 bg-[#E4002B] rounded-xl flex items-center justify-center">
              <span className="text-white text-xl font-black">88th</span>
            </div>
          </div>
        </div>

        {/* Stats Cards */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {/* Total Bookings */}
          <div className="bg-white rounded-2xl shadow-lg p-6 border border-slate-200 hover:shadow-xl transition">
            <div className="flex items-center justify-between mb-4">
              <div className="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center">
                <Calendar className="w-6 h-6 text-blue-600" />
              </div>
              <TrendingUp className="w-5 h-5 text-green-500" />
            </div>
            <h3 className="text-sm font-bold text-slate-500 uppercase tracking-wider mb-1">
              จำนวนการจอง
            </h3>
            <p className="text-4xl font-black text-slate-900">
              {stats?.totalBookings || 0}
            </p>
            <p className="text-xs text-slate-400 mt-2">การจองทั้งหมด</p>
          </div>

          {/* Total Seats */}
          <div className="bg-white rounded-2xl shadow-lg p-6 border border-slate-200 hover:shadow-xl transition">
            <div className="flex items-center justify-between mb-4">
              <div className="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center">
                <Ticket className="w-6 h-6 text-purple-600" />
              </div>
              <TrendingUp className="w-5 h-5 text-green-500" />
            </div>
            <h3 className="text-sm font-bold text-slate-500 uppercase tracking-wider mb-1">
              จำนวนที่นั่ง
            </h3>
            <p className="text-4xl font-black text-slate-900">
              {stats?.totalSeats || 0}
            </p>
            <p className="text-xs text-slate-400 mt-2">ที่นั่งที่จองทั้งหมด</p>
          </div>

          {/* Total Checked In */}
          <div className="bg-white rounded-2xl shadow-lg p-6 border border-slate-200 hover:shadow-xl transition">
            <div className="flex items-center justify-between mb-4">
              <div className="w-12 h-12 bg-green-100 rounded-xl flex items-center justify-center">
                <Users className="w-6 h-6 text-green-600" />
              </div>
              <TrendingUp className="w-5 h-5 text-green-500" />
            </div>
            <h3 className="text-sm font-bold text-slate-500 uppercase tracking-wider mb-1">
              เช็คอินแล้ว
            </h3>
            <p className="text-4xl font-black text-slate-900">
              {stats?.totalCheckedIn || 0}
            </p>
            <p className="text-xs text-slate-400 mt-2">
              {stats?.totalSeats ? 
                `${((stats.totalCheckedIn / stats.totalSeats) * 100).toFixed(1)}% ของทั้งหมด` 
                : '0% ของทั้งหมด'}
            </p>
          </div>
        </div>

        {/* Recent Bookings */}
        <div className="bg-white rounded-2xl shadow-lg border border-slate-200">
          <div className="p-6 border-b border-slate-200">
            <div className="flex items-center justify-between mb-4">
              <div>
                <h2 className="text-xl font-black text-slate-900">การจองล่าสุด</h2>
                <p className="text-sm text-slate-500 mt-1">รายการจองทั้งหมด</p>
              </div>
              <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  placeholder="ค้นหาเลขจอง, ชื่อ, เบอร์..."
                  className="pl-10 pr-4 py-2 bg-slate-50 border-2 border-slate-200 rounded-xl text-sm font-medium focus:border-[#E4002B] focus:bg-white outline-none transition w-64"
                />
              </div>
            </div>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="bg-slate-50 border-b border-slate-200">
                <tr>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    QR Token
                  </th>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    ชื่อผู้จอง
                  </th>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    เบอร์โทร
                  </th>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    จำนวนที่นั่ง
                  </th>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    ประเภท
                  </th>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    วันที่จอง
                  </th>
                  <th className="px-6 py-4 text-left text-xs font-black text-slate-600 uppercase tracking-wider">
                    การใช้สิทธิ์
                  </th>
                  <th className="px-6 py-4 text-center text-xs font-black text-slate-600 uppercase tracking-wider">
                    จัดการ
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {currentBookings.length === 0 ? (
                  <tr>
                    <td colSpan={8} className="px-6 py-12 text-center">
                      <div className="text-slate-400">
                        <Ticket className="w-12 h-12 mx-auto mb-3 opacity-50" />
                        <p className="font-medium">ไม่พบข้อมูลการจอง</p>
                      </div>
                    </td>
                  </tr>
                ) : (
                  currentBookings.map((booking) => (
                    <tr key={booking.id} className="hover:bg-slate-50 transition">
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className="text-sm font-bold text-[#E4002B]">
                          {booking.booking_number}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className="text-sm font-semibold text-slate-900">
                          {booking.booker_name}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className="text-sm text-slate-600">
                          {booking.phone}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className="inline-flex items-center px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-xs font-bold">
                          {booking.seat_count} ที่นั่ง
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className="inline-flex items-center px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-xs font-bold">
                          {booking.tier_name}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className="text-sm text-slate-600">
                          {new Date(booking.created_at).toLocaleDateString('th-TH', {
                            year: 'numeric',
                            month: 'short',
                            day: 'numeric',
                            hour: '2-digit',
                            minute: '2-digit'
                          })}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <span className={`inline-flex items-center px-3 py-1 rounded-full text-xs font-bold ${
                          booking.is_booking_for_others 
                            ? 'bg-orange-100 text-orange-700' 
                            : 'bg-green-100 text-green-700'
                        }`}>
                          {booking.is_booking_for_others ? 'ใช้สิทธิ์ผู้อื่น' : 'ใช้สิทธิ์ตัวเอง'}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-center">
                        <button
                          onClick={() => onViewBooking?.(booking.booking_number)}
                          className="inline-flex items-center gap-1 px-3 py-1.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-lg text-xs font-bold transition"
                        >
                          <Eye className="w-4 h-4" />
                          ดูรายละเอียด
                        </button>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>

          {filteredBookings.length > 0 && (
            <div className="px-6 py-4 border-t border-slate-200 bg-slate-50">
              <div className="flex items-center justify-between">
                <p className="text-sm text-slate-600">
                  แสดง <span className="font-bold text-slate-900">{startIndex + 1}-{Math.min(endIndex, filteredBookings.length)}</span> จาก <span className="font-bold text-slate-900">{filteredBookings.length}</span> รายการ
                  {searchTerm && ` (ค้นหา: "${searchTerm}")`}
                </p>
                
                {totalPages > 1 && (
                  <div className="flex items-center gap-2">
                    <button
                      onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                      disabled={currentPage === 1}
                      className="px-3 py-1.5 bg-white border-2 border-slate-200 rounded-lg text-sm font-bold text-slate-700 hover:bg-slate-50 disabled:opacity-50 disabled:cursor-not-allowed transition"
                    >
                      ← ก่อนหน้า
                    </button>
                    
                    <div className="flex items-center gap-1">
                      {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => {
                        // Show first page, last page, current page, and pages around current
                        const showPage = page === 1 || 
                                        page === totalPages || 
                                        (page >= currentPage - 1 && page <= currentPage + 1);
                        
                        const showEllipsis = (page === currentPage - 2 && currentPage > 3) ||
                                            (page === currentPage + 2 && currentPage < totalPages - 2);
                        
                        if (showEllipsis) {
                          return <span key={page} className="px-2 text-slate-400">...</span>;
                        }
                        
                        if (!showPage) return null;
                        
                        return (
                          <button
                            key={page}
                            onClick={() => setCurrentPage(page)}
                            className={`min-w-[36px] px-3 py-1.5 rounded-lg text-sm font-bold transition ${
                              currentPage === page
                                ? 'bg-[#E4002B] text-white'
                                : 'bg-white border-2 border-slate-200 text-slate-700 hover:bg-slate-50'
                            }`}
                          >
                            {page}
                          </button>
                        );
                      })}
                    </div>
                    
                    <button
                      onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                      disabled={currentPage === totalPages}
                      className="px-3 py-1.5 bg-white border-2 border-slate-200 rounded-lg text-sm font-bold text-slate-700 hover:bg-slate-50 disabled:opacity-50 disabled:cursor-not-allowed transition"
                    >
                      ถัดไป →
                    </button>
                  </div>
                )}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default AdminDashboard;
