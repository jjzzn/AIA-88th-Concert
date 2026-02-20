# Admin Tracking System - คู่มือการติดตั้งและใช้งาน

## สรุปการเปลี่ยนแปลง

### 1. ลบหน้าที่ไม่ต้องการ ✅
- ลบหน้า `/pages/admin-cancel.tsx` (ยกเลิกตั๋ว)
- ลบหน้า `/pages/admin-restore.tsx` (คืนตั๋วที่ยกเลิกผิด)
- ลบปุ่มทั้ง 2 จากหน้า `/pages/admin-manage.tsx`
- ลบ routes ที่เกี่ยวข้องจาก `/index.tsx`

### 2. สร้างระบบ Admin Login และ Tracking ✅

#### ไฟล์ที่สร้างใหม่:

1. **`database-admin-tracking.sql`** - Database schema สำหรับ:
   - `admin_users` - ตาราง Admin users
   - `admin_sessions` - ตาราง sessions สำหรับ login
   - `admin_action_logs` - ตารางบันทึกการกระทำของ Admin
   - Functions และ Views สำหรับจัดการ authentication และ logging

2. **`lib/services/adminAuthService.ts`** - Service สำหรับ:
   - Login/Logout
   - Session validation
   - Log admin actions
   - Get action history

3. **`components/admin/AdminLoginGuard.tsx`** - Component สำหรับ:
   - Login form
   - Session guard
   - แสดงข้อมูล Admin ที่ login อยู่

## วิธีติดตั้ง

### ขั้นตอนที่ 1: รัน Database Schema

1. เปิด Supabase SQL Editor
2. รันไฟล์ `database-admin-tracking.sql` ทั้งหมด
3. ตรวจสอบว่าตารางถูกสร้างสำเร็จ:
   - admin_users
   - admin_sessions
   - admin_action_logs

### ขั้นตอนที่ 2: สร้าง Admin Users

**สำคัญ:** ในไฟล์ SQL มี sample admin users แต่ password ยังไม่ได้ hash

คุณต้อง:
1. ติดตั้ง bcrypt library: `npm install bcryptjs`
2. Hash password ด้วย bcrypt
3. Update password_hash ในตาราง admin_users

ตัวอย่างการ hash password:
```javascript
const bcrypt = require('bcryptjs');
const password = 'your-password';
const hash = bcrypt.hashSync(password, 10);
console.log(hash); // นำ hash นี้ไปใส่ใน database
```

หรือใช้ SQL:
```sql
-- Update password สำหรับ admin1
UPDATE admin_users 
SET password_hash = '$2a$10$...' -- ใส่ hashed password ที่นี่
WHERE username = 'admin1';
```

### ขั้นตอนที่ 3: Wrap Admin Pages ด้วย AdminLoginGuard

ตัวอย่างการใช้งานใน admin pages:

```tsx
import AdminLoginGuard from '../components/admin/AdminLoginGuard';
import { adminAuthService } from '../lib/services/adminAuthService';

const AdminSeatSwapPage: React.FC = () => {
  const [currentAdmin, setCurrentAdmin] = useState(null);

  const handleSwap = async () => {
    // ทำการ swap seat
    
    // Log action
    await adminAuthService.logAction({
      action_type: 'seat_swap',
      booking_seat_id: bookingSeatId,
      details: {
        old_seat: oldSeat,
        new_seat: newSeat,
        reason: reason
      }
    });
  };

  return (
    <AdminLoginGuard onAdminChange={setCurrentAdmin}>
      {/* Your admin page content */}
    </AdminLoginGuard>
  );
};
```

## การใช้งาน Admin Tracking

### 1. Log Admin Actions

เมื่อ Admin ทำการกระทำใดๆ ให้เรียก:

```typescript
await adminAuthService.logAction({
  action_type: 'seat_swap', // หรือ 'check_in', 'search', 'view_dashboard'
  booking_id: 'uuid',
  booking_seat_id: 'uuid',
  details: {
    // ข้อมูลเพิ่มเติมตามต้องการ
    old_seat: 'A01',
    new_seat: 'B05',
    reason: 'ผู้เข้าร่วมขอเปลี่ยน'
  }
});
```

