# SalesProRedwoodsKenyan - Authentication System

## Authentication Architecture

### Supabase Auth Integration
- **Provider:** Supabase Authentication
- **Method:** JWT-based authentication
- **Storage:** Secure token storage in localStorage
- **Session Management:** Automatic token refresh

### Authentication Flow
```typescript
// Auth flow diagram
User Login → Supabase Auth → JWT Token → Session Storage → Protected Routes
```

## User Authentication

### Login System
```typescript
interface LoginCredentials {
  email: string;
  password: string;
  rememberMe?: boolean;
}

const signIn = async (credentials: LoginCredentials) => {
  const { data, error } = await supabase.auth.signInWithPassword({
    email: credentials.email,
    password: credentials.password
  });
  
  if (error) throw error;
  return data;
};
```

### Registration System
```typescript
interface RegisterData {
  email: string;
  password: string;
  firstName: string;
  lastName: string;
  role: UserRole;
}

const signUp = async (userData: RegisterData) => {
  const { data, error } = await supabase.auth.signUp({
    email: userData.email,
    password: userData.password,
    options: {
      data: {
        first_name: userData.firstName,
        last_name: userData.lastName,
        role: userData.role
      }
    }
  });
  
  if (error) throw error;
  return data;
};
```

### Password Reset
```typescript
const resetPassword = async (email: string) => {
  const { error } = await supabase.auth.resetPasswordForEmail(email, {
    redirectTo: `${window.location.origin}/auth/reset-password`
  });
  
  if (error) throw error;
};
```

## User Roles and Permissions

### Role Definitions
```typescript
enum UserRole {
  SUPER_ADMIN = 'super_admin',
  ADMIN = 'admin',
  MANAGER = 'manager',
  CASHIER = 'cashier',
  WAREHOUSE_STAFF = 'warehouse_staff',
  SALES_PERSON = 'sales_person',
  ACCOUNTANT = 'accountant'
}
```

### Permission Matrix
```typescript
interface Permission {
  module: string;
  action: 'create' | 'read' | 'update' | 'delete';
  allowed: boolean;
}

const ROLE_PERMISSIONS: Record<UserRole, Permission[]> = {
  [UserRole.SUPER_ADMIN]: [
    // All permissions
  ],
  [UserRole.ADMIN]: [
    // Most permissions except system config
  ],
  [UserRole.MANAGER]: [
    // Management permissions
  ],
  [UserRole.CASHIER]: [
    // POS and basic sales permissions
  ],
  // ... other roles
};
```

### Module-Level Permissions

#### Sales Module
- **Create Sales:** Admin, Manager, Cashier, Sales Person
- **View Sales:** All roles
- **Edit Sales:** Admin, Manager
- **Delete Sales:** Admin only
- **Process Refunds:** Admin, Manager

#### Inventory Module
- **Manage Products:** Admin, Manager, Warehouse Staff
- **View Inventory:** All roles
- **Stock Adjustments:** Admin, Manager, Warehouse Staff
- **Warehouse Transfers:** Admin, Manager, Warehouse Staff

#### Financial Module
- **View Reports:** Admin, Manager, Accountant
- **Financial Settings:** Admin only
- **Payment Processing:** Admin, Manager, Cashier
- **Accounting Entries:** Admin, Accountant

#### User Management
- **Create Users:** Super Admin, Admin
- **Edit Users:** Super Admin, Admin
- **Assign Roles:** Super Admin only
- **View Users:** Admin, Manager

## Profile Management

### User Profile Schema
```sql
CREATE TABLE public.profiles (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  first_name text,
  last_name text,
  email text,
  phone text,
  avatar_url text,
  role user_role NOT NULL DEFAULT 'cashier',
  department text,
  warehouse_id uuid REFERENCES warehouses(id),
  is_active boolean DEFAULT true,
  last_login_at timestamp with time zone,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Profile RLS Policies
```sql
-- Users can view their own profile
CREATE POLICY "Users can view own profile"
  ON profiles FOR SELECT
  USING (auth.uid() = user_id);

-- Users can update their own profile
CREATE POLICY "Users can update own profile"
  ON profiles FOR UPDATE
  USING (auth.uid() = user_id);

