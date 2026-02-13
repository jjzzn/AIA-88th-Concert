import React, { useState, useEffect, useMemo } from 'react';
import { Loader2, ArrowLeft, CheckCircle2, MapPin, ChevronDown, ChevronUp } from 'lucide-react';
import { SeatInfo } from '../../types/seat-swap';
import { seatSwapService } from '../../lib/services/seatSwapService';

interface Props {
  currentSeatId: string;
  currentSeatInfo: SeatInfo;
  onSeatSelect: (seat: SeatInfo) => void;
  onBack: () => void;
}

const SeatSwapSeatMap: React.FC<Props> = ({ currentSeatId, currentSeatInfo, onSeatSelect, onBack }) => {
  const [loading, setLoading] = useState(true);
  const [allSeats, setAllSeats] = useState<SeatInfo[]>([]);
  const [selectedZone, setSelectedZone] = useState<string | null>(null);
  const [expandedLevels, setExpandedLevels] = useState<{ level1: boolean; level2: boolean; level3: boolean }>({
    level1: true,
    level2: true,
    level3: true
  });

  useEffect(() => {
    loadSeats();
  }, [currentSeatId]);

  const loadSeats = async () => {
    setLoading(true);
    try {
      const result = await seatSwapService.getAvailableSeats(currentSeatId);
      setAllSeats(result.seats);
    } catch (error) {
      console.error('Failed to load seats:', error);
    } finally {
      setLoading(false);
    }
  };

  // Group seats by zone
  const zones = useMemo(() => {
    const zoneMap = new Map<string, { zone_id: string; zone_name: string; tier_name: string; tier_color: string; seats: SeatInfo[] }>();
    
    allSeats.forEach(seat => {
      if (!zoneMap.has(seat.zone_id)) {
        zoneMap.set(seat.zone_id, {
          zone_id: seat.zone_id,
          zone_name: seat.zone_name,
          tier_name: seat.tier_name,
          tier_color: seat.tier_color,
          seats: []
        });
      }
      zoneMap.get(seat.zone_id)!.seats.push(seat);
    });

    return Array.from(zoneMap.values());
  }, [allSeats]);

  // Group zones by level
  const groupedZones = useMemo(() => {
    const level1Codes = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'VL', 'VR', 'FF', 'HH'];
    const level2Codes = ['SB', 'SC', 'SD', 'SE', 'SF', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN'];
    // Level 3 zones are single letters: ZONE B, ZONE C, etc.
    const level3Pattern = /^ZONE [B-T]$/;
    
    const grouped = {
      level1: zones.filter(z => level1Codes.some(code => z.zone_name.includes(code))),
      level2: zones.filter(z => level2Codes.some(code => z.zone_name.includes(code))),
      level3: zones.filter(z => level3Pattern.test(z.zone_name))
    };
    
    return grouped;
  }, [zones]);

  // Group seats by row in selected zone
  const rowSeats = useMemo(() => {
    if (!selectedZone) return {};
    
    const zone = zones.find(z => z.zone_id === selectedZone);
    if (!zone) return {};

    const rows: Record<string, SeatInfo[]> = {};
    zone.seats.forEach(seat => {
      if (!rows[seat.row]) rows[seat.row] = [];
      rows[seat.row].push(seat);
    });

    // Sort seats in each row
    Object.keys(rows).forEach(row => {
      rows[row].sort((a, b) => a.number - b.number);
    });

    return rows;
  }, [selectedZone, zones]);

  const selectedZoneInfo = zones.find(z => z.zone_id === selectedZone);

  // Zone Selection View
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
            <p className="text-slate-600 font-medium">กำลังโหลดโซน...</p>
          </div>
        ) : (
          <>
            {/* Zone List - Grouped by Level */}
            <div className="space-y-6">
              {/* Level 1 */}
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
                    {groupedZones.level1.map(zone => (
                      <button
                        key={zone.zone_id}
                        onClick={() => setSelectedZone(zone.zone_id)}
                        disabled={zone.seats.length === 0}
                        className="text-left bg-white border-2 border-slate-200 hover:border-orange-400 rounded-2xl p-4 transition-all hover:shadow-lg active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <h3 className="text-base font-black text-slate-900 mb-1">{zone.zone_name}</h3>
                        <p className="text-xs text-slate-500">{zone.seats.length} ที่ว่าง</p>
                      </button>
                    ))}
                    </div>
                  )}
                </div>
              )}

              {/* Level 2 */}
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
                    {groupedZones.level2.map(zone => (
                      <button
                        key={zone.zone_id}
                        onClick={() => setSelectedZone(zone.zone_id)}
                        disabled={zone.seats.length === 0}
                        className="text-left bg-white border-2 border-slate-200 hover:border-purple-400 rounded-2xl p-4 transition-all hover:shadow-lg active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <h3 className="text-base font-black text-slate-900 mb-1">{zone.zone_name}</h3>
                        <p className="text-xs text-slate-500">{zone.seats.length} ที่ว่าง</p>
                      </button>
                    ))}
                    </div>
                  )}
                </div>
              )}

              {/* Level 3 */}
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
                    {groupedZones.level3.map(zone => (
                      <button
                        key={zone.zone_id}
                        onClick={() => setSelectedZone(zone.zone_id)}
                        disabled={zone.seats.length === 0}
                        className="text-left bg-white border-2 border-slate-200 hover:border-blue-400 rounded-2xl p-4 transition-all hover:shadow-lg active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
                      >
                        <h3 className="text-base font-black text-slate-900 mb-1">{zone.zone_name}</h3>
                        <p className="text-xs text-slate-500">{zone.seats.length} ที่ว่าง</p>
                      </button>
                    ))}
                    </div>
                  )}
                </div>
              )}
            </div>
          </>
        )}
      </div>
    );
  }

  // Seat Selection View (Grid Layout like user's view)
  return (
    <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
      <button
        onClick={() => setSelectedZone(null)}
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
                {seats.map(seat => (
                  <button
                    key={seat.seat_id}
                    onClick={() => onSeatSelect(seat)}
                    className="aspect-square bg-gradient-to-br from-green-50 to-emerald-50 hover:from-green-100 hover:to-emerald-100 border-2 border-green-200 hover:border-green-400 rounded-[12px] flex flex-col items-center justify-center transition-all hover:scale-105 active:scale-95 group"
                    title={`Row ${seat.row}, Seat ${seat.number}`}
                  >
                    <span className="text-xs font-bold text-green-700 group-hover:text-green-900">
                      {seat.number}
                    </span>
                  </button>
                ))}
              </div>
            </div>
          ))}
      </div>

      {/* Legend */}
      <div className="mt-6 pt-6 border-t border-slate-100">
        <p className="text-xs font-bold text-slate-500 uppercase mb-3">คำอธิบาย</p>
        <div className="flex flex-wrap gap-4">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-gradient-to-br from-green-50 to-emerald-50 border-2 border-green-200 rounded-[8px]" />
            <span className="text-sm font-medium text-slate-700">ที่นั่งว่าง</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SeatSwapSeatMap;
