import React, { useState, useEffect } from 'react';
import { AdminUser } from '../types/admin';
import { adminService } from '../lib/services/adminService';
import AdminLogin from '../components/admin/AdminLogin';
import SeatSwapPortal from '../components/admin/SeatSwapPortal';

const SeatSwapPage: React.FC = () => {
  const [currentUser, setCurrentUser] = useState<AdminUser | null>(null);

  useEffect(() => {
    // Check if user is already logged in (from localStorage)
    const savedUser = localStorage.getItem('admin_user');
    if (savedUser) {
      try {
        setCurrentUser(JSON.parse(savedUser));
      } catch (e) {
        localStorage.removeItem('admin_user');
      }
    }
  }, []);

  const handleLoginSuccess = (user: AdminUser) => {
    setCurrentUser(user);
    localStorage.setItem('admin_user', JSON.stringify(user));
  };

  const handleLogout = () => {
    setCurrentUser(null);
    localStorage.removeItem('admin_user');
  };

  if (!currentUser) {
    return <AdminLogin onLoginSuccess={handleLoginSuccess} />;
  }

  return <SeatSwapPortal adminUser={currentUser} />;
};

export default SeatSwapPage;
