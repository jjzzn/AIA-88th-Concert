
import React, { useState } from 'react';
import { Tier, BookingState } from '../types';
import { Ticket, AlertCircle, Plus, X, Search, Phone, Loader2, ArrowLeft } from 'lucide-react';
import Confirmation from './Confirmation';
import { useCodeValidation } from '../lib/hooks';
import { bookingService } from '../lib/services';

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
  const [allBookings, setAllBookings] = useState<any[]>([]);
  
  const { validateCodes, loading: validating } = useCodeValidation();

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

  const validate = async () => {
    setError(null);
    const nonEmptyCodes = codes.filter(c => c !== '');
    const validCodes = codes.filter(c => c.length === 8);
    
    if (nonEmptyCodes.length === 0) {
      setError('กรุณากรอกรหัสอย่างน้อย 1 รหัส');
      return;
    }

    if (validCodes.length !== nonEmptyCodes.length) {
      setError('รหัสต้องมี 8 หลัก (เช่น PT4K7M2N)');
      return;
    }

    const uniqueCodes = new Set(validCodes);
    if (uniqueCodes.size !== validCodes.length) {
      setError('รหัสสิทธิ์ต้องห้ามซ้ำกัน');
      return;
    }

    const result = await validateCodes(validCodes);
    
    if (!result.isValid) {
      setError(result.error || 'รหัสไม่ถูกต้อง');
      return;
    }

    if (result.tier) {
      onSubmit(validCodes, result.tier);
    }
  };

  const handleRetrievalSubmit = async () => {
    setRetrievalError(null);
    if (retrievalPhone.length !== 10) {
      setRetrievalError('กรุณากรอกเบอร์โทรศัพท์ 10 หลัก');
      return;
    }

    setIsRetrieving(true);
    
    try {
      const bookings = await bookingService.getBookingByPhone(retrievalPhone);
      
      if (!bookings || bookings.length === 0) {
        setRetrievalError('ไม่พบข้อมูลการจองด้วยเบอร์นี้');
        setIsRetrieving(false);
        return;
      }

      // Store all bookings to display (don't show ticket immediately)
      setAllBookings(bookings);
      setIsRetrieving(false);
    } catch (error) {
      setRetrievalError('เกิดข้อผิดพลาดในการค้นหา');
      setIsRetrieving(false);
    }
  };

  const closeRetrievalModal = () => {
    setViewingTicket(null);
    setAllBookings([]);
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
        <p className="text-slate-500 text-sm">กรุณาระบุรหัส 8 หลัก (เช่น PT4K7M2N) สูงสุด 5 รหัส</p>
      </div>

      <div className="space-y-3">
        {codes.map((code, index) => (
          <div key={index} className="relative group">
            <input
              type="text"
              value={code}
              onChange={(e) => handleCodeChange(index, e.target.value)}
              placeholder="XXXXXXXX"
              className="w-full bg-white border-2 border-[#E4002B] rounded-xl px-4 py-4 text-center text-lg font-mono tracking-wide focus:border-[#E4002B] focus:ring-2 focus:ring-[#E4002B]/20 outline-none transition uppercase text-slate-800"
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
          disabled={validating}
          className="w-full py-4 bg-[#E4002B] text-white rounded-xl font-bold text-lg shadow-lg shadow-red-500/20 hover:bg-red-700 active:scale-[0.98] transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
        >
          {validating ? (
            <>
              <Loader2 className="w-5 h-5 animate-spin" />
              <span>กำลังตรวจสอบ...</span>
            </>
          ) : (
            'ตรวจสอบข้อมูล'
          )}
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
              {allBookings.length > 0 && !viewingTicket ? (
                <div className="text-left">
                  <div className="flex items-center justify-between mb-6">
                    <h3 className="text-2xl font-black text-slate-900">การจองของคุณ</h3>
                    <button onClick={closeRetrievalModal} className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition">
                      <X className="w-5 h-5 text-slate-500" />
                    </button>
                  </div>
                  <p className="text-sm text-slate-500 mb-4">พบ {allBookings.length} การจอง</p>
                  <div className="max-h-[60vh] overflow-y-auto space-y-4 no-scrollbar pb-4">
                    {(() => {
                      // Group bookings by tier_id and get tier info
                      const bookingsByTier: { [key: string]: any[] } = {};
                      const tierInfo: { [key: string]: any } = {};
                      
                      allBookings.forEach((booking: any) => {
                        // Get tier_id from first seat
                        const tierId = booking.booking_seats?.[0]?.seats?.tier_id;
                        if (!tierId) return;
                        
                        if (!bookingsByTier[tierId]) {
                          bookingsByTier[tierId] = [];
                        }
                        bookingsByTier[tierId].push(booking);
                        
                        // Store tier info - use hardcoded level for correct sorting
                        if (!tierInfo[tierId]) {
                          const tierData = booking.booking_seats?.[0]?.seats?.tiers;
                          tierInfo[tierId] = {
                            id: tierId,
                            name: tierData?.name || getTierName(tierId),
                            level: getTierLevel(tierId) // Always use hardcoded level for sorting
                          };
                        }
                      });
                      
                      // Helper functions to get tier name and level
                      function getTierName(tierId: string): string {
                        const tierMap: { [key: string]: string } = {
                          '11111111-1111-1111-1111-111111111111': 'PLATINUM',
                          '22222222-2222-2222-2222-222222222222': 'GOLD',
                          '66666666-6666-6666-6666-666666666666': 'SILVER',
                          '77777777-7777-7777-7777-777777777777': 'CLASSIC',
                        };
                        return tierMap[tierId] || 'STANDARD';
                      }
                      
                      function getTierLevel(tierId: string): number {
                        const levelMap: { [key: string]: number } = {
                          '11111111-1111-1111-1111-111111111111': 1,
                          '22222222-2222-2222-2222-222222222222': 2,
                          '66666666-6666-6666-6666-666666666666': 3,
                          '77777777-7777-7777-7777-777777777777': 4,
                        };
                        return levelMap[tierId] || 99;
                      }
                      
                      // Sort tiers by level (lower level = higher tier)
                      const sortedTierIds = Object.keys(bookingsByTier).sort((a, b) => {
                        return tierInfo[a].level - tierInfo[b].level;
                      });
                      
                      return sortedTierIds.map((tierId) => (
                        <div key={tierId} className="space-y-2">
                          {/* Tier Header */}
                          <div className="px-3 py-1.5 bg-slate-50 rounded-lg">
                            <p className="text-xs font-black text-slate-600 uppercase tracking-wider">{tierInfo[tierId].name}</p>
                          </div>
                          
                          {/* Bookings in this tier */}
                          {bookingsByTier[tierId].map((booking: any, index: number) => {
                            const seatCount = booking.booking_seats?.length || 0;
                            const bookingDate = new Date(booking.created_at).toLocaleDateString('th-TH', {
                              year: 'numeric',
                              month: 'short',
                              day: 'numeric',
                            });
                            
                            return (
                              <button
                                key={booking.id}
                                onClick={() => {
                                  const attendees = booking.booking_seats?.map((bs: any) => ({
                                    firstName: bs.first_name,
                                    lastName: bs.last_name,
                                    seatId: bs.seat_id,
                                    qrToken: bs.qr_token,
                                    isCheckedIn: bs.checked_in || (bs.check_ins && bs.check_ins.length > 0),
                                    checkedInAt: bs.check_ins?.[0]?.checked_in_at,
                                  })) || [];

                                  const seats = booking.booking_seats?.map((bs: any) => ({
                                    id: bs.seats.id,
                                    row: bs.seats.row,
                                    number: bs.seats.number,
                                    tier_id: bs.seats.tier_id,
                                    zone_id: bs.seats.zone_id,
                                    is_booked: true,
                                    qr_token: bs.qr_token,
                                  })) || [];

                                  // Extract tier from first seat's tiers
                                  const tierData = booking.booking_seats?.[0]?.seats?.tiers;
                                  const tier = tierData ? {
                                    id: tierData.id,
                                    name: tierData.name,
                                    level: tierData.level,
                                    price: tierData.price,
                                    color: tierData.color,
                                    description: tierData.description,
                                  } : null;

                                  setViewingTicket({
                                    attendees,
                                    selectedSeats: seats,
                                    contact: {
                                      email: booking.email,
                                      phone: booking.phone,
                                    },
                                    selectedTier: tier,
                                    codes: [],
                                  });
                                }}
                                className="w-full text-left bg-white border-2 border-slate-100 rounded-[24px] p-5 hover:border-[#E4002B] hover:shadow-lg transition group"
                              >
                                <div className="flex items-center justify-between mb-2">
                                  <span className="text-xs font-bold text-slate-400 uppercase tracking-wider">{bookingDate}</span>
                                  <span className="text-xs text-slate-400">{seatCount} ที่นั่ง</span>
                                </div>
                                <div className="flex items-center justify-between">
                                  <div>
                                    <p className="text-lg font-black text-slate-900 group-hover:text-[#E4002B] transition">AIA 88th Concert</p>
                                  </div>
                                  <div className="w-8 h-8 rounded-full bg-slate-50 group-hover:bg-red-50 flex items-center justify-center transition">
                                    <Ticket className="w-4 h-4 text-slate-400 group-hover:text-[#E4002B] transition" />
                                  </div>
                                </div>
                              </button>
                            );
                          })}
                        </div>
                      ));
                    })()}
                  </div>
                </div>
              ) : viewingTicket ? (
                <div className="text-left">
                  <div className="flex items-center justify-between mb-6">
                    <button
                      onClick={() => setViewingTicket(null)}
                      className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition"
                    >
                      <ArrowLeft className="w-4 h-4" />
                      <span className="text-sm font-bold">กลับ</span>
                    </button>
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
