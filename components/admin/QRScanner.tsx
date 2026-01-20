import React, { useEffect, useRef, useState } from 'react';
import { X, Camera } from 'lucide-react';
import { Html5Qrcode } from 'html5-qrcode';

interface Props {
  onScan: (qrToken: string) => void;
  onClose: () => void;
}

const QRScanner: React.FC<Props> = ({ onScan, onClose }) => {
  const scannerRef = useRef<Html5Qrcode | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [scanning, setScanning] = useState(false);
  const [scanned, setScanned] = useState(false);

  useEffect(() => {
    startScanner();
    return () => {
      stopScanner();
    };
  }, []);

  const startScanner = async () => {
    try {
      const scanner = new Html5Qrcode('qr-reader');
      scannerRef.current = scanner;

      await scanner.start(
        { facingMode: 'environment' },
        {
          fps: 10,
          qrbox: { width: 250, height: 250 }
        },
        (decodedText) => {
          if (!scanned) {
            setScanned(true);
            onScan(decodedText);
            stopScanner();
          }
        },
        (errorMessage) => {
          // Ignore decode errors (happens when no QR code is in view)
        }
      );
      
      setScanning(true);
    } catch (err) {
      setError('ไม่สามารถเข้าถึงกล้องได้ กรุณาอนุญาตการใช้งานกล้อง');
      console.error('Scanner error:', err);
    }
  };

  const stopScanner = async () => {
    if (scannerRef.current) {
      try {
        await scannerRef.current.stop();
        scannerRef.current.clear();
      } catch (err) {
        console.error('Error stopping scanner:', err);
      }
    }
  };

  const handleManualInput = (token: string) => {
    if (token.trim()) {
      onScan(token.trim());
    }
  };

  return (
    <div className="fixed inset-0 z-50 bg-black/90 backdrop-blur-sm flex items-center justify-center p-6 animate-in fade-in duration-300">
      <style>{`
        #qr-reader__dashboard_section {
          display: none !important;
        }
        #qr-reader__dashboard_section_csr {
          display: none !important;
        }
        #qr-reader video {
          width: 100% !important;
          height: 100% !important;
          object-fit: cover !important;
        }
      `}</style>
      
      <div className="relative w-full max-w-lg">
        {/* Close Button */}
        <button
          onClick={onClose}
          className="absolute -top-12 right-0 w-10 h-10 bg-white/10 hover:bg-white/20 rounded-full flex items-center justify-center transition"
        >
          <X className="w-6 h-6 text-white" />
        </button>

        <div className="bg-slate-900 rounded-[32px] overflow-hidden shadow-2xl">
          {/* Header */}
          <div className="p-6 border-b border-slate-700">
            <div className="flex items-center gap-3">
              <Camera className="w-6 h-6 text-white" />
              <div>
                <h3 className="text-lg font-black text-white">Scan QR Code</h3>
                <p className="text-sm text-slate-400">วางกล้องให้ตรงกับ QR Code</p>
              </div>
            </div>
          </div>

          {/* Video/Scanner Area */}
          <div className="relative aspect-square bg-slate-950 overflow-hidden">
            {error ? (
              <div className="absolute inset-0 flex items-center justify-center p-6">
                <div className="text-center">
                  <div className="w-16 h-16 bg-red-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
                    <Camera className="w-8 h-8 text-red-400" />
                  </div>
                  <p className="text-white font-bold mb-2">ไม่สามารถเปิดกล้องได้</p>
                  <p className="text-sm text-slate-400">{error}</p>
                </div>
              </div>
            ) : (
              <div className="relative w-full h-full">
                {/* QR Reader Container */}
                <div id="qr-reader" className="w-full h-full" />
                
                {/* Scanning Status */}
                {scanning && !scanned && (
                  <div className="absolute bottom-4 left-0 right-0 text-center z-10">
                    <div className="inline-block px-4 py-2 bg-black/60 backdrop-blur-sm rounded-full">
                      <p className="text-white text-sm font-bold">กำลังสแกน...</p>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>

          {/* Manual Input (for testing) */}
          <div className="p-6 bg-slate-800 border-t border-slate-700">
            <p className="text-xs font-bold text-slate-400 uppercase tracking-wider mb-3 text-center">
              หรือกรอก QR Token ด้วยตนเอง
            </p>
            <input
              type="text"
              placeholder="กรอก QR Token"
              onKeyPress={(e) => {
                if (e.key === 'Enter') {
                  handleManualInput((e.target as HTMLInputElement).value);
                }
              }}
              className="w-full px-4 py-3 bg-slate-900 border-2 border-slate-700 rounded-[16px] text-white font-medium focus:border-[#E4002B] outline-none transition"
            />
            <p className="text-xs text-slate-500 mt-2 text-center">
              กด Enter เพื่อตรวจสอบ
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default QRScanner;
