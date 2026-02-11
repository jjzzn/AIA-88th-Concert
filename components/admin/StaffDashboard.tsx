import React, { useState, useEffect } from 'react';
import { LogOut, User, BarChart3, Clock, CheckCircle2, Search } from 'lucide-react';
import { AdminUser, CheckInStats, RecentCheckIn } from '../../types/admin';
import { adminService } from '../../lib/services/adminService';
import QRScanner from './QRScanner';
import TicketVerificationModal from './TicketVerificationModal';

interface Props {
  user: AdminUser;
  onLogout: () => void;
}

const StaffDashboard: React.FC<Props> = ({ user, onLogout }) => {
  const [stats, setStats] = useState<CheckInStats | null>(null);
  const [recentCheckIns, setRecentCheckIns] = useState<RecentCheckIn[]>([]);
  const [showScanner, setShowScanner] = useState(false);
  const [manualTicketId, setManualTicketId] = useState('');
  const [verifyingTicket, setVerifyingTicket] = useState<string | null>(null);

  useEffect(() => {
    loadData();
    const interval = setInterval(loadData, 10000); // Refresh every 10 seconds
    return () => clearInterval(interval);
  }, []);

  const loadData = async () => {
    const [statsData, recentData] = await Promise.all([
      adminService.getCheckInStats(),
      adminService.getRecentCheckIns(10)
    ]);
    setStats(statsData);
    setRecentCheckIns(recentData);
  };

  const handleScan = (qrToken: string) => {
    setShowScanner(false);
    setVerifyingTicket(qrToken);
  };

  const handleManualVerify = () => {
    if (manualTicketId.trim()) {
      setVerifyingTicket(manualTicketId.trim());
      setManualTicketId('');
    }
  };

  const handleCheckInComplete = () => {
    setVerifyingTicket(null);
    loadData();
  };

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Header */}
      <div className="bg-white border-b border-slate-100 sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <div className="w-12 h-12 bg-[#E4002B] rounded-[16px] flex items-center justify-center">
                <CheckCircle2 className="w-6 h-6 text-white" />
              </div>
              <div>
                <h1 className="text-xl font-black text-slate-900">88th Year Concert</h1>
                <p className="text-sm font-medium text-slate-500">Staff Dashboard</p>
              </div>
            </div>
            <div className="flex items-center gap-4">
              <div className="text-right">
                <p className="text-sm font-bold text-slate-900">{user.full_name}</p>
                <p className="text-xs text-slate-500">{user.gate?.name || 'All Gates'}</p>
              </div>
              <button
                onClick={onLogout}
                className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition"
              >
                <LogOut className="w-5 h-5 text-slate-600" />
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 py-8 space-y-6">
        {/* Stats Overview */}
        <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-lg font-black text-slate-900">TOTAL CHECKED-IN</h2>
            <span className={`text-sm font-bold px-3 py-1 rounded-full ${
              (stats?.percentage || 0) >= 80 ? 'bg-emerald-50 text-emerald-600' :
              (stats?.percentage || 0) >= 50 ? 'bg-amber-50 text-amber-600' :
              'bg-slate-50 text-slate-600'
            }`}>
              {stats?.percentage || 0}% Complete
            </span>
          </div>
          
          <div className="mb-4">
            <div className="flex items-baseline gap-2 mb-2">
              <span className="text-4xl font-black text-[#E4002B]">{stats?.total_checked_in || 0}</span>
              <span className="text-lg font-bold text-slate-400">/ {stats?.total_capacity || 0}</span>
            </div>
            <div className="w-full h-3 bg-slate-100 rounded-full overflow-hidden">
              <div 
                className="h-full bg-[#E4002B] transition-all duration-500"
                style={{ width: `${stats?.percentage || 0}%` }}
              />
            </div>
          </div>
        </div>

        {/* Verification Method */}
        <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-black text-slate-900">VERIFICATION METHOD</h2>
            <span className="text-xs font-bold text-white bg-red-500 px-3 py-1 rounded-full uppercase tracking-wider">
              Live Scanner
            </span>
          </div>

          {/* QR Scanner Button */}
          <button
            onClick={() => setShowScanner(true)}
            className="w-full aspect-video bg-gradient-to-br from-slate-800 to-slate-900 rounded-[20px] flex items-center justify-center mb-4 hover:scale-[1.02] transition-transform shadow-lg relative overflow-hidden group"
          >
            <div className="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48ZGVmcz48cGF0dGVybiBpZD0iZ3JpZCIgd2lkdGg9IjQwIiBoZWlnaHQ9IjQwIiBwYXR0ZXJuVW5pdHM9InVzZXJTcGFjZU9uVXNlIj48cGF0aCBkPSJNIDQwIDAgTCAwIDAgMCA0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSJyZ2JhKDI1NSwyNTUsMjU1LDAuMDUpIiBzdHJva2Utd2lkdGg9IjEiLz48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JpZCkiLz48L3N2Zz4=')] opacity-50" />
            <div className="relative z-10 text-center">
              <div className="w-24 h-24 border-4 border-white/30 rounded-[20px] flex items-center justify-center mx-auto mb-4 group-hover:border-white/50 transition">
                <div className="w-16 h-16 bg-white/10 rounded-[12px] flex items-center justify-center">
                  <BarChart3 className="w-8 h-8 text-white" />
                </div>
              </div>
              <p className="text-white font-black text-lg">TAP TO SCAN QR CODE</p>
            </div>
          </button>

          {/* Manual Entry */}
          <div>
            <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-3 text-center">
              OR MANUAL ENTRY
            </p>
            <div className="flex gap-2">
              <div className="relative flex-1">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={manualTicketId}
                  onChange={(e) => setManualTicketId(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleManualVerify()}
                  placeholder="Enter Ticket ID"
                  className="w-full pl-12 pr-4 py-3 bg-slate-50 border-2 border-slate-100 rounded-[16px] text-slate-900 font-medium focus:border-[#E4002B] focus:bg-white outline-none transition"
                />
              </div>
              <button
                onClick={handleManualVerify}
                disabled={!manualTicketId.trim()}
                className="px-6 py-3 bg-[#E4002B] text-white rounded-[16px] font-bold hover:bg-red-700 transition disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Verify
              </button>
            </div>
          </div>
        </div>

        {/* Zone Statistics */}
        {stats && stats.by_tier.length > 0 && (
          <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
            <h2 className="text-lg font-black text-slate-900 mb-4">ZONE STATISTICS</h2>
            <div className="grid grid-cols-2 gap-4">
              {stats.by_tier.map((tier) => (
                <div key={tier.tier_name} className="space-y-2">
                  <div className="flex items-center justify-between">
                    <span className="text-sm font-black text-slate-900 uppercase">{tier.tier_name}</span>
                    <span className="text-xs font-bold text-[#E4002B]">{tier.percentage}%</span>
                  </div>
                  <div className="flex items-baseline gap-1">
                    <span className="text-2xl font-black text-slate-900">{tier.checked_in}</span>
                    <span className="text-sm font-bold text-slate-400">/ {tier.total}</span>
                  </div>
                  <div className="w-full h-2 bg-slate-100 rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-[#E4002B] transition-all duration-500"
                      style={{ width: `${tier.percentage}%` }}
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Recent Check-ins */}
        <div className="bg-white rounded-[24px] p-6 shadow-sm border border-slate-100">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-black text-slate-900">RECENT CHECK-INS</h2>
            <button className="text-sm font-bold text-[#E4002B] hover:underline">
              View All
            </button>
          </div>
          <div className="space-y-3">
            {recentCheckIns.length === 0 ? (
              <p className="text-center text-slate-400 py-8">ยังไม่มีการ check-in</p>
            ) : (
              recentCheckIns.map((checkIn) => (
                <div key={checkIn.id} className="flex items-center gap-4 p-4 bg-slate-50 rounded-[16px]">
                  <div className="w-10 h-10 bg-emerald-100 rounded-full flex items-center justify-center flex-shrink-0">
                    <CheckCircle2 className="w-5 h-5 text-emerald-600" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="font-bold text-slate-900 truncate">{checkIn.attendee_name}</p>
                    <p className="text-xs text-slate-500">
                      {checkIn.zone && `${checkIn.zone}, `}
                      {checkIn.row && `${checkIn.row}, `}
                      {checkIn.seat_number && `Seat ${checkIn.seat_number}`}
                    </p>
                  </div>
                  <div className="text-right">
                    <p className="text-xs font-bold text-[#E4002B] uppercase">{checkIn.tier_name}</p>
                    <p className="text-xs text-slate-500">{checkIn.time_ago}</p>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>

      {/* QR Scanner Modal */}
      {showScanner && (
        <QRScanner
          onScan={handleScan}
          onClose={() => setShowScanner(false)}
        />
      )}

      {/* Ticket Verification Modal */}
      {verifyingTicket && (
        <TicketVerificationModal
          qrToken={verifyingTicket}
          adminUser={user}
          onClose={() => setVerifyingTicket(null)}
          onCheckInComplete={handleCheckInComplete}
        />
      )}
    </div>
  );
};

export default StaffDashboard;
