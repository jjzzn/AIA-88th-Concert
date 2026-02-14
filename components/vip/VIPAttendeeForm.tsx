import React, { useState } from 'react';
import { VIPSeat, VIPAttendee } from '../../types/vip';
import { ChevronLeft, User, Mail, Phone, CheckCircle } from 'lucide-react';

interface Props {
  seats: VIPSeat[];
  onBack: () => void;
  onSubmit: (attendees: VIPAttendee[]) => void;
}

const VIPAttendeeForm: React.FC<Props> = ({ seats, onBack, onSubmit }) => {
  const [attendees, setAttendees] = useState<VIPAttendee[]>(
    seats.map(seat => ({
      seatId: seat.id,
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
    }))
  );

  const [errors, setErrors] = useState<Record<number, Record<string, string>>>({});

  const updateAttendee = (index: number, field: keyof VIPAttendee, value: string) => {
    const updated = [...attendees];
    updated[index] = { ...updated[index], [field]: value };
    setAttendees(updated);

    // Clear error for this field
    if (errors[index]?.[field]) {
      const newErrors = { ...errors };
      delete newErrors[index][field];
      setErrors(newErrors);
    }
  };

  const validateForm = (): boolean => {
    const newErrors: Record<number, Record<string, string>> = {};
    let isValid = true;

    attendees.forEach((attendee, index) => {
      const attendeeErrors: Record<string, string> = {};

      if (!attendee.firstName.trim()) {
        attendeeErrors.firstName = 'กรุณากรอกชื่อ';
        isValid = false;
      }

      if (!attendee.lastName.trim()) {
        attendeeErrors.lastName = 'กรุณากรอกนามสกุล';
        isValid = false;
      }

      if (!attendee.email.trim()) {
        attendeeErrors.email = 'กรุณากรอกอีเมล';
        isValid = false;
      } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(attendee.email)) {
        attendeeErrors.email = 'รูปแบบอีเมลไม่ถูกต้อง';
        isValid = false;
      }

      if (!attendee.phone.trim()) {
        attendeeErrors.phone = 'กรุณากรอกเบอร์โทรศัพท์';
        isValid = false;
      } else if (!/^0\d{9}$/.test(attendee.phone)) {
        attendeeErrors.phone = 'เบอร์โทรศัพท์ต้องเป็น 10 หลัก';
        isValid = false;
      }

      if (Object.keys(attendeeErrors).length > 0) {
        newErrors[index] = attendeeErrors;
      }
    });

    setErrors(newErrors);
    return isValid;
  };

  const handleSubmit = () => {
    if (validateForm()) {
      onSubmit(attendees);
    }
  };

  return (
    <div className="space-y-6 pb-10">
      {/* Header */}
      <div className="px-2">
        <p className="text-[10px] font-bold text-[#E4002B] uppercase tracking-wider mb-1">STEP 2 OF 3</p>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-xl font-black text-slate-900">กรอกชื่อ</h2>
          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">NEXT: คอนเฟิร์มที่นั่ง</p>
        </div>
        <div className="flex gap-1.5 h-1.5 w-full mb-8">
          <div className="flex-1 bg-slate-200 rounded-full" />
          <div className="flex-1 bg-[#E4002B] rounded-full shadow-sm shadow-red-500/20" />
          <div className="flex-1 bg-slate-200 rounded-full" />
        </div>
        <button
          onClick={onBack}
          className="flex items-center gap-2 text-slate-400 text-sm font-bold hover:text-[#E4002B] transition mb-6"
        >
          <span>←</span>
          <span>ย้อนกลับ</span>
        </button>
      </div>

      {/* Info Card */}
      <div className="bg-amber-50 border-2 border-amber-200 rounded-2xl p-6 mb-6">
        <p className="text-sm font-bold text-amber-900">
          <CheckCircle className="w-5 h-5 inline mr-2" />
          กรุณากรอกข้อมูลให้ครบถ้วนสำหรับทุกที่นั่ง อีเมลยืนยันจะถูกส่งไปยังอีเมลที่ระบุ
        </p>
      </div>

      {/* Attendee Forms */}
      <div className="space-y-6">
          {attendees.map((attendee, index) => {
            const seat = seats[index];
            return (
              <div key={seat.id} className="bg-white rounded-3xl shadow-lg p-8">
                {/* Seat Info Header */}
                <div className="flex items-center justify-between mb-6 pb-6 border-b-2 border-slate-100">
                  <div className="flex items-center gap-3">
                    <div className="w-12 h-12 bg-gradient-to-br from-amber-500 to-yellow-500 rounded-xl flex items-center justify-center">
                      <User className="w-6 h-6 text-white" />
                    </div>
                    <div>
                      <p className="text-sm font-bold text-slate-500">ที่นั่งที่ {index + 1}</p>
                      <p className="text-xl font-black text-slate-900">
                        แถว {seat.row} ที่นั่ง {seat.number}
                      </p>
                    </div>
                  </div>
                </div>

                {/* Form Fields */}
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  {/* First Name */}
                  <div>
                    <label className="block text-sm font-bold text-slate-700 mb-2">
                      ชื่อ <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      value={attendee.firstName}
                      onChange={(e) => updateAttendee(index, 'firstName', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[index]?.firstName ? 'border-red-500' : 'border-slate-50'} rounded-2xl px-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="กรอกชื่อ"
                    />
                    {errors[index]?.firstName && (
                      <p className="text-xs text-red-500 font-bold mt-1">{errors[index].firstName}</p>
                    )}
                  </div>

                  {/* Last Name */}
                  <div>
                    <label className="block text-sm font-bold text-slate-700 mb-2">
                      นามสกุล <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      value={attendee.lastName}
                      onChange={(e) => updateAttendee(index, 'lastName', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[index]?.lastName ? 'border-red-500' : 'border-slate-50'} rounded-2xl px-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="กรอกนามสกุล"
                    />
                    {errors[index]?.lastName && (
                      <p className="text-xs text-red-500 font-bold mt-1">{errors[index].lastName}</p>
                    )}
                  </div>

                  {/* Email */}
                  <div>
                    <label className="block text-sm font-bold text-slate-700 mb-2">
                      <Mail className="w-4 h-4 inline mr-1" />
                      อีเมล <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="email"
                      value={attendee.email}
                      onChange={(e) => updateAttendee(index, 'email', e.target.value)}
                      className={`w-full bg-slate-50 border-2 ${errors[index]?.email ? 'border-red-500' : 'border-slate-50'} rounded-2xl px-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="example@email.com"
                    />
                    {errors[index]?.email && (
                      <p className="text-xs text-red-500 font-bold mt-1">{errors[index].email}</p>
                    )}
                  </div>

                  {/* Phone */}
                  <div>
                    <label className="block text-sm font-bold text-slate-700 mb-2">
                      <Phone className="w-4 h-4 inline mr-1" />
                      เบอร์โทรศัพท์ <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="tel"
                      maxLength={10}
                      value={attendee.phone}
                      onChange={(e) => updateAttendee(index, 'phone', e.target.value.replace(/\D/g, ''))}
                      className={`w-full bg-slate-50 border-2 ${errors[index]?.phone ? 'border-red-500' : 'border-slate-50'} rounded-2xl px-4 py-4 text-sm font-bold focus:border-[#E4002B] focus:bg-white outline-none transition text-slate-900 placeholder:text-slate-300`}
                      placeholder="0XXXXXXXXX"
                    />
                    {errors[index]?.phone && (
                      <p className="text-xs text-red-500 font-bold mt-1">{errors[index].phone}</p>
                    )}
                  </div>
                </div>
              </div>
            );
          })}
        </div>

      {/* Submit Button */}
      <div className="mt-8 bg-white rounded-2xl shadow-lg p-6">
        <button
          onClick={handleSubmit}
          className="w-full py-5 bg-[#E4002B] text-white rounded-2xl font-bold text-lg hover:bg-red-700 active:scale-95 transition shadow-lg shadow-red-500/25"
        >
          ยืนยันการจอง ({attendees.length} ที่นั่ง)
        </button>
      </div>
    </div>
  );
};

export default VIPAttendeeForm;
