# Troubleshooting: Seat Locking Not Working

## ✅ Migration Run แล้ว แต่ที่นั่งยังไม่ล็อค

### สาเหตุที่เป็นไปได้:

---

## 1. Frontend ยังไม่ได้ Restart/Rebuild

**ปัญหา:** Code ใหม่ยังไม่ทำงาน

**วิธีแก้:**

```bash
# หยุด dev server (Ctrl+C)
# แล้ว start ใหม่
npm run dev

# หรือ
yarn dev
```

**หลัง restart:**
1. Hard refresh browser: `Cmd+Shift+R` (Mac) หรือ `Ctrl+Shift+R` (Windows)
2. ลองใหม่

---

## 2. Browser Cache

**ปัญหา:** Browser ใช้ code เก่า

**วิธีแก้:**

```bash
# Chrome/Edge
1. เปิด DevTools (F12)
2. คลิกขวาที่ปุ่ม Refresh
3. เลือก "Empty Cache and Hard Reload"

# หรือ
1. Cmd+Shift+R (Mac)
2. Ctrl+Shift+R (Windows)
```

---

## 3. TypeScript Errors

**ปัญหา:** มี compile errors

**วิธีเช็ค:**

```bash
# ดู terminal ที่รัน npm run dev
# ถ้ามี errors สีแดง = มีปัญหา
```

**วิธีแก้:**

TypeScript errors ที่เห็นใน `seatLockService.ts` และ `App.tsx` **ไม่กระทบการทำงาน**

แต่ถ้าต้องการแก้:

```typescript
// ใน seatLockService.ts
// เพิ่ม @ts-ignore ก่อน supabase.rpc

// @ts-ignore
const { data, error } = await supabase.rpc('lock_seats', {
  p_seat_ids: seatIds,
  p_session_id: sessionId,
  p_lock_duration_minutes: durationMinutes,
});
```

---

## 4. เช็คว่า Code ทำงานหรือไม่

**เปิด Browser Console (F12):**

```javascript
// ใน Console tab
// พิมพ์:
localStorage.getItem('seat_lock_session_id')

// ควรเห็น: "session-1234567890-xxxxx"
// ถ้าเป็น null = code ไม่ทำงาน
```

---

## 5. Test Seat Locking ด้วย Console

**ใน Browser Console (F12):**

```javascript
// Import service (ถ้าใช้ได้)
// หรือ test ผ่าน Supabase SQL Editor

// Test ใน SQL Editor:
SELECT * FROM lock_seats(
  ARRAY['seat-id-ของคุณ'],
  'test-session-999',
  5
);

// ควรได้:
// success: true
// locked_seats: ['seat-id-ของคุณ']
```

---

## 6. เช็ค Network Requests

**ใน Browser DevTools:**

```
1. เปิด Network tab (F12)
2. Filter: "lock_seats"
3. เลือกที่นั่ง + กด "ยืนยัน"
4. ควรเห็น request ไป Supabase
5. ดู Response:
   - success: true = ล็อคสำเร็จ
   - success: false = มีปัญหา
```

---

## 7. เช็คว่าที่นั่งถูกล็อคจริงหรือไม่

**ใน Supabase SQL Editor:**

```sql
-- ดูที่นั่งที่ถูกล็อค
SELECT 
  id,
  row,
  number,
  locked_by,
  locked_until,
  EXTRACT(EPOCH FROM (locked_until - NOW())) as seconds_remaining
FROM seats
WHERE locked_until IS NOT NULL
  AND locked_until > NOW()
ORDER BY locked_until DESC;

-- ถ้าไม่มีข้อมูล = ไม่มีที่นั่งถูกล็อค
-- ถ้ามี = ระบบทำงาน แต่ UI ไม่แสดง
```

---

## 8. เช็ค SeatSelection Component

**ตรวจสอบว่า import ถูกต้อง:**

