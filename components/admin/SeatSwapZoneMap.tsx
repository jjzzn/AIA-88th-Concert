import React, { useState, useEffect, useMemo } from 'react';
import { Loader2, ArrowLeft, MapPin } from 'lucide-react';
import { SeatInfo } from '../../types/seat-swap';
import { seatSwapService } from '../../lib/services/seatSwapService';
import { supabase } from '../../lib/supabase';

interface Props {
  currentSeatId: string;
  currentSeatInfo: SeatInfo;
  onSeatSelect: (seat: SeatInfo) => void;
  onBack: () => void;
}

interface ZoneWithSeats {
  zone_id: string;
  zone_name: string;
  tier_name: string;
  tier_color: string;
  available_count: number;
  total_count: number;
  seats: SeatInfo[];
}

const SeatSwapZoneMap: React.FC<Props> = ({ 
  currentSeatId, 
  currentSeatInfo, 
  onSeatSelect, 
  onBack 
}) => {
  const [loading, setLoading] = useState(true);
  const [allSeats, setAllSeats] = useState<SeatInfo[]>([]);
  const [selectedZone, setSelectedZone] = useState<string | null>(null);
  const [selectedSeatId, setSelectedSeatId] = useState<string | null>(null);

  useEffect(() => {
    loadSeats();
    
    // Set up realtime subscription for seats table
    const channel = supabase
      .channel('admin-seat-swap-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'seats'
        },
        (payload) => {
          console.log('🔄 Real-time seat change (Admin Swap):', payload);
          loadSeats();
        }
      )
      .subscribe();
    
    return () => {
      supabase.removeChannel(channel);
    };
  }, [currentSeatId]);

  const loadSeats = async () => {
    setLoading(true);
    try {
      const seatMap = await seatSwapService.getSeatMap(currentSeatId);
      
      // Flatten all seats from all zones
      const allSeatsFlat: SeatInfo[] = [];
      seatMap.zones.forEach(zone => {
        zone.seats.forEach(seat => {
          allSeatsFlat.push(seat as SeatInfo);
        });
      });
      
      setAllSeats(allSeatsFlat);
    } catch (error) {
      console.error('Failed to load seats:', error);
    } finally {
      setLoading(false);
    }
  };

  // Group seats by zone
  const zones = useMemo(() => {
    const zoneMap = new Map<string, ZoneWithSeats>();
    
    allSeats.forEach(seat => {
      if (!zoneMap.has(seat.zone_id)) {
        zoneMap.set(seat.zone_id, {
          zone_id: seat.zone_id,
          zone_name: seat.zone_name,
          tier_name: seat.tier_name,
          tier_color: seat.tier_color,
          available_count: 0,
          total_count: 0,
          seats: []
        });
      }
      
      const zone = zoneMap.get(seat.zone_id)!;
      zone.seats.push(seat);
      zone.total_count++;
      
      if (!seat.is_booked || seat.seat_id === currentSeatId) {
        zone.available_count++;
      }
    });

    return Array.from(zoneMap.values());
  }, [allSeats, currentSeatId]);

  // Filter zones by tier (only PLATINUM, GOLD, SILVER, CLASSIC)
  const filteredZones = useMemo(() => {
    const tierOrder = ['PLATINUM', 'GOLD', 'SILVER', 'CLASSIC'];
    
    return zones
      .filter(z => z.tier_name && tierOrder.includes(z.tier_name.toUpperCase()))
      .sort((a, b) => {
        const aTier = a.tier_name ? a.tier_name.toUpperCase() : '';
        const bTier = b.tier_name ? b.tier_name.toUpperCase() : '';
        const aIndex = tierOrder.indexOf(aTier);
        const bIndex = tierOrder.indexOf(bTier);
        if (aIndex !== bIndex) return aIndex - bIndex;
        return (a.zone_name || '').localeCompare(b.zone_name || '');
      });
  }, [zones]);

  // Get seats for selected zone
  const selectedZoneSeats = useMemo(() => {
    if (!selectedZone) return [];
    const zone = zones.find(z => z.zone_id === selectedZone);
    return zone?.seats || [];
  }, [selectedZone, zones]);

  // Group seats by row
  const rowSeats = useMemo(() => {
    const rows: Record<string, SeatInfo[]> = {};
    
    selectedZoneSeats.forEach(seat => {
      if (!rows[seat.row]) rows[seat.row] = [];
      rows[seat.row].push(seat);
    });

    Object.keys(rows).forEach(row => {
      rows[row].sort((a, b) => a.number - b.number);
    });

    return rows;
  }, [selectedZoneSeats]);

  const handleSeatClick = (seat: SeatInfo) => {
    if (seat.is_booked && seat.seat_id !== currentSeatId) return;
    if (seat.seat_id === currentSeatId) return;
    
    setSelectedSeatId(seat.seat_id);
    onSeatSelect(seat);
  };

  const getSeatColor = (seat: SeatInfo) => {
    if (seat.seat_id === currentSeatId) {
      return 'bg-red-100 border-red-300 text-red-600 cursor-not-allowed';
    }
    if (seat.seat_id === selectedSeatId) {
      return 'bg-[#E4002B] border-[#E4002B] text-white scale-110 shadow-lg';
    }
    if (seat.is_booked) {
      return 'bg-white border-slate-200 text-slate-400 cursor-not-allowed';
    }
    return 'bg-slate-900 hover:bg-slate-700 border-slate-700 text-white cursor-pointer';
  };

  const selectedZoneInfo = zones.find(z => z.zone_id === selectedZone);

  // Zone Map View
  if (!selectedZone) {
    return (
      <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
        <button
          onClick={onBack}
          className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition mb-6 group"
        >
          <ArrowLeft className="w-4 h-4 group-hover:-translate-x-1 transition-transform" />
          <span className="text-sm font-bold">กลับ</span>
        </button>

        <h2 className="text-xl font-black text-slate-900 mb-6">เลือกโซนที่ต้องการ</h2>

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
          <div className="grid grid-cols-3 gap-3">
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Zone</p>
              <p className="text-sm font-black text-slate-900">{currentSeatInfo.zone_name}</p>
            </div>
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Row</p>
              <p className="text-xl font-black text-slate-900">{currentSeatInfo.row}</p>
            </div>
            <div>
              <p className="text-xs font-bold text-slate-500 uppercase mb-1">Seat</p>
              <p className="text-xl font-black text-amber-600">
                {currentSeatInfo.number.toString().padStart(2, '0')}
              </p>
            </div>
          </div>
        </div>

        {loading ? (
          <div className="flex flex-col items-center justify-center py-12">
            <Loader2 className="w-12 h-12 text-blue-600 animate-spin mb-4" />
            <p className="text-slate-600 font-medium">กำลังโหลดโซน...</p>
          </div>
        ) : (
          <div>
            {/* Stage */}
            <div className="mb-8 flex justify-center">
              <div className="w-full max-w-[400px] py-4 bg-slate-900 rounded-full flex items-center justify-center">
                <span className="text-sm font-black text-white uppercase tracking-[0.6em]">STAGE</span>
              </div>
            </div>

            {/* Zone Map - Visual Layout */}
            <div className="space-y-3">
              {/* Row A zones */}
              {filteredZones.filter(z => z.zone_name && z.zone_name.includes(' A')).length > 0 && (
                <div className="flex justify-center gap-4">
                  {filteredZones
                    .filter(z => z.zone_name && z.zone_name.includes(' A'))
                    .sort((a, b) => (a.zone_name || '').localeCompare(b.zone_name || ''))
                    .map(zone => (
                      <button
                        key={zone.zone_id}
                        onClick={() => setSelectedZone(zone.zone_id)}
                        className="w-36 h-24 bg-[#E4002B] hover:bg-[#c00024] text-white rounded-[28px] flex items-center justify-center font-black text-2xl transition-all hover:scale-105 active:scale-95 shadow-lg"
                      >
                        {(zone.zone_name || '').replace('ZONE ', '')}
                      </button>
                    ))}
                </div>
              )}

              {/* Row B zones */}
              {filteredZones.filter(z => z.zone_name && z.zone_name.includes(' B')).length > 0 && (
                <div className="flex justify-center gap-4">
                  {filteredZones
                    .filter(z => z.zone_name && z.zone_name.includes(' B'))
                    .sort((a, b) => (a.zone_name || '').localeCompare(b.zone_name || ''))
                    .map(zone => (
                      <button
                        key={zone.zone_id}
                        onClick={() => setSelectedZone(zone.zone_id)}
                        className="w-32 h-24 bg-[#E4002B] hover:bg-[#c00024] text-white rounded-[28px] flex items-center justify-center font-black text-2xl transition-all hover:scale-105 active:scale-95 shadow-lg"
                      >
                        {(zone.zone_name || '').replace('ZONE ', '')}
                      </button>
                    ))}
                </div>
              )}

              {/* Row C and D zones */}
              {(filteredZones.filter(z => z.zone_name && (z.zone_name.includes(' C') || z.zone_name.includes(' D'))).length > 0) && (
                <div className="flex justify-center gap-4">
                  {filteredZones
                    .filter(z => z.zone_name && (z.zone_name.includes(' C') || z.zone_name.includes(' D')))
                    .sort((a, b) => {
                      const order = ['ZONE C1', 'ZONE D1', 'ZONE D2', 'ZONE C2'];
                      const aIndex = order.indexOf(a.zone_name || '');
                      const bIndex = order.indexOf(b.zone_name || '');
                      if (aIndex !== -1 && bIndex !== -1) return aIndex - bIndex;
                      return (a.zone_name || '').localeCompare(b.zone_name || '');
                    })
                    .map(zone => (
                      <button
                        key={zone.zone_id}
                        onClick={() => setSelectedZone(zone.zone_id)}
                        className="w-28 h-24 bg-[#E4002B] hover:bg-[#c00024] text-white rounded-[28px] flex items-center justify-center font-black text-xl transition-all hover:scale-105 active:scale-95 shadow-lg"
                      >
                        {(zone.zone_name || '').replace('ZONE ', '')}
                      </button>
                    ))}
                </div>
              )}
            </div>

            {/* Zone List (Alternative view) */}
            <div className="mt-8 pt-6 border-t border-slate-100">
              <p className="text-xs font-bold text-slate-500 uppercase mb-3">รายการโซนทั้งหมด</p>
              <div className="grid grid-cols-2 gap-2">
                {filteredZones.map(zone => (
                  <button
                    key={zone.zone_id}
                    onClick={() => setSelectedZone(zone.zone_id)}
                    className="text-left bg-slate-50 hover:bg-slate-100 border border-slate-200 rounded-lg p-3 transition-all text-sm"
                  >
                    <div className="font-black text-slate-900">{zone.zone_name}</div>
                    <div className="text-xs text-slate-500 mt-1">
                      {zone.available_count} ที่ว่าง / {zone.total_count} ที่
                    </div>
                  </button>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>
    );
  }

  // Seat Selection View
  return (
    <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
      <button
        onClick={() => {
          setSelectedZone(null);
          setSelectedSeatId(null);
        }}
        className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition mb-6 group"
      >
        <ArrowLeft className="w-4 h-4 group-hover:-translate-x-1 transition-transform" />
        <span className="text-sm font-bold">กลับไปเลือกโซน</span>
      </button>

      <div className="mb-6">
        <h2 className="text-xl font-black text-slate-900 mb-2">
          {selectedZoneInfo?.zone_name}
        </h2>
        <p className="text-sm text-slate-600">
          คลิกที่นั่งที่ต้องการเปลี่ยน
        </p>
      </div>

      {/* Stage */}
      <div className="mb-8 flex justify-center">
        <div className="w-full max-w-md py-2 bg-slate-50 border border-slate-100 rounded-full flex items-center justify-center shadow-inner">
          <span className="text-[10px] font-black text-slate-300 uppercase tracking-[0.8em]">S T A G E</span>
        </div>
      </div>

      {/* Seats Grid - User Style */}
      <div className="flex-1 overflow-x-auto overflow-y-visible mb-8">
        <div className="min-w-fit flex flex-col items-center gap-5 mx-auto">
          {Object.entries(rowSeats)
            .sort(([a], [b]) => a.localeCompare(b))
            .map(([row, seats]) => (
              <div key={row} className="flex items-center gap-5">
                <span className="w-4 text-[11px] font-black text-slate-400">{row}</span>
                <div className="flex gap-3">
                  {seats.map(seat => {
                    const isCurrent = seat.seat_id === currentSeatId;
                    const isSelected = seat.seat_id === selectedSeatId;
                    const seatLabel = `${seat.row}${seat.number.toString().padStart(2, '0')}`;
                    
                    return (
                      <button
                        key={seat.seat_id}
                        onClick={() => handleSeatClick(seat)}
                        disabled={seat.is_booked && !isCurrent}
                        className={`
                          relative w-12 h-12 rounded-xl transition-all duration-300 transform flex items-center justify-center
                          text-[10px] font-black tracking-tighter
                          ${
                            isCurrent
                              ? 'bg-red-100 border-2 border-red-300 text-red-600 cursor-not-allowed'
                              : seat.is_booked
                                ? 'bg-slate-50 border border-slate-100 text-slate-200 cursor-not-allowed'
                                : isSelected
                                  ? 'bg-[#E4002B] text-white ring-4 ring-red-100 scale-110 shadow-lg z-10'
                                  : 'bg-slate-900 text-slate-400 hover:bg-slate-700 shadow-sm'
                          }
                        `}
                        title={`Row ${seat.row}, Seat ${seat.number}${isCurrent ? ' (ที่นั่งปัจจุบัน)' : ''}`}
                      >
                        {seatLabel}
                      </button>
                    );
                  })}
                </div>
                <span className="w-4 text-[11px] font-black text-slate-400 text-right">{row}</span>
              </div>
            ))}
        </div>
      </div>

      {/* Legend */}
      <div className="px-6 mb-4">
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
            <div className="w-3 h-3 rounded-md bg-slate-50 border border-slate-200" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">จองแล้ว</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-red-100 border border-red-300" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">ปัจจุบัน</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SeatSwapZoneMap;
