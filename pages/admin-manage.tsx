import React from 'react';
import { RefreshCw, Trash2 } from 'lucide-react';

const AdminManagePage: React.FC = () => {
  const handleNavigate = (path: string) => {
    window.history.pushState({}, '', path);
    window.dispatchEvent(new PopStateEvent('popstate'));
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10 shadow-sm">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div>
            <h1 className="text-2xl font-black text-slate-900">ระบบจัดการตั๋ว</h1>
            <p className="text-sm text-slate-500">Ticket Management System</p>
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="max-w-4xl mx-auto px-6 py-12">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-black text-slate-900 mb-3">เลือกประเภทการจัดการ</h2>
          <p className="text-slate-600">กรุณาเลือกว่าต้องการจัดการตั๋วแบบใด</p>
        </div>

        <div className="grid md:grid-cols-2 gap-6">
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

          {/* Cancel Ticket Card */}
          <button
            onClick={() => handleNavigate('/admin/manage/cancel')}
            className="group bg-white rounded-[32px] p-8 border-2 border-slate-200 hover:border-red-500 transition-all hover:shadow-xl hover:scale-105 active:scale-100"
          >
            <div className="flex flex-col items-center text-center">
              <div className="w-20 h-20 bg-red-100 group-hover:bg-red-500 rounded-full flex items-center justify-center mb-6 transition-colors">
                <Trash2 className="w-10 h-10 text-red-600 group-hover:text-white transition-colors" />
              </div>
              <h3 className="text-2xl font-black text-slate-900 mb-3">ยกเลิกตั๋ว</h3>
              <p className="text-sm text-slate-600 leading-relaxed">
                ยกเลิกการจองของผู้เข้าร่วมงาน<br />
                ที่นั่งจะถูกคืนเข้าระบบทันที
              </p>
              <div className="mt-6 px-6 py-2 bg-red-50 group-hover:bg-red-500 rounded-full transition-colors">
                <span className="text-sm font-bold text-red-600 group-hover:text-white transition-colors">
                  Cancel Ticket
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
                <li>• การยกเลิกตั๋วจะคืนที่นั่งเข้าระบบทันที</li>
                <li>• ระบบจะส่งอีเมลแจ้งเตือนไปยังผู้ใช้อัตโนมัติ</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminManagePage;
