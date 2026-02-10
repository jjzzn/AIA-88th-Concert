
import React, { useRef } from 'react';
import { BookingState, Seat } from '../types';
import { CheckCircle2, Download, Calendar, MapPin, Star } from 'lucide-react';
import QRCode from './QRCode';
import html2canvas from 'html2canvas';

interface Props {
  state: BookingState;
  onReset: () => void;
  isPopup?: boolean;
}

const Confirmation: React.FC<Props> = ({ state, onReset, isPopup = false }) => {
  const tierName = state.selectedTier?.name || 'STANDARD';
  const tierColor = state.selectedTier?.color || '#E4002B';
  const isSingleTicket = state.attendees.length === 1;
  const ticketRefs = useRef<(HTMLDivElement | null)[]>([]);

  const handleDownloadImage = async (index: number) => {
    const ticketElement = ticketRefs.current[index];
    if (!ticketElement) return;

    try {
      // Wait for all images (including QR code) to load
      const images = ticketElement.querySelectorAll('img');
      await Promise.all(
        Array.from(images).map((img: HTMLImageElement) => {
          if (img.complete) return Promise.resolve();
          return new Promise((resolve, reject) => {
            img.onload = resolve;
            img.onerror = reject;
          });
        })
      );

      // Small delay to ensure rendering is complete
      await new Promise(resolve => setTimeout(resolve, 100));

      const canvas = await html2canvas(ticketElement, {
        scale: 2,
        backgroundColor: '#ffffff',
        logging: false,
        useCORS: true,
        allowTaint: true,
        foreignObjectRendering: false,
      });

      const link = document.createElement('a');
      const attendee = state.attendees[index];
      const seat = state.selectedSeats.find(s => s.id === attendee.seatId);
      const fileName = `AIA-Concert-Ticket-${attendee.firstName}-${seat?.row}${seat?.number}.png`;
      
      link.download = fileName;
      link.href = canvas.toDataURL('image/png');
      link.click();
    } catch (error) {
      console.error('Error downloading image:', error);
      alert('เกิดข้อผิดพลาดในการบันทึกรูปภาพ');
    }
  };

  return (
    <div className={`space-y-6 pb-10 ${!isPopup ? 'animate-in fade-in zoom-in-95 duration-700' : ''}`}>
      {!isPopup && (
        <>
          {/* Step Indicator */}
          <div className="px-2">
            <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">STEP 3 OF 3</p>
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-xl font-black text-slate-900">คอนเฟิร์มที่นั่ง</h2>
              <p className="text-[10px] font-bold text-emerald-500 uppercase tracking-widest">COMPLETED</p>
            </div>
            <div className="flex gap-1.5 h-1.5 w-full mb-8">
              <div className="flex-1 bg-slate-200 rounded-full" />
              <div className="flex-1 bg-slate-200 rounded-full" />
              <div className="flex-1 bg-emerald-500 rounded-full shadow-sm shadow-emerald-500/20" />
            </div>
          </div>

          {/* Success Status */}
          <div className="text-center space-y-3">
            <div className="w-16 h-16 bg-emerald-50 rounded-full flex items-center justify-center mx-auto border border-emerald-100">
              <CheckCircle2 className="w-8 h-8 text-emerald-500" />
            </div>
            <div className="space-y-1">
              <h2 className="text-2xl font-bold text-slate-900">จองสำเร็จ!</h2>
              <p className="text-slate-500 text-sm">ตั๋วของคุณพร้อมใช้งานแล้ว</p>
            </div>
          </div>
        </>
      )}

      {/* Ticket Container - Centered for single, Carousel for multiple */}
      <div className={`relative ${isSingleTicket ? 'px-2' : '-mx-4'}`}>
        <div className={`flex ${isSingleTicket ? 'justify-center' : 'overflow-x-auto snap-x snap-mandatory no-scrollbar px-4 gap-4 pb-4'}`}>
          {state.attendees.map((attendee, index) => {
            // Find the corresponding seat from selectedSeats
            const seat = state.selectedSeats.find(s => s.id === attendee.seatId);
            const row = seat?.row || 'A';
            const num = seat?.number?.toString().padStart(2, '0') || '01';
            const qrToken = (attendee as any).qrToken || (seat as any)?.qr_token || crypto.randomUUID();
            const isCheckedIn = (attendee as any).isCheckedIn || false;
            const checkedInAt = (attendee as any).checkedInAt;
            
            // Get zone information
            const zoneId = seat?.zone_id || seat?.zoneId || '';
            const zoneName = (seat as any)?.zones?.name || zoneId || 'N/A';

            return (
              <div 
                key={index} 
                className={`flex-shrink-0 ${isSingleTicket ? 'w-full' : 'w-[85%] snap-center'} transition-all`}
              >
                <div 
                  ref={(el) => (ticketRefs.current[index] = el)}
                  className="bg-white rounded-[32px] shadow-[0_20px_60px_rgba(0,0,0,0.12)] border border-slate-50 overflow-hidden h-full flex flex-col"
                >
                  {/* Tier Header Banner */}
                  <div 
                    className="px-6 py-3.5 flex justify-between items-center text-white"
                    style={{ backgroundColor: tierColor }}
                  >
                    <div className="flex items-center gap-2">
                      <Star className="w-4 h-4 fill-white/20" />
                      <span className="text-xs font-black tracking-widest uppercase">{tierName}</span>
                    </div>
                    <span className="text-[10px] font-bold opacity-70 uppercase tracking-tighter">
                      TICKET {index + 1}/{state.attendees.length}
                    </span>
                  </div>

                  <div className="p-7 space-y-6 flex-1">
                    {/* Attendee Name at Top */}
                    <div className="text-center border-b border-slate-50 pb-5">
                      <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2">ATTENDEE NAME</p>
                      <h3 className="text-2xl font-extrabold text-slate-900 uppercase tracking-tight">
                        {attendee.firstName} {attendee.lastName}
                      </h3>
                    </div>

                    {/* Zone, Row, Seat above QR code */}
                    <div className="border-b border-slate-100 pb-5">
                      <div className="grid grid-cols-3 gap-4 text-center">
                        <div>
                          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">ZONE</p>
                          <p className="text-lg font-black text-slate-900">{zoneName}</p>
                        </div>
                        <div>
                          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">ROW</p>
                          <p className="text-lg font-black text-slate-900">{row}</p>
                        </div>
                        <div>
                          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">SEAT</p>
                          <p className="text-lg font-black text-[#E4002B]">{num}</p>
                        </div>
                      </div>
                    </div>

                    {/* QR Code Area - Clean & Centered */}
                    <div className="flex justify-center py-2">
                      <div className={`p-6 bg-[#F8FAFC] rounded-[40px] border border-slate-100 shadow-[inset_0_2px_8px_rgba(0,0,0,0.03)] relative ${isCheckedIn ? 'opacity-60' : ''}`}>
                        {isCheckedIn && (
                          <>
                            {/* Semi-transparent overlay */}
                            <div className="absolute inset-0 bg-white/40 rounded-[40px] z-10" />
                            
                            {/* Red stamp overlay */}
                            <div className="absolute inset-0 flex items-center justify-center z-20">
                              <div className="relative">
                                {/* Red diagonal stamp */}
                                <div className="bg-[#E4002B] text-white px-8 py-3 transform -rotate-12 border-4 border-[#E4002B] shadow-lg">
                                  <p className="text-xl font-black uppercase tracking-wider whitespace-nowrap">
                                    ถูกใช้แล้ว (USED)
                                  </p>
                                </div>
                              </div>
                            </div>
                            
                            {/* Checked-in timestamp */}
                            {checkedInAt && (
                              <div className="absolute bottom-2 left-0 right-0 text-center z-20">
                                <p className="text-[10px] text-slate-600 font-bold bg-white/80 inline-block px-3 py-1 rounded-full">
                                  {new Date(checkedInAt).toLocaleString('th-TH')}
                                </p>
                              </div>
                            )}
                          </>
                        )}
                        <QRCode 
                          value={qrToken}
                          size={160}
                          className="rounded-lg"
                        />
                        <p className="text-[11px] text-center text-slate-600 font-mono mt-3 tracking-wide font-bold">
                          {qrToken}
                        </p>
                      </div>
                    </div>

                    {/* Event Details */}
                    <div className="space-y-4 pt-2">
                      <div className="flex items-center gap-4 text-slate-800">
                        <div className="w-9 h-9 bg-red-50 rounded-xl flex items-center justify-center shrink-0">
                          <Calendar className="w-4 h-4 text-[#E4002B]" />
                        </div>
                        <span className="text-sm font-bold">24 MAY 2025 • 19:00</span>
                      </div>
                      <div className="flex items-center gap-4 text-slate-800">
                        <div className="w-9 h-9 bg-red-50 rounded-xl flex items-center justify-center shrink-0">
                          <MapPin className="w-4 h-4 text-[#E4002B]" />
                        </div>
                        <span className="text-sm font-bold leading-tight">IMPACT ARENA, MUANG THONG THANI</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
        {!isSingleTicket && (
          <div className="flex justify-center gap-1.5 mt-2">
            {state.attendees.map((_, i) => (
              <div key={i} className="w-1.5 h-1.5 rounded-full bg-slate-200" />
            ))}
          </div>
        )}
      </div>

      {/* Action Buttons */}
      <div className="px-2">
        {isSingleTicket ? (
          <button 
            onClick={() => handleDownloadImage(0)}
            className="w-full flex items-center justify-center gap-2 py-4 px-4 bg-[#E4002B] text-white rounded-2xl font-bold text-sm hover:bg-red-700 transition active:scale-95 shadow-lg shadow-red-500/25"
          >
            <Download className="w-4 h-4" />
            บันทึกรูปภาพ
          </button>
        ) : (
          <div className="space-y-3">
            <p className="text-xs font-bold text-slate-500 text-center uppercase tracking-wider">บันทึกตั๋วแต่ละใบ</p>
            <div className="grid grid-cols-2 gap-3">
              {state.attendees.map((attendee, index) => {
                const seat = state.selectedSeats.find(s => s.id === attendee.seatId);
                return (
                  <button
                    key={index}
                    onClick={() => handleDownloadImage(index)}
                    className="flex flex-col items-center gap-2 py-3 px-3 bg-white border border-slate-200 rounded-2xl text-slate-800 font-bold text-xs hover:bg-slate-50 hover:border-[#E4002B] transition active:scale-95 shadow-sm"
                  >
                    <Download className="w-4 h-4 text-[#E4002B]" />
                    <span className="truncate w-full text-center">{seat?.row}{seat?.number}</span>
                  </button>
                );
              })}
            </div>
          </div>
        )}
      </div>

      {/* Return Home Button */}
      {!isPopup && (
        <div className="text-center pt-4">
          <button 
            onClick={onReset}
            className="text-slate-400 text-sm font-bold uppercase tracking-widest hover:text-[#E4002B] transition py-2 active:scale-95"
          >
            กลับสู่หน้าหลัก
          </button>
        </div>
      )}
    </div>
  );
};

export default Confirmation;
