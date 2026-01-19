# 🚀 Quick Start Guide - AIA Concert Ticket Booking

## ขั้นตอนการติดตั้ง (Setup Steps)

### 1. สร้าง Database ใน Supabase

1. เปิด Supabase SQL Editor: https://mzhroupxmegympgtjatc.supabase.co
2. ไปที่ **SQL Editor** (เมนูด้านซ้าย)
3. คัดลอกโค้ดทั้งหมดจากไฟล์ `database-complete.sql`
4. วางในช่อง SQL Editor และกด **Run**
5. รอจนกว่าจะเสร็จ (ประมาณ 5-10 วินาที)

### 2. ตรวจสอบว่า Database สร้างสำเร็จ

ใน SQL Editor รันคำสั่งนี้:

```sql
SELECT 'Tiers' as table_name, COUNT(*) as count FROM tiers
UNION ALL
SELECT 'Zones', COUNT(*) FROM zones
UNION ALL
SELECT 'Seats', COUNT(*) FROM seats
UNION ALL
SELECT 'Access Codes', COUNT(*) FROM access_codes;
```

**ผลลัพธ์ที่ควรได้:**
- Tiers: 4 rows (PLATINUM, GOLD, SILVER, CLASSIC)
- Zones: 9 rows (A1, A2, B1, B2, B3, C1, C2, D1, D2)
- Seats: 450 rows (9 zones × 50 seats)
- Access Codes: 32 rows

### 3. ตรวจสอบ Environment Variables

ไฟล์ `.env.local` ควรมีข้อมูลนี้:

```env
VITE_SUPABASE_URL=https://mzhroupxmegympgtjatc.supabase.co
VITE_SUPABASE_ANON_KEY=sb_publishable__5rLEaucqVBgXjQWZo_ZZg_rCR7zZYt
```

### 4. รัน Development Server

```bash
npm run dev
```

เปิดเบราว์เซอร์ที่ http://localhost:5173

---

## 🧪 ทดสอบระบบ (Testing)

### ทดสอบ Code Validation

ใช้รหัสเหล่านี้ในหน้า Code Entry:

**PLATINUM Tier (฿6,500):**
- `1AIA2024-001`
- `1AIA2024-002`
- `1PLAT-VIP-01`

**GOLD Tier (฿4,500):**
- `2AIA2024-001`
- `2AIA2024-002`
- `2GOLD-PRE-01`

**SILVER Tier (฿3,500):**
- `3AIA2024-001`
- `3AIA2024-002`
- `3SILV-STD-01`

**CLASSIC Tier (฿2,500):**
- `4AIA2024-001`
- `5AIA2024-001`
- `4CLAS-BAS-01`

### ขั้นตอนการทดสอบ

1. **กรอกรหัส:** ใส่รหัสที่ต้องการ (1-5 รหัส)
2. **เลือกที่นั่ง:** เลือก Zone และที่นั่งตามจำนวนรหัส
3. **กรอกข้อมูล:** ใส่ชื่อ-นามสกุล, อีเมล, เบอร์โทร
4. **ยืนยัน:** ระบบจะบันทึกลง Supabase

---

## 📊 ตรวจสอบข้อมูลใน Database

### ดูการจองทั้งหมด

```sql
SELECT 
    b.id,
    b.email,
    b.phone,
    b.total_amount,
    COUNT(bs.id) as seats_count,
    b.created_at
FROM bookings b
LEFT JOIN booking_seats bs ON b.id = bs.booking_id
GROUP BY b.id
ORDER BY b.created_at DESC;
```

### ดูที่นั่งที่ถูกจองแล้ว

```sql
SELECT 
    s.row,
    s.number,
    z.name as zone_name,
    t.name as tier_name,
    bs.first_name,
    bs.last_name
FROM seats s
JOIN zones z ON s.zone_id = z.id
JOIN tiers t ON s.tier_id = t.id
LEFT JOIN booking_seats bs ON s.id = bs.seat_id
WHERE s.is_booked = true
ORDER BY t.price DESC, z.name, s.row, s.number;
```

### ดูรหัสที่ถูกใช้แล้ว

```sql
SELECT 
    ac.code,
    t.name as tier_name,
    ac.is_used,
    ac.used_at
FROM access_codes ac
JOIN tiers t ON ac.tier_id = t.id
WHERE ac.is_used = true
ORDER BY ac.used_at DESC;
```

---

## 🔧 Troubleshooting

### ❌ "Missing Supabase environment variables"

**แก้ไข:**
1. ตรวจสอบว่ามีไฟล์ `.env.local` ในโฟลเดอร์ root
2. ตรวจสอบว่าชื่อตัวแปรขึ้นต้นด้วย `VITE_`
3. รีสตาร์ท dev server (`npm run dev`)

### ❌ "Failed to validate codes"

**แก้ไข:**
1. ตรวจสอบว่ารันไฟล์ `database-complete.sql` แล้ว
2. ตรวจสอบว่ามี access codes ในตาราง:
   ```sql
   SELECT * FROM access_codes LIMIT 5;
   ```
3. ใช้รหัสที่มีในระบบ (ดูด้านบน)

### ❌ "Failed to load seats"

**แก้ไข:**
1. ตรวจสอบว่ามีข้อมูล seats ในตาราง:
   ```sql
   SELECT COUNT(*) FROM seats;
   ```
2. ถ้าไม่มี ให้รันไฟล์ `database-complete.sql` ใหม่

### ❌ TypeScript Errors

**แก้ไข:**
1. รัน `npm install` ใหม่
2. รีสตาร์ท TypeScript server ใน VS Code:
   - กด `Cmd+Shift+P` (Mac) หรือ `Ctrl+Shift+P` (Windows)
   - พิมพ์ "TypeScript: Restart TS Server"

---

## 📁 โครงสร้างโค้ด

```
lib/
├── supabase.ts              # Supabase client
├── database.types.ts        # Database types
├── services/                # Backend logic
│   ├── codeService.ts       # Code validation
│   ├── seatService.ts       # Seat management
│   ├── bookingService.ts    # Booking creation
│   └── tierService.ts       # Tier data
└── hooks/                   # React hooks
    ├── useCodeValidation.ts # Code validation hook
    ├── useSeats.ts          # Seats hook
    └── useBooking.ts        # Booking hook

components/
├── CodeEntry.tsx            # ✅ Connected to Supabase
├── SeatSelection.tsx        # ✅ Connected to Supabase
├── DetailsForm.tsx          # ✅ Connected to Supabase
└── Confirmation.tsx         # Display only
```

---

## ✅ Checklist

- [ ] รันไฟล์ `database-complete.sql` ใน Supabase
- [ ] ตรวจสอบว่ามีข้อมูล 4 tiers, 9 zones, 450 seats
- [ ] ตรวจสอบไฟล์ `.env.local` มี credentials ถูกต้อง
- [ ] รัน `npm run dev` สำเร็จ
- [ ] ทดสอบกรอกรหัสและ validate ได้
- [ ] ทดสอบเลือกที่นั่งได้
- [ ] ทดสอบจองสำเร็จและบันทึกลง database

---

## 🎉 เสร็จสิ้น!

ระบบพร้อมใช้งานแล้ว! ข้อมูลทั้งหมดจะถูกบันทึกลง Supabase อัตโนมัติ

**หากมีปัญหา:**
- ดูไฟล์ `SUPABASE_SETUP.md` สำหรับรายละเอียดเพิ่มเติม
- ดูไฟล์ `lib/api.example.ts` สำหรับตัวอย่างการใช้งาน
