import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { bookingId } = await req.json()

    console.log('Received bookingId:', bookingId)

    if (!bookingId) {
      throw new Error('Booking ID is required')
    }

    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: req.headers.get('Authorization')! },
        },
      }
    )

    console.log('Fetching booking:', bookingId)

    // Fetch booking with all seats
    const { data: booking, error: bookingError } = await supabaseClient
      .from('bookings')
      .select(`
        *,
        booking_seats (
          id,
          first_name,
          last_name,
          email,
          phone,
          qr_token,
          seats!booking_seats_seat_id_fkey (
            row,
            number,
            tier_id,
            zones (
              name,
              tiers (
                name,
                color
              )
            )
          )
        )
      `)
      .eq('id', bookingId)
      .single()

    console.log('Booking query result:', { booking, error: bookingError })

    if (bookingError) {
      console.error('Booking error details:', bookingError)
      throw new Error(`Booking query failed: ${bookingError.message}`)
    }

    if (!booking) {
      throw new Error('Booking not found')
    }

    if (!booking.booking_seats || booking.booking_seats.length === 0) {
      throw new Error('No booking seats found')
    }

    console.log(`Processing ${booking.booking_seats.length} tickets for booking ${bookingId}`)

    const emailResults = []
    const errors = []

    // Send individual email for each seat
    for (const seat of booking.booking_seats) {
      try {
        // Skip if no email
        if (!seat.email) {
          console.log(`Skipping seat ${seat.id} - no email provided`)
          continue
        }

        const seatNumber = `${seat.seats.row}${seat.seats.number.toString().padStart(2, '0')}`
        const tierName = seat.seats.zones?.tiers?.name || 'STANDARD'
        const tierColor = seat.seats.zones?.tiers?.color || '#D31145'

        // Generate QR code
        const qrData = JSON.stringify({
          qrToken: seat.qr_token,
          bookingId: booking.phone,
          attendee: `${seat.first_name} ${seat.last_name}`,
          seat: seatNumber,
          tier: tierName,
          timestamp: Date.now()
        })
        const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(qrData)}&color=000000&bgcolor=FFFFFF`

        // Email HTML for individual ticket
        const emailHtml = `
          <!DOCTYPE html>
          <html>
            <head>
              <meta charset="utf-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Booking Confirmed - AIA Concert 2025</title>
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
                
                <div style="background-color: #E4002B; padding: 40px 20px; text-align: center;">
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
                    <h2 style="font-size: 18px; font-weight: 700; margin: 0 0 20px 0; color: #111827;">Your Ticket</h2>

                    <div style="border: 1px solid #E5E7EB; border-radius: 16px; overflow: hidden; margin-bottom: 24px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
                      <div style="background: #FAFAFA; padding: 16px 20px; border-bottom: 1px dashed #D1D5DB;">
                        <table style="width: 100%;">
                          <tr>
                            <td style="text-align: left;">
                              <span style="font-weight: 700; font-size: 14px; color: #374151;">${seat.first_name} ${seat.last_name}</span>
                            </td>
                            <td style="text-align: right;">
                              <span style="background: #E4002B; color: white; font-size: 11px; font-weight: 700; padding: 4px 10px; border-radius: 4px;">${tierName}</span>
                            </td>
                          </tr>
                        </table>
                      </div>
                      <div style="padding: 24px; text-align: center;">
                        <img src="${qrCodeUrl}" alt="QR Code" style="width: 160px; height: 160px; display: block; margin: 0 auto 12px auto;">
                        <p style="margin: 0 0 20px 0; font-size: 13px; font-weight: 700; color: #6B7280; letter-spacing: 0.5px;">${seat.qr_token}</p>
                        
                        <div style="display: inline-block; background: #FEF2F2; padding: 8px 24px; border-radius: 8px; border: 1px solid #FEE2E2;">
                          <span style="color: #991B1B; font-size: 12px; font-weight: 600; text-transform: uppercase;">Seat Number</span>
                          <div style="color: #E4002B; font-size: 24px; font-weight: 800; line-height: 1.2;">${seatNumber}</div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div style="background-color: #F9FAFB; padding: 24px; border-radius: 12px; margin-bottom: 32px;">
                    <h3 style="margin: 0 0 16px 0; font-size: 16px; font-weight: 700;">Order Summary</h3>
                    <table style="width: 100%; font-size: 14px;">
                      <tr>
                        <td style="padding-bottom: 8px; color: #6B7280;">Booking ID</td>
                        <td style="padding-bottom: 8px; text-align: right; font-weight: 600; color: #111827;">${booking.id}</td>
                      </tr>
                      <tr>
                        <td style="padding-bottom: 8px; color: #6B7280;">Attendee</td>
                        <td style="padding-bottom: 8px; text-align: right; font-weight: 600; color: #111827;">${seat.first_name} ${seat.last_name}</td>
                      </tr>
                      <tr>
                        <td style="color: #6B7280;">Seat</td>
                        <td style="text-align: right; font-weight: 600; color: #111827;">${seatNumber}</td>
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
                  <p style="margin: 0 0 24px 0; font-size: 14px; color: #6B7280;">Contact us at <a href="mailto:support@aiaconcert.com" style="color: #E4002B; text-decoration: none;">support@aiaconcert.com</a></p>
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
            from: 'AIA Concert <onboarding@resend.dev>',
            to: [seat.email],
            subject: `🎫 Your Ticket - AIA Concert 2025 | Seat ${seatNumber}`,
            html: emailHtml,
          }),
        })

        const data = await res.json()

        if (!res.ok) {
          console.error(`Failed to send email to ${seat.email}:`, data)
          errors.push({
            email: seat.email,
            seat: seatNumber,
            error: data.message || 'Failed to send email'
          })
        } else {
          console.log(`Email sent successfully to ${seat.email} for seat ${seatNumber}`)
          emailResults.push({
            email: seat.email,
            seat: seatNumber,
            emailId: data.id
          })
        }

      } catch (error) {
        console.error(`Error processing seat ${seat.id}:`, error)
        errors.push({
          email: seat.email,
          seat: `${seat.seats.row}${seat.seats.number}`,
          error: error.message
        })
      }
    }

    return new Response(
      JSON.stringify({ 
        success: true,
        message: `Sent ${emailResults.length} emails successfully`,
        sent: emailResults.length,
        failed: errors.length,
        results: emailResults,
        errors: errors
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
