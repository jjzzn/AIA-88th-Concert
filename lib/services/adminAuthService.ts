import { supabase } from '../supabase';

export interface AdminUser {
  id: string;
  username: string;
  full_name: string;
  email: string;
  role: string;
  is_active: boolean;
}

export interface AdminSession {
  admin_user_id: string;
  username: string;
  full_name: string;
  email: string;
  role: string;
  is_valid: boolean;
}

export interface LoginCredentials {
  username: string;
  password: string;
}

export interface LoginResult {
  success: boolean;
  session_token?: string;
  admin_user?: AdminUser;
  error?: string;
}

export const adminAuthService = {
  /**
   * Login admin user
   * Note: In production, implement proper password hashing with bcrypt
   */
  async login(credentials: LoginCredentials): Promise<LoginResult> {
    try {
      // For now, use simple authentication
      // In production, you should hash passwords and compare hashes
      const { data: adminUser, error } = await supabase
        .from('admin_users')
        .select('*')
        .eq('username', credentials.username)
        .eq('is_active', true)
        .single();

      if (error || !adminUser) {
        return { success: false, error: 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง' };
      }

      // TODO: In production, verify password hash with bcrypt
      // For now, we'll generate a session token
      const sessionToken = this.generateSessionToken();

      // Create session
      const { error: sessionError } = await supabase.rpc('create_admin_session', {
        p_admin_user_id: adminUser.id,
        p_session_token: sessionToken,
        p_ip_address: null,
        p_user_agent: navigator.userAgent,
        p_expires_in_hours: 24,
      });

      if (sessionError) {
        console.error('Error creating session:', sessionError);
        return { success: false, error: 'ไม่สามารถสร้าง session ได้' };
      }

      // Store session token in localStorage
      localStorage.setItem('admin_session_token', sessionToken);

      return {
        success: true,
        session_token: sessionToken,
        admin_user: {
          id: adminUser.id,
          username: adminUser.username,
          full_name: adminUser.full_name,
          email: adminUser.email,
          role: adminUser.role,
          is_active: adminUser.is_active,
        },
      };
    } catch (error) {
      console.error('Login error:', error);
      return { success: false, error: 'เกิดข้อผิดพลาดในการเข้าสู่ระบบ' };
    }
  },

  /**
   * Validate current session
   */
  async validateSession(): Promise<AdminSession | null> {
    try {
      const sessionToken = localStorage.getItem('admin_session_token');
      if (!sessionToken) {
        return null;
      }

      const { data, error } = await supabase.rpc('validate_admin_session', {
        p_session_token: sessionToken,
      });

      if (error || !data || data.length === 0) {
        localStorage.removeItem('admin_session_token');
        return null;
      }

      const session = data[0];
      if (!session.is_valid) {
        localStorage.removeItem('admin_session_token');
        return null;
      }

      return session;
    } catch (error) {
      console.error('Session validation error:', error);
      return null;
    }
  },

  /**
   * Logout admin user
   */
  async logout(): Promise<void> {
    try {
      const sessionToken = localStorage.getItem('admin_session_token');
      if (sessionToken) {
        // Delete session from database
        await supabase
          .from('admin_sessions')
          .delete()
          .eq('session_token', sessionToken);
      }
      localStorage.removeItem('admin_session_token');
    } catch (error) {
      console.error('Logout error:', error);
    }
  },

  /**
   * Get current admin user
   */
  async getCurrentAdmin(): Promise<AdminUser | null> {
    const session = await this.validateSession();
    if (!session) {
      return null;
    }

    return {
      id: session.admin_user_id,
      username: session.username,
      full_name: session.full_name,
      email: session.email,
      role: session.role,
      is_active: true,
    };
  },

  /**
   * Generate random session token
   */
  generateSessionToken(): string {
    return `admin_${Date.now()}_${Math.random().toString(36).substring(2, 15)}`;
  },

  /**
   * Log admin action
   */
  async logAction(params: {
    action_type: string;
    booking_id?: string;
    booking_seat_id?: string;
    details?: Record<string, any>;
  }): Promise<void> {
    try {
      const admin = await this.getCurrentAdmin();
      if (!admin) {
        console.warn('No admin user found for logging action');
        return;
      }

      await supabase.rpc('log_admin_action', {
        p_admin_user_id: admin.id,
        p_action_type: params.action_type,
        p_booking_id: params.booking_id || null,
        p_booking_seat_id: params.booking_seat_id || null,
        p_details: params.details ? JSON.stringify(params.details) : null,
        p_ip_address: null,
        p_user_agent: navigator.userAgent,
      });
    } catch (error) {
      console.error('Error logging admin action:', error);
    }
  },

  /**
   * Get admin action history
   */
  async getActionHistory(limit: number = 100): Promise<any[]> {
    try {
      const { data, error } = await supabase
        .from('admin_action_history')
        .select('*')
        .order('created_at', { ascending: false })
        .limit(limit);

      if (error) {
        console.error('Error fetching action history:', error);
        return [];
      }

      return data || [];
    } catch (error) {
      console.error('Error fetching action history:', error);
      return [];
    }
  },
};
