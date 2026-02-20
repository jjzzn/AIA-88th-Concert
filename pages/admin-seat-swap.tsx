import React, { useState, useEffect } from 'react';
import { adminManagerAuthService } from '../lib/services/adminManagerAuthService';
import SeatSwapPortal from '../components/admin/SeatSwapPortal';

const AdminSeatSwapPage: React.FC = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    checkAuth();
  }, []);

  const checkAuth = async () => {
    const admin = await adminManagerAuthService.getCurrentAdmin();
    if (!admin) {
      window.location.href = '/admin/login';
      return;
    }
    setLoading(false);
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

  return <SeatSwapPortal />;
};

export default AdminSeatSwapPage;
