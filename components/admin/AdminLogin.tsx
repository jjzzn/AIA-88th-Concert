import React, { useState } from 'react';
import { Lock, User, LogIn, Loader2 } from 'lucide-react';
import { AdminUser } from '../../types/admin';
import { adminService } from '../../lib/services/adminService';

interface Props {
  onLoginSuccess: (user: AdminUser) => void;
}

const AdminLogin: React.FC<Props> = ({ onLoginSuccess }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      const user = await adminService.login(username, password);
      
      if (user) {
        onLoginSuccess(user);
      } else {
        setError('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
      }
    } catch (err) {
      setError('เกิดข้อผิดพลาดในการเข้าสู่ระบบ');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 flex items-center justify-center p-6">
      <div className="w-full max-w-md">
        {/* Logo/Header */}
        <div className="text-center mb-8">
          <div className="w-20 h-20 bg-[#E4002B] rounded-[24px] flex items-center justify-center mx-auto mb-4 shadow-2xl">
            <Lock className="w-10 h-10 text-white" />
          </div>
          <h1 className="text-3xl font-black text-white mb-2">AIA LIVE IN CONCERT</h1>
          <p className="text-slate-400 font-medium">Staff Dashboard</p>
        </div>

        {/* Login Form */}
        <div className="bg-white rounded-[32px] p-8 shadow-2xl">
          <h2 className="text-2xl font-black text-slate-900 mb-6">เข้าสู่ระบบ</h2>
          
          <form onSubmit={handleSubmit} className="space-y-5">
            {/* Username */}
            <div>
              <label className="block text-sm font-bold text-slate-700 mb-2">
                ชื่อผู้ใช้
              </label>
              <div className="relative">
                <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  className="w-full pl-12 pr-4 py-4 bg-slate-50 border-2 border-slate-100 rounded-[20px] text-slate-900 font-medium focus:border-[#E4002B] focus:bg-white outline-none transition"
                  placeholder="กรอกชื่อผู้ใช้"
                  required
                  autoFocus
                />
              </div>
            </div>

            {/* Password */}
            <div>
              <label className="block text-sm font-bold text-slate-700 mb-2">
                รหัสผ่าน
              </label>
              <div className="relative">
                <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="w-full pl-12 pr-4 py-4 bg-slate-50 border-2 border-slate-100 rounded-[20px] text-slate-900 font-medium focus:border-[#E4002B] focus:bg-white outline-none transition"
                  placeholder="กรอกรหัสผ่าน"
                  required
                />
              </div>
            </div>

            {/* Error Message */}
            {error && (
              <div className="bg-red-50 border-2 border-red-100 rounded-[16px] p-4">
                <p className="text-sm font-bold text-red-600">{error}</p>
              </div>
            )}

            {/* Submit Button */}
            <button
              type="submit"
              disabled={loading}
              className="w-full py-4 bg-[#E4002B] text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 hover:bg-red-700 active:scale-[0.98] transition shadow-lg disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {loading ? (
                <>
                  <Loader2 className="w-6 h-6 animate-spin" />
                  <span>กำลังเข้าสู่ระบบ...</span>
                </>
              ) : (
                <>
                  <LogIn className="w-6 h-6" />
                  <span>เข้าสู่ระบบ</span>
                </>
              )}
            </button>
          </form>

          {/* Demo Credentials */}
          <div className="mt-6 p-4 bg-slate-50 rounded-[16px]">
            <p className="text-xs font-bold text-slate-500 mb-2">Demo Credentials:</p>
            <p className="text-xs text-slate-600">Username: <span className="font-mono font-bold">staff</span></p>
            <p className="text-xs text-slate-600">Password: <span className="font-mono font-bold">123456</span></p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminLogin;
