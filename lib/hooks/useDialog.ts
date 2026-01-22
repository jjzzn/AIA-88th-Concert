import { useState, useCallback } from 'react';

interface DialogConfig {
  title?: string;
  message: string;
  type?: 'success' | 'error' | 'info' | 'warning';
  confirmText?: string;
  cancelText?: string;
  onConfirm?: () => void;
}

export const useDialog = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [config, setConfig] = useState<DialogConfig>({
    message: '',
  });

  const showDialog = useCallback((dialogConfig: DialogConfig) => {
    setConfig(dialogConfig);
    setIsOpen(true);
  }, []);

  const closeDialog = useCallback(() => {
    setIsOpen(false);
  }, []);

  const showSuccess = useCallback((message: string, title?: string) => {
    showDialog({
      message,
      title,
      type: 'success',
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showError = useCallback((message: string, title?: string) => {
    showDialog({
      message,
      title: title || 'เกิดข้อผิดพลาด',
      type: 'error',
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showWarning = useCallback((message: string, title?: string) => {
    showDialog({
      message,
      title,
      type: 'warning',
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showInfo = useCallback((message: string, title?: string) => {
    showDialog({
      message,
      title,
      type: 'info',
      confirmText: 'ตกลง',
    });
  }, [showDialog]);

  const showConfirm = useCallback((
    message: string,
    onConfirm: () => void,
    title?: string
  ) => {
    showDialog({
      message,
      title,
      type: 'warning',
      confirmText: 'ยืนยัน',
      cancelText: 'ยกเลิก',
      onConfirm,
    });
  }, [showDialog]);

  return {
    isOpen,
    config,
    closeDialog,
    showDialog,
    showSuccess,
    showError,
    showWarning,
    showInfo,
    showConfirm,
  };
};
