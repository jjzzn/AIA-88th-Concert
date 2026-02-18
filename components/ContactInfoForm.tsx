import React, { useState } from 'react';
import { ContactInfo } from '../types';
import { User, Phone, ArrowLeft, X } from 'lucide-react';

interface Props {
  onSubmit: (contact: ContactInfo) => void;
  onBack: () => void;
}

const ContactInfoForm: React.FC<Props> = ({ onSubmit, onBack }) => {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [phone, setPhone] = useState('');
  const [pdpaAccepted, setPdpaAccepted] = useState(false);
  const [showTermsModal, setShowTermsModal] = useState(false);
  const [showPrivacyModal, setShowPrivacyModal] = useState(false);
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

    if (!pdpaAccepted) {
      newErrors.pdpa = 'กรุณายอมรับเงื่อนไขการใช้งานและนโยบายความเป็นส่วนตัว';
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
          88th Anniversary Concert
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

        {/* PDPA Checkbox */}
        <div className="pt-2">
          <label className="flex items-start gap-3 cursor-pointer group">
            <div className="relative flex items-center justify-center mt-0.5">
              <input
                type="checkbox"
                checked={pdpaAccepted}
                onChange={(e) => setPdpaAccepted(e.target.checked)}
                className="w-5 h-5 rounded border-2 border-[#E4002B] text-[#E4002B] focus:ring-2 focus:ring-[#E4002B]/20 cursor-pointer accent-[#E4002B]"
              />
            </div>
            <span className="text-sm text-slate-600 leading-relaxed">
              ข้าพเจ้ายอมรับ
              <button
                type="button"
                onClick={(e) => {
                  e.preventDefault();
                  setShowTermsModal(true);
                }}
                className="text-[#E4002B] font-bold hover:underline mx-1"
              >
                เงื่อนไขการใช้งาน
              </button>
              และ
              <button
                type="button"
                onClick={(e) => {
                  e.preventDefault();
                  setShowPrivacyModal(true);
                }}
                className="text-[#E4002B] font-bold hover:underline mx-1"
              >
                นโยบายความเป็นส่วนตัว
              </button>
            </span>
          </label>
          {errors.pdpa && (
            <p className="text-xs text-red-500 font-bold mt-2 ml-8">{errors.pdpa}</p>
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

      {/* Terms Modal */}
      {showTermsModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center px-4 animate-in fade-in duration-300">
          <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" onClick={() => setShowTermsModal(false)} />
          <div className="relative bg-white w-full max-w-2xl rounded-3xl shadow-2xl animate-in zoom-in-95 duration-300 max-h-[80vh] flex flex-col">
            <div className="flex items-center justify-between p-6 border-b border-slate-100">
              <h3 className="text-xl font-black text-slate-900">เงื่อนไขการใช้งาน</h3>
              <button
                onClick={() => setShowTermsModal(false)}
                className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition"
              >
                <X className="w-5 h-5 text-slate-500" />
              </button>
            </div>
            <div className="p-6 overflow-y-auto">
              <div className="prose prose-sm max-w-none">
                <h4 className="font-bold text-slate-900 mb-3">1. การยอมรับเงื่อนไข</h4>
                <p className="text-slate-600 mb-4">
                  การใช้งานระบบจองตั๋วคอนเสิร์ต 88th Anniversary Concert ถือว่าท่านได้อ่านและยอมรับเงื่อนไขการใช้งานทั้งหมดแล้ว
                </p>

                <h4 className="font-bold text-slate-900 mb-3">2. การจองและการชำระเงิน</h4>
                <p className="text-slate-600 mb-4">
                  - ตั๋วที่จองจะต้องจองสำเร็จภายในเวลาที่กำหนด<br />
                  - การจองจะสมบูรณ์เมื่อได้รับการยืนยันจากระบบเท่านั้น<br />
                </p>

                <h4 className="font-bold text-slate-900 mb-3">3. การเปลี่ยนแปลงที่นั่ง</h4>
                <p className="text-slate-600 mb-4">
                  - สามารถเปลี่ยนแปลงที่นั่งได้ 1 ครั้งเท่านั้น<br />
                  - การเปลี่ยนแปลงต้องทำก่อนวันงาน 10 วัน<br />
                  - ที่นั่งใหม่ต้องอยู่ในโซนตามรหัสที่แลกมาเท่านั้น
                </p>

                <h4 className="font-bold text-slate-900 mb-3">4. การยกเลิก</h4>
                <p className="text-slate-600 mb-4">
                  - สามารถยกเลิกตั๋วได้ 1 ครั้งเท่านั้น<br />
                  - ต้องยกเลิกก่อนวันงาน 10 วัน<br />
                </p>

                <h4 className="font-bold text-slate-900 mb-3">5. ข้อจำกัดความรับผิด</h4>
                <p className="text-slate-600">
                  ทางงานจะไม่รับผิดชอบต่อความเสียหายใดๆ ที่เกิดจากการใช้งานระบบ หรือการเข้าร่วมงาน ยกเว้นกรณีที่เกิดจากความประมาทเลินเล่ออย่างร้ายแรงของทางงาน
                </p>
              </div>
            </div>
            <div className="p-6 border-t border-slate-100">
              <button
                onClick={() => setShowTermsModal(false)}
                className="w-full py-3 bg-[#E4002B] text-white rounded-xl font-bold hover:bg-red-700 transition"
              >
                ปิด
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Privacy Policy Modal */}
      {showPrivacyModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center px-4 animate-in fade-in duration-300">
          <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" onClick={() => setShowPrivacyModal(false)} />
          <div className="relative bg-white w-full max-w-2xl rounded-3xl shadow-2xl animate-in zoom-in-95 duration-300 max-h-[80vh] flex flex-col">
            <div className="flex items-center justify-between p-6 border-b border-slate-100">
              <h3 className="text-xl font-black text-slate-900">นโยบายความเป็นส่วนตัว</h3>
              <button
                onClick={() => setShowPrivacyModal(false)}
                className="w-10 h-10 bg-slate-100 rounded-full flex items-center justify-center hover:bg-slate-200 transition"
              >
                <X className="w-5 h-5 text-slate-500" />
              </button>
            </div>
            <div className="p-6 overflow-y-auto">
              <div className="prose prose-sm max-w-none">
                <h4 className="font-bold text-slate-900 mb-3">1. การเก็บรวบรวมข้อมูล</h4>
                <p className="text-slate-600 mb-4">
                  เราเก็บรวบรวมข้อมูลส่วนบุคคลของท่าน ได้แก่:<br />
                  - ชื่อ-นามสกุล<br />
                  - เบอร์โทรศัพท์<br />
                  - อีเมล<br />
                </p>

                <h4 className="font-bold text-slate-900 mb-3">2. วัตถุประสงค์การใช้ข้อมูล</h4>
                <p className="text-slate-600 mb-4">
                  - เพื่อดำเนินการจองตั๋วและยืนยันการจอง<br />
                  - เพื่อติดต่อสื่อสารเกี่ยวกับการจองและงาน<br />
                  - เพื่อปรับปรุงคุณภาพการให้บริการ<br />
                  - เพื่อวิเคราะห์และสถิติการใช้งาน
                </p>

                <h4 className="font-bold text-slate-900 mb-3">3. การเปิดเผยข้อมูล</h4>
                <p className="text-slate-600 mb-4">
                  เราจะไม่เปิดเผยข้อมูลส่วนบุคคลของท่านต่อบุคคลที่สาม ยกเว้น:<br />
                  - เมื่อได้รับความยินยอมจากท่าน<br />
                  - เมื่อกฎหมายกำหนดให้ต้องเปิดเผย<br />
                  - เพื่อดำเนินการตามที่ท่านร้องขอ
                </p>

                <h4 className="font-bold text-slate-900 mb-3">4. ความปลอดภัยของข้อมูล</h4>
                <p className="text-slate-600 mb-4">
                  เรามีมาตรการรักษาความปลอดภัยที่เหมาะสมเพื่อป้องกันการสูญหาย การเข้าถึง การใช้ การเปลี่ยนแปลง การแก้ไข หรือการเปิดเผยข้อมูลส่วนบุคคลโดยไม่ได้รับอนุญาต
                </p>

                <h4 className="font-bold text-slate-900 mb-3">5. สิทธิของเจ้าของข้อมูล</h4>
                <p className="text-slate-600 mb-4">
                  ท่านมีสิทธิ์:<br />
                  - เข้าถึงและขอสำเนาข้อมูลส่วนบุคคล<br />
                  - ขอแก้ไขข้อมูลส่วนบุคคลที่ไม่ถูกต้อง<br />
                  - ขอลบหรือระงับการใช้ข้อมูลส่วนบุคคล<br />
                  - คัดค้านการประมวลผลข้อมูลส่วนบุคคล
                </p>

                <h4 className="font-bold text-slate-900 mb-3">6. ติดต่อเรา</h4>
                <p className="text-slate-600">
                  หากท่านมีคำถามเกี่ยวกับนโยบายความเป็นส่วนตัว กรุณาติดต่อ:<br />
                  อีเมล: th.privacy@aia.com<br />
                  โทร: 02-353-8900
                </p>
              </div>
            </div>
            <div className="p-6 border-t border-slate-100">
              <button
                onClick={() => setShowPrivacyModal(false)}
                className="w-full py-3 bg-[#E4002B] text-white rounded-xl font-bold hover:bg-red-700 transition"
              >
                ปิด
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default ContactInfoForm;
