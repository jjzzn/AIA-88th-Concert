# 📧 Email Confirmation Setup Guide

## ภาพรวม

ระบบส่ง Email Confirmation อัตโนมัติหลังจากจองตั๋วสำเร็จ โดยใช้:
- **Supabase Edge Functions** - สำหรับ backend logic
- **Resend** - สำหรับส่ง email (ใช้ sandbox mode ก่อน)

---

## 🚀 ขั้นตอนการติดตั้ง

### 1. สมัคร Resend Account

1. ไปที่ https://resend.com
2. สมัครบัญชีฟรี
3. ไปที่ **API Keys** และสร้าง API key ใหม่
4. คัดลอก API key (จะใช้ในขั้นตอนถัดไป)

**Note:** Sandbox mode จะส่ง email ได้เฉพาะ email ที่ verify แล้วเท่านั้น

---

### 2. ติดตั้ง Supabase CLI

```bash
# Install Supabase CLI (ถ้ายังไม่มี)
brew install supabase/tap/supabase

# หรือใช้ npm
npm install -g supabase
```

---

### 3. Login และ Link Project

```bash
# Login to Supabase
supabase login

# Link to your project
cd /Users/jetzzn/Downloads/aia-concert-ticket-mini-app
supabase link --project-ref YOUR_PROJECT_REF

# หา project ref ได้จาก Supabase Dashboard URL:
# https://supabase.com/dashboard/project/YOUR_PROJECT_REF
```

---

### 4. ตั้งค่า Environment Variables

```bash
# Set Resend API Key
supabase secrets set RESEND_API_KEY=re_xxxxxxxxxxxxx

# Verify secrets
supabase secrets list
```

---

### 5. Deploy Edge Function

```bash
# Deploy the function
supabase functions deploy send-booking-confirmation

# ตรวจสอบว่า deploy สำเร็จ
supabase functions list
```

---

## 📝 ไฟล์ที่สร้างแล้ว

### **Edge Function**
`supabase/functions/send-booking-confirmation/index.ts`

**Features:**
- ✅ ดึงข้อมูลการจองจาก database
- ✅ สร้าง QR codes สำหรับแต่ละตั๋ว
- ✅ สร้าง HTML email template สวยงาม
- ✅ ส่ง email ผ่าน Resend API
- ✅ รองรับ CORS

### **Updated Service**
`lib/services/bookingService.ts`

เพิ่มฟังก์ชัน:
```typescript
sendConfirmationEmail(bookingId: string)
```

---

## 📧 Email Template

Email จะประกอบด้วย:

### **Header**
- 🎫 Booking Confirmed!
- AIA Concert 2025

### **Booking Details**
- Booking ID
- Email
- Phone
- Tier
- Total Tickets
- Total Amount

### **Event Information**
- 📅 Date: 24 May 2025
- ⏰ Time: 19:00
- 📍 Venue: IMPACT Arena

### **Tickets Section**
แต่ละตั๋วจะมี:
- QR Code (200x200px)
- ชื่อผู้เข้าชม
- ที่นั่ง
- Tier

### **Instructions**
- วิธีใช้ QR Code
- ข้อควรระวัง

---

## 🧪 การทดสอบ

### 1. ทดสอบ Function โดยตรง

```bash
# Test locally
supabase functions serve send-booking-confirmation

# ใน terminal อื่น
curl -i --location --request POST 'http://localhost:54321/functions/v1/send-booking-confirmation' \
  --header 'Authorization: Bearer YOUR_ANON_KEY' \
  --header 'Content-Type: application/json' \
  --data '{"bookingId":"YOUR_BOOKING_ID"}'
```

### 2. ทดสอบผ่าน App

1. จองตั๋วผ่านแอพ
2. ตรวจสอบ email (ใช้ email ที่ verify ใน Resend)
3. ตรวจสอบ Supabase Logs:
   ```bash
   supabase functions logs send-booking-confirmation
   ```

---

## 🔐 Resend Sandbox Mode

### ข้อจำกัด:
- ส่ง email ได้เฉพาะ email ที่ verify แล้ว
- จำกัด 100 emails/day
- From address: `onboarding@resend.dev`

### Verify Email:
1. ไปที่ Resend Dashboard
2. Settings → Domains → Sandbox
3. เพิ่ม email ที่ต้องการทดสอบ
4. ยืนยัน email ที่ได้รับ

