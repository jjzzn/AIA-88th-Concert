import React, { useState } from 'react';
import { BookingState } from '../types';
import { Search, ArrowLeft, Ticket } from 'lucide-react';
import Confirmation from '../components/Confirmation';
import TicketRetrievalModal from '../components/TicketRetrievalModal';
import { bookingService } from '../lib/services';

const MyTicketsPage: React.FC = () => {
  const [viewingTicket, setViewingTicket] = useState<BookingState | null>(null);
  const [allBookings, setAllBookings] = useState<any[]>([]);
  const [isTicketModalOpen, setIsTicketModalOpen] = useState(false);

  const handleRetrievalSubmitWithPhone = async (phone: string) => {
    try {
      const bookings = await bookingService.getBookingByPhone(phone);
      
      if (!bookings || bookings.length === 0) {
        return;
      }

      setAllBookings(bookings);
    } catch (error) {
      console.error('Error searching:', error);
    }
  };

  // Auto-search if phone parameter is in URL, otherwise show modal
  React.useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    const phoneParam = urlParams.get('phone');
    if (phoneParam) {
      handleRetrievalSubmitWithPhone(phoneParam);
    } else {
      setIsTicketModalOpen(true);
    }
  }, []);

  const resetSearch = () => {
    setViewingTicket(null);
    setAllBookings([]);
    setIsTicketModalOpen(true);
  };

  const getTierName = (tierId: string): string => {
    const tierMap: { [key: string]: string } = {
      '11111111-1111-1111-1111-111111111111': 'PLATINUM',
      '22222222-2222-2222-2222-222222222222': 'GOLD',
      '66666666-6666-6666-6666-666666666666': 'SILVER',
      '77777777-7777-7777-7777-777777777777': 'CLASSIC',
    };
    return tierMap[tierId] || 'STANDARD';
  };

  const getTierLevel = (tierId: string): number => {
    const levelMap: { [key: string]: number } = {
      '11111111-1111-1111-1111-111111111111': 1,
      '22222222-2222-2222-2222-222222222222': 2,
      '66666666-6666-6666-6666-666666666666': 3,
      '77777777-7777-7777-7777-777777777777': 4,
    };
    return levelMap[tierId] || 99;
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
      <div className="max-w-4xl mx-auto px-6 py-8">
        {allBookings.length > 0 && !viewingTicket ? (
          // Bookings List
          <div className="space-y-6 animate-in fade-in zoom-in-95 duration-500">
            <div className="flex items-center justify-between">
              <h1 className="text-3xl font-black text-slate-900">การจองของคุณ</h1>
              <button
                onClick={resetSearch}
                className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition"
              >
                <ArrowLeft className="w-4 h-4" />
                <span className="text-sm font-bold">ค้นหาใหม่</span>
              </button>
            </div>
            <p className="text-sm text-slate-500">พบ {allBookings.length} การจอง</p>
            
            <div className="space-y-6">
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
                
                const sortedTierIds = Object.keys(bookingsByTier).sort((a, b) => {
                  return tierInfo[a].level - tierInfo[b].level;
                });
                
                return sortedTierIds.map((tierId) => (
                  <div key={tierId} className="space-y-3">
                    {bookingsByTier[tierId].map((booking: any) => {
                      // Show ALL seats including cancelled ones
                      const allSeats = booking.booking_seats || [];
                      
                      // Skip this booking if no seats at all
                      if (allSeats.length === 0) return null;
                      
                      const seatCount = allSeats.length;
                      const bookingDate = new Date(booking.created_at).toLocaleDateString('th-TH', {
                        year: 'numeric',
                        month: 'short',
                        day: 'numeric',
                      });
                      
                      return (
                        <button
                          key={booking.id}
                          onClick={() => {
                            const attendees = allSeats.map((bs: any) => ({
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

                            const seats = allSeats.map((bs: any) => ({
                              id: bs.seats.id,
                              row: bs.seats.row,
                              number: bs.seats.number,
                              tier_id: bs.seats.tier_id,
                              zone_id: bs.seats.zone_id,
                              is_booked: true,
                              qr_token: bs.qr_token,
                              zones: bs.seats.zones,
                            }));

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
                          className="w-full text-left bg-white border-2 border-slate-100 rounded-[32px] p-6 hover:border-[#E4002B] hover:shadow-xl transition group"
                        >
                          <div className="flex items-center justify-between mb-3">
                            <span className="text-xs font-bold text-slate-400 uppercase tracking-wider">
                              {bookingDate}
                            </span>
                            <span className="text-xs text-slate-400">{seatCount} ที่นั่ง</span>
                          </div>
                          <div className="flex items-center justify-between">
                            <div>
                              <p className="text-xl font-black text-slate-900 group-hover:text-[#E4002B] transition">
                                88th Concert
                              </p>
                            </div>
                            <div className="w-10 h-10 rounded-full bg-slate-50 group-hover:bg-red-50 flex items-center justify-center transition">
                              <Ticket className="w-5 h-5 text-slate-400 group-hover:text-[#E4002B] transition" />
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
          // Ticket Details
          <div className="space-y-6 animate-in fade-in zoom-in-95 duration-500">
            <div className="flex items-center justify-between">
              <button
                onClick={() => setViewingTicket(null)}
                className="flex items-center gap-2 text-slate-400 hover:text-slate-900 transition"
              >
                <ArrowLeft className="w-4 h-4" />
                <span className="text-sm font-bold">กลับ</span>
              </button>
            </div>
            <Confirmation state={viewingTicket} onReset={resetSearch} isPopup={true} />
          </div>
        ) : null}

        {/* Ticket Retrieval Modal */}
        <TicketRetrievalModal
          isOpen={isTicketModalOpen}
          onClose={() => {
            setIsTicketModalOpen(false);
            // If no bookings, redirect to home
            if (allBookings.length === 0) {
              window.location.href = '/';
            }
          }}
        />
      </div>
    </div>
  );
};

export default MyTicketsPage;
