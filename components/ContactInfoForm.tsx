import React, { useState } from 'react';
import { ContactInfo } from '../types';
import { User, Phone, ChevronRight } from 'lucide-react';

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
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center p-4">
      <div className="w-full max-w-2xl">
        {/* Header */}
        <div className="text-center mb-8">
          <div className="w-20 h-20 bg-gradient-to-br from-[#E4002B] to-red-600 rounded-full flex items-center justify-center mx-auto mb-6 shadow-lg">
            <User className="w-10 h-10 text-white" />
          </div>
          <h1 className="text-4xl font-black text-slate-900 mb-3">
            ข้อมูลผู้จอง
          </h1>
          <p className="text-slate-600 text-lg">
            กรุณากรอกชื่อและเบอร์โทรศัพท์ของคุณ
          </p>
        </div>

        {/* Form Card */}
        <div className="bg-white rounded-[32px] shadow-xl p-8 md:p-12">
          <div className="space-y-6">
            {/* First Name */}
            <div>
              <label className="block text-sm font-bold text-slate-700 mb-2">
                ชื่อ <span className="text-red-500">*</span>
              </label>
              <div className="relative">
                <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={firstName}
                  onChange={(e) => handleFirstNameChange(e.target.value)}
                  className={`w-full pl-12 pr-4 py-4 bg-slate-50 border-2 ${
                    errors.firstName ? 'border-red-500' : 'border-slate-50'
                  } rounded-2xl text-lg font-medium text-slate-900 focus:border-[#E4002B] focus:bg-white outline-none transition placeholder:text-slate-300`}
                  placeholder="กรอกชื่อ"
                />
              </div>
              {errors.firstName && (
                <p className="text-xs text-red-500 font-bold mt-2">{errors.firstName}</p>
              )}
            </div>

            {/* Last Name */}
            <div>
              <label className="block text-sm font-bold text-slate-700 mb-2">
                นามสกุล <span className="text-red-500">*</span>
              </label>
              <div className="relative">
                <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="text"
                  value={lastName}
                  onChange={(e) => handleLastNameChange(e.target.value)}
                  className={`w-full pl-12 pr-4 py-4 bg-slate-50 border-2 ${
                    errors.lastName ? 'border-red-500' : 'border-slate-50'
                  } rounded-2xl text-lg font-medium text-slate-900 focus:border-[#E4002B] focus:bg-white outline-none transition placeholder:text-slate-300`}
                  placeholder="กรอกนามสกุล"
                />
              </div>
              {errors.lastName && (
                <p className="text-xs text-red-500 font-bold mt-2">{errors.lastName}</p>
              )}
            </div>

            {/* Phone */}
            <div>
              <label className="block text-sm font-bold text-slate-700 mb-2">
                เบอร์โทรศัพท์ <span className="text-red-500">*</span>
              </label>
              <div className="relative">
                <Phone className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400" />
                <input
                  type="tel"
                  value={phone}
                  onChange={(e) => handlePhoneChange(e.target.value)}
                  className={`w-full pl-12 pr-4 py-4 bg-slate-50 border-2 ${
                    errors.phone ? 'border-red-500' : 'border-slate-50'
                  } rounded-2xl text-lg font-medium text-slate-900 focus:border-[#E4002B] focus:bg-white outline-none transition placeholder:text-slate-300`}
                  placeholder="0812345678"
                  maxLength={10}
                />
              </div>
              {errors.phone && (
                <p className="text-xs text-red-500 font-bold mt-2">{errors.phone}</p>
              )}
              <p className="text-xs text-slate-500 mt-2">
                เบอร์โทรศัพท์นี้จะใช้สำหรับติดต่อและค้นหาตั๋ว
              </p>
            </div>
          </div>

          {/* Buttons */}
          <div className="flex gap-4 mt-8">
            <button
              onClick={onBack}
              className="flex-1 py-4 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-[20px] font-black text-lg transition"
            >
              ย้อนกลับ
            </button>
            <button
              onClick={handleSubmit}
              className="flex-1 py-4 bg-gradient-to-r from-[#E4002B] to-red-600 hover:from-red-600 hover:to-[#E4002B] text-white rounded-[20px] font-black text-lg flex items-center justify-center gap-3 shadow-lg transition"
            >
              <span>ถัดไป</span>
              <ChevronRight className="w-6 h-6" />
            </button>
          </div>
        </div>

        {/* Info Box */}
        <div className="mt-6 bg-amber-50 border-2 border-amber-200 rounded-2xl p-4">
          <p className="text-sm text-amber-900 font-medium text-center">
            💡 ข้อมูลนี้จะใช้สำหรับติดต่อและค้นหาตั๋วของคุณ
          </p>
        </div>
      </div>
    </div>
  );
};

export default ContactInfoForm;
