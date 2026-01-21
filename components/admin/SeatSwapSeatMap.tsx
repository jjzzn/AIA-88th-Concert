import React, { useState, useEffect, useMemo } from 'react';
import { Loader2, ArrowLeft, CheckCircle2, MapPin } from 'lucide-react';
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
          <div className="space-y-3">
            {zones.map(zone => (
              <button
                key={zone.zone_id}
                onClick={() => setSelectedZone(zone.zone_id)}
                className="w-full text-left bg-white border-2 border-slate-200 hover:border-blue-400 rounded-[20px] p-5 transition-all hover:shadow-lg active:scale-[0.98] group"
              >
                <div className="flex items-center justify-between">
                  <div>
                    <h3 className="text-lg font-black text-slate-900 group-hover:text-blue-600 transition-colors">
                      {zone.zone_name}
                    </h3>
                    <div className="flex items-center gap-3 mt-1">
                      <span className="text-xs font-bold text-slate-500">
                        {zone.seats.length} ที่นั่งว่าง
                      </span>
                      <span 
                        className="text-xs font-bold uppercase px-2 py-0.5 rounded-full"
                        style={{ 
                          backgroundColor: zone.tier_color + '20',
                          color: zone.tier_color 
                        }}
                      >
                        {zone.tier_name}
                      </span>
                    </div>
                  </div>
                  <div className="w-10 h-10 rounded-full bg-slate-100 group-hover:bg-blue-50 flex items-center justify-center transition-colors">
                    <CheckCircle2 className="w-5 h-5 text-slate-400 group-hover:text-blue-600" />
                  </div>
                </div>
              </button>
            ))}
          </div>
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
