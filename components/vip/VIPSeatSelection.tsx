import React, { useState, useEffect } from 'react';
import { VIPRoom, VIPSeat } from '../../types/vip';
import { vipBookingService } from '../../lib/services/vipBookingService';
import { ChevronLeft, Armchair, Loader2 } from 'lucide-react';

interface Props {
  room: VIPRoom;
  onBack: () => void;
  onSubmit: (seats: VIPSeat[]) => void;
}

const VIPSeatSelection: React.FC<Props> = ({ room, onBack, onSubmit }) => {
  const [seats, setSeats] = useState<VIPSeat[]>([]);
  const [selectedSeats, setSelectedSeats] = useState<Set<string>>(new Set());
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadSeats();
  }, [room]);

  const loadSeats = async () => {
    setLoading(true);
    const data = await vipBookingService.getRoomSeats(room.id);
    setSeats(data);
    setLoading(false);
  };

  const toggleSeat = (seatId: string) => {
    const newSelected = new Set(selectedSeats);
    if (newSelected.has(seatId)) {
      newSelected.delete(seatId);
    } else {
      newSelected.add(seatId);
    }
    setSelectedSeats(newSelected);
  };

  const handleSubmit = () => {
    const selected = seats.filter(s => selectedSeats.has(s.id));
    if (selected.length > 0) {
      onSubmit(selected);
    }
  };

  const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  const seatsByRow = seats.reduce((acc, seat) => {
    if (!acc[seat.row]) acc[seat.row] = [];
    acc[seat.row].push(seat);
    return acc;
  }, {} as Record<string, VIPSeat[]>);

  return (
    <div className="space-y-6 pb-10">
      <div className="px-2">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">STEP 1 OF 3</p>
        <div className="flex items-center justify-between mb-2">
          <h2 className="text-xl font-black text-slate-900">เลือกที่นั่ง - Room {room.roomNumber}</h2>
          <p className="text-xs text-slate-400 font-medium">NEXT: <span className="text-slate-600 font-bold">กรอกชื่อ</span></p>
        </div>
        <div className="flex gap-1.5 h-1.5 w-full mb-6">
          <div className="flex-1 bg-[#E4002B] rounded-full shadow-sm shadow-red-500/20" />
          <div className="flex-1 bg-slate-200 rounded-full" />
          <div className="flex-1 bg-slate-200 rounded-full" />
        </div>
        <button
          onClick={onBack}
          className="flex items-center gap-2 text-slate-400 text-sm font-bold hover:text-[#E4002B] transition mb-6"
        >
          <span>←</span>
          <span>ย้อนกลับ</span>
        </button>
      </div>

      {loading ? (
        <div className="bg-white rounded-[32px] shadow-sm p-12 text-center border border-slate-100">
          <Loader2 className="w-12 h-12 text-[#E4002B] animate-spin mx-auto mb-4" />
          <p className="text-slate-600 font-medium">กำลังโหลดที่นั่ง...</p>
        </div>
      ) : seats.length === 0 ? (
        <div className="bg-white rounded-[32px] shadow-sm p-12 text-center border border-slate-100">
          <p className="text-slate-600 font-medium">ไม่พบข้อมูลที่นั่งในห้องนี้</p>
          <p className="text-sm text-slate-400 mt-2">กรุณาตรวจสอบว่าได้ import ข้อมูล CSV แล้ว</p>
        </div>
      ) : (
        <>

        {/* Seat Map Container */}
        <div className="bg-white rounded-[32px] shadow-sm p-6 mb-4 border border-slate-100">
          {/* Stage/Screen */}
          <div className="mb-8">
            <div className="w-full max-w-md mx-auto py-3 bg-slate-900 rounded-2xl">
              <p className="text-center text-white font-black text-xs uppercase tracking-[0.3em]">STAGE</p>
            </div>
          </div>

          {/* Seat Grid */}
          <div className="space-y-4 max-w-2xl mx-auto">
            {Object.keys(seatsByRow).sort().map((rowLetter) => {
              const rowSeats = seatsByRow[rowLetter] || [];
              if (rowSeats.length === 0) return null;

              return (
                <div key={rowLetter} className="flex items-center gap-3">
                  {/* Row Label */}
                  <div className="w-10 flex-shrink-0">
                    <div className="w-8 h-8 bg-slate-100 rounded-lg flex items-center justify-center">
                      <span className="font-black text-slate-700 text-sm">{rowLetter}</span>
                    </div>
                  </div>

                  {/* Seats */}
                  <div className="flex-1 flex flex-wrap gap-2 justify-center">
                    {rowSeats.sort((a, b) => a.number - b.number).map((seat) => {
                      const isSelected = selectedSeats.has(seat.id);
                      const isBooked = seat.isBooked;

                      return (
                        <button
                          key={seat.id}
                          onClick={() => !isBooked && toggleSeat(seat.id)}
                          disabled={isBooked}
                          className={`
                            w-12 h-12 rounded-xl flex flex-col items-center justify-center font-bold text-[10px] transition-all relative
                            ${isBooked
                              ? 'bg-slate-200 text-slate-400 cursor-not-allowed opacity-50'
                              : isSelected
                                ? 'bg-[#E4002B] text-white shadow-lg shadow-red-500/25 scale-105 border-2 border-[#E4002B]'
                                : 'bg-white border-2 border-slate-200 text-slate-700 hover:border-[#E4002B] hover:scale-105 active:scale-95'
                            }
                          `}
                        >
                          <Armchair className="w-5 h-5 mb-0.5" />
                          <span className="text-[9px]">{seat.number}</span>
                        </button>
                      );
                    })}
                  </div>
                </div>
              );
            })}
          </div>

          {/* Legend */}
          <div className="bg-slate-50 rounded-2xl p-4 mb-4 border border-slate-100">
            <div className="flex justify-center gap-6 text-xs">
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-white border-2 border-slate-200 rounded-lg flex items-center justify-center">
                  <Armchair className="w-4 h-4 text-slate-700" />
                </div>
                <span className="font-bold text-slate-600">ว่าง</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-[#E4002B] rounded-lg flex items-center justify-center">
                  <Armchair className="w-4 h-4 text-white" />
                </div>
                <span className="font-bold text-slate-600">เลือกแล้ว</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 bg-slate-200 rounded-lg flex items-center justify-center opacity-50">
                  <Armchair className="w-4 h-4 text-slate-400" />
                </div>
                <span className="font-bold text-slate-600">จองแล้ว</span>
              </div>
            </div>
          </div>
        </div>

        {/* Selected Count & Submit */}
        <div className="bg-white rounded-[32px] shadow-sm p-5 border border-slate-100">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-[10px] font-bold text-slate-400 uppercase tracking-wider mb-1">ที่นั่งที่เลือก</p>
              <p className="text-2xl font-black text-slate-900">
                {selectedSeats.size} <span className="text-sm text-slate-500 font-bold">ที่นั่ง</span>
              </p>
            </div>
            <button
              onClick={handleSubmit}
              disabled={selectedSeats.size === 0}
              className={`
                px-6 py-3 rounded-2xl font-bold text-sm transition-all shadow-lg
                ${selectedSeats.size > 0
                  ? 'bg-[#E4002B] text-white shadow-red-500/25 hover:bg-red-700 active:scale-95'
                  : 'bg-slate-200 text-slate-400 cursor-not-allowed shadow-none'
                }
              `}
            >
              ดำเนินการต่อ ({selectedSeats.size})
            </button>
          </div>
        </div>
        </>
        )}
    </div>
  );
};

export default VIPSeatSelection;
