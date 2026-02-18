
import React, { useState } from 'react';
import { UserType } from '../types';
import { User, Users, Search, Ticket } from 'lucide-react';

interface Props {
  onSelectUserType: (userType: UserType) => void;
  onViewMyTicket: () => void;
}

const UserTypeSelection: React.FC<Props> = ({ onSelectUserType, onViewMyTicket }) => {
  return (
    <div className="px-4 py-8 space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
      {/* AIA Logo and Title */}
      <div className="text-center space-y-6 pt-4">
        {/* AIA Logo */}
        <div className="flex justify-center">
          <div className="w-16 h-16 bg-[#E4002B] rounded-lg flex items-center justify-center">
            <span className="text-white text-2xl font-black">88th</span>
          </div>
        </div>
        
        {/* Concert Title */}
        <h1 className="text-3xl font-normal text-[#E4002B] tracking-wide">
          88th Anniversary Concert
        </h1>
      </div>

      {/* Selection Section */}
      <div className="text-center space-y-4">
        <h2 className="text-xl font-black text-slate-900">เลือกประเภทการใช้สิทธิ์</h2>
        <p className="text-slate-500 text-sm">กรุณาเลือกว่าคุณจะใช้สิทธิ์แบบไหน</p>
      </div>

      {/* User Type Options */}
      <div className="space-y-4">
        {/* Self Use */}
        <button
          onClick={() => onSelectUserType('SELF')}
          className="w-full bg-white border-2 border-slate-200 rounded-2xl p-6 hover:border-[#E4002B] hover:bg-red-50 transition group"
        >
          <div className="flex items-center gap-4">
            <div className="w-14 h-14 bg-slate-50 group-hover:bg-white rounded-xl flex items-center justify-center shrink-0 transition">
              <User className="w-7 h-7 text-slate-400 group-hover:text-[#E4002B] transition" />
            </div>
            <div className="text-left flex-1">
              <h3 className="text-lg font-black text-slate-900 group-hover:text-[#E4002B] transition">
                ใช้สิทธิ์ด้วยตัวเอง
              </h3>
              <p className="text-sm text-slate-500 mt-1">
                สำหรับผู้ที่มีรหัสสิทธิ์และจะใช้เอง
              </p>
            </div>
          </div>
        </button>

        {/* Agent */}
        <button
          onClick={() => onSelectUserType('AGENT')}
          className="w-full bg-white border-2 border-slate-200 rounded-2xl p-6 hover:border-[#E4002B] hover:bg-red-50 transition group"
        >
          <div className="flex items-center gap-4">
            <div className="w-14 h-14 bg-slate-50 group-hover:bg-white rounded-xl flex items-center justify-center shrink-0 transition">
              <Users className="w-7 h-7 text-slate-400 group-hover:text-[#E4002B] transition" />
            </div>
            <div className="text-left flex-1">
              <h3 className="text-lg font-black text-slate-900 group-hover:text-[#E4002B] transition">
                ตัวแทน
              </h3>
              <p className="text-sm text-slate-500 mt-1">
                สำหรับตัวแทนที่ทำการจองให้ลูกค้า
              </p>
            </div>
          </div>
        </button>
      </div>

      {/* View My Ticket Button */}
      <div className="pt-4">
        <button
          onClick={onViewMyTicket}
          className="w-full py-5 bg-white border-2 border-slate-200 text-slate-700 rounded-2xl font-bold text-base hover:bg-slate-50 active:scale-[0.98] transition flex items-center justify-center gap-2"
        >
          <Search className="w-5 h-5" />
          <span>ตรวจสอบตั๋วของฉัน (View My Ticket)</span>
        </button>
      </div>
    </div>
  );
};

export default UserTypeSelection;