### เมื่อมี Domain แล้ว:
1. เพิ่ม domain ใน Resend Dashboard
2. ตั้งค่า DNS records
3. อัปเดต `from` address ใน Edge Function:
   ```typescript
   from: 'AIA Concert <noreply@yourdomain.com>'
   ```
4. Deploy function ใหม่

---

## 📊 Monitoring

### ดู Logs

```bash
# Real-time logs
supabase functions logs send-booking-confirmation --follow

# Recent logs
supabase functions logs send-booking-confirmation --limit 50
```

### ตรวจสอบใน Resend Dashboard
- ไปที่ https://resend.com/emails
- ดู delivery status, opens, clicks

---

## 🐛 Troubleshooting

### Email ไม่ส่ง

1. **ตรวจสอบ API Key:**
   ```bash
   supabase secrets list
   ```

2. **ตรวจสอบ Logs:**
   ```bash
   supabase functions logs send-booking-confirmation
   ```

3. **ตรวจสอบ Email Verified:**
   - ใน Resend Dashboard → Sandbox
   - Email ต้อง verified

### Function Error

1. **ตรวจสอบ Booking ID:**
   - Booking ID ต้องมีอยู่ใน database
   - มี booking_seats data

2. **ตรวจสอบ CORS:**
   - Function รองรับ CORS แล้ว
   - ตรวจสอบ origin ใน browser console

### QR Code ไม่แสดง

1. **ตรวจสอบ qr_token:**
   ```sql
   SELECT qr_token FROM booking_seats WHERE booking_id = 'xxx';
   ```

2. **ตรวจสอบ URL encoding:**
   - QR data ต้อง encode ด้วย `encodeURIComponent()`

---

## 🎨 Customization

### แก้ไข Email Template

แก้ไขใน `supabase/functions/send-booking-confirmation/index.ts`:

```typescript
const emailHtml = `
  <!-- Your custom HTML here -->
`
```

### เพิ่ม Attachments

```typescript
body: JSON.stringify({
  from: 'AIA Concert <onboarding@resend.dev>',
  to: [booking.email],
  subject: 'Booking Confirmation',
  html: emailHtml,
  attachments: [
    {
      filename: 'ticket.pdf',
      content: pdfBuffer,
    }
  ]
})
```

### เพิ่ม CC/BCC

```typescript
body: JSON.stringify({
  from: 'AIA Concert <onboarding@resend.dev>',
  to: [booking.email],
  cc: ['admin@example.com'],
  bcc: ['archive@example.com'],
  subject: 'Booking Confirmation',
  html: emailHtml,
})
```

---

## 📈 Production Checklist

เมื่อพร้อม production:

- [ ] เพิ่ม custom domain ใน Resend
- [ ] ตั้งค่า DNS records (SPF, DKIM, DMARC)
- [ ] อัปเดต `from` address
- [ ] ทดสอบส่ง email ไปหลาย providers (Gmail, Outlook, Yahoo)
- [ ] ตั้งค่า rate limiting
- [ ] เพิ่ม error notification (Slack/Discord)
- [ ] สร้าง email templates สำหรับ:
  - [ ] Booking confirmation
  - [ ] Booking cancellation
  - [ ] Event reminder (1 day before)
  - [ ] Check-in confirmation

---

## 💡 Tips

1. **Test Email Design:**
   - ใช้ https://www.emailonacid.com/ หรือ https://litmus.com/
   - ทดสอบบน mobile และ desktop

2. **Optimize Images:**
   - QR codes ใช้ขนาด 200x200px (เหมาะสม)
   - Compress images ก่อนส่ง

3. **Track Opens:**
   - Resend รองรับ tracking อัตโนมัติ
   - ดูได้ใน Dashboard

4. **Backup Plan:**
   - เก็บ booking data ไว้
   - สามารถส่ง email ใหม่ได้ทีหลัง

---

## 🔗 Resources

- [Resend Documentation](https://resend.com/docs)
- [Supabase Edge Functions](https://supabase.com/docs/guides/functions)
- [Email Best Practices](https://www.emailonacid.com/blog/article/email-development/email-development-best-practices-2/)

---

**Created:** 21 January 2026  
**Status:** ✅ Ready for Testing (Sandbox Mode)
