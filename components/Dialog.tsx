import React from 'react';
import { X, AlertCircle, CheckCircle, Info } from 'lucide-react';

interface DialogProps {
  isOpen: boolean;
  onClose: () => void;
  title?: string;
  message: string;
  type?: 'success' | 'error' | 'info' | 'warning';
  confirmText?: string;
  onConfirm?: () => void;
  cancelText?: string;
}

const Dialog: React.FC<DialogProps> = ({
  isOpen,
  onClose,
  title,
  message,
  type = 'info',
  confirmText = 'ตรวจสอบ',
  onConfirm,
  cancelText,
}) => {
  if (!isOpen) return null;

  const handleConfirm = () => {
    if (onConfirm) {
      onConfirm();
    }
    onClose();
  };

  const getIcon = () => {
    switch (type) {
      case 'success':
        return <CheckCircle className="w-12 h-12 text-green-500" />;
      case 'error':
        return <AlertCircle className="w-12 h-12 text-red-500" />;
      case 'warning':
        return <AlertCircle className="w-12 h-12 text-amber-500" />;
      default:
        return <Info className="w-12 h-12 text-blue-500" />;
    }
  };

  const getColors = () => {
    switch (type) {
      case 'success':
        return {
          bg: 'bg-green-50',
          border: 'border-green-200',
          button: 'bg-green-500 hover:bg-green-600',
        };
      case 'error':
        return {
          bg: 'bg-red-50',
          border: 'border-red-200',
          button: 'bg-red-500 hover:bg-red-600',
        };
      case 'warning':
        return {
          bg: 'bg-amber-50',
          border: 'border-amber-200',
          button: 'bg-amber-500 hover:bg-amber-600',
        };
      default:
        return {
          bg: 'bg-blue-50',
          border: 'border-blue-200',
          button: 'bg-blue-500 hover:bg-blue-600',
        };
    }
  };

  const colors = getColors();

  return (
    <div className="fixed inset-0 z-[300] flex items-center justify-center p-4 animate-in fade-in duration-200">
      {/* Backdrop */}
      <div 
        className="absolute inset-0 bg-black/50 backdrop-blur-sm"
        onClick={onClose}
      />
      
      {/* Dialog */}
      <div className="relative bg-white rounded-3xl shadow-2xl max-w-md w-full animate-in zoom-in-95 duration-200">
        {/* Content */}
        <div className="p-8">
          {/* Icon */}
          <div className={`w-20 h-20 rounded-full ${colors.bg} border-2 ${colors.border} flex items-center justify-center mx-auto mb-6`}>
            {getIcon()}
          </div>

          {/* Title */}
          {title && (
            <h3 className="text-xl font-black text-slate-900 text-center mb-3">
              {title}
            </h3>
          )}

          {/* Message */}
          <p className="text-base text-slate-600 text-center leading-relaxed whitespace-pre-line">
            {message}
          </p>

          {/* Actions */}
          <div className="mt-8 flex gap-3">
            {cancelText && (
              <button
                onClick={onClose}
                className="flex-1 px-6 py-3 bg-slate-100 text-slate-700 rounded-xl font-bold hover:bg-slate-200 transition-colors"
              >
                {cancelText}
              </button>
            )}
            <button
              onClick={handleConfirm}
              className={`flex-1 px-6 py-3 ${colors.button} text-white rounded-xl font-bold transition-colors shadow-lg`}
            >
              {confirmText}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dialog;
