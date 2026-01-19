
import React, { useState, useMemo } from 'react';
import { Tier, Seat, Zone } from '../types';
import { Star, ChevronRight, Info, MapPin, LayoutGrid, Users, ArrowLeft, Loader2 } from 'lucide-react';
import { useSeats } from '../lib/hooks';
import { seatService } from '../lib/services';

interface Props {
  tier: Tier;
  maxSeats: number;
  onSubmit: (seats: Seat[]) => void;
  onBack: () => void;
}

const SeatSelection: React.FC<Props> = ({ tier, maxSeats, onSubmit, onBack }) => {
  const [selectedZone, setSelectedZone] = useState<Zone | null>(null);
  const [selectedSeatIds, setSelectedSeatIds] = useState<string[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [zones, setZones] = useState<Zone[]>([]);
  
  const { seats: allSeats, loading, error: seatsError, refreshSeats } = useSeats(tier.id);

  React.useEffect(() => {
    const loadZones = async () => {
      const fetchedZones = await seatService.getZonesByTier(tier.id);
      setZones(fetchedZones);
    };
    loadZones();
  }, [tier.id]);

  const availableZones = useMemo(() => {
    return zones;
  }, [zones]);

  const zoneSeats = useMemo(() => {
    if (!selectedZone) return [];
    return allSeats.filter(s => s.zone_id === selectedZone.id);
  }, [selectedZone, allSeats]);

  const rows = useMemo(() => {
    const r: Record<string, Seat[]> = {};
    zoneSeats.forEach(s => {
      if (!r[s.row]) r[s.row] = [];
      r[s.row].push(s);
    });
    Object.keys(r).forEach(key => {
      r[key].sort((a, b) => a.number - b.number);
    });
    return r;
  }, [zoneSeats]);

  const handleSeatClick = (seat: Seat) => {
    if (seat.is_booked) return;
    setError(null);
    
    if (selectedSeatIds.includes(seat.id)) {
      setSelectedSeatIds(selectedSeatIds.filter(id => id !== seat.id));
    } else {
      if (selectedSeatIds.length < maxSeats) {
        setSelectedSeatIds([...selectedSeatIds, seat.id]);
      } else {
        setError(`คุณสามารถเลือกได้สูงสุด ${maxSeats} ที่นั่ง`);
      }
    }
  };

  const validateAdjacency = (selected: Seat[]) => {
    if (selected.length <= 1) return true;
    const rowGroups: Record<string, number[]> = {};
    selected.forEach(s => {
      if (!rowGroups[s.row]) rowGroups[s.row] = [];
      rowGroups[s.row].push(s.number);
    });
    for (const row in rowGroups) {
      const nums = rowGroups[row].sort((a, b) => a - b);
      for (let i = 0; i < nums.length - 1; i++) {
        if (nums[i + 1] - nums[i] !== 1) return false;
      }
    }
    return true;
  };

  const validateAndSubmit = () => {
    if (selectedSeatIds.length !== maxSeats) {
      setError(`กรุณาเลือกที่นั่งให้ครบ ${maxSeats} ที่นั่ง`);
      return;
    }
    const selectedSeats = zoneSeats.filter(s => selectedSeatIds.includes(s.id));
    if (!validateAdjacency(selectedSeats)) {
      setError('ต้องเลือกที่นั่งติดกันเท่านั้น ไม่สามารถจองเว้นที่ว่างได้');
      return;
    }
    onSubmit(selectedSeats);
  };

  const selectedSeatsData = useMemo(() => {
    return zoneSeats.filter(s => selectedSeatIds.includes(s.id)).sort((a, b) => {
      if (a.row !== b.row) return a.row.localeCompare(b.row);
      return a.number - b.number;
    });
  }, [selectedSeatIds, zoneSeats]);

  // Arena Mini-Map Helper
  const ArenaMap = () => (
    <div className="w-full bg-slate-50 rounded-[32px] p-6 mb-8 border border-slate-100">
      <div className="flex flex-col items-center">
        {/* Stage */}
        <div className="w-3/4 py-1.5 bg-slate-900 rounded-full mb-8 flex items-center justify-center">
          <span className="text-[8px] font-black text-white uppercase tracking-[0.6em]">STAGE</span>
        </div>
        
        {/* Platinum Rows */}
        <div className="flex gap-2 mb-4">
          <div className={`w-14 h-8 rounded-lg flex items-center justify-center text-[10px] font-bold ${tier.id === 'PLATINUM' ? 'bg-[#9f1239] text-white shadow-lg' : 'bg-slate-200 text-slate-400'}`}>A1</div>
          <div className={`w-14 h-8 rounded-lg flex items-center justify-center text-[10px] font-bold ${tier.id === 'PLATINUM' ? 'bg-[#9f1239] text-white shadow-lg' : 'bg-slate-200 text-slate-400'}`}>A2</div>
        </div>

        {/* Gold Rows */}
        <div className="flex gap-2 mb-4">
          <div className={`w-12 h-10 rounded-lg flex items-center justify-center text-[10px] font-bold ${tier.id === 'GOLD' ? 'bg-[#be123c] text-white shadow-lg' : 'bg-slate-200 text-slate-400'}`}>B1</div>
          <div className={`w-12 h-10 rounded-lg flex items-center justify-center text-[10px] font-bold ${tier.id === 'GOLD' ? 'bg-[#be123c] text-white shadow-lg' : 'bg-slate-200 text-slate-400'}`}>B2</div>
          <div className={`w-12 h-10 rounded-lg flex items-center justify-center text-[10px] font-bold ${tier.id === 'GOLD' ? 'bg-[#be123c] text-white shadow-lg' : 'bg-slate-200 text-slate-400'}`}>B3</div>
        </div>

        {/* Silver & Classic (Further back) */}
        <div className="flex gap-2">
          <div className={`w-10 h-8 rounded-lg flex items-center justify-center text-[8px] font-bold ${tier.id === 'SILVER' ? 'bg-[#fb7185] text-white' : 'bg-slate-100 text-slate-300'}`}>C1</div>
          <div className={`w-10 h-8 rounded-lg flex items-center justify-center text-[8px] font-bold ${tier.id === 'CLASSIC' ? 'bg-[#ffe4e6] text-[#be123c]' : 'bg-slate-100 text-slate-300'}`}>D1</div>
          <div className={`w-10 h-8 rounded-lg flex items-center justify-center text-[8px] font-bold ${tier.id === 'CLASSIC' ? 'bg-[#ffe4e6] text-[#be123c]' : 'bg-slate-100 text-slate-300'}`}>D2</div>
          <div className={`w-10 h-8 rounded-lg flex items-center justify-center text-[8px] font-bold ${tier.id === 'SILVER' ? 'bg-[#fb7185] text-white' : 'bg-slate-100 text-slate-300'}`}>C2</div>
        </div>
      </div>
    </div>
  );

  // Zone Selection View
  if (!selectedZone) {
    return (
      <div className="flex flex-col min-h-full bg-white animate-in fade-in duration-500">
        <div className="px-6 py-4">
          <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">SELECT YOUR ZONE</p>
          <h2 className="text-2xl font-black text-slate-900 mb-6">เลือกโซนที่ต้องการ</h2>
          
          {/* Compact Tier Header Display */}
          <div 
            className="mb-4 p-5 rounded-[28px] relative overflow-hidden text-white shadow-[0_15px_30px_rgba(0,0,0,0.12)] transition-all duration-500"
            style={{ 
              background: `linear-gradient(135deg, ${tier.color} 0%, #1e1b1b 100%)` 
            }}
          >
            <div className="relative z-10 space-y-3">
              <div className="space-y-0.5">
                <p className="text-[9px] font-bold uppercase tracking-widest opacity-80">YOUR TIER LEVEL</p>
                <div className="flex items-center gap-2">
                   <h3 className="text-3xl font-black italic tracking-tight uppercase leading-none">{tier.name}</h3>
                   <div className="px-1.5 py-0.5 border border-white/30 rounded-md text-[9px] font-black uppercase tracking-widest">
                      {tier.level}
                   </div>
                </div>
              </div>
              <p className="text-xs font-medium opacity-90 max-w-[200px] leading-snug">
                {tier.description}
              </p>
            </div>
            
            {/* Background Star Decoration - Smaller and shifted more for a cleaner look */}
            <div className="absolute top-1/2 -right-6 -translate-y-1/2 text-white/5 pointer-events-none">
               <Star className="w-40 h-40" strokeWidth={1.2} />
            </div>
          </div>

          <ArenaMap />

          <div className="grid grid-cols-1 gap-4 pb-8">
            {availableZones.map(zone => {
              const bookedInZone = allSeats.filter(s => s.zone_id === zone.id && s.is_booked).length;
              const remaining = zone.capacity - bookedInZone;

              return (
                <button
                  key={zone.id}
                  onClick={() => setSelectedZone(zone)}
                  className="relative overflow-hidden group text-left bg-white border border-slate-100 rounded-[28px] p-6 shadow-sm hover:shadow-xl hover:border-red-100 transition-all active:scale-[0.98]"
                >
                  <div className="flex justify-between items-start relative z-10">
                    <div>
                      <h3 className="text-xl font-black text-slate-900 group-hover:text-[#E4002B] transition-colors">{zone.name}</h3>
                      <div className="flex items-center gap-3 mt-1">
                        <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                          <Users className="w-3 h-3" /> {remaining} ที่นั่งว่าง
                        </span>
                        <span className="text-[10px] px-2 py-0.5 rounded-full bg-slate-50 text-slate-500 font-bold border border-slate-100">
                          {tier.name}
                        </span>
                      </div>
                    </div>
                    <div className="w-10 h-10 rounded-full bg-slate-50 flex items-center justify-center group-hover:bg-red-50 transition-colors">
                      <ChevronRight className="w-5 h-5 text-slate-300 group-hover:text-[#E4002B]" />
                    </div>
                  </div>

                  {/* Progress Bar */}
                  <div className="mt-6 h-1.5 w-full bg-slate-50 rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-[#E4002B] transition-all duration-1000"
                      style={{ width: `${100 - (remaining / zone.capacity * 100)}%` }}
                    />
                  </div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  }

  // Seat Selection View
  return (
    <div className="flex flex-col min-h-full bg-white animate-in slide-in-from-right-10 duration-500">
      {/* Step Indicator & Back to Zones */}
      <div className="px-6 py-4">
        <button 
          onClick={() => setSelectedZone(null)}
          className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition mb-4 group"
        >
          <ArrowLeft className="w-4 h-4 group-hover:-translate-x-1 transition-transform" />
          <span className="text-xs font-bold uppercase tracking-widest">Back to Zones</span>
        </button>
        
        <div className="flex items-center justify-between mb-2">
          <h2 className="text-2xl font-black text-slate-900">{selectedZone.name}</h2>
          <div className="px-3 py-1 rounded-full bg-red-50 border border-red-100">
             <span className="text-[10px] font-black text-[#E4002B] uppercase tracking-tighter">SELECT {maxSeats} SEATS</span>
          </div>
        </div>
        <div className="flex gap-1.5 h-1.5 w-full mb-6">
          <div className="flex-1 bg-slate-100 rounded-full" />
          <div className="flex-1 bg-[#E4002B] rounded-full" />
          <div className="flex-1 bg-slate-100 rounded-full" />
        </div>
      </div>

      {/* Stage Graphic */}
      <div className="px-6 mb-10">
        <div className="w-full py-2 bg-slate-50 border border-slate-100 rounded-full flex items-center justify-center shadow-inner">
          <span className="text-[10px] font-black text-slate-300 uppercase tracking-[0.8em]">S T A G E</span>
        </div>
      </div>

      {/* Seat Map */}
      <div className="flex-1 overflow-x-auto seat-map-container px-6 mb-8 py-2">
        <div className="min-w-fit flex flex-col items-center gap-5">
          {Object.keys(rows).map((rowName) => (
            <div key={rowName} className="flex items-center gap-5">
              <span className="w-4 text-[11px] font-black text-slate-400">{rowName}</span>
              <div className="flex gap-3">
                {rows[rowName].map(seat => {
                  const isSelected = selectedSeatIds.includes(seat.id);
                  const seatLabel = `${seat.row}${seat.number.toString().padStart(2, '0')}`;
                  return (
                    <button
                      key={seat.id}
                      onClick={() => handleSeatClick(seat)}
                      disabled={seat.isBooked}
                      className={`
                        relative w-9 h-9 rounded-xl transition-all duration-300 transform flex items-center justify-center
                        text-[8px] font-black tracking-tighter
                        ${seat.isBooked 
                          ? 'bg-slate-50 border border-slate-100 text-slate-200 cursor-not-allowed' 
                          : isSelected 
                            ? 'bg-[#E4002B] text-white ring-4 ring-red-100 scale-110 shadow-lg z-10' 
                            : 'bg-slate-900 text-slate-400 hover:bg-slate-700 shadow-sm'}
                      `}
                    >
                      {seatLabel}
                    </button>
                  );
                })}
              </div>
              <span className="w-4 text-[11px] font-black text-slate-400 text-right">{rowName}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Legend */}
      <div className="px-6 mb-8">
        <div className="flex items-center justify-center gap-6 p-4 bg-slate-50/50 rounded-2xl border border-slate-50">
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-slate-900" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">ว่าง</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-[#E4002B]" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">เลือก</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-slate-100" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">เต็ม</span>
          </div>
        </div>
      </div>

      {/* Bottom Summary Bar */}
      <div className="px-4 pb-8 space-y-4">
        {selectedSeatsData.length > 0 ? (
          <div className="bg-white border border-slate-100 rounded-[32px] p-6 shadow-2xl flex items-center justify-between animate-in slide-in-from-bottom-2">
            <div>
              <p className="text-[10px] font-black text-[#E4002B] uppercase tracking-widest mb-1">YOUR SELECTION</p>
              <h4 className="text-xl font-black text-slate-900">
                {selectedSeatsData.map(s => `${s.row}${s.number.toString().padStart(2, '0')}`).join(', ')}
              </h4>
            </div>
            <div className="text-right">
               <p className="text-xs font-bold text-slate-400">{selectedSeatsData.length} Seats</p>
               <p className="text-[10px] font-medium text-slate-300">Impact Arena</p>
            </div>
          </div>
        ) : (
          <div className="bg-slate-50 border border-dashed border-slate-200 rounded-[32px] p-6 text-center">
            <p className="text-sm font-bold text-slate-400">เลือกที่นั่งติดกันเพื่อให้การจองสมบูรณ์</p>
          </div>
        )}

        <button
          onClick={validateAndSubmit}
          disabled={selectedSeatIds.length < maxSeats}
          className={`w-full py-5 rounded-[24px] font-black text-lg flex items-center justify-center gap-2 transition-all active:scale-[0.98] shadow-lg
            ${selectedSeatIds.length === maxSeats 
              ? 'bg-[#E4002B] text-white shadow-red-500/20' 
              : 'bg-slate-100 text-slate-300 cursor-not-allowed shadow-none'}
          `}
        >
          <span>ยืนยันที่นั่ง</span>
          <ChevronRight className="w-5 h-5" />
        </button>
      </div>

      {error && (
        <div className="fixed bottom-28 left-6 right-6 bg-slate-900 text-white px-5 py-4 rounded-2xl flex items-center gap-3 shadow-2xl animate-in slide-in-from-bottom-4 z-[100] border border-white/10">
          <div className="w-8 h-8 bg-red-500 rounded-full flex items-center justify-center shrink-0">
            <Info className="w-4 h-4 text-white" />
          </div>
          <p className="text-sm font-bold leading-tight">{error}</p>
        </div>
      )}
    </div>
  );
};

export default SeatSelection;
