import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

interface BookingData {
  bookingId: string
  email: string
  phone: string
  attendees: Array<{
    firstName: string
    lastName: string
    seat: string
    qrToken: string
  }>
  tier: string
}

serve(async (req) => {
  // Handle CORS preflight requests
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { bookingId } = await req.json()

    if (!bookingId) {
      throw new Error('Booking ID is required')
    }

    // Initialize Supabase client
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: req.headers.get('Authorization')! },
        },
      }
    )

    // Fetch booking details
    const { data: booking, error: bookingError } = await supabaseClient
      .from('bookings')
      .select(`
        *,
        booking_seats (
          first_name,
          last_name,
          qr_token,
          seats (
            row,
            number,
            tiers (
              name,
              color
            )
          )
        )
      `)
      .eq('id', bookingId)
      .single()

    if (bookingError || !booking) {
      throw new Error('Booking not found')
    }

    // Prepare email data
    const attendees = booking.booking_seats.map((bs: any) => ({
      firstName: bs.first_name,
      lastName: bs.last_name,
      seat: `${bs.seats.row}${bs.seats.number.toString().padStart(2, '0')}`,
      qrToken: bs.qr_token,
      tier: bs.seats.tiers.name,
    }))

    const tierName = attendees[0]?.tier || 'STANDARD'

    // Generate QR code URLs for each ticket
    const ticketsHtml = attendees.map((att: any, index: number) => {
      const qrData = JSON.stringify({
        qrToken: att.qrToken,
        bookingId: booking.phone,
        attendee: `${att.firstName} ${att.lastName}`,
        seat: att.seat,
        tier: att.tier,
        timestamp: Date.now()
      })
      const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(qrData)}&color=000000&bgcolor=FFFFFF`
      
      return `
        <div style="border: 1px solid #E5E7EB; border-radius: 16px; overflow: hidden; margin-bottom: 24px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
          <div style="background: #FAFAFA; padding: 16px 20px; border-bottom: 1px dashed #D1D5DB;">
            <table style="width: 100%;">
              <tr>
                <td><span style="font-weight: 700; font-size: 14px; color: #374151;">#${index + 1} ${att.firstName} ${att.lastName}</span></td>
                <td style="text-align: right;"><span style="background: #D31145; color: white; font-size: 11px; font-weight: 700; padding: 4px 10px; border-radius: 4px;">${att.tier}</span></td>
              </tr>
            </table>
          </div>
          <div style="padding: 24px; text-align: center;">
            <img src="${qrCodeUrl}" alt="QR Code" style="width: 160px; height: 160px; display: block; margin: 0 auto 12px auto;">
            <p style="margin: 0 0 20px 0; font-size: 13px; font-weight: 700; color: #6B7280; letter-spacing: 0.5px;">${att.qrToken}</p>
            
            <div style="display: inline-block; background: #FEF2F2; padding: 8px 24px; border-radius: 8px; border: 1px solid #FEE2E2;">
              <span style="color: #991B1B; font-size: 12px; font-weight: 600; text-transform: uppercase; display: block;">Seat Number</span>
              <div style="color: #D31145; font-size: 24px; font-weight: 800; line-height: 1.2;">${att.seat}</div>
            </div>
          </div>
        </div>
      `
    }).join('')

    // Email HTML template
    const emailHtml = `
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Booking Confirmation - AIA Concert 2025</title>
          <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&family=Sarabun:wght@400;500;700&display=swap');
            body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
            table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }
            img { -ms-interpolation-mode: bicubic; border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }
            table { border-collapse: collapse !important; }
            body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }
          </style>
        </head>
        <body style="margin: 0; padding: 0; font-family: 'Inter', 'Sarabun', Helvetica, Arial, sans-serif; background-color: #F5F5F7; color: #1F2937;">
          <div style="max-width: 600px; margin: 0 auto; background-color: #FFFFFF; overflow: hidden; font-family: 'Inter', 'Sarabun', sans-serif;">
            
            <div style="background-color: #D31145; padding: 40px 20px; text-align: center;">
              <div style="margin-bottom: 16px;">
                <span style="background: rgba(255,255,255,0.15); color: #ffffff; padding: 6px 16px; border-radius: 50px; font-size: 12px; font-weight: 700; letter-spacing: 1px;">AIA CONCERT 2025</span>
              </div>
              <h1 style="color: #ffffff; margin: 0; font-size: 28px; font-weight: 700; letter-spacing: -0.5px;">Booking Confirmed</h1>
              <p style="color: rgba(255,255,255,0.9); margin: 8px 0 0 0; font-size: 16px;">ขอบคุณสำหรับการจอง ตั๋วของคุณพร้อมแล้ว!</p>
            </div>

            <div style="padding: 32px 24px;">
              <table style="width: 100%; margin-bottom: 32px;">
                <tr>
                  <td style="vertical-align: top; padding-right: 12px; width: 50%;">
                    <p style="margin: 0 0 4px 0; font-size: 11px; text-transform: uppercase; color: #6B7280; font-weight: 700; letter-spacing: 0.5px;">DATE & TIME</p>
                    <p style="margin: 0; font-size: 16px; font-weight: 600; color: #111827;">24 May 2025</p>
                    <p style="margin: 2px 0 0 0; font-size: 14px; color: #6B7280;">19:00 PM</p>
                  </td>
                  <td style="vertical-align: top; padding-left: 12px; width: 50%;">
                    <p style="margin: 0 0 4px 0; font-size: 11px; text-transform: uppercase; color: #6B7280; font-weight: 700; letter-spacing: 0.5px;">LOCATION</p>
                    <p style="margin: 0; font-size: 16px; font-weight: 600; color: #111827;">IMPACT Arena</p>
                    <p style="margin: 2px 0 0 0; font-size: 14px; color: #6B7280;">Muang Thong Thani</p>
                  </td>
                </tr>
              </table>

              <div style="margin-bottom: 40px;">
                <h2 style="font-size: 18px; font-weight: 700; margin: 0 0 20px 0; color: #111827;">Your Tickets (${attendees.length})</h2>
                ${ticketsHtml}
              </div>

              <div style="background-color: #F9FAFB; padding: 24px; border-radius: 12px; margin-bottom: 32px;">
                <h3 style="margin: 0 0 16px 0; font-size: 16px; font-weight: 700;">Order Summary</h3>
                <table style="width: 100%; font-size: 14px;">
                  <tr>
                    <td style="padding-bottom: 8px; color: #6B7280;">Order ID</td>
                    <td style="padding-bottom: 8px; text-align: right; font-weight: 600; color: #111827;">${attendees[0]?.qrToken || 'N/A'}</td>
                  </tr>
                  <tr>
                    <td style="padding-bottom: 8px; color: #6B7280;">Customer</td>
                    <td style="padding-bottom: 8px; text-align: right; font-weight: 600; color: #111827;">${attendees[0]?.firstName || ''} ${attendees[0]?.lastName || ''}</td>
                  </tr>
                  <tr>
                    <td style="color: #6B7280;">Total Tickets</td>
                    <td style="text-align: right; font-weight: 600; color: #111827;">${attendees.length} Ticket${attendees.length > 1 ? 's' : ''}</td>
                  </tr>
                </table>
              </div>

              <div>
                <h3 style="margin: 0 0 12px 0; font-size: 14px; text-transform: uppercase; color: #9CA3AF; letter-spacing: 0.5px;">Important Info</h3>
                <ul style="margin: 0; padding-left: 20px; color: #4B5563; font-size: 14px; line-height: 1.6;">
                  <li style="margin-bottom: 6px;">แสดง QR Code ที่จุดลงทะเบียน (Check-in)</li>
                  <li style="margin-bottom: 6px;">QR Code สามารถสแกนได้เพียง 1 ครั้งต่อใบ</li>
                  <li style="margin-bottom: 6px;">กรุณามาถึงก่อนเวลาเริ่มแสดง 30 นาที</li>
                  <li>ห้ามแชร์ QR Code ให้กับผู้อื่น</li>
                </ul>
              </div>
            </div>

            <div style="background-color: #F3F4F6; padding: 32px 24px; text-align: center; border-top: 1px solid #E5E7EB;">
              <p style="margin: 0 0 8px 0; font-size: 14px; font-weight: 600; color: #374151;">Need Help?</p>
              <p style="margin: 0 0 24px 0; font-size: 14px; color: #6B7280;">Contact us at <a href="mailto:support@aiaconcert.com" style="color: #D31145; text-decoration: none;">support@aiaconcert.com</a></p>
              
              <p style="margin: 0; font-size: 12px; color: #9CA3AF;">© 2025 AIA Concert. All rights reserved.</p>
            </div>
          </div>
        </body>
      </html>
    `

    // Send email via Resend
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${RESEND_API_KEY}`,
      },
      body: JSON.stringify({
        from: 'AIA Concert <onboarding@resend.dev>', // Sandbox email
        to: [booking.email],
        subject: `🎫 Booking Confirmation - AIA Concert 2025 (${attendees.length} Ticket${attendees.length > 1 ? 's' : ''})`,
        html: emailHtml,
      }),
    })

    const data = await res.json()

    if (!res.ok) {
      throw new Error(data.message || 'Failed to send email')
    }

    return new Response(
      JSON.stringify({ 
        success: true, 
        message: 'Email sent successfully',
        emailId: data.id 
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
      },
    )
  } catch (error) {
    console.error('Error:', error)
    return new Response(
      JSON.stringify({ 
        success: false, 
        error: error.message 
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 400,
      },
    )
  }
})
