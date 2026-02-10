
import React, { useState } from 'react';
import { Tier } from '../types';
import { AlertCircle, Plus, X, Loader2 } from 'lucide-react';
import { useCodeValidation } from '../lib/hooks';

interface Props {
  onSubmit: (codes: string[], tier: Tier) => void;
}

const CodeEntry: React.FC<Props> = ({ onSubmit }) => {
  const [codes, setCodes] = useState<string[]>(['']);
  const [error, setError] = useState<string | null>(null);
  
  const { validateCodes, loading: validating } = useCodeValidation();

  const handleAddCode = () => {
    if (codes.length < 10) {
      setCodes([...codes, '']);
    }
  };

  const handleRemoveCode = (index: number) => {
    if (codes.length > 1) {
      const newCodes = codes.filter((_, i) => i !== index);
      setCodes(newCodes);
    }
  };

  const handleCodeChange = (index: number, value: string) => {
    const newCodes = [...codes];
    newCodes[index] = value.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 8);
    setCodes(newCodes);
  };

  const validate = async () => {
    setError(null);
    const nonEmptyCodes = codes.filter(c => c !== '');
    const validCodes = codes.filter(c => c.length === 8);
    
    if (nonEmptyCodes.length === 0) {
      setError('กรุณากรอกรหัสอย่างน้อย 1 รหัส');
      return;
    }

    if (validCodes.length !== nonEmptyCodes.length) {
      setError('รหัสต้องมี 8 หลัก (เช่น PT4K7M2N)');
      return;
    }

    const uniqueCodes = new Set(validCodes);
    if (uniqueCodes.size !== validCodes.length) {
      setError('รหัสสิทธิ์ต้องห้ามซ้ำกัน');
      return;
    }

    const result = await validateCodes(validCodes);
    
    if (!result.isValid) {
      setError(result.error || 'รหัสไม่ถูกต้อง');
      return;
    }

    if (result.tier) {
      onSubmit(validCodes, result.tier);
    }
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

      {/* Code Entry Section */}
      <div className="text-center space-y-4">
        <h2 className="text-xl font-black text-slate-900">ระบุรหัสบัตร</h2>
        <p className="text-slate-500 text-sm">กรุณาระบุรหัส 8 หลัก สูงสุด 10 รหัส</p>
      </div>

      <div className="space-y-3">
        {codes.map((code, index) => (
          <div key={index} className="relative group">
            <input
              type="text"
              value={code}
              onChange={(e) => handleCodeChange(index, e.target.value)}
              placeholder="X X X X X X X X"
              className="w-full bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-5 text-center text-xl font-bold tracking-[0.5em] focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition uppercase text-slate-400 placeholder:text-slate-300"
            />
            {codes.length > 1 && (
              <button 
                onClick={() => handleRemoveCode(index)}
                className="absolute right-4 top-1/2 -translate-y-1/2 p-1 text-slate-400 hover:text-red-500 transition"
              >
                <X className="w-5 h-5" />
              </button>
            )}
          </div>
        ))}

        {codes.length < 10 && (
          <button 
            onClick={handleAddCode}
            className="w-full py-4 border-2 border-dashed border-slate-200 rounded-2xl flex items-center justify-center gap-2 text-slate-400 hover:text-[#E4002B] hover:border-[#E4002B] transition font-bold text-sm"
          >
            <Plus className="w-5 h-5" />
            <span>เพิ่มรหัสบัตร</span>
          </button>
        )}
      </div>

      {error && (
        <div className="bg-red-50 border-2 border-red-100 text-red-600 rounded-2xl p-4 flex items-start gap-3 text-sm">
          <AlertCircle className="w-5 h-5 shrink-0 mt-0.5" />
          <p className="font-bold">{error}</p>
        </div>
      )}

      <div className="pt-4">
        <button
          onClick={validate}
          disabled={validating}
          className="w-full py-5 bg-[#E4002B] text-white rounded-2xl font-black text-lg shadow-xl shadow-red-500/25 hover:bg-red-700 active:scale-[0.98] transition disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
        >
          {validating ? (
            <>
              <Loader2 className="w-6 h-6 animate-spin" />
              <span>กำลังตรวจสอบ...</span>
            </>
          ) : (
            'ตรวจสอบข้อมูล'
          )}
        </button>
      </div>
    </div>
  );
};

export default CodeEntry;
