
import React, { useState } from 'react';
import { BookingState } from '../types';
import { Ticket, X, Search, Phone, Loader2, ArrowLeft } from 'lucide-react';
import Confirmation from './Confirmation';
import { bookingService } from '../lib/services';

interface Props {
  isOpen: boolean;
  onClose: () => void;
}

const TicketRetrievalModal: React.FC<Props> = ({ isOpen, onClose }) => {
  const [retrievalPhone, setRetrievalPhone] = useState('');
  const [isRetrieving, setIsRetrieving] = useState(false);
  const [retrievalError, setRetrievalError] = useState<string | null>(null);
  const [viewingTicket, setViewingTicket] = useState<BookingState | null>(null);
  const [allBookings, setAllBookings] = useState<any[]>([]);

  const handleRetrievalSubmit = async () => {
    setRetrievalError(null);
    if (retrievalPhone.length !== 10) {
      setRetrievalError('กรุณากรอกเบอร์โทรศัพท์ 10 หลัก');
      return;
    }

    setIsRetrieving(true);
    
    try {
      console.log('TicketRetrievalModal - Searching for phone:', retrievalPhone);
      const bookings = await bookingService.getBookingByPhone(retrievalPhone);
      console.log('TicketRetrievalModal - Bookings found:', bookings);
      console.log('TicketRetrievalModal - Bookings count:', bookings?.length || 0);
      
      if (!bookings || bookings.length === 0) {
        console.error('TicketRetrievalModal - No bookings found for phone:', retrievalPhone);
        setRetrievalError('ไม่พบข้อมูลการจองด้วยเบอร์นี้');
        setIsRetrieving(false);
        return;
      }

      // Navigate to my-tickets page with phone number
      window.location.href = `/my-tickets?phone=${retrievalPhone}`;
      setIsRetrieving(false);
    } catch (error) {
      console.error('TicketRetrievalModal - Error searching:', error);
      setRetrievalError('เกิดข้อผิดพลาดในการค้นหา');
      setIsRetrieving(false);
    }
  };

  const closeModal = () => {
    setViewingTicket(null);
    setAllBookings([]);
    setRetrievalError(null);
    setRetrievalPhone('');
    onClose();
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center px-6 animate-in fade-in duration-300">
      <div 
        className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" 
        onClick={closeModal}
      />
      
      <div className="relative bg-white w-full max-w-sm rounded-[40px] overflow-hidden shadow-2xl animate-in zoom-in-95 duration-300">
        <div className="px-8 pt-10 pb-10 text-center">
          {allBookings.length > 0 && !viewingTicket ? (
            <div className="text-left">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-2xl font-black text-slate-900">การจองของคุณ</h3>
                <button onClick={closeModal} className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition">
                  <X className="w-5 h-5 text-slate-500" />
                </button>
              </div>
              <p className="text-sm text-slate-500 mb-4">พบ {allBookings.length} การจอง</p>
              <div className="max-h-[60vh] overflow-y-auto space-y-4 no-scrollbar pb-4">
                {(() => {
                  const bookingsByTier: { [key: string]: any[] } = {};
                  const tierInfo: { [key: string]: any } = {};
                  
                  allBookings.forEach((booking: any) => {
                    const tierId = booking.booking_seats?.[0]?.seats?.tier_id;
                    if (!tierId) return;
                    
                    if (!bookingsByTier[tierId]) {
                      bookingsByTier[tierId] = [];
                    }
                    bookingsByTier[tierId].push(booking);
                    
                    if (!tierInfo[tierId]) {
                      const tierData = booking.booking_seats?.[0]?.seats?.tiers;
                      tierInfo[tierId] = {
                        id: tierId,
                        name: tierData?.name || getTierName(tierId),
                        level: getTierLevel(tierId)
                      };
                    }
                  });
                  
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
                  
                  const sortedTierIds = Object.keys(bookingsByTier).sort((a, b) => {
                    return tierInfo[a].level - tierInfo[b].level;
                  });
                  
                  return sortedTierIds.map((tierId) => (
                    <div key={tierId} className="space-y-2">
                      <div className="px-3 py-1.5 bg-slate-50 rounded-lg">
                        <p className="text-xs font-black text-slate-600 uppercase tracking-wider">{tierInfo[tierId].name}</p>
                      </div>
                      
                      {bookingsByTier[tierId].map((booking: any) => {
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
                                bookingSeatId: bs.id,
                                isCheckedIn: bs.checked_in || (bs.check_ins && bs.check_ins.length > 0),
                                checkedInAt: bs.check_ins?.[0]?.checked_in_at,
                                cancelCount: bs.cancel_count || 0,
                                swapCount: bs.swap_count || 0,
                                isCancelled: bs.is_cancelled || false,
                              })) || [];

                              const seats = booking.booking_seats?.map((bs: any) => ({
                                id: bs.seats.id,
                                row: bs.seats.row,
                                number: bs.seats.number,
                                tier_id: bs.seats.tier_id,
                                zone_id: bs.seats.zone_id,
                                is_booked: true,
                                qr_token: bs.qr_token,
                                zones: bs.seats.zones,
                              })) || [];

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
                                userType: null,
                                agentInfo: null,
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
                                <p className="text-lg font-black text-slate-900 group-hover:text-[#E4002B] transition">88th Concert</p>
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
                <button onClick={closeModal} className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition">
                  <X className="w-5 h-5 text-slate-500" />
                </button>
              </div>
              <div className="max-h-[70vh] overflow-y-auto no-scrollbar pb-4">
                <Confirmation state={viewingTicket} onReset={closeModal} isPopup={true} />
              </div>
            </div>
          ) : (
            <div className="space-y-6">
              <div className="w-20 h-20 bg-slate-50 rounded-full flex items-center justify-center mx-auto border border-slate-100">
                <Phone className="w-10 h-10 text-slate-400" />
              </div>
              
              <div className="space-y-2">
                <h3 className="text-2xl font-black text-slate-900">ค้นหาตั๋วของคุณ</h3>
                <p className="text-sm font-medium text-slate-500">กรุณาระบุเบอร์โทรศัพท์ที่ใช้ในการจอง</p>
              </div>

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
                  onClick={closeModal}
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
  );
};

export default TicketRetrievalModal;
