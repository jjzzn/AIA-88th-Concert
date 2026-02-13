// Updated SeatSelection component with 3-level zone grouping
// This is a reference implementation - you'll need to integrate this into your existing component

// Add this helper function to group zones by level
const groupZonesByLevel = (zones: Zone[]) => {
  const level1Codes = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'VL', 'VR', 'FF', 'HH'];
  const level2Codes = ['SB', 'SC', 'SD', 'SE', 'SF', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN'];
  // Level 3: LB, LC, LD, LE, LF, LG, LH, LI, LJ, LK, LL, LM, LN, LO, LP, LQ, LR, LS, LT

  return {
    level1: zones.filter(z => level1Codes.includes(z.code)),
    level2: zones.filter(z => level2Codes.includes(z.code)),
    level3: zones.filter(z => z.code.startsWith('L') && z.code.length === 2)
  };
};

// Updated Zone Selection View with Level Grouping
const ZoneSelectionView = () => {
  const groupedZones = groupZonesByLevel(availableZones);

  return (
    <div className="flex flex-col min-h-full bg-white animate-in fade-in duration-500">
      <div className="px-6 py-4">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">SELECT YOUR ZONE</p>
        <h2 className="text-2xl font-black text-slate-900 mb-6">เลือกโซนที่ต้องการ</h2>
        
        {/* Tier Header */}
        <div 
          className="mb-4 p-5 rounded-[28px] relative overflow-hidden text-white shadow-[0_15px_30px_rgba(0,0,0,0.12)]"
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
        </div>

        {/* Arena Map */}
        <ArenaMap />

        {/* Level 1 - Floor */}
        {groupedZones.level1.length > 0 && (
          <div className="mb-6">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-8 h-8 rounded-full bg-gradient-to-br from-orange-400 to-orange-600 flex items-center justify-center">
                <span className="text-white text-xs font-black">1</span>
              </div>
              <h3 className="text-lg font-black text-slate-900">Level 1 - Floor</h3>
              <span className="text-xs text-slate-400 font-bold">({groupedZones.level1.length} zones)</span>
            </div>
            <div className="grid grid-cols-2 gap-3">
              {groupedZones.level1.map(zone => (
                <ZoneCard key={zone.id} zone={zone} />
              ))}
            </div>
          </div>
        )}

        {/* Level 2 - Middle */}
        {groupedZones.level2.length > 0 && (
          <div className="mb-6">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-8 h-8 rounded-full bg-gradient-to-br from-purple-400 to-purple-600 flex items-center justify-center">
                <span className="text-white text-xs font-black">2</span>
              </div>
              <h3 className="text-lg font-black text-slate-900">Level 2 - Middle</h3>
              <span className="text-xs text-slate-400 font-bold">({groupedZones.level2.length} zones)</span>
            </div>
            <div className="grid grid-cols-2 gap-3">
              {groupedZones.level2.map(zone => (
                <ZoneCard key={zone.id} zone={zone} />
              ))}
            </div>
          </div>
        )}

        {/* Level 3 - Upper */}
        {groupedZones.level3.length > 0 && (
          <div className="mb-6">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-8 h-8 rounded-full bg-gradient-to-br from-blue-400 to-blue-600 flex items-center justify-center">
                <span className="text-white text-xs font-black">3</span>
              </div>
              <h3 className="text-lg font-black text-slate-900">Level 3 - Upper</h3>
              <span className="text-xs text-slate-400 font-bold">({groupedZones.level3.length} zones)</span>
            </div>
            <div className="grid grid-cols-2 gap-3">
              {groupedZones.level3.map(zone => (
                <ZoneCard key={zone.id} zone={zone} />
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

// Zone Card Component
const ZoneCard = ({ zone }: { zone: Zone }) => {
  const bookedInZone = allSeats.filter(s => s.zone_id === zone.id && s.is_booked).length;
  const remaining = zone.capacity - bookedInZone;

  return (
    <button
      onClick={() => setSelectedZone(zone)}
      className="relative overflow-hidden group text-left bg-white border border-slate-100 rounded-2xl p-4 shadow-sm hover:shadow-lg hover:border-red-100 transition-all active:scale-[0.98]"
    >
      <div className="relative z-10">
        <h3 className="text-lg font-black text-slate-900 group-hover:text-[#E4002B] transition-colors mb-1">
          {zone.name}
        </h3>
        <div className="flex items-center gap-2 mb-2">
          <span className="text-xs font-bold text-slate-400 flex items-center gap-1">
            <Users className="w-3 h-3" /> {remaining}
          </span>
          <span className="text-[9px] px-1.5 py-0.5 rounded-full bg-slate-50 text-slate-500 font-bold border border-slate-100">
            {tier.name}
          </span>
        </div>
        
        {/* Progress Bar */}
        <div className="h-1 w-full bg-slate-50 rounded-full overflow-hidden">
          <div 
            className="h-full bg-[#E4002B] transition-all duration-1000"
            style={{ width: `${100 - (remaining / zone.capacity * 100)}%` }}
          />
        </div>
      </div>
    </button>
  );
};
