import React, { useState } from 'react';
import { ContactInfo } from '../types';
import { User, Phone, ArrowLeft } from 'lucide-react';

interface Props {
  onSubmit: (contact: ContactInfo) => void;
  onBack: () => void;
}

const ContactInfoForm: React.FC<Props> = ({ onSubmit, onBack }) => {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [phone, setPhone] = useState('');
  const [errors, setErrors] = useState<Record<string, string>>({});

  const handleFirstNameChange = (value: string) => {
    // Allow only Thai (ก-ฮ) and English (A-Z, a-z) characters and spaces
    const filtered = value.replace(/[^a-zA-Z\u0E00-\u0E7F\s]/g, '');
    setFirstName(filtered);
  };

  const handleLastNameChange = (value: string) => {
    // Allow only Thai (ก-ฮ) and English (A-Z, a-z) characters and spaces
    const filtered = value.replace(/[^a-zA-Z\u0E00-\u0E7F\s]/g, '');
    setLastName(filtered);
  };

  const handlePhoneChange = (value: string) => {
    // Allow only digits, max 10 characters
    const filtered = value.replace(/\D/g, '').slice(0, 10);
    setPhone(filtered);
  };

  const validate = () => {
    const newErrors: Record<string, string> = {};

    if (!firstName.trim()) {
      newErrors.firstName = 'กรุณากรอกชื่อ';
    }

    if (!lastName.trim()) {
      newErrors.lastName = 'กรุณากรอกนามสกุล';
    }

    if (!phone || phone.length !== 10) {
      newErrors.phone = 'กรุณากรอกเบอร์โทรศัพท์ 10 หลัก';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = () => {
    if (!validate()) return;

    onSubmit({
      firstName,
      lastName,
      phone,
      email: '', // Will be filled later in DetailsForm
    });
  };

  return (
    <div className="px-4 py-8 space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
      {/* AIA Logo and Title */}
      <div className="text-center space-y-6 pt-4">
        <div className="flex justify-center">
          <div className="w-16 h-16 bg-[#E4002B] rounded-lg flex items-center justify-center">
            <span className="text-white text-2xl font-black">88th</span>
          </div>
        </div>
        
        <h1 className="text-3xl font-normal text-[#E4002B] tracking-wide">
          88th Year Concert
        </h1>
      </div>

      {/* User Entry Section */}
      <div className="text-center space-y-4">
        <div className="w-16 h-16 bg-slate-50 rounded-full flex items-center justify-center mx-auto border border-slate-100">
          <User className="w-8 h-8 text-slate-400" />
        </div>
        <h2 className="text-xl font-black text-slate-900">ข้อมูลผู้จอง</h2>
        <p className="text-slate-500 text-sm">กรุณากรอกชื่อและเบอร์โทรศัพท์ของคุณ</p>
      </div>

      <div className="space-y-4">
        {/* First Name */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            ชื่อ
          </label>
          <input
            type="text"
            value={firstName}
            onChange={(e) => handleFirstNameChange(e.target.value)}
            placeholder="กรอกชื่อ"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
          {errors.firstName && (
            <p className="text-xs text-red-500 font-bold mt-2">{errors.firstName}</p>
          )}
        </div>

        {/* Last Name */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            นามสกุล
          </label>
          <input
            type="text"
            value={lastName}
            onChange={(e) => handleLastNameChange(e.target.value)}
            placeholder="กรอกนามสกุล"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
          {errors.lastName && (
            <p className="text-xs text-red-500 font-bold mt-2">{errors.lastName}</p>
          )}
        </div>

        {/* Phone */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            เบอร์โทรศัพท์
          </label>
          <input
            type="tel"
            value={phone}
            onChange={(e) => handlePhoneChange(e.target.value)}
            placeholder="0812345678"
            maxLength={10}
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
          {errors.phone && (
            <p className="text-xs text-red-500 font-bold mt-2">{errors.phone}</p>
          )}
        </div>
      </div>

      <div className="pt-4">
        <button
          onClick={handleSubmit}
          className="w-full py-5 bg-[#E4002B] text-white rounded-2xl font-black text-lg shadow-xl shadow-red-500/25 hover:bg-red-700 active:scale-[0.98] transition"
        >
          ถัดไป
        </button>
      </div>
    </div>
  );
};

export default ContactInfoForm;
