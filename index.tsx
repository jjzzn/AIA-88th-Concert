
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import AdminPage from './pages/admin';

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

  // Check if path is /admin
  if (currentPath === '/admin' || currentPath === '/admin/') {
    return <AdminPage />;
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
