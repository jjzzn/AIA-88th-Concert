import React, { useState, useEffect } from 'react';
import { Tier } from '../types';
import { AlertCircle, Star, Loader2 } from 'lucide-react';
import { tierService } from '../lib/services';

interface Props {
  onSubmit: (tier: Tier, quantity: number) => void;
}

const AgentTierSelection: React.FC<Props> = ({ onSubmit }) => {
  const [tiers, setTiers] = useState<Tier[]>([]);
  const [selectedTier, setSelectedTier] = useState<Tier | null>(null);
  const [quantity, setQuantity] = useState<number>(1);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const loadTiers = async () => {
      try {
        const fetchedTiers = await tierService.getAllTiers();
        setTiers(fetchedTiers);
        setLoading(false);
      } catch (err) {
        setError('ไม่สามารถโหลดข้อมูลโซนที่นั่งได้');
        setLoading(false);
      }
    };
    loadTiers();
  }, []);

  const handleSubmit = () => {
    setError(null);

    if (!selectedTier) {
      setError('กรุณาเลือกโซนที่นั่ง');
      return;
    }

    if (quantity < 1 || quantity > 10) {
      setError('กรุณาเลือกจำนวนที่นั่ง 1-10 ที่');
      return;
    }

    onSubmit(selectedTier, quantity);
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <Loader2 className="w-8 h-8 text-[#E4002B] animate-spin" />
      </div>
    );
  }

  return (
    <div className="px-4 py-8 space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
      {/* Title */}
      <div className="text-center space-y-4">
        <div className="w-16 h-16 bg-slate-50 rounded-full flex items-center justify-center mx-auto border border-slate-100">
          <Star className="w-8 h-8 text-slate-400" />
        </div>
        <h2 className="text-xl font-black text-slate-900">เลือกโซนที่นั่ง</h2>
        <p className="text-slate-500 text-sm">เลือกโซนและจำนวนที่นั่งที่ต้องการจอง</p>
      </div>

      {/* Tier Selection */}
      <div className="space-y-3">
        <label className="block text-sm font-bold text-slate-700 mb-2">
          โซนที่นั่ง
        </label>
        {tiers.map((tier) => (
          <button
            key={tier.id}
            onClick={() => setSelectedTier(tier)}
            className={`w-full p-4 rounded-2xl border-2 transition text-left ${
              selectedTier?.id === tier.id
                ? 'border-[#E4002B] bg-red-50'
                : 'border-slate-200 bg-slate-50 hover:border-slate-300'
            }`}
          >
            <div className="flex items-center justify-between">
              <div>
                <div className="font-black text-slate-900">{tier.name}</div>
                <div className="text-sm text-slate-500">{tier.description}</div>
              </div>
              <div
                className="w-6 h-6 rounded-full border-2 flex items-center justify-center"
                style={{
                  borderColor: selectedTier?.id === tier.id ? '#E4002B' : '#cbd5e1',
                  backgroundColor: selectedTier?.id === tier.id ? '#E4002B' : 'transparent',
                }}
              >
                {selectedTier?.id === tier.id && (
                  <div className="w-2 h-2 bg-white rounded-full" />
                )}
              </div>
            </div>
          </button>
        ))}
      </div>

      {/* Quantity Selection */}
      <div className="space-y-3">
        <label className="block text-sm font-bold text-slate-700 mb-2">
          จำนวนที่นั่ง
        </label>
        <div className="flex items-center gap-4">
          <button
            onClick={() => setQuantity(Math.max(1, quantity - 1))}
            className="w-12 h-12 bg-slate-100 rounded-xl font-black text-xl hover:bg-slate-200 active:scale-95 transition"
          >
            −
          </button>
          <input
            type="number"
            min="1"
            max="10"
            value={quantity}
            onChange={(e) => {
              const val = parseInt(e.target.value);
              if (!isNaN(val) && val >= 1 && val <= 10) {
                setQuantity(val);
              }
            }}
            className="flex-1 text-center bg-slate-50 border-2 border-slate-200 rounded-2xl px-6 py-4 text-2xl font-black focus:border-[#E4002B] focus:bg-white focus:ring-4 focus:ring-[#E4002B]/10 outline-none transition"
          />
          <button
            onClick={() => setQuantity(Math.min(10, quantity + 1))}
            className="w-12 h-12 bg-slate-100 rounded-xl font-black text-xl hover:bg-slate-200 active:scale-95 transition"
          >
            +
          </button>
        </div>
        <p className="text-xs text-slate-500 text-center">สามารถจองได้สูงสุด 10 ที่</p>
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
          disabled={!selectedTier}
          className="w-full py-5 bg-[#E4002B] text-white rounded-2xl font-black text-lg shadow-xl shadow-red-500/25 hover:bg-red-700 active:scale-[0.98] transition disabled:opacity-50 disabled:cursor-not-allowed"
        >
          เลือกที่นั่ง
        </button>
      </div>
    </div>
  );
};

export default AgentTierSelection;
