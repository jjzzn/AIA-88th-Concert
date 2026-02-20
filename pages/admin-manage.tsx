import React, { useEffect, useState } from 'react';
import { RefreshCw, Search, BarChart3, LogOut } from 'lucide-react';
import { adminManagerAuthService, AdminManager } from '../lib/services/adminManagerAuthService';

const AdminManagePage: React.FC = () => {
  const [admin, setAdmin] = useState<AdminManager | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    checkAuth();
  }, []);

  const checkAuth = async () => {
    const currentAdmin = await adminManagerAuthService.getCurrentAdmin();
    if (!currentAdmin) {
      // Not logged in, redirect to login page
      window.location.href = '/admin/login';
      return;
    }
    setAdmin(currentAdmin);
    setLoading(false);
  };

  const handleLogout = async () => {
    await adminManagerAuthService.logout();
    window.location.href = '/admin/login';
  };

  const handleNavigate = (path: string) => {
    window.history.pushState({}, '', path);
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-[#E4002B] border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-slate-600 font-bold">กำลังตรวจสอบสิทธิ์...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10 shadow-sm">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-black text-slate-900">ระบบจัดการตั๋ว</h1>
              <p className="text-sm text-slate-500">Ticket Management System</p>
            </div>
            <div className="flex items-center gap-4">
              <div className="text-right">
                <p className="text-sm font-bold text-slate-900">{admin?.full_name}</p>
                <p className="text-xs text-slate-500">{admin?.role === 'superadmin' ? 'Super Admin' : 'Manager'}</p>
              </div>
              <button
                onClick={handleLogout}
                className="flex items-center gap-2 px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold rounded-xl transition"
              >
                <LogOut className="w-4 h-4" />
                ออกจากระบบ
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-7xl mx-auto px-6 py-12">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-black text-slate-900 mb-3">เลือกประเภทการจัดการ</h2>
          <p className="text-slate-600">กรุณาเลือกว่าต้องการจัดการตั๋วแบบใด</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {/* Dashboard Card */}
          <button
            onClick={() => handleNavigate('/admin/manage/dashboard')}
            className="group bg-white rounded-[32px] p-8 border-2 border-slate-200 hover:border-orange-500 transition-all hover:shadow-xl hover:scale-105 active:scale-100"
          >
            <div className="flex flex-col items-center text-center">
              <div className="w-20 h-20 bg-orange-100 group-hover:bg-orange-500 rounded-full flex items-center justify-center mb-6 transition-colors">
                <BarChart3 className="w-10 h-10 text-orange-600 group-hover:text-white transition-colors" />
              </div>
              <h3 className="text-2xl font-black text-slate-900 mb-3">Dashboard</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                ดูภาพรวมการจอง<br />
                และสถิติต่างๆ
              </p>
              <div className="mt-6 px-6 py-2 bg-orange-50 group-hover:bg-orange-500 rounded-full transition-colors">
                <span className="text-sm font-bold text-orange-600 group-hover:text-white transition-colors">
                  Dashboard
                </span>
              </div>
            </div>
          </button>
          {/* Ticket Search Card */}
          <button
            onClick={() => handleNavigate('/admin/manage/search')}
            className="group bg-white rounded-[32px] p-8 border-2 border-slate-200 hover:border-purple-500 transition-all hover:shadow-xl hover:scale-105 active:scale-100"
          >
            <div className="flex flex-col items-center text-center">
              <div className="w-20 h-20 bg-purple-100 group-hover:bg-purple-500 rounded-full flex items-center justify-center mb-6 transition-colors">
                <Search className="w-10 h-10 text-purple-600 group-hover:text-white transition-colors" />
              </div>
              <h3 className="text-2xl font-black text-slate-900 mb-3">ค้นหาข้อมูลตั๋ว</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                ค้นหาข้อมูลตั๋วแต่ละใบ<br />
                ด้วย Booking Number, เบอร์โทร หรือชื่อ
              </p>
              <div className="mt-6 px-6 py-2 bg-purple-50 group-hover:bg-purple-500 rounded-full transition-colors">
                <span className="text-sm font-bold text-purple-600 group-hover:text-white transition-colors">
                  Ticket Search
                </span>
              </div>
            </div>
          </button>

          {/* Seat Swap Card */}
          <button
            onClick={() => handleNavigate('/admin/manage/seat-swap')}
            className="group bg-white rounded-[32px] p-8 border-2 border-slate-200 hover:border-blue-500 transition-all hover:shadow-xl hover:scale-105 active:scale-100"
          >
            <div className="flex flex-col items-center text-center">
              <div className="w-20 h-20 bg-blue-100 group-hover:bg-blue-500 rounded-full flex items-center justify-center mb-6 transition-colors">
                <RefreshCw className="w-10 h-10 text-blue-600 group-hover:text-white transition-colors" />
              </div>
              <h3 className="text-2xl font-black text-slate-900 mb-3">เปลี่ยนแปลงที่นั่ง</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                เปลี่ยนที่นั่งของผู้เข้าร่วมงาน<br />
                สามารถเลือกที่นั่งใหม่ในโซนต่างๆ ได้
              </p>
              <div className="mt-6 px-6 py-2 bg-blue-50 group-hover:bg-blue-500 rounded-full transition-colors">
                <span className="text-sm font-bold text-blue-600 group-hover:text-white transition-colors">
                  Seat Swap
                </span>
              </div>
            </div>
          </button>

        </div>

        {/* Info Box */}
        <div className="mt-12 bg-blue-50 border-2 border-blue-200 rounded-[24px] p-6">
          <div className="flex items-start gap-4">
            <div className="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center flex-shrink-0">
              <span className="text-white font-black text-lg">!</span>
            </div>
            <div>
              <p className="text-sm font-bold text-blue-900 mb-2">ข้อมูลสำคัญ</p>
              <ul className="text-sm text-blue-800 space-y-1">
                <li>• การเปลี่ยนแปลงที่นั่งจะมีผลทันที และบันทึกใน audit log</li>
                <li>• การค้นหาตั๋วสามารถใช้ Booking Number, เบอร์โทร หรือชื่อผู้เข้าร่วม</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminManagePage;
