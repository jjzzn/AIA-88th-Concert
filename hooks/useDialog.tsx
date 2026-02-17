import { useState, useCallback } from 'react';

interface DialogState {
  isOpen: boolean;
  title?: string;
  message: string;
  type?: 'success' | 'error' | 'info' | 'warning';
  confirmText?: string;
  onConfirm?: () => void;
  cancelText?: string;
}

export const useDialog = () => {
  const [dialogState, setDialogState] = useState<DialogState>({
    isOpen: false,
    message: '',
    type: 'info',
    confirmText: 'ตกลง',
  });

  const showDialog = useCallback((options: Omit<DialogState, 'isOpen'>) => {
    setDialogState({
      isOpen: true,
      confirmText: 'ตกลง',
      ...options,
    });
  }, []);

  const closeDialog = useCallback(() => {
    setDialogState(prev => ({ ...prev, isOpen: false }));
  }, []);

  // Helper functions for common dialog types
  const showError = useCallback((message: string, title?: string) => {
    showDialog({
      type: 'error',
      title: title || 'เกิดข้อผิดพลาด',
      message,
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showWarning = useCallback((message: string, title?: string) => {
    showDialog({
      type: 'warning',
      title: title || 'คำเตือน',
      message,
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showSuccess = useCallback((message: string, title?: string) => {
    showDialog({
      type: 'success',
      title: title || 'สำเร็จ',
      message,
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showInfo = useCallback((message: string, title?: string) => {
    showDialog({
      type: 'info',
      title: title || 'แจ้งเตือน',
      message,
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  return {
    dialogState,
    showDialog,
    closeDialog,
    showError,
    showWarning,
    showSuccess,
    showInfo,
  };
};
