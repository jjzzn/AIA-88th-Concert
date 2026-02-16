import React from 'react';
import VIPBookingApp from '../components/vip/VIPBookingApp';

const VIPBookingPage: React.FC = () => {
  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      <div className="max-w-7xl mx-auto px-4 py-6">
        <VIPBookingApp />
      </div>
    </div>
  );
};

export default VIPBookingPage;