-- Admins can view all profiles
CREATE POLICY "Admins can view all profiles"
  ON profiles FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE user_id = auth.uid()
      AND role IN ('super_admin', 'admin')
    )
  );
```

## Protected Routes

### Route Protection Hook
```typescript
const useAuth = () => {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null);
      setLoading(false);
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setUser(session?.user ?? null);
        setLoading(false);
      }
    );

    return () => subscription.unsubscribe();
  }, []);

  return { user, loading };
};
```

### Route Guard Component
```typescript
interface ProtectedRouteProps {
  children: React.ReactNode;
  requiredRole?: UserRole;
  requiredPermission?: string;
}

const ProtectedRoute: React.FC<ProtectedRouteProps> = ({
  children,
  requiredRole,
  requiredPermission
}) => {
  const { user, loading } = useAuth();
  const { profile } = useProfile();

  if (loading) return <LoadingSpinner />;
  
  if (!user) {
    return <Navigate to="/auth/login" replace />;
  }

  if (requiredRole && profile?.role !== requiredRole) {
    return <Navigate to="/unauthorized" replace />;
  }

  if (requiredPermission && !hasPermission(profile?.role, requiredPermission)) {
    return <Navigate to="/unauthorized" replace />;
  }

  return <>{children}</>;
};
```

## Session Management

### Session Storage
```typescript
const SessionManager = {
  getToken: () => localStorage.getItem('supabase.auth.token'),
  
  setToken: (token: string) => {
    localStorage.setItem('supabase.auth.token', token);
  },
  
  clearToken: () => {
    localStorage.removeItem('supabase.auth.token');
  },
  
  isTokenValid: async () => {
    const { data: { user } } = await supabase.auth.getUser();
    return !!user;
  }
};
```

### Auto-logout on Inactivity
```typescript
const useInactivityTimer = (timeoutMinutes: number = 30) => {
  const { signOut } = useAuth();
  
  useEffect(() => {
    let timeoutId: NodeJS.Timeout;
    
    const resetTimer = () => {
      clearTimeout(timeoutId);
      timeoutId = setTimeout(() => {
        signOut();
      }, timeoutMinutes * 60 * 1000);
    };
    
    // Reset timer on user activity
    const events = ['mousedown', 'mousemove', 'keypress', 'scroll', 'touchstart'];
    events.forEach(event => {
      document.addEventListener(event, resetTimer, true);
    });
    
    resetTimer(); // Start timer
    
    return () => {
      clearTimeout(timeoutId);
      events.forEach(event => {
        document.removeEventListener(event, resetTimer, true);
      });
    };
  }, [timeoutMinutes, signOut]);
};
```

## Multi-factor Authentication (Future)

### MFA Setup
```typescript
interface MFASetup {
  enableSMS: boolean;
  enableAuthenticator: boolean;
  enableEmail: boolean;
  backupCodes: string[];
}
```

### Security Features

#### Password Requirements
- Minimum 8 characters
- At least one uppercase letter
- At least one lowercase letter
- At least one number
- At least one special character

#### Account Security
- Failed login attempt tracking
- Account lockout after 5 failed attempts
- Password history (prevent reuse of last 5 passwords)
- Force password change every 90 days

#### Audit Logging
```typescript
interface AuditLog {
  id: string;
  user_id: string;
  action: string;
  resource: string;
  ip_address: string;
  user_agent: string;
  timestamp: Date;
  success: boolean;
}
```

## Error Handling

### Authentication Errors
```typescript
enum AuthError {
  INVALID_CREDENTIALS = 'invalid_credentials',
  ACCOUNT_LOCKED = 'account_locked',
  EMAIL_NOT_VERIFIED = 'email_not_verified',
  PASSWORD_EXPIRED = 'password_expired',
  INSUFFICIENT_PERMISSIONS = 'insufficient_permissions'
}

const handleAuthError = (error: AuthError) => {
  switch (error) {
    case AuthError.INVALID_CREDENTIALS:
      return 'Invalid email or password';
    case AuthError.ACCOUNT_LOCKED:
      return 'Account locked due to multiple failed attempts';
    // ... other cases
  }
};
```