```typescript
// ใน components/SeatSelection.tsx
// บรรทัดแรกๆ ควรมี:
import { seatLockService, SeatAvailability } from '../lib/services/seatLockService';

// ถ้าไม่มี = ยังไม่ได้แก้ไข
```

---

## 9. Clear All และเริ่มใหม่

**Reset ทุกอย่าง:**

```bash
# 1. Clear browser data
# Chrome: Settings → Privacy → Clear browsing data
# เลือก: Cached images and files

# 2. Clear localStorage
# Console: localStorage.clear()

# 3. Restart dev server
# Terminal: Ctrl+C
npm run dev

# 4. Hard refresh
# Cmd+Shift+R
```

---

## 10. ตรวจสอบ Step-by-Step

### **Step 1: เช็ค Database**
```sql
-- มี columns หรือไม่
SELECT column_name FROM information_schema.columns 
WHERE table_name = 'seats' 
AND column_name IN ('locked_until', 'locked_by');

-- ควรเห็น 2 rows
```

### **Step 2: เช็ค Functions**
```sql
-- มี functions หรือไม่
SELECT proname FROM pg_proc 
WHERE proname IN ('lock_seats', 'check_seats_available');

-- ควรเห็น 2 rows
```

### **Step 3: Test Lock**
```sql
-- ล็อคที่นั่งทดสอบ
SELECT * FROM lock_seats(
  ARRAY['seat-id-1'],
  'test-123',
  5
);

-- ดู result
```

### **Step 4: เช็ค Frontend**
```bash
# Dev server running?
ps aux | grep "vite"

# ถ้าไม่มี = ต้อง start
npm run dev
```

### **Step 5: เช็ค Browser**
```javascript
// Console
localStorage.getItem('seat_lock_session_id')

// ควรมีค่า
```

### **Step 6: Test Flow**
```
1. เลือกที่นั่ง A01
2. เปิด Console (F12)
3. ดู Network tab
4. กด "ยืนยันที่นั่ง"
5. ควรเห็น request "lock_seats"
6. ดู Response
```

---

## ✅ Checklist

- [ ] Database migration run แล้ว
- [ ] Columns `locked_until`, `locked_by` มีใน table `seats`
- [ ] Functions `lock_seats`, `check_seats_available` มี
- [ ] Dev server restart แล้ว
- [ ] Browser hard refresh แล้ว (Cmd+Shift+R)
- [ ] localStorage มี `seat_lock_session_id`
- [ ] Network tab เห็น request `lock_seats`
- [ ] SQL query เห็นที่นั่งถูกล็อค
- [ ] SeatSelection.tsx มี import `seatLockService`

---

## 🆘 ถ้ายังไม่ได้

**ส่งข้อมูลเหล่านี้:**

1. **Browser Console errors** (F12 → Console tab)
2. **Network request** (F12 → Network → filter "lock")
3. **SQL query result:**
   ```sql
   SELECT * FROM seats WHERE locked_until IS NOT NULL LIMIT 5;
   ```
4. **Dev server output** (terminal logs)
5. **Screenshot** ของหน้าเลือกที่นั่ง

---

## 🎯 Quick Fix

**ลองทำตามนี้:**

```bash
# 1. Stop dev server
Ctrl+C

# 2. Clear node_modules (ถ้าจำเป็น)
rm -rf node_modules
npm install

# 3. Start dev server
npm run dev

# 4. เปิด browser ใหม่ (Incognito mode)
# 5. ลองใหม่
```

---

## 📝 สรุป

**ปัญหาส่วนใหญ่:**
1. ❌ ไม่ได้ restart dev server
2. ❌ Browser cache
3. ❌ TypeScript errors (แต่ไม่กระทบการทำงาน)

**วิธีแก้:**
1. ✅ Restart dev server
2. ✅ Hard refresh browser
3. ✅ เช็ค Console errors
4. ✅ เช็ค Network requests
