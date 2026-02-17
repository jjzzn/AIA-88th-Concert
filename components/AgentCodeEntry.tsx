
import React, { useState } from 'react';
import { AgentInfo } from '../types';
import { AlertCircle, Users, X } from 'lucide-react';

interface Props {
  onSubmit: (agentInfo: AgentInfo) => void;
}

const AgentCodeEntry: React.FC<Props> = ({ onSubmit }) => {
  const [agentCode, setAgentCode] = useState('');
  const [agentFirstName, setAgentFirstName] = useState('');
  const [agentLastName, setAgentLastName] = useState('');
  const [phone, setPhone] = useState('');
  const [pdpaAccepted, setPdpaAccepted] = useState(false);
  const [showTermsModal, setShowTermsModal] = useState(false);
  const [showPrivacyModal, setShowPrivacyModal] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleAgentCodeChange = (value: string) => {
    const filtered = value.replace(/\D/g, '');
    setAgentCode(filtered);
  };

  const handlePhoneChange = (value: string) => {
    const filtered = value.replace(/\D/g, '').slice(0, 10);
    setPhone(filtered);
  };

  const handleSubmit = () => {
    setError(null);

    if (!agentCode.trim()) {
      setError('กรุณากรอกรหัสตัวแทน');
      return;
    }

    if (!agentFirstName.trim()) {
      setError('กรุณากรอกชื่อ');
      return;
    }

    if (!agentLastName.trim()) {
      setError('กรุณากรอกนามสกุล');
      return;
    }

    if (!phone || phone.length !== 10) {
      setError('กรุณากรอกเบอร์โทรศัพท์ 10 หลัก');
      return;
    }

    if (!pdpaAccepted) {
      setError('กรุณายอมรับเงื่อนไขการใช้งานและนโยบายความเป็นส่วนตัว');
      return;
    }

    onSubmit({
      agentCode: agentCode.trim(),
      agentFirstName: agentFirstName.trim(),
      agentLastName: agentLastName.trim(),
    });
  };

  return (
    <div className="px-4 py-8 space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
      {/* AIA Logo and Title */}
      <div className="text-center space-y-6 pt-4">
        {/* AIA Logo */}
        <div className="flex justify-center">
          <div className="w-16 h-16 bg-[#E4002B] rounded-lg flex items-center justify-center">
            <span className="text-white text-2xl font-black">88th</span>
          </div>
        </div>
        
        {/* Concert Title */}
        <h1 className="text-3xl font-normal text-[#E4002B] tracking-wide">
          88th Year Concert
        </h1>
      </div>

      {/* Agent Entry Section */}
      <div className="text-center space-y-4">
        <div className="w-16 h-16 bg-slate-50 rounded-full flex items-center justify-center mx-auto border border-slate-100">
          <Users className="w-8 h-8 text-slate-400" />
        </div>
        <h2 className="text-xl font-black text-slate-900">ข้อมูลตัวแทน</h2>
        <p className="text-slate-500 text-sm">กรุณากรอกรหัสและชื่อตัวแทน</p>
      </div>

      <div className="space-y-4">
        {/* Agent First Name Input */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            ชื่อ
          </label>
          <input
            type="text"
            value={agentFirstName}
            onChange={(e) => setAgentFirstName(e.target.value)}
            placeholder="กรอกชื่อ"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
        </div>

        {/* Agent Last Name Input */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            นามสกุล
          </label>
          <input
            type="text"
            value={agentLastName}
            onChange={(e) => setAgentLastName(e.target.value)}
            placeholder="กรอกนามสกุล"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
        </div>

        {/* Agent Code Input */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            รหัสตัวแทน
          </label>
          <input
            type="text"
            value={agentCode}
            onChange={(e) => handleAgentCodeChange(e.target.value)}
            placeholder="กรอกรหัสตัวแทน"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
        </div>

        {/* Phone Input */}
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
        </div>
      </div>

      {error && (
        <div className="bg-red-50 border-2 border-red-100 text-red-600 rounded-2xl p-4 flex items-start gap-3 text-sm">
          <AlertCircle className="w-5 h-5 shrink-0 mt-0.5" />
          <p className="font-bold">{error}</p>
        </div>
      )}

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
                  การใช้งานระบบจองตั๋วคอนเสิร์ต 88th Year Concert ถือว่าท่านได้อ่านและยอมรับเงื่อนไขการใช้งานทั้งหมดแล้ว
                </p>

                <h4 className="font-bold text-slate-900 mb-3">2. การจองและการชำระเงิน</h4>
                <p className="text-slate-600 mb-4">
                  - ตั๋วที่จองจะต้องจองให้สำเร็จภายในเวลาที่กำหนด<br />
                  - การจองจะสมบูรณ์เมื่อได้รับการยืนยันจากระบบเท่านั้น<br />
                </p>

                <h4 className="font-bold text-slate-900 mb-3">3. การเปลี่ยนแปลงที่นั่ง</h4>
                <p className="text-slate-600 mb-4">
                  - สามารถเปลี่ยนแปลงที่นั่งได้ 1 ครั้งเท่านั้น<br />
                  - การเปลี่ยนแปลงต้องทำก่อนวันงาน 7 วัน<br />
                  - ที่นั่งใหม่ต้องอยู่ในโซนทตามรหัสที่แลกมาเท้่านั้น
                </p>

                <h4 className="font-bold text-slate-900 mb-3">4. การยกเลิก</h4>
                <p className="text-slate-600 mb-4">
                  - สามารถยกเลิกตั๋วได้ 1 ครั้งเท่านั้น<br />
                  - ต้องยกเลิกก่อนวันงาน 14 วัน<br />
                </p>

                <h4 className="font-bold text-slate-900 mb-3">5. ข้อจำกัดความรับผิด</h4>
                <p className="text-slate-600">
                  ทางงานจะไม่รับผิดชอบต่อความเสียหายใดๆ ที่เกิดจากการใช้งานระบบ หรือการเข้าร่วมงาน ยกเว้นกรณีที่เกิดจากความประมาทเลินเล่ออย่างร้ายแรงของ AIA
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
                  - ข้อมูลการจองและการชำระเงิน
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
                  อีเมล: privacy@aia.co.th<br />
                  โทร: 02-123-4567
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

export default AgentCodeEntry;
