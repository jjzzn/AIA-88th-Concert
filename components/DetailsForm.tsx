
import React, { useState } from 'react';
import { Seat, Attendee, ContactInfo } from '../types';
import { User, Mail, Phone, ArrowRight } from 'lucide-react';

interface Props {
  seats: Seat[];
  onSubmit: (attendees: Attendee[], contact: ContactInfo) => void;
  timeRemaining?: number | null;
  bookerInfo?: ContactInfo;
}

const DetailsForm: React.FC<Props> = ({ seats, onSubmit, timeRemaining, bookerInfo }) => {
  const [attendees, setAttendees] = useState<Attendee[]>(
    seats.map(s => ({ firstName: '', lastName: '', seatId: s.id, email: '', phone: '' }))
  );
  const [contact, setContact] = useState<ContactInfo>(
    bookerInfo || { email: '', phone: '', firstName: '', lastName: '' }
  );
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handlePrefillFromBooker = (index: number) => {
    if (!bookerInfo?.firstName || !bookerInfo?.lastName || !bookerInfo?.phone) return;
    
    const newAttendees = [...attendees];
    newAttendees[index] = {
      ...newAttendees[index],
      firstName: bookerInfo.firstName,
      lastName: bookerInfo.lastName,
      phone: bookerInfo.phone,
      email: bookerInfo.email || ''
    };
    setAttendees(newAttendees);
  };

  const handleAttendeeChange = (index: number, field: 'firstName' | 'lastName' | 'email' | 'phone', value: string) => {
    let filteredValue = value;
    
    if (field === 'firstName' || field === 'lastName') {
      // Allow only Thai characters (ก-ฮ and vowels/tone marks), English letters (A-Z, a-z), and spaces
      filteredValue = value.replace(/[^a-zA-Z\u0E00-\u0E7F\s]/g, '');
    } else if (field === 'phone') {
      filteredValue = value.replace(/\D/g, '').slice(0, 10);
    } else if (field === 'email') {
      // Allow only English characters, numbers, and common email symbols
      filteredValue = value.replace(/[^a-zA-Z0-9@._+\-]/g, '');
    }
    
    const newAttendees = [...attendees];
    newAttendees[index] = { ...newAttendees[index], [field]: filteredValue };
    setAttendees(newAttendees);
  };

  const handleContactChange = (field: keyof ContactInfo, value: string) => {
    let finalValue = value;
    if (field === 'phone') {
      finalValue = value.replace(/\D/g, '').slice(0, 10);
    } else if (field === 'email') {
      // Restriction: Allow only English characters, numbers, and common email symbols
      finalValue = value.replace(/[^a-zA-Z0-9@._+\-]/g, '');
    }
    setContact({ ...contact, [field]: finalValue });
  };

  const validate = () => {
    if (isSubmitting) return; // ป้องกันการกดซ้ำ
    
    const newErrors: Record<string, string> = {};
    
    attendees.forEach((a, i) => {
      if (!a.firstName.trim()) newErrors[`f${i}`] = 'กรุณากรอกชื่อ';
      if (!a.lastName.trim()) newErrors[`l${i}`] = 'กรุณากรอกนามสกุล';
      if (!a.email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(a.email)) {
        newErrors[`e${i}`] = 'กรุณากรอกอีเมลที่ถูกต้อง';
      }
      if (!a.phone || a.phone.length !== 10) {
        newErrors[`p${i}`] = 'กรุณากรอกเบอร์โทรศัพท์ 10 หลัก';
      }
    });

    if (!contact.email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contact.email)) {
      newErrors.email = 'กรุณากรอกอีเมลที่ถูกต้อง';
    }
    if (!contact.phone || contact.phone.length !== 10) {
      newErrors.phone = 'กรุณากรอกเบอร์โทรศัพท์ 10 หลัก';
    }

    setErrors(newErrors);
    if (Object.keys(newErrors).length === 0) {
      setIsSubmitting(true);
      onSubmit(attendees, contact);
    }
  };

  return (
    <div className="space-y-6 animate-in fade-in slide-in-from-right-8 duration-500">
      {/* Step Indicator */}
      <div className="px-2">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">STEP 2 OF 3</p>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-xl font-black text-slate-900">กรอกชื่อ</h2>
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">NEXT: คอนเฟิร์มที่นั่ง</p>
        </div>
        <div className="flex gap-1.5 h-1.5 w-full mb-8">
          <div className="flex-1 bg-slate-200 rounded-full" />
          <div className="flex-1 bg-[#E4002B] rounded-full shadow-sm shadow-red-500/20" />
          <div className="flex-1 bg-slate-100 rounded-full" />
        </div>
      </div>

      <div className="space-y-1">
        <h2 className="text-2xl font-bold text-slate-900">ระบุข้อมูลของคุณ</h2>
        <p className="text-slate-500 text-sm">ข้อมูลนี้จะถูกใช้สำหรับการยืนยันและออกบัตร</p>
      </div>

      <div className="space-y-6">
        {attendees.map((attendee, index) => {
          // Find original seat info to display correctly formatted label (e.g. A01)
          const seatObj = seats[index];
          const formattedSeat = seatObj 
            ? `${seatObj.row}${seatObj.number.toString().padStart(2, '0')}`
            : attendee.seatId.split('-').pop();

          return (
            <div key={attendee.seatId} className="bg-white border border-slate-200 p-6 rounded-[32px] shadow-sm space-y-5">
              <div className="flex items-center justify-between border-b border-slate-50 pb-4">
                <span className="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">บัตรใบที่ {index + 1}</span>
                <div className="flex items-center gap-2">
                  {bookerInfo?.firstName && bookerInfo?.lastName && (
                    <button
                      type="button"
                      onClick={() => handlePrefillFromBooker(index)}
                      className="px-3 py-1 bg-blue-50 hover:bg-blue-100 text-blue-600 rounded-full border border-blue-200 font-bold text-[10px] tracking-tight transition"
                    >
                      ใช้ข้อมูลผู้จอง
                    </button>
                  )}
                  <div className="px-3 py-1 bg-red-50 text-[#E4002B] rounded-full border border-red-100 font-black text-[10px] tracking-tight">
                    SEAT: {formattedSeat}
                  </div>
                </div>
              </div>
              
              <div className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <label className="text-[10px] font-black text-slate-400 uppercase tracking-wider">ชื่อ (ก-ฮ, A-Z)</label>
                    <input
                      type="text"
                      value={attendee.firstName}
                      onChange={(e) => handleAttendeeChange(index, 'firstName', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[`f${index}`] ? 'border-red-500' : 'border-slate-50'} rounded-2xl px-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="สมชาย"
                    />
                  </div>
                  <div className="space-y-2">
                    <label className="text-[10px] font-black text-slate-400 uppercase tracking-wider">นามสกุล (ก-ฮ, A-Z)</label>
                    <input
                      type="text"
                      value={attendee.lastName}
                      onChange={(e) => handleAttendeeChange(index, 'lastName', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[`l${index}`] ? 'border-red-500' : 'border-slate-50'} rounded-2xl px-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="ใจดี"
                    />
                  </div>
                </div>
                
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-400 uppercase tracking-wider">อีเมล</label>
                  <div className="relative">
                    <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                    <input
                      type="email"
                      value={attendee.email || ''}
                      onChange={(e) => handleAttendeeChange(index, 'email', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[`e${index}`] ? 'border-red-500' : 'border-slate-50'} rounded-2xl pl-12 pr-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="example@email.com"
                    />
                  </div>
                  {errors[`e${index}`] && (
                    <p className="text-xs text-red-500 font-bold">{errors[`e${index}`]}</p>
                  )}
                </div>
                
                <div className="space-y-2">
                  <label className="text-[10px] font-black text-slate-400 uppercase tracking-wider">เบอร์โทรศัพท์</label>
                  <div className="relative">
                    <Phone className="absolute left-4 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-300" />
                    <input
                      type="tel"
                      inputMode="numeric"
                      maxLength={10}
                      value={attendee.phone || ''}
                      onChange={(e) => handleAttendeeChange(index, 'phone', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[`p${index}`] ? 'border-red-500' : 'border-slate-50'} rounded-2xl pl-12 pr-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="0812345678"
                    />
                  </div>
                  {errors[`p${index}`] && (
                    <p className="text-xs text-red-500 font-bold">{errors[`p${index}`]}</p>
                  )}
                </div>
              </div>
            </div>
          );
        })}
      </div>

      <div className="space-y-4 pt-4">
        <div className="flex items-center gap-3 mb-2 px-2">
          <div className="w-10 h-10 bg-red-50 rounded-2xl flex items-center justify-center border border-red-100">
            <User className="w-5 h-5 text-[#E4002B]" />
          </div>
          <h3 className="font-black text-slate-800 tracking-tight">ข้อมูลผู้ติดต่อ (สำหรับการรับตั๋ว)</h3>
        </div>

        <div className="space-y-4 px-2">
          <div className="relative">
            <Mail className="absolute left-5 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-300" />
            <input
              type="email"
              value={contact.email}
              onChange={(e) => handleContactChange('email', e.target.value)}
              className={`w-full bg-slate-50 border-2 ${errors.email ? 'border-red-500' : 'border-slate-50'} rounded-[24px] pl-14 pr-6 py-5 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900`}
              placeholder="อีเมล (ภาษาอังกฤษ)"
            />
          </div>
          <div className="relative">
            <Phone className="absolute left-5 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-300" />
            <input
              type="tel"
              inputMode="numeric"
              maxLength={10}
              value={contact.phone}
              onChange={(e) => handleContactChange('phone', e.target.value)}
              className={`w-full bg-slate-50 border-2 ${errors.phone ? 'border-red-500' : 'border-slate-50'} rounded-[24px] pl-14 pr-6 py-5 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900`}
              placeholder="เบอร์โทรศัพท์ (10 หลัก)"
            />
          </div>
        </div>
      </div>

      <div className="px-2 pt-4">
        <button
          onClick={validate}
          disabled={isSubmitting}
          className={`w-full py-5 rounded-[24px] font-black text-lg shadow-xl flex items-center justify-center gap-3 transition ${
            isSubmitting 
              ? 'bg-slate-400 text-slate-200 cursor-not-allowed shadow-slate-400/20' 
              : 'bg-[#E4002B] text-white shadow-red-500/20 hover:bg-red-700 active:scale-[0.98]'
          }`}
        >
          {isSubmitting ? (
            <>
              <svg className="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              <span>กำลังจอง...</span>
            </>
          ) : (
            <>
              <span>ยืนยันและจองทันที</span>
              <ArrowRight className="w-6 h-6" />
            </>
          )}
        </button>
      </div>
    </div>
  );
};

export default DetailsForm;
