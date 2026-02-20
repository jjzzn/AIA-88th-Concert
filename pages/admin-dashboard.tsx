import React from 'react';
import AdminDashboard from '../components/admin/AdminDashboard';
import { ArrowLeft } from 'lucide-react';

const AdminDashboardPage: React.FC = () => {
  const handleBack = () => {
    window.history.back();
  };

  const handleViewBooking = (qrToken: string) => {
    // Navigate to search page with QR token pre-filled
    console.log('View booking with QR token:', qrToken);
    window.history.pushState({}, '', `/admin/manage/search?qr=${encodeURIComponent(qrToken)}`);
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      {/* Header with Back Button */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10 shadow-sm">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center gap-4">
            <button
              onClick={handleBack}
              className="flex items-center gap-2 px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl font-bold transition"
            >
              <ArrowLeft className="w-4 h-4" />
              กลับ
            </button>
            <div>
              <h1 className="text-2xl font-black text-slate-900">Dashboard</h1>
              <p className="text-sm text-slate-500">ภาพรวมการจองตั๋วคอนเสิร์ต</p>
            </div>
          </div>
        </div>
      </div>

      {/* Dashboard Component */}
      <AdminDashboard onViewBooking={handleViewBooking} />
    </div>
  );
};

export default AdminDashboardPage;