### 2. ดู Action History

```typescript
const history = await adminAuthService.getActionHistory(100);
// Returns array of admin actions with details
```

### 3. ตรวจสอบ Admin ที่ login อยู่

```typescript
const admin = await adminAuthService.getCurrentAdmin();
if (admin) {
  console.log(`Admin: ${admin.full_name} (${admin.username})`);
}
```

## Action Types ที่รองรับ

- `seat_swap` - เปลี่ยนที่นั่ง
- `check_in` - เช็คอิน
- `search` - ค้นหาตั๋ว
- `view_dashboard` - ดู Dashboard
- สามารถเพิ่ม action types อื่นๆ ได้ตามต้องการ

## ตัวอย่าง Details Object

### Seat Swap
```json
{
  "old_seat": "A01",
  "new_seat": "B05",
  "old_zone": "ZONE A1",
  "new_zone": "ZONE B1",
  "reason": "ผู้เข้าร่วมขอเปลี่ยน",
  "notes": "เปลี่ยนเนื่องจาก..."
}
```

### Search
```json
{
  "search_type": "booking_number",
  "search_term": "BOOK-12345",
  "results_count": 5
}
```

### Check In
```json
{
  "qr_token": "AIA-123456",
  "attendee_name": "สมชาย ใจดี",
  "seat": "A01"
}
```

## Security Notes

⚠️ **สำคัญมาก:**

1. **Password Hashing**: ต้อง implement bcrypt password hashing ใน production
2. **HTTPS**: ใช้ HTTPS เท่านั้นใน production
3. **Session Timeout**: Sessions หมดอายุใน 24 ชั่วโมง (ปรับได้ใน `create_admin_session`)
4. **Password Policy**: ควรกำหนด password policy ที่เข้มงวด
5. **Rate Limiting**: ควรเพิ่ม rate limiting สำหรับ login attempts

## Database Views

### admin_action_history
View นี้รวมข้อมูล admin actions พร้อม details:
```sql
SELECT * FROM admin_action_history 
WHERE action_type = 'seat_swap' 
ORDER BY created_at DESC 
LIMIT 50;
```

## Troubleshooting

### ปัญหา: Login ไม่ได้
- ตรวจสอบว่า admin_users มีข้อมูล
- ตรวจสอบว่า is_active = true
- ตรวจสอบ password hash

### ปัญหา: Session หมดอายุเร็ว
- ปรับ `p_expires_in_hours` ใน `create_admin_session` function

### ปัญหา: Action ไม่ถูก log
- ตรวจสอบว่า admin login อยู่
- ตรวจสอบ console สำหรับ errors
- ตรวจสอบว่า `log_admin_action` function ทำงานปกติ

## Next Steps (แนะนำ)

1. ✅ รัน database schema
2. ✅ สร้าง admin users พร้อม hashed passwords
3. 🔄 Wrap ทุก admin pages ด้วย `AdminLoginGuard`
4. 🔄 เพิ่ม `adminAuthService.logAction()` ในทุก admin actions
5. 🔄 สร้างหน้า Admin Action History Dashboard (optional)
6. 🔄 Implement password change functionality (optional)
7. 🔄 เพิ่ม 2FA (optional, for high security)

## ไฟล์ที่เกี่ยวข้อง

- `/database-admin-tracking.sql` - Database schema
- `/lib/services/adminAuthService.ts` - Authentication service
- `/components/admin/AdminLoginGuard.tsx` - Login guard component
- `/pages/admin-manage.tsx` - Updated admin management page
- `/index.tsx` - Updated routing

## สรุป

ระบบนี้จะช่วยให้คุณ:
- ✅ ลบหน้ายกเลิกตั๋วและคืนตั๋วออกแล้ว
- ✅ มีระบบ Login สำหรับ Admin
- ✅ บันทึกว่า Admin คนไหนทำอะไรกับตั๋วไหนเมื่อไหร่
- ✅ ตรวจสอบ history ของการกระทำทั้งหมดได้
- ✅ มีความปลอดภัยด้วย session management

หากมีคำถามหรือต้องการความช่วยเหลือเพิ่มเติม กรุณาติดต่อทีมพัฒนา
