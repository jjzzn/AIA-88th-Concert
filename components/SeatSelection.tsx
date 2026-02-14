
import React, { useState, useMemo, useEffect } from 'react';
import { Tier, Seat, Zone } from '../types';
import { Star, ChevronRight, Info, MapPin, LayoutGrid, Users, ArrowLeft, Loader2, ChevronDown, ChevronUp } from 'lucide-react';
import { useSeats } from '../lib/hooks';
import { seatService } from '../lib/services';
import { seatLockService, SeatAvailability } from '../lib/services/seatLockService';

interface Props {
  tier: Tier;
  maxSeats: number;
  onSubmit: (seats: Seat[]) => void;
  onBack: () => void;
  timeRemaining?: number | null;
}

const SeatSelection: React.FC<Props> = ({ tier, maxSeats, onSubmit, onBack, timeRemaining }) => {
  const [selectedZone, setSelectedZone] = useState<Zone | null>(null);
  const [selectedSeatIds, setSelectedSeatIds] = useState<string[]>([]);
  const [zones, setZones] = useState<Zone[]>([]);
  const [expandedLevels, setExpandedLevels] = useState<{ level1: boolean; level2: boolean; level3: boolean }>({
    level1: true,
    level2: true,
    level3: true
  });
  const [seatAvailability, setSeatAvailability] = useState<Record<string, SeatAvailability>>({});
  const [error, setError] = useState<string | null>(null);
  
  // Get zone IDs for fetching seats
  const zoneIds = useMemo(() => zones.map(z => z.id), [zones]);
  
  const { seats: allSeats, loading, error: seatsError, refreshSeats } = useSeats(tier.id, zoneIds);

  useEffect(() => {
    const loadZones = async () => {
      const fetchedZones = await seatService.getZonesByTier(tier.id);
      setZones(fetchedZones);
    };
    loadZones();
  }, [tier.id]);

  const availableZones = useMemo(() => {
    return zones;
  }, [zones]);

  // Group zones by level
  const groupedZones = useMemo(() => {
    const level1Codes = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'VL', 'VR', 'FF', 'HH'];
    const level2Codes = ['SB', 'SC', 'SD', 'SE', 'SF', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN'];
    
    return {
      level1: availableZones.filter(z => level1Codes.includes(z.code)),
      level2: availableZones.filter(z => level2Codes.includes(z.code)),
      level3: availableZones.filter(z => z.code.startsWith('L') && z.code.length === 2)
    };
  }, [availableZones]);

  const zoneSeats = useMemo(() => {
    if (!selectedZone) return [];
    return allSeats.filter(s => s.zone_id === selectedZone.id);
  }, [selectedZone, allSeats]);

  // Check seat availability when zone changes or seats load
  useEffect(() => {
    const checkAvailability = async () => {
      if (zoneSeats.length === 0) return;
      
      const seatIds = zoneSeats.map(s => s.id);
      console.log('🔍 Checking availability for seats:', seatIds);
      
      const availability = await seatLockService.checkAvailability(seatIds);
      console.log('📊 Availability result:', availability);
      
      const availabilityMap: Record<string, SeatAvailability> = {};
      availability.forEach(avail => {
        availabilityMap[avail.seatId] = avail;
        if (avail.status === 'locked') {
          console.log('🔒 Locked seat found:', avail.seatId, 'by', avail.lockedBy);
        }
      });
      
      console.log('💾 Setting availability map:', availabilityMap);
      
      // Log summary of locked seats
      const lockedSeats = availability.filter(a => a.status === 'locked');
      if (lockedSeats.length > 0) {
        console.log('🔒 LOCKED SEATS FOUND:', lockedSeats.map(s => s.seatId));
      }
      
      setSeatAvailability(availabilityMap);
    };
    
    checkAvailability();
    
    // Refresh availability every 10 seconds
    const interval = setInterval(checkAvailability, 10000);
    return () => clearInterval(interval);
  }, [zoneSeats]);

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
    
    // Check if seat is locked by someone else
    const availability = seatAvailability[seat.id];
    if (availability && availability.status === 'locked') {
      setError('ที่นั่งนี้กำลังถูกเลือกโดยผู้ใช้อื่น');
      return;
    }
    
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
      
      // Check spacing between selected seats
      for (let i = 0; i < nums.length - 1; i++) {
        const gap = nums[i + 1] - nums[i];
        
        // Allow adjacent seats (gap = 1) or seats with gap >= 2
        // Disallow gap of exactly 1 empty seat (gap = 2 means 1 seat between)
        if (gap === 2) {
          return false; // ห้ามเว้นที่ว่าง 1 ที่
        }
        // gap = 1 (ติดกัน) หรือ gap >= 3 (ห่างกัน 2 ที่ขึ้นไป) = OK
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
      setError('ไม่สามารถเว้นที่ว่างเพียง 1 ที่ได้ กรุณาเลือกที่นั่งติดกัน หรือห่างกันอย่างน้อย 2 ที่');
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

  // Arena Venue Map
  const ArenaMap = () => {
    return (
      <div className="w-full bg-white rounded-[32px] p-4 mb-6 border border-slate-100 shadow-sm">
        <div className="flex flex-col items-center">
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-wider mb-3">Venue Map</p>
          <div className="w-full overflow-hidden rounded-2xl border border-slate-100">
            <img 
              src="https://in2it-service.com/IN2IT/Map-88th-concert.png" 
              alt="AIA 88th Concert Venue Map"
              className="w-full h-auto object-contain"
              loading="lazy"
            />
          </div>
          <p className="text-[9px] text-slate-400 mt-3 text-center font-medium">
            Impact Arena - AIA 88th Year Concert
          </p>
        </div>
      </div>
    );
  };

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

          <div className="space-y-6 pb-8">
            {/* Level 1 - Floor */}
            {groupedZones.level1.length > 0 && (
              <div>
                <button
                  onClick={() => setExpandedLevels(prev => ({ ...prev, level1: !prev.level1 }))}
                  className="w-full flex items-center justify-between gap-3 mb-3 p-3 rounded-xl hover:bg-slate-50 transition-colors"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-gradient-to-br from-orange-400 to-orange-600 flex items-center justify-center shadow-md">
                      <span className="text-white text-xs font-black">1</span>
                    </div>
                    <div className="text-left">
                      <h3 className="text-sm font-black text-slate-900">Level 1 - Floor</h3>
                      <p className="text-[10px] text-slate-400 font-medium">{groupedZones.level1.length} zones</p>
                    </div>
                  </div>
                  {expandedLevels.level1 ? (
                    <ChevronUp className="w-5 h-5 text-slate-400" />
                  ) : (
                    <ChevronDown className="w-5 h-5 text-slate-400" />
                  )}
                </button>
                {expandedLevels.level1 && (
                  <div className="grid grid-cols-2 gap-3">
                    {groupedZones.level1.map(zone => {
                    const bookedInZone = allSeats.filter(s => s.zone_id === zone.id && s.is_booked).length;
                    const remaining = zone.capacity - bookedInZone;
                    return (
                      <button
                        key={zone.id}
                        onClick={() => setSelectedZone(zone)}
                        className="relative overflow-hidden group text-left bg-white border border-slate-100 rounded-2xl p-4 shadow-sm hover:shadow-lg hover:border-orange-200 transition-all active:scale-[0.98]"
                      >
                        <h3 className="text-base font-black text-slate-900 group-hover:text-orange-600 transition-colors mb-1">{zone.name}</h3>
                        <div className="flex items-center gap-2 mb-2">
                          <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                            <Users className="w-3 h-3" /> {remaining}
                          </span>
                        </div>
                        <div className="h-1 w-full bg-slate-50 rounded-full overflow-hidden">
                          <div className="h-full bg-orange-500 transition-all duration-1000" style={{ width: `${100 - (remaining / zone.capacity * 100)}%` }} />
                        </div>
                      </button>
                    );
                    })}
                  </div>
                )}
              </div>
            )}

            {/* Level 2 - Middle */}
            {groupedZones.level2.length > 0 && (
              <div>
                <button
                  onClick={() => setExpandedLevels(prev => ({ ...prev, level2: !prev.level2 }))}
                  className="w-full flex items-center justify-between gap-3 mb-3 p-3 rounded-xl hover:bg-slate-50 transition-colors"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-gradient-to-br from-purple-400 to-purple-600 flex items-center justify-center shadow-md">
                      <span className="text-white text-xs font-black">2</span>
                    </div>
                    <div className="text-left">
                      <h3 className="text-sm font-black text-slate-900">Level 2 - Middle</h3>
                      <p className="text-[10px] text-slate-400 font-medium">{groupedZones.level2.length} zones</p>
                    </div>
                  </div>
                  {expandedLevels.level2 ? (
                    <ChevronUp className="w-5 h-5 text-slate-400" />
                  ) : (
                    <ChevronDown className="w-5 h-5 text-slate-400" />
                  )}
                </button>
                {expandedLevels.level2 && (
                  <div className="grid grid-cols-2 gap-3">
                    {groupedZones.level2.map(zone => {
                    const bookedInZone = allSeats.filter(s => s.zone_id === zone.id && s.is_booked).length;
                    const remaining = zone.capacity - bookedInZone;
                    return (
                      <button
                        key={zone.id}
                        onClick={() => setSelectedZone(zone)}
                        className="relative overflow-hidden group text-left bg-white border border-slate-100 rounded-2xl p-4 shadow-sm hover:shadow-lg hover:border-purple-200 transition-all active:scale-[0.98]"
                      >
                        <h3 className="text-base font-black text-slate-900 group-hover:text-purple-600 transition-colors mb-1">{zone.name}</h3>
                        <div className="flex items-center gap-2 mb-2">
                          <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                            <Users className="w-3 h-3" /> {remaining}
                          </span>
                        </div>
                        <div className="h-1 w-full bg-slate-50 rounded-full overflow-hidden">
                          <div className="h-full bg-purple-500 transition-all duration-1000" style={{ width: `${100 - (remaining / zone.capacity * 100)}%` }} />
                        </div>
                      </button>
                    );
                    })}
                  </div>
                )}
              </div>
            )}

            {/* Level 3 - Upper */}
            {groupedZones.level3.length > 0 && (
              <div>
                <button
                  onClick={() => setExpandedLevels(prev => ({ ...prev, level3: !prev.level3 }))}
                  className="w-full flex items-center justify-between gap-3 mb-3 p-3 rounded-xl hover:bg-slate-50 transition-colors"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-gradient-to-br from-blue-400 to-blue-600 flex items-center justify-center shadow-md">
                      <span className="text-white text-xs font-black">3</span>
                    </div>
                    <div className="text-left">
                      <h3 className="text-sm font-black text-slate-900">Level 3 - Upper</h3>
                      <p className="text-[10px] text-slate-400 font-medium">{groupedZones.level3.length} zones</p>
                    </div>
                  </div>
                  {expandedLevels.level3 ? (
                    <ChevronUp className="w-5 h-5 text-slate-400" />
                  ) : (
                    <ChevronDown className="w-5 h-5 text-slate-400" />
                  )}
                </button>
                {expandedLevels.level3 && (
                  <div className="grid grid-cols-2 gap-3">
                    {groupedZones.level3.map(zone => {
                    const bookedInZone = allSeats.filter(s => s.zone_id === zone.id && s.is_booked).length;
                    const remaining = zone.capacity - bookedInZone;
                    return (
                      <button
                        key={zone.id}
                        onClick={() => setSelectedZone(zone)}
                        className="relative overflow-hidden group text-left bg-white border border-slate-100 rounded-2xl p-4 shadow-sm hover:shadow-lg hover:border-blue-200 transition-all active:scale-[0.98]"
                      >
                        <h3 className="text-base font-black text-slate-900 group-hover:text-blue-600 transition-colors mb-1">{zone.name}</h3>
                        <div className="flex items-center gap-2 mb-2">
                          <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                            <Users className="w-3 h-3" /> {remaining}
                          </span>
                        </div>
                        <div className="h-1 w-full bg-slate-50 rounded-full overflow-hidden">
                          <div className="h-full bg-blue-500 transition-all duration-1000" style={{ width: `${100 - (remaining / zone.capacity * 100)}%` }} />
                        </div>
                      </button>
                    );
                    })}
                  </div>
                )}
              </div>
            )}
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
        
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">STEP 1 OF 3</p>
        <div className="flex items-center justify-between mb-2">
          <h2 className="text-xl font-black text-slate-900">เลือกที่นั่ง</h2>
          <p className="text-xs text-slate-400 font-medium">NEXT: <span className="text-slate-600 font-bold">กรอกชื่อ</span></p>
        </div>
        <div className="flex gap-1.5 h-1.5 w-full mb-6">
          <div className="flex-1 bg-[#E4002B] rounded-full" />
          <div className="flex-1 bg-slate-100 rounded-full" />
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
      <div className="flex-1 overflow-x-auto overflow-y-auto seat-map-container px-6 mb-8 py-2 scroll-smooth max-h-[60vh]">
        <div className="min-w-fit flex flex-col items-center gap-5 pb-4">
          {Object.keys(rows).map((rowName) => {
            const rowSeats = rows[rowName];
            const seatsPerRow = rowSeats.length;
            
            // Determine grid columns based on zone and row
            let numCols = 8; // default
            if (selectedZone && (selectedZone.name === 'ZONE A1' || selectedZone.name === 'ZONE A4')) {
              numCols = 12; // 12 seats per row
            } else if (selectedZone && (selectedZone.name === 'ZONE A2' || selectedZone.name === 'ZONE A3')) {
              // Rows AA-AS: 20 seats, Rows AT-AX: 12 seats
              const rowsWithTwenty = ['AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AP', 'AQ', 'AR', 'AS'];
              numCols = rowsWithTwenty.includes(rowName) ? 20 : 12;
            }
            
            return (
            <div key={rowName} className="flex items-center gap-5">
              <span className="w-4 text-[11px] font-black text-slate-400">{rowName}</span>
              <div className="grid gap-3" style={{ gridTemplateColumns: `repeat(${numCols}, minmax(0, 1fr))` }}>
                {rows[rowName].map(seat => {
                  const isSelected = selectedSeatIds.includes(seat.id);
                  const availability = seatAvailability[seat.id];
                  const isLocked = availability?.status === 'locked';
                  const seatLabel = `${seat.row}${seat.number.toString().padStart(2, '0')}`;
                  
                  // Debug: log ALL locked seats
                  if (isLocked) {
                    console.log(`🔒 LOCKED SEAT: ${seat.row}${seat.number.toString().padStart(2, '0')}`, {
                      seatId: seat.id,
                      status: availability?.status,
                      lockedBy: availability?.lockedBy,
                      isLocked: true
                    });
                  }
                  
                  return (
                    <button
                      key={seat.id}
                      onClick={() => handleSeatClick(seat)}
                      disabled={seat.is_booked || isLocked}
                      className={`
                        relative w-9 h-9 rounded-xl transition-all duration-300 transform flex items-center justify-center
                        text-[8px] font-black tracking-tighter
                        ${seat.is_booked 
                          ? 'bg-slate-50 border border-slate-100 text-slate-200 cursor-not-allowed' 
                          : isLocked
                            ? 'bg-yellow-400 text-yellow-900 cursor-not-allowed border border-yellow-500 opacity-75'
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
            );
          })}
        </div>
      </div>

      {/* Legend */}
      <div className="px-6 mb-8">
        <div className="flex items-center justify-center gap-4 p-4 bg-slate-50/50 rounded-2xl border border-slate-50">
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-slate-900" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">ว่าง</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-[#E4002B]" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">เลือก</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-md bg-yellow-400 border border-yellow-500" />
            <span className="text-[10px] font-bold text-slate-500 uppercase">กำลังจอง</span>
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
