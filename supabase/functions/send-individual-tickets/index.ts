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
              <title>Your Ticket - AIA Concert 2025</title>
            </head>
            <body style="margin: 0; padding: 0; font-family: 'Inter', 'Sarabun', Helvetica, Arial, sans-serif; background-color: #F5F5F7; color: #1F2937;">
              <div style="max-width: 600px; margin: 0 auto; background-color: #FFFFFF; overflow: hidden;">
                
                <div style="background-color: ${tierColor}; padding: 40px 20px; text-align: center;">
                  <div style="margin-bottom: 16px;">
                    <span style="background: rgba(255,255,255,0.15); color: #ffffff; padding: 6px 16px; border-radius: 50px; font-size: 12px; font-weight: 700; letter-spacing: 1px;">AIA CONCERT 2025</span>
                  </div>
                  <h1 style="color: #ffffff; margin: 0; font-size: 28px; font-weight: 700; letter-spacing: -0.5px;">Your Ticket</h1>
                  <p style="color: rgba(255,255,255,0.9); margin: 8px 0 0 0; font-size: 16px;">ตั๋วของคุณพร้อมแล้ว!</p>
                </div>

                <div style="padding: 32px 24px;">
                  <div style="text-align: center; margin-bottom: 32px;">
                    <h2 style="font-size: 24px; font-weight: 700; margin: 0 0 8px 0; color: #111827;">${seat.first_name} ${seat.last_name}</h2>
                    <div style="display: inline-block; background: #FEF2F2; padding: 12px 32px; border-radius: 12px; border: 2px solid ${tierColor};">
                      <span style="color: #6B7280; font-size: 12px; font-weight: 600; text-transform: uppercase; display: block; margin-bottom: 4px;">Seat Number</span>
                      <div style="color: ${tierColor}; font-size: 32px; font-weight: 800; line-height: 1;">${seatNumber}</div>
                    </div>
                  </div>

                  <div style="background-color: #F9FAFB; padding: 24px; border-radius: 16px; margin-bottom: 32px;">
                    <table style="width: 100%; margin-bottom: 24px;">
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

                    <div style="text-align: center; padding: 24px; background: white; border-radius: 12px;">
                      <p style="margin: 0 0 16px 0; font-size: 14px; font-weight: 700; color: #374151;">Your QR Code</p>
                      <img src="${qrCodeUrl}" alt="QR Code" style="width: 200px; height: 200px; display: block; margin: 0 auto 16px auto;">
                      <p style="margin: 0; font-size: 13px; font-weight: 700; color: #6B7280; letter-spacing: 0.5px;">${seat.qr_token}</p>
                    </div>
                  </div>

                  <div style="background-color: #FEF2F2; padding: 20px; border-radius: 12px; border-left: 4px solid ${tierColor}; margin-bottom: 24px;">
                    <h3 style="margin: 0 0 12px 0; font-size: 14px; text-transform: uppercase; color: #991B1B; letter-spacing: 0.5px;">⚠️ Important</h3>
                    <ul style="margin: 0; padding-left: 20px; color: #4B5563; font-size: 14px; line-height: 1.6;">
                      <li style="margin-bottom: 6px;">แสดง QR Code นี้ที่จุดลงทะเบียน</li>
                      <li style="margin-bottom: 6px;">QR Code สามารถสแกนได้เพียง 1 ครั้ง</li>
                      <li style="margin-bottom: 6px;">กรุณามาถึงก่อนเวลาเริ่มแสดง 30 นาที</li>
                      <li>ห้ามแชร์ QR Code ให้กับผู้อื่น</li>
                    </ul>
                  </div>

                  <div style="text-align: center; padding: 16px; background: #F9FAFB; border-radius: 8px;">
                    <p style="margin: 0 0 4px 0; font-size: 12px; color: #6B7280;">Tier</p>
                    <span style="background: ${tierColor}; color: white; font-size: 14px; font-weight: 700; padding: 6px 16px; border-radius: 6px; display: inline-block;">${tierName}</span>
                  </div>
                </div>

                <div style="background-color: #F3F4F6; padding: 32px 24px; text-align: center; border-top: 1px solid #E5E7EB;">
                  <p style="margin: 0 0 8px 0; font-size: 14px; font-weight: 600; color: #374151;">Need Help?</p>
                  <p style="margin: 0 0 24px 0; font-size: 14px; color: #6B7280;">Contact us at <a href="mailto:support@aiaconcert.com" style="color: ${tierColor}; text-decoration: none;">support@aiaconcert.com</a></p>
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
