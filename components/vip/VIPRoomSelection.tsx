import React, { useState, useEffect } from 'react';
import { VIPRoom } from '../../types/vip';
import { vipBookingService } from '../../lib/services/vipBookingService';
import { DoorOpen, Users, ChevronRight, Loader2 } from 'lucide-react';

interface Props {
  onSelectRoom: (room: VIPRoom) => void;
}

const VIPRoomSelection: React.FC<Props> = ({ onSelectRoom }) => {
  const [rooms, setRooms] = useState<VIPRoom[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadRooms();
  }, []);

  const loadRooms = async () => {
    setLoading(true);
    const data = await vipBookingService.getRooms();
    setRooms(data);
    setLoading(false);
  };

  if (loading) {
    return (
      <div className="text-center py-20">
        <Loader2 className="w-12 h-12 text-[#E4002B] animate-spin mx-auto mb-4" />
        <p className="text-slate-600 font-medium">กำลังโหลดห้อง VIP...</p>
      </div>
    );
  }

  return (
    <>
      {/* Hero Banner / KV */}
      <div className="relative bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 rounded-[32px] overflow-hidden mb-8 shadow-2xl">
        {/* Background Pattern */}
        <div className="absolute inset-0 opacity-10">
          <div className="absolute inset-0" style={{
            backgroundImage: 'radial-gradient(circle at 2px 2px, white 1px, transparent 0)',
            backgroundSize: '40px 40px'
          }} />
        </div>
        
        {/* Content */}
        <div className="relative px-8 py-12">
          <div className="max-w-3xl">
            <p className="text-[#E4002B] font-black text-xs uppercase tracking-[0.3em] mb-3">EXCLUSIVE EVENT</p>
            <h1 className="text-4xl md:text-5xl font-black text-white mb-4 leading-tight">
              AIA 88th Anniversary Celebration
            </h1>
            <p className="text-slate-300 text-sm md:text-base leading-relaxed max-w-2xl">
              Experience world-class music in the comfort of our exclusive VIP suites. 
              Secure your preferred room for the ultimate concert experience.
            </p>
          </div>
        </div>
        
        {/* Decorative Element */}
        <div className="absolute top-0 right-0 w-64 h-64 bg-[#E4002B] rounded-full blur-[120px] opacity-20" />
      </div>

      {/* Room Selection Header */}
      <div className="px-2 mb-8">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">VIP ROOM SELECTION</p>
        <h2 className="text-xl font-black text-slate-900 mb-2">Select one of our 10 private suites to proceed with seat reservation</h2>
        <p className="text-sm text-slate-500">เลือกห้อง VIP ที่ต้องการเพื่อดำเนินการจองที่นั่ง</p>
      </div>

      {/* Room Grid */}
      <div className="grid grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
          {rooms.map((room) => (
            <button
              key={room.id}
              onClick={() => onSelectRoom(room)}
              className="group bg-white rounded-[32px] p-6 shadow-sm hover:shadow-xl transition-all duration-300 border-2 border-slate-100 hover:border-[#E4002B] hover:scale-[1.02] active:scale-100"
            >
              {/* Room Info */}
              <div className="text-center mb-4">
                <h3 className="text-lg font-black text-slate-900 mb-1">{room.name}</h3>
                <p className="text-sm text-slate-500 font-bold">{room.capacity} ที่นั่ง</p>
                
                {/* Booking Status */}
                <div className="mt-3">
                  <div className="flex items-center justify-center gap-2 mb-2">
                    <Users className="w-4 h-4 text-slate-400" />
                    <span className="text-xs font-bold text-slate-600">
                      {room.bookedCount || 0}/{room.capacity}
                    </span>
                  </div>
                  <div className="w-full bg-slate-100 rounded-full h-2 overflow-hidden">
                    <div 
                      className="bg-[#E4002B] h-full transition-all duration-500"
                      style={{ width: `${((room.bookedCount || 0) / room.capacity) * 100}%` }}
                    />
                  </div>
                </div>
              </div>

              {/* Select Button */}
              <div className="flex items-center justify-center gap-2 text-[#E4002B] group-hover:text-red-700 font-bold text-sm">
                <span>เลือกห้องนี้</span>
                <ChevronRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" />
              </div>
            </button>
          ))}
        </div>

      {/* Info Footer */}
      <div className="mt-8 text-center">
        <p className="text-xs text-slate-500">
          <span className="font-bold text-slate-700">หมายเหตุ:</span> ห้อง VIP มีจำนวนที่นั่งจำกัด
        </p>
      </div>
    </>
  );
};

export default VIPRoomSelection;
