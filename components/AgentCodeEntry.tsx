
import React, { useState } from 'react';
import { AgentInfo } from '../types';
import { AlertCircle, Users } from 'lucide-react';

interface Props {
  onSubmit: (agentInfo: AgentInfo) => void;
}

const AgentCodeEntry: React.FC<Props> = ({ onSubmit }) => {
  const [agentCode, setAgentCode] = useState('');
  const [agentName, setAgentName] = useState('');
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = () => {
    setError(null);

    if (!agentCode.trim()) {
      setError('กรุณากรอกรหัสตัวแทน');
      return;
    }

    if (!agentName.trim()) {
      setError('กรุณากรอกชื่อตัวแทน');
      return;
    }

    onSubmit({
      agentCode: agentCode.trim(),
      agentName: agentName.trim(),
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
        {/* Agent Code Input */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            รหัสตัวแทน
          </label>
          <input
            type="text"
            value={agentCode}
            onChange={(e) => setAgentCode(e.target.value)}
            placeholder="กรอกรหัสตัวแทน"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
        </div>

        {/* Agent Name Input */}
        <div>
          <label className="block text-sm font-bold text-slate-700 mb-2">
            ชื่อตัวแทน
          </label>
          <input
            type="text"
            value={agentName}
            onChange={(e) => setAgentName(e.target.value)}
            placeholder="กรอกชื่อตัวแทน"
            className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-base font-semibold focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
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
    </div>
  );
};

export default AgentCodeEntry;
