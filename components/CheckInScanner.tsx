import React, { useState } from 'react';
import { CheckCircle2, XCircle, Scan, Users, UserCheck, Clock } from 'lucide-react';
import { checkinService, CheckInResult } from '../lib/services/checkinService';

const CheckInScanner: React.FC = () => {
  const [qrInput, setQrInput] = useState('');
  const [scanning, setScanning] = useState(false);
  const [result, setResult] = useState<CheckInResult | null>(null);
  const [stats, setStats] = useState({ total: 0, checkedIn: 0, remaining: 0 });

  React.useEffect(() => {
    loadStats();
  }, []);

  const loadStats = async () => {
    const data = await checkinService.getCheckInStats();
    setStats(data);
  };

  const handleScan = async () => {
    if (!qrInput.trim()) return;

    setScanning(true);
    setResult(null);

    try {
      // Parse QR code data
      const qrData = JSON.parse(qrInput);
      const checkInResult = await checkinService.checkIn(qrData.qrToken);
      
      setResult(checkInResult);
      
      if (checkInResult.success) {
        await loadStats();
      }
    } catch (error) {
      setResult({
        success: false,
        message: 'QR Code ไม่ถูกต้อง',
      });
    } finally {
      setScanning(false);
      setQrInput('');
    }
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') {
      handleScan();
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-6">
      <div className="max-w-2xl mx-auto space-y-6">
        {/* Header */}
        <div className="text-center space-y-2">
          <h1 className="text-4xl font-black text-white">Check-In System</h1>
          <p className="text-slate-400 font-medium">AIA Concert 2025</p>
        </div>

        {/* Stats Cards */}
        <div className="grid grid-cols-3 gap-4">
          <div className="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20">
            <div className="flex items-center gap-3 mb-2">
              <Users className="w-5 h-5 text-blue-400" />
              <span className="text-xs font-bold text-slate-300 uppercase">Total</span>
            </div>
            <p className="text-3xl font-black text-white">{stats.total}</p>
          </div>
          
          <div className="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20">
            <div className="flex items-center gap-3 mb-2">
              <UserCheck className="w-5 h-5 text-emerald-400" />
              <span className="text-xs font-bold text-slate-300 uppercase">Checked In</span>
            </div>
            <p className="text-3xl font-black text-emerald-400">{stats.checkedIn}</p>
          </div>
          
          <div className="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20">
            <div className="flex items-center gap-3 mb-2">
              <Clock className="w-5 h-5 text-amber-400" />
              <span className="text-xs font-bold text-slate-300 uppercase">Remaining</span>
            </div>
            <p className="text-3xl font-black text-amber-400">{stats.remaining}</p>
          </div>
        </div>

        {/* Scanner Input */}
        <div className="bg-white rounded-3xl p-8 shadow-2xl space-y-6">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Scan className="w-8 h-8 text-[#E4002B]" />
            <h2 className="text-2xl font-black text-slate-900">Scan QR Code</h2>
          </div>

          <div className="space-y-4">
            <textarea
              value={qrInput}
              onChange={(e) => setQrInput(e.target.value)}
              onKeyPress={handleKeyPress}
              placeholder="Paste QR code data here or use scanner..."
              className="w-full h-32 bg-slate-50 border-2 border-slate-200 rounded-2xl px-4 py-3 text-slate-900 font-mono text-sm focus:ring-4 focus:ring-red-100 focus:border-[#E4002B] outline-none transition resize-none"
              autoFocus
            />

            <button
              onClick={handleScan}
              disabled={scanning || !qrInput.trim()}
              className="w-full py-4 bg-[#E4002B] text-white rounded-2xl font-bold text-lg hover:bg-red-600 active:scale-[0.98] transition disabled:opacity-50 disabled:cursor-not-allowed shadow-lg"
            >
              {scanning ? 'กำลังตรวจสอบ...' : 'Check In'}
            </button>
          </div>
        </div>

        {/* Result Display */}
        {result && (
          <div className={`rounded-3xl p-8 shadow-2xl animate-in zoom-in-95 duration-300 ${
            result.success ? 'bg-emerald-50 border-2 border-emerald-200' : 'bg-red-50 border-2 border-red-200'
          }`}>
            <div className="flex items-start gap-4">
              {result.success ? (
                <CheckCircle2 className="w-12 h-12 text-emerald-500 flex-shrink-0" />
              ) : (
                <XCircle className="w-12 h-12 text-red-500 flex-shrink-0" />
              )}
              
              <div className="flex-1 space-y-3">
                <h3 className={`text-2xl font-black ${result.success ? 'text-emerald-900' : 'text-red-900'}`}>
                  {result.message}
                </h3>
                
                {result.data && (
                  <div className="space-y-2">
                    <div className="flex items-center gap-2">
                      <span className="text-sm font-bold text-slate-500">ชื่อ:</span>
                      <span className="text-lg font-black text-slate-900">{result.data.attendeeName}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="text-sm font-bold text-slate-500">ที่นั่ง:</span>
                      <span className="text-lg font-black text-slate-900">{result.data.seat}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="text-sm font-bold text-slate-500">Tier:</span>
                      <span className="text-lg font-black text-slate-900">{result.data.tier}</span>
                    </div>
                    {result.data.alreadyCheckedIn && result.data.checkedInAt && (
                      <div className="flex items-center gap-2">
                        <span className="text-sm font-bold text-slate-500">Check-in เมื่อ:</span>
                        <span className="text-sm font-bold text-slate-700">
                          {new Date(result.data.checkedInAt).toLocaleString('th-TH')}
                        </span>
                      </div>
                    )}
                  </div>
                )}
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default CheckInScanner;
