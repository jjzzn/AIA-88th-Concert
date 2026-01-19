
import React, { useState } from 'react';
import { Tier, BookingState } from '../types';
import { getTierFromCode, TIERS, MOCK_SEATS } from '../constants';
import { Ticket, AlertCircle, Plus, X, Search, Phone, Loader2 } from 'lucide-react';
import Confirmation from './Confirmation';

interface Props {
  onSubmit: (codes: string[], tier: Tier) => void;
}

const CodeEntry: React.FC<Props> = ({ onSubmit }) => {
  const [codes, setCodes] = useState<string[]>(['']);
  const [error, setError] = useState<string | null>(null);
  const [isRetrievalModalOpen, setIsRetrievalModalOpen] = useState(false);
  const [retrievalPhone, setRetrievalPhone] = useState('');
  const [isRetrieving, setIsRetrieving] = useState(false);
  const [retrievalError, setRetrievalError] = useState<string | null>(null);
  const [viewingTicket, setViewingTicket] = useState<BookingState | null>(null);

  const handleAddCode = () => {
    if (codes.length < 5) {
      setCodes([...codes, '']);
    }
  };

  const handleRemoveCode = (index: number) => {
    if (codes.length > 1) {
      const newCodes = codes.filter((_, i) => i !== index);
      setCodes(newCodes);
    }
  };

  const handleCodeChange = (index: number, value: string) => {
    const newCodes = [...codes];
    newCodes[index] = value.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 8);
    setCodes(newCodes);
  };

  const validate = () => {
    setError(null);
    const nonEmptyCodes = codes.filter(c => c !== '');
    const validCodes = codes.filter(c => c.length === 8);
    
    if (nonEmptyCodes.length === 0) {
      setError('กรุณากรอกรหัส 8 หลักอย่างน้อย 1 รหัส');
      return;
    }

    if (validCodes.length !== nonEmptyCodes.length) {
      setError('รหัสต้องมีความยาวครบ 8 หลัก');
      return;
    }

    const uniqueCodes = new Set(validCodes);
    if (uniqueCodes.size !== validCodes.length) {
      setError('รหัสสิทธิ์ต้องห้ามซ้ำกัน');
      return;
    }

    const firstTier = getTierFromCode(validCodes[0]);
    if (!firstTier) {
      setError(`รหัส ${validCodes[0]} ไม่ถูกต้องหรือไม่พบข้อมูลโซน`);
      return;
    }

    for (let i = 1; i < validCodes.length; i++) {
      const tier = getTierFromCode(validCodes[i]);
      if (!tier) {
        setError(`รหัส ${validCodes[i]} ไม่ถูกต้อง`);
        return;
      }
      if (tier.id !== firstTier.id) {
        setError('รหัสต้องอยู่ใน Tier เดียวกันเพื่อจองพร้อมกัน');
        return;
      }
    }

    onSubmit(validCodes, firstTier);
  };

  const handleRetrievalSubmit = () => {
    setRetrievalError(null);
    if (retrievalPhone.length !== 10) {
      setRetrievalError('กรุณากรอกเบอร์โทรศัพท์ 10 หลัก');
      return;
    }

    setIsRetrieving(true);
    // Simulate API call
    setTimeout(() => {
      setIsRetrieving(false);
      // Mock ticket data
      const mockFoundState: BookingState = {
        codes: ['RETRIEVED'],
        selectedTier: TIERS[0],
        selectedSeats: [MOCK_SEATS[0]],
        attendees: [{ firstName: 'JOHN', lastName: 'DOE', seatId: MOCK_SEATS[0].id }],
        contact: { email: 'john@example.com', phone: retrievalPhone }
      };
      setViewingTicket(mockFoundState);
    }, 1500);
  };

  const closeRetrievalModal = () => {
    setViewingTicket(null);
    setRetrievalError(null);
    setRetrievalPhone('');
    setIsRetrievalModalOpen(false);
  };

  return (
    <div className="px-4 py-6 space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
      <div className="text-center">
        <div className="w-16 h-16 bg-[#E4002B]/10 rounded-full flex items-center justify-center mx-auto mb-4 border border-[#E4002B]/20">
          <Ticket className="w-8 h-8 text-[#E4002B]" />
        </div>
        <h2 className="text-2xl font-bold text-slate-900 mb-1">ระบุรหัสบัตร</h2>
        <p className="text-slate-500 text-sm">กรุณาระบุรหัส 8 หลักของคุณ (สูงสุด 5 รหัส)</p>
      </div>

      <div className="space-y-3">
        {codes.map((code, index) => (
          <div key={index} className="relative group">
            <input
              type="text"
              value={code}
              onChange={(e) => handleCodeChange(index, e.target.value)}
              placeholder="XXXXXXXX"
              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-4 text-center text-xl font-mono tracking-widest focus:border-[#E4002B] focus:ring-1 focus:ring-[#E4002B] outline-none transition uppercase text-slate-800"
            />
            {codes.length > 1 && (
              <button 
                onClick={() => handleRemoveCode(index)}
                className="absolute right-3 top-1/2 -translate-y-1/2 p-1 text-slate-400 hover:text-red-500"
              >
                <X className="w-5 h-5" />
              </button>
            )}
          </div>
        ))}

        {codes.length < 5 && (
          <button 
            onClick={handleAddCode}
            className="w-full py-3 border-2 border-dashed border-slate-200 rounded-xl flex items-center justify-center gap-2 text-slate-400 hover:text-[#E4002B] hover:border-[#E4002B] transition font-medium"
          >
            <Plus className="w-5 h-5" />
            <span>เพิ่มรหัสบัตร</span>
          </button>
        )}
      </div>

      {error && (
        <div className="bg-red-50 border border-red-100 text-red-600 rounded-xl p-4 flex items-start gap-3 text-sm">
          <AlertCircle className="w-5 h-5 shrink-0" />
          <p className="font-medium">{error}</p>
        </div>
      )}

      <div className="space-y-3 pt-2">
        <button
          onClick={validate}
          className="w-full py-4 bg-[#E4002B] text-white rounded-xl font-bold text-lg shadow-lg shadow-red-500/20 hover:bg-red-700 active:scale-[0.98] transition"
        >
          ตรวจสอบข้อมูล
        </button>

        <button
          onClick={() => setIsRetrievalModalOpen(true)}
          className="w-full py-4 bg-white border border-[#E4002B] text-[#E4002B] rounded-xl font-bold text-lg hover:bg-red-50 active:scale-[0.98] transition flex items-center justify-center gap-2"
        >
          <Search className="w-5 h-5" />
          <span>View My Ticket</span>
        </button>
      </div>

      {/* Retrieval Modal */}
      {isRetrievalModalOpen && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center px-6 animate-in fade-in duration-300">
          <div 
            className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" 
            onClick={closeRetrievalModal}
          />
          
          <div className="relative bg-white w-full max-w-sm rounded-[40px] overflow-hidden shadow-2xl animate-in zoom-in-95 duration-300">
            <div className="px-8 pt-10 pb-10 text-center">
              {viewingTicket ? (
                <div className="text-left">
                  <div className="flex items-center justify-between mb-6">
                    <h3 className="text-2xl font-black text-slate-900">Your Ticket</h3>
                    <button onClick={closeRetrievalModal} className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition">
                      <X className="w-5 h-5 text-slate-500" />
                    </button>
                  </div>
                  <div className="max-h-[70vh] overflow-y-auto no-scrollbar pb-4">
                    <Confirmation state={viewingTicket} onReset={closeRetrievalModal} isPopup={true} />
                  </div>
                </div>
              ) : (
                <div className="space-y-6">
                  {/* Icon */}
                  <div className="w-20 h-20 bg-slate-50 rounded-full flex items-center justify-center mx-auto border border-slate-100">
                    <Phone className="w-10 h-10 text-slate-400" />
                  </div>
                  
                  {/* Text Header */}
                  <div className="space-y-2">
                    <h3 className="text-2xl font-black text-slate-900">ค้นหาตั๋วของคุณ</h3>
                    <p className="text-sm font-medium text-slate-500">กรุณาระบุเบอร์โทรศัพท์ที่ใช้ในการจอง</p>
                  </div>

                  {/* Form */}
                  <div className="space-y-5 pt-2">
                    <div className="relative">
                      <input
                        type="tel"
                        maxLength={10}
                        value={retrievalPhone}
                        onChange={(e) => setRetrievalPhone(e.target.value.replace(/\D/g, ''))}
                        placeholder="0XXXXXXXXX"
                        className="w-full bg-white border-2 border-[#E4002B] rounded-[24px] px-5 py-5 text-center text-2xl font-black tracking-widest focus:ring-4 focus:ring-red-50 outline-none transition text-slate-900 placeholder:text-slate-200"
                        autoFocus
                      />
                    </div>
                    
                    {retrievalError && (
                      <p className="text-xs font-bold text-red-500 animate-pulse">{retrievalError}</p>
                    )}

                    <button
                      onClick={handleRetrievalSubmit}
                      disabled={isRetrieving}
                      className="w-full py-5 bg-[#0F172A] text-white rounded-[24px] font-bold text-lg flex items-center justify-center gap-3 hover:bg-slate-800 active:scale-[0.98] transition shadow-lg shadow-slate-200"
                    >
                      {isRetrieving ? (
                        <Loader2 className="w-6 h-6 animate-spin" />
                      ) : (
                        <>
                          <Search className="w-5 h-5" />
                          <span>ค้นหาข้อมูล</span>
                        </>
                      )}
                    </button>
                    
                    <button
                      onClick={closeRetrievalModal}
                      className="w-full py-2 text-slate-400 font-bold text-sm uppercase tracking-[0.2em] hover:text-slate-600 transition"
                    >
                      ยกเลิก
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default CodeEntry;
