import { supabase } from '../supabase';

export interface AdminManager {
  id: string;
  username: string;
  full_name: string;
  email: string;
  role: 'manager' | 'superadmin';
  is_active: boolean;
}

export interface LoginCredentials {
  username: string;
  password: string;
}

export interface LoginResult {
  success: boolean;
  error?: string;
  sessionToken?: string;
  admin?: AdminManager;
}

const SESSION_STORAGE_KEY = 'admin_manager_session';

export const adminManagerAuthService = {
  /**
   * Login admin manager
   */
  async login(credentials: LoginCredentials): Promise<LoginResult> {
    try {
      const { data: manager, error } = await supabase
        .from('admin_managers')
        .select('*')
        .eq('username', credentials.username)
        .eq('is_active', true)
        .single();

      if (error || !manager) {
        return { success: false, error: 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง' };
      }

      // Simple password verification (comparing with stored password_hash)
      // In production, this should use bcrypt.compare() for hashed passwords
      // For now, we'll do a simple string comparison
      if (manager.password_hash !== credentials.password) {
        return { success: false, error: 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง' };
      }

      // Generate session token
      const sessionToken = this.generateSessionToken();

      // Create session in database
      const expiresAt = new Date();
      expiresAt.setHours(expiresAt.getHours() + 24); // 24 hour session

      const { error: sessionError } = await supabase
        .from('admin_manager_sessions')
        .insert({
          manager_id: manager.id,
          session_token: sessionToken,
          ip_address: null,
          user_agent: navigator.userAgent,
          expires_at: expiresAt.toISOString(),
        });

      if (sessionError) {
        console.error('Error creating session:', sessionError);
        return { success: false, error: 'ไม่สามารถสร้าง session ได้' };
      }

      // Update last login
      await supabase
        .from('admin_managers')
        .update({ last_login: new Date().toISOString() })
        .eq('id', manager.id);

      // Store session token in localStorage
      localStorage.setItem(SESSION_STORAGE_KEY, sessionToken);

      return {
        success: true,
        sessionToken,
        admin: {
          id: manager.id,
          username: manager.username,
          full_name: manager.full_name,
          email: manager.email,
          role: manager.role,
          is_active: manager.is_active,
        },
      };
    } catch (error) {
      console.error('Login error:', error);
      return { success: false, error: 'เกิดข้อผิดพลาดในการเข้าสู่ระบบ' };
    }
  },

  /**
   * Validate session and get current admin
   */
  async validateSession(): Promise<AdminManager | null> {
    try {
      const sessionToken = localStorage.getItem(SESSION_STORAGE_KEY);
      if (!sessionToken) {
        return null;
      }

      // Check session in database
      const { data: session, error } = await supabase
        .from('admin_manager_sessions')
        .select(`
          *,
          admin_managers (
            id,
            username,
            full_name,
            email,
            role,
            is_active
          )
        `)
        .eq('session_token', sessionToken)
        .single();

      if (error || !session) {
        this.logout();
        return null;
      }

      // Check if session is expired
      const now = new Date();
      const expiresAt = new Date(session.expires_at);
      if (now > expiresAt) {
        this.logout();
        return null;
      }

      // Check if admin is still active
      const manager = session.admin_managers as any;
      if (!manager || !manager.is_active) {
        this.logout();
        return null;
      }

      // Update last activity
      await supabase
        .from('admin_manager_sessions')
        .update({ last_activity: new Date().toISOString() })
        .eq('session_token', sessionToken);

      return {
        id: manager.id,
        username: manager.username,
        full_name: manager.full_name,
        email: manager.email,
        role: manager.role,
        is_active: manager.is_active,
      };
    } catch (error) {
      console.error('Session validation error:', error);
      return null;
    }
  },

  /**
   * Logout
   */
  async logout(): Promise<void> {
    try {
      const sessionToken = localStorage.getItem(SESSION_STORAGE_KEY);
      if (sessionToken) {
        // Delete session from database
        await supabase
          .from('admin_manager_sessions')
          .delete()
          .eq('session_token', sessionToken);
      }
    } catch (error) {
      console.error('Logout error:', error);
    } finally {
      localStorage.removeItem(SESSION_STORAGE_KEY);
    }
  },

  /**
   * Get current admin
   */
  async getCurrentAdmin(): Promise<AdminManager | null> {
    return this.validateSession();
  },

  /**
   * Generate random session token
   */
  generateSessionToken(): string {
    return Array.from(crypto.getRandomValues(new Uint8Array(32)))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('');
  },

  /**
   * Check if user is logged in
   */
  isLoggedIn(): boolean {
    return !!localStorage.getItem(SESSION_STORAGE_KEY);
  },
};
