import React, { useState, useEffect } from 'react';
import { LogIn, User, Lock, Loader2 } from 'lucide-react';
import { adminAuthService, AdminUser } from '../../lib/services/adminAuthService';

interface Props {
  children: React.ReactNode;
  onAdminChange?: (admin: AdminUser | null) => void;
}

const AdminLoginGuard: React.FC<Props> = ({ children, onAdminChange }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [currentAdmin, setCurrentAdmin] = useState<AdminUser | null>(null);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [isLoggingIn, setIsLoggingIn] = useState(false);

  useEffect(() => {
    checkAuth();
  }, []);

  const checkAuth = async () => {
    setIsLoading(true);
    const admin = await adminAuthService.getCurrentAdmin();
    if (admin) {
      setCurrentAdmin(admin);
      setIsAuthenticated(true);
      onAdminChange?.(admin);
    }
    setIsLoading(false);
  };

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setIsLoggingIn(true);

    const result = await adminAuthService.login({ username, password });

    if (result.success && result.admin_user) {
      setCurrentAdmin(result.admin_user);
      setIsAuthenticated(true);
      onAdminChange?.(result.admin_user);
    } else {
      setError(result.error || 'เข้าสู่ระบบไม่สำเร็จ');
    }

    setIsLoggingIn(false);
  };

  const handleLogout = async () => {
    await adminAuthService.logout();
    setCurrentAdmin(null);
    setIsAuthenticated(false);
    setUsername('');
    setPassword('');
    onAdminChange?.(null);
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="w-12 h-12 text-[#E4002B] animate-spin mx-auto mb-4" />
          <p className="text-slate-600 font-medium">กำลังตรวจสอบสิทธิ์...</p>
        </div>
      </div>
    );
  }

  if (!isAuthenticated) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center p-6">
        <div className="w-full max-w-md">
          {/* Logo */}
          <div className="text-center mb-8">
            <div className="w-20 h-20 bg-[#E4002B] rounded-2xl flex items-center justify-center mx-auto mb-4">
              <span className="text-white text-2xl font-black">88th</span>
            </div>
            <h1 className="text-3xl font-black text-slate-900 mb-2">Admin Login</h1>
            <p className="text-slate-600">ระบบจัดการตั๋วคอนเสิร์ต</p>
          </div>

          {/* Login Form */}
          <div className="bg-white rounded-3xl shadow-xl border-2 border-slate-200 p-8">
            <form onSubmit={handleLogin} className="space-y-6">
              {/* Username */}
              <div>
                <label className="block text-sm font-bold text-slate-700 mb-2">
                  ชื่อผู้ใช้ <span className="text-[#E4002B]">*</span>
                </label>
                <div className="relative">
                  <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                  <input
                    type="text"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    placeholder="กรอกชื่อผู้ใช้"
                    className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl pl-12 pr-4 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
                    required
                  />
                </div>
              </div>

              {/* Password */}
              <div>
                <label className="block text-sm font-bold text-slate-700 mb-2">
                  รหัสผ่าน <span className="text-[#E4002B]">*</span>
                </label>
                <div className="relative">
                  <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                  <input
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="กรอกรหัสผ่าน"
                    className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl pl-12 pr-4 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
                    required
                  />
                </div>
              </div>

              {/* Error Message */}
              {error && (
                <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-4">
                  <p className="text-sm text-red-700 font-medium">{error}</p>
                </div>
              )}

              {/* Login Button */}
              <button
                type="submit"
                disabled={isLoggingIn}
                className="w-full py-4 bg-[#E4002B] hover:bg-red-700 text-white rounded-2xl font-black text-lg flex items-center justify-center gap-3 transition shadow-lg hover:shadow-xl disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {isLoggingIn ? (
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

            {/* Info */}
            <div className="mt-6 pt-6 border-t border-slate-100">
              <p className="text-xs text-slate-500 text-center">
                สำหรับเจ้าหน้าที่ผู้ดูแลระบบเท่านั้น
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Authenticated - show children with admin info header
  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      {/* Admin Info Bar */}
      <div className="bg-white border-b border-slate-200 shadow-sm">
        <div className="max-w-7xl mx-auto px-6 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 bg-[#E4002B] rounded-xl flex items-center justify-center">
                <User className="w-5 h-5 text-white" />
              </div>
              <div>
                <p className="text-sm font-bold text-slate-900">{currentAdmin?.full_name}</p>
                <p className="text-xs text-slate-500">@{currentAdmin?.username} • {currentAdmin?.role}</p>
              </div>
            </div>
            <button
              onClick={handleLogout}
              className="px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl font-bold text-sm transition"
            >
              ออกจากระบบ
            </button>
          </div>
        </div>
      </div>

      {/* Main Content */}
      {children}
    </div>
  );
};

export default AdminLoginGuard;
