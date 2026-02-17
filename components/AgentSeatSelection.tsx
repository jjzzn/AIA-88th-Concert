import React, { useState, useMemo, useEffect } from 'react';
import { Tier, Seat, Zone } from '../types';
import { Star, ChevronRight, Info, MapPin, LayoutGrid, Users, ArrowLeft, Loader2, ChevronDown, ChevronUp } from 'lucide-react';
import { useSeats } from '../lib/hooks';
import { seatService, tierService } from '../lib/services';
import { seatLockService, SeatAvailability } from '../lib/services/seatLockService';
import { supabase } from '../lib/supabase';
import Dialog from './Dialog';
import { useDialog } from '../hooks/useDialog';

interface Props {
  onSubmit: (seats: Seat[]) => void;
  onBack: () => void;
  timeRemaining?: number | null;
}

const AgentSeatSelection: React.FC<Props> = ({ onSubmit, onBack, timeRemaining }) => {
  const [selectedZone, setSelectedZone] = useState<Zone | null>(null);
  const [selectedSeatIds, setSelectedSeatIds] = useState<string[]>([]);
  const [allTiers, setAllTiers] = useState<Tier[]>([]);
  const [allZones, setAllZones] = useState<Zone[]>([]);
  const [allSeats, setAllSeats] = useState<Seat[]>([]);
  const [loading, setLoading] = useState(true);
  const [seatAvailability, setSeatAvailability] = useState<Record<string, SeatAvailability>>({});
  const [expandedTiers, setExpandedTiers] = useState<Record<string, boolean>>({});
  const [error, setError] = useState<string | null>(null);
  const { dialogState, closeDialog, showWarning, showError } = useDialog();

  useEffect(() => {
    const loadAllData = async () => {
      try {
        // Load all tiers
        const tiers = await tierService.getAllTiers();
        setAllTiers(tiers);
        
        // Initialize all tiers as expanded
        const expanded: Record<string, boolean> = {};
        tiers.forEach(tier => {
          expanded[tier.id] = true;
        });
        setExpandedTiers(expanded);
        
        // Load zones from all tiers
        const zonesPromises = tiers.map(tier => seatService.getZonesByTier(tier.id));
        const zonesArrays = await Promise.all(zonesPromises);
        const allZonesFlat = zonesArrays.flat();
        
        // Deduplicate zones by zone.id
        const uniqueZonesMap = new Map<string, Zone>();
        allZonesFlat.forEach(zone => {
          uniqueZonesMap.set(zone.id, zone);
        });
        const zones = Array.from(uniqueZonesMap.values());
        setAllZones(zones);

        // Load seats from all zones (now deduplicated)
        const zoneIds = zones.map(z => z.id);
        const seats = await seatService.getSeatsByZones(zoneIds);
        setAllSeats(seats);

        setLoading(false);
      } catch (error) {
        console.error('Failed to load seats:', error);
        setLoading(false);
      }
    };

    loadAllData();
  }, []);

  // Check seat availability with realtime updates
  useEffect(() => {
    const checkAvailabilityStatus = async () => {
      if (allSeats.length === 0) return;
      
      const seatIds = allSeats.map(s => s.id);
      const availability = await seatLockService.checkAvailability(seatIds);
      
      const availabilityMap: Record<string, SeatAvailability> = {};
      availability.forEach(avail => {
        availabilityMap[avail.seatId] = avail;
      });
      
      setSeatAvailability(availabilityMap);
    };

    checkAvailabilityStatus();
    
    // Set up realtime subscription for seats table
    const channel = supabase
      .channel('agent-seat-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'seats',
          filter: selectedZone ? `zone_id=eq.${selectedZone.id}` : undefined
        },
        (payload) => {
          console.log('🔄 Real-time seat change (Agent):', payload);
          checkAvailabilityStatus();
        }
      )
      .subscribe();
    
    const interval = setInterval(checkAvailabilityStatus, 5000);
    
    return () => {
      clearInterval(interval);
      supabase.removeChannel(channel);
    };
  }, [allSeats, selectedZone]);

  const availableSeats = useMemo(() => {
    if (!selectedZone) return [];
    return allSeats.filter(seat => {
      const zoneId = seat.zone_id || seat.zoneId;
      const isBooked = seat.is_booked || seat.isBooked;
      const availability = seatAvailability[seat.id];
      const isAvailable = !isBooked && 
                         availability?.status !== 'locked' && 
                         availability?.status !== 'booked';
      return zoneId === selectedZone.id && isAvailable;
    });
  }, [allSeats, selectedZone, seatAvailability]);

  const handleSeatClick = async (seat: Seat) => {
    if (seat.is_booked) return;
    
    const availability = seatAvailability[seat.id];
    if (availability && availability.status === 'locked') {
      showWarning('ที่นั่งถูกเลือกแล้ว กรุณาเลือกที่นั่งใหม่');
      return;
    }
    
    setError(null);
    
    if (selectedSeatIds.includes(seat.id)) {
      // Unlock seat when deselecting
      await seatLockService.unlockSeats([seat.id]);
      setSelectedSeatIds(selectedSeatIds.filter(id => id !== seat.id));
    } else {
      // Lock seat immediately when selecting
      const lockResult = await seatLockService.lockSeats([seat.id], 5);
      
      if (!lockResult.success) {
        // Seat is already locked or booked
        if (lockResult.alreadyLocked.length > 0) {
          showWarning('ที่นั่งถูกเลือกแล้ว กรุณาเลือกที่นั่งใหม่');
        } else if (lockResult.alreadyBooked.length > 0) {
          showError('ที่นั่งนี้ถูกจองแล้ว');
        }
        return;
      }
      
      setSelectedSeatIds([...selectedSeatIds, seat.id]);
    }
  };

  const handleSubmit = () => {
    if (selectedSeatIds.length === 0) {
      setError('กรุณาเลือกที่นั่งอย่างน้อย 1 ที่');
      return;
    }
    const seats = allSeats.filter(s => selectedSeatIds.includes(s.id));
    onSubmit(seats);
  };

  const zonesByTier = useMemo(() => {
    const grouped: Record<string, Zone[]> = {};
    allZones.forEach(zone => {
      const tierId = zone.tier_id || zone.tierId;
      if (!grouped[tierId]) grouped[tierId] = [];
      grouped[tierId].push(zone);
    });
    return grouped;
  }, [allZones]);

  const zoneSeats = useMemo(() => {
    if (!selectedZone) return [];
    return allSeats.filter(seat => {
      const zoneId = seat.zone_id || seat.zoneId;
      return zoneId === selectedZone.id;
    });
  }, [allSeats, selectedZone]);

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

  const minSeatNumber = useMemo(() => {
    if (zoneSeats.length === 0) return 1;
    return Math.min(...zoneSeats.map(s => s.number));
  }, [zoneSeats]);

  const maxSeatNumber = useMemo(() => {
    if (zoneSeats.length === 0) return 1;
    return Math.max(...zoneSeats.map(s => s.number));
  }, [zoneSeats]);

  const selectedSeatsData = useMemo(() => {
    return zoneSeats.filter(s => selectedSeatIds.includes(s.id)).sort((a, b) => {
      if (a.row !== b.row) return a.row.localeCompare(b.row);
      return a.number - b.number;
    });
  }, [selectedSeatIds, zoneSeats]);

  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <Loader2 className="w-8 h-8 text-[#E4002B] animate-spin" />
      </div>
    );
  }

  return (
    <div className="flex flex-col h-full">

      {/* Zone Selection or Seat Map */}
      {!selectedZone ? (
        <div className="flex-1 overflow-y-auto px-6 py-4 space-y-6">
          <div>
            <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">AGENT BOOKING</p>
            <h2 className="text-2xl font-black text-slate-900 mb-2">เลือกโซนที่ต้องการ</h2>
            <p className="text-sm text-slate-500">เลือกได้จากทุกโซน ทุก Tier</p>
          </div>

          {/* Arena Map */}
          <div className="w-full bg-white rounded-[32px] p-4 border border-slate-100 shadow-sm">
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

          {/* Tiers and Zones */}
          <div className="space-y-4 pb-8">
            {allTiers.map(tier => {
              const zones = zonesByTier[tier.id] || [];
              if (zones.length === 0) return null;
              
              return (
                <div key={tier.id}>
                  <button
                    onClick={() => setExpandedTiers(prev => ({ ...prev, [tier.id]: !prev[tier.id] }))}
                    className="w-full mb-3 p-4 rounded-[20px] relative overflow-hidden text-white shadow-lg transition-all"
                    style={{ 
                      background: `linear-gradient(135deg, ${tier.color} 0%, #1e1b1b 100%)` 
                    }}
                  >
                    <div className="relative z-10 flex items-center justify-between">
                      <div className="text-left">
                        <p className="text-[9px] font-bold uppercase tracking-widest opacity-80">{tier.level}</p>
                        <h3 className="text-xl font-black uppercase">{tier.name}</h3>
                        <p className="text-[10px] opacity-80 mt-1">{zones.length} zones</p>
                      </div>
                      {expandedTiers[tier.id] ? (
                        <ChevronUp className="w-5 h-5" />
                      ) : (
                        <ChevronDown className="w-5 h-5" />
                      )}
                    </div>
                    <div className="absolute top-1/2 -right-4 -translate-y-1/2 text-white/5 pointer-events-none">
                      <Star className="w-32 h-32" strokeWidth={1.2} />
                    </div>
                  </button>
                  
                  {expandedTiers[tier.id] && (
                    <div className="grid grid-cols-2 gap-3">
                      {zones.map(zone => {
                        const bookedInZone = allSeats.filter(s => {
                          const zId = s.zone_id || s.zoneId;
                          const isBooked = s.is_booked || s.isBooked;
                          return zId === zone.id && isBooked;
                        }).length;
                        const remaining = zone.capacity - bookedInZone;
                        
                        return (
                          <button
                            key={`${tier.id}-${zone.id}`}
                            onClick={() => setSelectedZone(zone)}
                            className="relative overflow-hidden group text-left bg-white border border-slate-100 rounded-2xl p-4 shadow-sm hover:shadow-lg transition-all active:scale-[0.98]"
                            style={{ borderColor: expandedTiers[tier.id] ? `${tier.color}20` : undefined }}
                          >
                            <h3 className="text-base font-black text-slate-900 mb-1">{zone.name}</h3>
                            <div className="flex items-center gap-2 mb-2">
                              <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
                                <Users className="w-3 h-3" /> {remaining}
                              </span>
                            </div>
                            <div className="h-1 w-full bg-slate-50 rounded-full overflow-hidden">
                              <div 
                                className="h-full transition-all duration-1000" 
                                style={{ 
                                  width: `${100 - (remaining / zone.capacity * 100)}%`,
                                  backgroundColor: tier.color
                                }} 
                              />
                            </div>
                          </button>
                        );
                      })}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </div>
      ) : (
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
            
            <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">AGENT BOOKING</p>
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
          <div className="flex-1 overflow-x-auto overflow-y-auto seat-map-container mb-8 py-2 scroll-smooth max-h-[60vh]">
            <div className="min-w-fit flex flex-col items-start gap-5 pb-4 pl-2">
              {Object.keys(rows).map((rowName) => {
                const rowSeats = rows[rowName];
                const numCols = maxSeatNumber - minSeatNumber + 1;
                
                return (
                <div key={rowName} className="flex items-center gap-3">
                  <span className="w-6 text-[11px] font-black text-slate-400">{rowName}</span>
                  <div className="grid gap-3" style={{ gridTemplateColumns: `repeat(${numCols}, 48px)` }}>
                    {rows[rowName].map(seat => {
                      const isSelected = selectedSeatIds.includes(seat.id);
                      const availability = seatAvailability[seat.id];
                      const isLocked = availability?.status === 'locked';
                      const seatLabel = `${seat.row}${seat.number.toString().padStart(2, '0')}`;
                      const gridCol = seat.number - minSeatNumber + 1;
                      
                      return (
                        <button
                          key={seat.id}
                          onClick={() => handleSeatClick(seat)}
                          disabled={seat.is_booked || isLocked}
                          style={{ gridColumn: gridCol }}
                          className={`
                            relative w-9 h-9 rounded-xl transition-all duration-300 transform flex items-center justify-center
                            text-[8px] font-black tracking-tighter
                            ${seat.is_booked || isLocked
                              ? 'bg-slate-400 border border-slate-300 text-slate-100 cursor-not-allowed' 
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
                  <span className="w-6 text-[11px] font-black text-slate-400 text-right">{rowName}</span>
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
                <div className="w-3 h-3 rounded-md bg-slate-400" />
                <span className="text-[10px] font-bold text-slate-500 uppercase">เต็ม</span>
              </div>
            </div>
          </div>

          {/* Bottom Summary Bar */}
          <div className="px-4 pb-8 space-y-4">
            {selectedSeatsData.length > 0 ? (
              <div className="bg-white border border-slate-100 rounded-[32px] p-6 shadow-2xl flex items-center justify-between animate-in slide-in-from-bottom-2">
                <div className="flex items-center gap-4">
                  <div className="px-4 py-2 bg-slate-50 border border-slate-200 rounded-xl">
                    <p className="text-[9px] font-bold text-slate-500 uppercase tracking-wider">Zone</p>
                    <p className="text-base font-black text-slate-900">{selectedZone?.code || selectedZone?.name}</p>
                  </div>
                  <div>
                    <p className="text-[10px] font-black text-slate-500 uppercase tracking-widest mb-1">ที่นั่งที่เลือก</p>
                    <h4 className="text-lg font-black text-slate-900">
                      {selectedSeatsData.map(s => `${s.row}${s.number.toString().padStart(2, '0')}`).join(', ')}
                    </h4>
                  </div>
                </div>
                <div className="text-right">
                   <p className="text-base font-black text-slate-900">{selectedSeatsData.length} {selectedSeatsData.length === 1 ? 'Seat' : 'Seats'}</p>
                   <p className="text-[10px] font-medium text-slate-400">{selectedZone?.name}</p>
                </div>
              </div>
            ) : (
              <div className="bg-slate-50 border border-dashed border-slate-200 rounded-[32px] p-6 text-center">
                <p className="text-sm font-bold text-slate-400">เลือกที่นั่งที่ต้องการจอง</p>
              </div>
            )}

            <button
              onClick={handleSubmit}
              disabled={selectedSeatIds.length === 0}
              className={`w-full py-5 rounded-[24px] font-black text-lg flex items-center justify-center gap-2 transition-all active:scale-[0.98] shadow-lg
                ${selectedSeatIds.length > 0
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
      )}

      <Dialog
        isOpen={dialogState.isOpen}
        onClose={closeDialog}
        title={dialogState.title}
        message={dialogState.message}
        type={dialogState.type}
        confirmText={dialogState.confirmText}
        onConfirm={dialogState.onConfirm}
        cancelText={dialogState.cancelText}
      />
    </div>
  );
};

export default AgentSeatSelection;
