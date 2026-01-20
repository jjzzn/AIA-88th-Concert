import React, { useState, useEffect } from 'react';
import AdminLogin from '../components/admin/AdminLogin';
import StaffDashboard from '../components/admin/StaffDashboard';
import { AdminUser } from '../types/admin';

const AdminPage: React.FC = () => {
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

  return <StaffDashboard user={currentUser} onLogout={handleLogout} />;
};

export default AdminPage;
