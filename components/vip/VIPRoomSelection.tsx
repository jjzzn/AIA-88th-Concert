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
      {/* Header */}
      <div className="px-2 mb-8">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">VIP BOOKING</p>
        <h2 className="text-xl font-black text-slate-900 mb-4">เลือกห้อง VIP</h2>
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
