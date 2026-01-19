import React from 'react';

interface QRCodeProps {
  value: string;
  size?: number;
  className?: string;
}

const QRCode: React.FC<QRCodeProps> = ({ value, size = 200, className = '' }) => {
  // Use QR Code API (https://api.qrserver.com/v1/create-qr-code/)
  const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=${size}x${size}&data=${encodeURIComponent(value)}&color=1E293B&bgcolor=FFFFFF`;

  return (
    <img
      src={qrCodeUrl}
      alt="QR Code"
      className={className}
      style={{ width: size, height: size }}
      loading="lazy"
    />
  );
};

export default QRCode;
