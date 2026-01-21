import React, { useState, useEffect } from 'react';
import { Loader2, Filter, Grid3x3 } from 'lucide-react';
import { SeatInfo } from '../../types/seat-swap';
import { seatSwapService } from '../../lib/services/seatSwapService';

interface Props {
  currentSeatId: string;
  onSeatSelect: (seat: SeatInfo) => void;
}

const SeatMapSelector: React.FC<Props> = ({ currentSeatId, onSeatSelect }) => {
  const [loading, setLoading] = useState(true);
  const [availableSeats, setAvailableSeats] = useState<SeatInfo[]>([]);
  const [filteredSeats, setFilteredSeats] = useState<SeatInfo[]>([]);
  const [selectedTier, setSelectedTier] = useState<string>('all');
  const [tiers, setTiers] = useState<{ tier_id: string; tier_name: string; tier_color: string; count: number }[]>([]);

  useEffect(() => {
    loadAvailableSeats();
  }, [currentSeatId]);

  useEffect(() => {
    if (selectedTier === 'all') {
      setFilteredSeats(availableSeats);
    } else {
      setFilteredSeats(availableSeats.filter(s => s.tier_id === selectedTier));
    }
  }, [selectedTier, availableSeats]);

  const loadAvailableSeats = async () => {
    setLoading(true);
    try {
      const result = await seatSwapService.getAvailableSeats(currentSeatId);
      setAvailableSeats(result.seats);
      setFilteredSeats(result.seats);
      
      // Extract unique tiers
      const tierMap = new Map<string, { tier_id: string; tier_name: string; tier_color: string; count: number }>();
      result.seats.forEach(seat => {
        if (tierMap.has(seat.tier_id)) {
          tierMap.get(seat.tier_id)!.count++;
        } else {
          tierMap.set(seat.tier_id, {
            tier_id: seat.tier_id,
            tier_name: seat.tier_name,
            tier_color: seat.tier_color,
            count: 1
          });
        }
      });
      setTiers(Array.from(tierMap.values()));
    } catch (error) {
      console.error('Failed to load available seats:', error);
    } finally {
      setLoading(false);
    }
  };

  // Group seats by zone
  const groupedSeats = filteredSeats.reduce((acc, seat) => {
    if (!acc[seat.zone_name]) {
      acc[seat.zone_name] = [];
    }
    acc[seat.zone_name].push(seat);
    return acc;
  }, {} as Record<string, SeatInfo[]>);

  return (
    <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-xl font-black text-slate-900">เลือกที่นั่งใหม่</h2>
          <p className="text-sm text-slate-500 mt-1">
            {filteredSeats.length} ที่นั่งว่าง
          </p>
        </div>
        <div className="flex items-center gap-2">
          <Filter className="w-5 h-5 text-slate-400" />
          <select
            value={selectedTier}
            onChange={(e) => setSelectedTier(e.target.value)}
            className="px-4 py-2 bg-slate-50 border-2 border-slate-200 rounded-[12px] font-bold text-sm text-slate-900 focus:border-blue-500 outline-none transition"
          >
            <option value="all">ทุก Tier ({availableSeats.length})</option>
            {tiers.map(tier => (
              <option key={tier.tier_id} value={tier.tier_id}>
                {tier.tier_name} ({tier.count})
              </option>
            ))}
          </select>
        </div>
      </div>

      {loading ? (
        <div className="flex flex-col items-center justify-center py-12">
          <Loader2 className="w-12 h-12 text-blue-600 animate-spin mb-4" />
          <p className="text-slate-600 font-medium">กำลังโหลดที่นั่งว่าง...</p>
        </div>
      ) : filteredSeats.length === 0 ? (
        <div className="flex flex-col items-center justify-center py-12">
          <Grid3x3 className="w-12 h-12 text-slate-300 mb-4" />
          <p className="text-slate-600 font-medium">ไม่มีที่นั่งว่างในขณะนี้</p>
        </div>
      ) : (
        <div className="space-y-6">
          {Object.entries(groupedSeats).map(([zoneName, seats]) => (
            <div key={zoneName} className="space-y-3">
              <div className="flex items-center gap-3">
                <h3 className="text-lg font-black text-slate-900">{zoneName}</h3>
                <span className="px-2 py-1 bg-slate-100 text-slate-600 rounded-full text-xs font-bold">
                  {seats.length} ที่นั่ง
                </span>
              </div>
              
              <div className="grid grid-cols-5 sm:grid-cols-8 md:grid-cols-10 lg:grid-cols-12 gap-2">
                {seats
                  .sort((a, b) => {
                    if (a.row !== b.row) return a.row.localeCompare(b.row);
                    return a.number - b.number;
                  })
                  .map(seat => (
                    <button
                      key={seat.seat_id}
                      onClick={() => onSeatSelect(seat)}
                      className="group relative aspect-square bg-gradient-to-br from-green-50 to-emerald-50 hover:from-green-100 hover:to-emerald-100 border-2 border-green-200 hover:border-green-400 rounded-[12px] flex flex-col items-center justify-center transition-all hover:scale-105 active:scale-95"
                      title={`${seat.zone_name} - Row ${seat.row}, Seat ${seat.number}`}
                    >
                      <span className="text-xs font-bold text-green-700 group-hover:text-green-900">
                        {seat.row}
                      </span>
                      <span className="text-lg font-black text-green-600 group-hover:text-green-800">
                        {seat.number}
                      </span>
                      
                      {/* Tier indicator */}
                      <div 
                        className="absolute bottom-1 left-1 right-1 h-1 rounded-full"
                        style={{ backgroundColor: seat.tier_color }}
                      />
                    </button>
                  ))}
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Legend */}
      <div className="mt-6 pt-6 border-t border-slate-100">
        <p className="text-xs font-bold text-slate-500 uppercase mb-3">คำอธิบาย</p>
        <div className="flex flex-wrap gap-4">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-gradient-to-br from-green-50 to-emerald-50 border-2 border-green-200 rounded-[8px]" />
            <span className="text-sm font-medium text-slate-700">ที่นั่งว่าง</span>
          </div>
          {tiers.map(tier => (
            <div key={tier.tier_id} className="flex items-center gap-2">
              <div 
                className="w-8 h-2 rounded-full"
                style={{ backgroundColor: tier.tier_color }}
              />
              <span className="text-sm font-medium text-slate-700">{tier.tier_name}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default SeatMapSelector;
