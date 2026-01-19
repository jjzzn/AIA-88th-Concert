export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      tiers: {
        Row: {
          id: string
          name: string
          level: string
          price: number
          color: string
          description: string
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          level: string
          price: number
          color: string
          description: string
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          level?: string
          price?: number
          color?: string
          description?: string
          created_at?: string
        }
      }
      zones: {
        Row: {
          id: string
          name: string
          tier_id: string
          capacity: number
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          tier_id: string
          capacity: number
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          tier_id?: string
          capacity?: number
          created_at?: string
        }
      }
      seats: {
        Row: {
          id: string
          row: string
          number: number
          tier_id: string
          zone_id: string
          is_booked: boolean
          created_at: string
        }
        Insert: {
          id?: string
          row: string
          number: number
          tier_id: string
          zone_id: string
          is_booked?: boolean
          created_at?: string
        }
        Update: {
          id?: string
          row?: string
          number?: number
          tier_id?: string
          zone_id?: string
          is_booked?: boolean
          created_at?: string
        }
      }
      access_codes: {
        Row: {
          id: string
          code: string
          tier_id: string
          is_used: boolean
          used_at: string | null
          created_at: string
        }
        Insert: {
          id?: string
          code: string
          tier_id: string
          is_used?: boolean
          used_at?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          code?: string
          tier_id?: string
          is_used?: boolean
          used_at?: string | null
          created_at?: string
        }
      }
      bookings: {
        Row: {
          id: string
          email: string
          phone: string
          total_amount: number
          status: string
          created_at: string
        }
        Insert: {
          id?: string
          email: string
          phone: string
          total_amount: number
          status?: string
          created_at?: string
        }
        Update: {
          id?: string
          email?: string
          phone?: string
          total_amount?: number
          status?: string
          created_at?: string
        }
      }
      booking_seats: {
        Row: {
          id: string
          booking_id: string
          seat_id: string
          first_name: string
          last_name: string
          created_at: string
        }
        Insert: {
          id?: string
          booking_id: string
          seat_id: string
          first_name: string
          last_name: string
          created_at?: string
        }
        Update: {
          id?: string
          booking_id?: string
          seat_id?: string
          first_name?: string
          last_name?: string
          created_at?: string
        }
      }
      booking_codes: {
        Row: {
          id: string
          booking_id: string
          code_id: string
          created_at: string
        }
        Insert: {
          id?: string
          booking_id: string
          code_id: string
          created_at?: string
        }
        Update: {
          id?: string
          booking_id?: string
          code_id?: string
          created_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
  }
}
