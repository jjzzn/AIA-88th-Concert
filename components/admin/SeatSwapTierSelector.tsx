import React, { useState, useEffect, useMemo } from 'react';
import { Loader2, ArrowLeft, MapPin, Star } from 'lucide-react';
import { SeatInfo } from '../../types/seat-swap';
import { seatSwapService } from '../../lib/services/seatSwapService';

interface Props {
  currentSeatId: string;
  currentSeatInfo: SeatInfo;
  onSeatSelect: (seat: SeatInfo) => void;
  onBack: () => void;
}

interface SeatWithStatus extends SeatInfo {
  status: 'available' | 'booked' | 'current' | 'reserved' | 'selected';
}

const SeatSwapTierSelector: React.FC<Props> = ({ 
  currentSeatId, 
  currentSeatInfo, 
  onSeatSelect, 
  onBack 
}) => {
  const [loading, setLoading] = useState(true);
  const [allSeats, setAllSeats] = useState<SeatInfo[]>([]);
  const [bookedSeats, setBookedSeats] = useState<Set<string>>(new Set());
  const [selectedTier, setSelectedTier] = useState<string | null>(null);
  const [selectedSeatId, setSelectedSeatId] = useState<string | null>(null);

  useEffect(() => {
    loadSeats();
  }, [currentSeatId]);

  const loadSeats = async () => {
    setLoading(true);
    try {
      // Get available seats
      const result = await seatSwapService.getAvailableSeats(currentSeatId);
      setAllSeats(result.seats);

      // Get all seats including booked ones for display
      const seatMap = await seatSwapService.getSeatMap(currentSeatId);
      const booked = new Set<string>();
      seatMap.zones.forEach(zone => {
        zone.seats.forEach(seat => {
          if (seat.is_booked && seat.seat_id !== currentSeatId) {
            booked.add(seat.seat_id);
          }
        });
      });
      setBookedSeats(booked);
    } catch (error) {
      console.error('Failed to load seats:', error);
    } finally {
      setLoading(false);
    }
  };

  // Group available seats by tier
  const tiers = useMemo(() => {
    const tierMap = new Map<string, { 
      tier_id: string; 
      tier_name: string; 
      tier_color: string; 
      available_count: number;
    }>();
    
    allSeats.forEach(seat => {
      if (tierMap.has(seat.tier_id)) {
        tierMap.get(seat.tier_id)!.available_count++;
      } else {
        tierMap.set(seat.tier_id, {
          tier_id: seat.tier_id,
          tier_name: seat.tier_name,
          tier_color: seat.tier_color,
          available_count: 1
        });
      }
    });

    return Array.from(tierMap.values());
  }, [allSeats]);

  // Get all seats for selected tier (including booked ones)
  const tierSeatsWithStatus = useMemo(() => {
    if (!selectedTier) return [];

    // Get all seats from seat map for this tier
    const allTierSeats: SeatWithStatus[] = [];
    
    // Add available seats
    allSeats
      .filter(s => s.tier_id === selectedTier)
      .forEach(seat => {
        allTierSeats.push({
          ...seat,
          status: seat.seat_id === selectedSeatId ? 'selected' : 'available'
        });
      });

    return allTierSeats;
  }, [selectedTier, allSeats, selectedSeatId]);

  // Group seats by row
  const rowSeats = useMemo(() => {
    const rows: Record<string, SeatWithStatus[]> = {};
    
    tierSeatsWithStatus.forEach(seat => {
      if (!rows[seat.row]) rows[seat.row] = [];
      rows[seat.row].push(seat);
    });

    // Sort seats in each row
    Object.keys(rows).forEach(row => {
      rows[row].sort((a, b) => a.number - b.number);
    });

    return rows;
  }, [tierSeatsWithStatus]);

  const handleSeatClick = (seat: SeatWithStatus) => {
    if (seat.status === 'booked' || seat.status === 'current') return;
    
    setSelectedSeatId(seat.seat_id);
    onSeatSelect(seat);
  };

  const getSeatColor = (status: SeatWithStatus['status']) => {
    switch (status) {
      case 'available':
        return 'bg-slate-900 hover:bg-slate-700 border-slate-700 text-white cursor-pointer';
      case 'booked':
        return 'bg-white border-slate-200 text-slate-400 cursor-not-allowed';
      case 'current':
        return 'bg-red-100 border-red-300 text-red-600 cursor-not-allowed';
      case 'reserved':
        return 'bg-yellow-100 border-yellow-300 text-yellow-700 cursor-not-allowed';
      case 'selected':
        return 'bg-[#E4002B] border-[#E4002B] text-white scale-110 shadow-lg';
      default:
        return 'bg-slate-900 border-slate-700 text-white';
    }
  };

  // Tier Selection View
  if (!selectedTier) {
    return (
      <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
        <button
          onClick={onBack}
          className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition mb-6 group"
        >
          <ArrowLeft className="w-4 h-4 group-hover:-translate-x-1 transition-transform" />
          <span className="text-sm font-bold">กลับ</span>
        </button>

        <h2 className="text-xl font-black text-slate-900 mb-6">เลือก Tier ที่ต้องการ</h2>

        {/* Current Seat Info */}
        <div className="mb-6 p-5 bg-gradient-to-br from-amber-50 to-white border-2 border-amber-200 rounded-[20px]">
          <div className="flex items-center gap-3 mb-3">
            <div className="w-10 h-10 bg-amber-100 rounded-full flex items-center justify-center">
              <MapPin className="w-5 h-5 text-amber-600" />
            </div>
            <div>
              <p className="text-xs font-bold text-amber-600 uppercase">ที่นั่งปัจจุบัน</p>
              <p className="text-sm font-medium text-slate-600">จะถูกเปลี่ยนเป็นที่ว่าง</p>
            </div>
          </div>
          <div className="grid grid-cols-4 gap-3">
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Tier</p>
              <p className="text-lg font-black" style={{ color: currentSeatInfo.tier_color }}>
                {currentSeatInfo.tier_name}
              </p>
            </div>
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Zone</p>
              <p className="text-lg font-black text-slate-900">{currentSeatInfo.zone_name}</p>
            </div>
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Row</p>
              <p className="text-2xl font-black text-slate-900">{currentSeatInfo.row}</p>
            </div>
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Seat</p>
              <p className="text-2xl font-black text-amber-600">
                {currentSeatInfo.number.toString().padStart(2, '0')}
              </p>
            </div>
          </div>
        </div>

        {loading ? (
          <div className="flex flex-col items-center justify-center py-12">
            <Loader2 className="w-12 h-12 text-blue-600 animate-spin mb-4" />
            <p className="text-slate-600 font-medium">กำลังโหลด Tier...</p>
          </div>
        ) : (
          <div className="space-y-3">
            {tiers.map(tier => (
              <button
                key={tier.tier_id}
                onClick={() => setSelectedTier(tier.tier_id)}
                className="w-full text-left bg-white border-2 border-slate-200 hover:border-blue-400 rounded-[20px] p-5 transition-all hover:shadow-lg active:scale-[0.98] group"
              >
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-4">
                    <div 
                      className="w-12 h-12 rounded-full flex items-center justify-center"
                      style={{ backgroundColor: tier.tier_color + '20' }}
                    >
                      <Star className="w-6 h-6" style={{ color: tier.tier_color }} />
                    </div>
                    <div>
                      <h3 
                        className="text-xl font-black uppercase group-hover:text-blue-600 transition-colors"
                        style={{ color: tier.tier_color }}
                      >
                        {tier.tier_name}
                      </h3>
                      <p className="text-sm font-medium text-slate-500">
                        {tier.available_count} ที่นั่งว่าง
                      </p>
                    </div>
                  </div>
                  <div className="text-right">
                    <div className="w-10 h-10 rounded-full bg-slate-100 group-hover:bg-blue-50 flex items-center justify-center transition-colors">
                      <ArrowLeft className="w-5 h-5 text-slate-400 group-hover:text-blue-600 rotate-180" />
                    </div>
                  </div>
                </div>
              </button>
            ))}
          </div>
        )}
      </div>
    );
  }

  const selectedTierInfo = tiers.find(t => t.tier_id === selectedTier);

  // Seat Selection View
  return (
    <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
      <button
        onClick={() => {
          setSelectedTier(null);
          setSelectedSeatId(null);
        }}
        className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition mb-6 group"
      >
        <ArrowLeft className="w-4 h-4 group-hover:-translate-x-1 transition-transform" />
        <span className="text-sm font-bold">กลับไปเลือก Tier</span>
      </button>

      <div className="mb-6">
        <h2 
          className="text-2xl font-black uppercase mb-2"
          style={{ color: selectedTierInfo?.tier_color }}
        >
          {selectedTierInfo?.tier_name}
        </h2>
        <p className="text-sm text-slate-600">
          คลิกที่นั่งที่ต้องการเปลี่ยน (สีดำ = ว่าง)
        </p>
      </div>

      {/* Stage */}
      <div className="mb-8 flex justify-center">
        <div className="w-[280px] py-3 bg-slate-900 rounded-full flex items-center justify-center">
          <span className="text-xs font-black text-white uppercase tracking-[0.4em]">STAGE</span>
        </div>
      </div>

      {/* Seats Grid */}
      <div className="space-y-4 max-h-[500px] overflow-y-auto">
        {Object.entries(rowSeats)
          .sort(([a], [b]) => a.localeCompare(b))
          .map(([row, seats]) => (
            <div key={row} className="space-y-2">
              <div className="flex items-center gap-3">
                <div className="w-8 h-8 bg-slate-900 rounded-lg flex items-center justify-center">
                  <span className="text-sm font-black text-white">{row}</span>
                </div>
                <div className="h-px flex-1 bg-slate-200" />
              </div>
              
              <div className="grid grid-cols-8 gap-2">
                {seats.map(seat => {
                  const isCurrent = seat.seat_id === currentSeatId;
                  const status = isCurrent ? 'current' : seat.status;
                  
                  return (
                    <button
                      key={seat.seat_id}
                      onClick={() => handleSeatClick(seat)}
                      disabled={status === 'booked' || status === 'current' || status === 'reserved'}
                      className={`aspect-square border-2 rounded-[12px] flex items-center justify-center transition-all ${getSeatColor(status)}`}
                      title={`Row ${seat.row}, Seat ${seat.number}${isCurrent ? ' (ที่นั่งปัจจุบัน)' : ''}`}
                    >
                      <span className="text-sm font-bold">
                        {seat.number}
                      </span>
                    </button>
                  );
                })}
              </div>
            </div>
          ))}
      </div>

      {/* Legend */}
      <div className="mt-6 pt-6 border-t border-slate-100">
        <p className="text-xs font-bold text-slate-500 uppercase mb-3">คำอธิบาย</p>
        <div className="grid grid-cols-2 gap-3">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-slate-900 border-2 border-slate-700 rounded-[8px]" />
            <span className="text-sm font-medium text-slate-700">ว่าง (เลือกได้)</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-white border-2 border-slate-200 rounded-[8px]" />
            <span className="text-sm font-medium text-slate-700">ถูกจองแล้ว</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-red-100 border-2 border-red-300 rounded-[8px]" />
            <span className="text-sm font-medium text-slate-700">ที่นั่งปัจจุบัน</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-[#E4002B] border-2 border-[#E4002B] rounded-[8px]" />
            <span className="text-sm font-medium text-slate-700">ที่เลือก</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SeatSwapTierSelector;
