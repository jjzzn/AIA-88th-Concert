
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import AdminPage from './pages/admin';
import SeatSwapPage from './pages/seat-swap';
import VIPBookingPage from './pages/vip-booking';
import MyTicketsPage from './pages/my-tickets';

const rootElement = document.getElementById('root');
if (!rootElement) {
  throw new Error("Could not find root element to mount to");
}

// Simple routing based on pathname
const Router: React.FC = () => {
  const [currentPath, setCurrentPath] = React.useState(window.location.pathname);

  React.useEffect(() => {
    const handleLocationChange = () => {
      setCurrentPath(window.location.pathname);
    };

    window.addEventListener('popstate', handleLocationChange);
    return () => window.removeEventListener('popstate', handleLocationChange);
  }, []);

  // Check if path is /my-tickets
  if (currentPath === '/my-tickets' || currentPath === '/my-tickets/') {
    return <MyTicketsPage />;
  }

  // Check if path is /vip-booking
  if (currentPath === '/vip-booking' || currentPath === '/vip-booking/') {
    return <VIPBookingPage />;
  }

  // Check if path is /check-in
  if (currentPath === '/check-in' || currentPath === '/check-in/') {
    return <AdminPage />;
  }

  // Check if path is /admin/seat-swap
  if (currentPath === '/admin/seat-swap' || currentPath === '/admin/seat-swap/') {
    return <SeatSwapPage />;
  }

  // Default to main app
  return <App />;
};

const root = ReactDOM.createRoot(rootElement);
root.render(
  <React.StrictMode>
    <Router />
  </React.StrictMode>
);
