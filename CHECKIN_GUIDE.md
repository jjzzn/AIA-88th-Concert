# 🎫 Check-In System Guide

## ภาพรวมระบบ

ระบบ Check-In สำหรับงาน AIA Concert 2025 ใช้ QR Code ในการตรวจสอบและลงทะเบียนผู้เข้าชมวันงาน

## 📋 ขั้นตอนการติดตั้ง

### 1. อัปเดต Database Schema

รัน SQL script ใน Supabase SQL Editor:

```bash
# รัน database-checkin.sql หลังจาก database-final-fixed.sql
```

Script นี้จะเพิ่ม:
- ✅ `checked_in` column - สถานะการ check-in
- ✅ `checked_in_at` column - เวลาที่ check-in
- ✅ `qr_token` column - Token สำหรับตรวจสอบ QR code
- ✅ Auto-generate QR token trigger
- ✅ Indexes สำหรับ query ที่เร็วขึ้น

### 2. ไฟล์ที่เพิ่มเข้ามา

**Backend Service:**
- `lib/services/checkinService.ts` - Service สำหรับ check-in

**Frontend Component:**
- `components/CheckInScanner.tsx` - หน้าสแกน QR code

**Database:**
- `database-checkin.sql` - Schema สำหรับ check-in

## 🔐 ระบบความปลอดภัย

### QR Code Structure

แต่ละ QR code มีข้อมูล JSON:

```json
{
  "qrToken": "550e8400-e29b-41d4-a716-446655440000",
  "bookingId": "0812345678",
  "attendee": "สมชาย ใจดี",
  "seat": "A05",
  "tier": "PLATINUM",
  "timestamp": 1737283200000
}
```

### Security Features

- ✅ **Unique Token** - แต่ละที่นั่งมี QR token ไม่ซ้ำกัน
- ✅ **One-time Check-in** - ตรวจสอบไม่ให้ check-in ซ้ำ
- ✅ **Timestamp** - บันทึกเวลาที่ check-in
- ✅ **Database Validation** - ตรวจสอบกับ database ทุกครั้ง

## 📱 การใช้งานหน้า Check-In

### สำหรับเจ้าหน้าที่

1. **เปิดหน้า Check-In Scanner**
   ```
   /checkin (เพิ่ม route ใน App.tsx)
   ```

2. **สแกน QR Code**
   - ใช้ QR scanner อ่าน QR code จากตั๋ว
   - หรือ paste ข้อมูล QR code ในช่อง textarea

3. **ตรวจสอบผล**
   - ✅ สีเขียว = Check-in สำเร็จ
   - ❌ สีแดง = Check-in ไม่สำเร็จ (ซ้ำหรือไม่ถูกต้อง)

### Dashboard Statistics

แสดงสถิติแบบ real-time:
- **Total** - จำนวนตั๋วทั้งหมด
- **Checked In** - จำนวนที่ check-in แล้ว
- **Remaining** - จำนวนที่เหลือ

## 🔄 API Endpoints

### Check-In

```typescript
checkinService.checkIn(qrToken: string)
```

**Response:**
```typescript
{
  success: boolean,
  message: string,
  data?: {
    attendeeName: string,
    seat: string,
    tier: string,
    alreadyCheckedIn: boolean,
    checkedInAt?: string
  }
}
```

### Get Statistics

```typescript
checkinService.getCheckInStats()
```

**Response:**
```typescript
{
  total: number,
  checkedIn: number,
  remaining: number
}
```

## 🎯 Use Cases

### Case 1: Check-in สำเร็จ

```
Input: Valid QR Token
Output: ✅ Check-in สำเร็จ!
- ชื่อ: สมชาย ใจดี
- ที่นั่ง: A05
- Tier: PLATINUM
```

### Case 2: Check-in ซ้ำ

```
Input: Already checked-in token
Output: ❌ ตั๋วนี้ Check-in แล้ว
- Check-in เมื่อ: 19 ม.ค. 2026 15:30
```

### Case 3: QR Code ไม่ถูกต้อง

```
Input: Invalid token
Output: ❌ QR Code ไม่ถูกต้องหรือไม่พบข้อมูล
```

## 🚀 การเพิ่ม Route ใน App

เพิ่มใน `App.tsx`:

```typescript
import CheckInScanner from './components/CheckInScanner';

// เพิ่ม route สำหรับ check-in
if (window.location.pathname === '/checkin') {
  return <CheckInScanner />;
}
```

## 📊 Database Queries

### ดูสถิติ Check-in

```sql
SELECT 
  COUNT(*) as total,
  COUNT(*) FILTER (WHERE checked_in = true) as checked_in,
  COUNT(*) FILTER (WHERE checked_in = false) as remaining
FROM booking_seats;
```

### ดูรายการ Check-in ล่าสุด

```sql
SELECT 
  bs.first_name,
  bs.last_name,
  s.row,
  s.number,
  t.name as tier,
  bs.checked_in_at
FROM booking_seats bs
JOIN seats s ON bs.seat_id = s.id
JOIN tiers t ON s.tier_id = t.id
WHERE bs.checked_in = true
ORDER BY bs.checked_in_at DESC
LIMIT 10;
```

## 🔧 Troubleshooting

### QR Code ไม่ทำงาน

1. ตรวจสอบว่ารัน `database-checkin.sql` แล้ว
2. ตรวจสอบว่า `qr_token` column มีค่า
3. ตรวจสอบ Supabase connection

### Check-in ไม่บันทึก

1. ตรวจสอบ RLS policies ใน Supabase
2. ตรวจสอบ permissions ของ table
3. ดู console logs สำหรับ errors

## 📝 Notes

- QR token สร้างอัตโนมัติเมื่อจองตั๋ว
- ไม่สามารถ check-in ซ้ำได้
- บันทึก timestamp ทุกครั้งที่ check-in
- รองรับการสแกนด้วย QR scanner hardware

## 🎨 UI Features

- **Real-time Stats** - อัปเดตสถิติทันทีหลัง check-in
- **Color-coded Results** - เขียว = สำเร็จ, แดง = ไม่สำเร็จ
- **Responsive Design** - ใช้งานได้บน tablet/mobile
- **Dark Theme** - เหมาะสำหรับใช้งานในงาน

## 🔐 Security Best Practices

1. ใช้ HTTPS เท่านั้น
2. จำกัดการเข้าถึงหน้า check-in (authentication)
3. Log ทุก check-in attempts
4. Backup database ก่อนงาน
5. Test ระบบก่อนวันงานจริง

---

**สร้างโดย:** AIA Concert Booking System
**วันที่:** 19 มกราคม 2026
