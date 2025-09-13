# SalesProRedwoodsKenyan - System Overview

## System Architecture

A modern Point of Sale (POS) system built with React, TypeScript, and Supabase, converted from a Laravel-based system.

### Technology Stack

**Frontend:**
- React 18 with TypeScript
- Tailwind CSS for styling
- Shadcn/ui components
- React Query for data fetching
- Zustand for state management
- React Hook Form for forms
- Recharts for analytics

**Backend:**
- Supabase (PostgreSQL database)
- Row Level Security (RLS)
- Edge Functions for business logic
- Real-time subscriptions

**Authentication:**
- Supabase Auth
- Role-based access control
- Session management

### Core Features

1. **Point of Sale Interface**
   - Real-time product search
   - Cart management
   - Payment processing
   - Receipt generation

2. **Inventory Management**
   - Product catalog
   - Stock tracking
   - Warehouse management
   - Product variants

3. **Sales Management**
   - Sales transactions
   - Quotations
   - Customer management
   - Payment tracking

4. **Purchasing System**
   - Purchase orders
   - Supplier management
   - Receiving goods
   - Purchase payments

5. **Manufacturing Module**
   - Production planning
   - Bill of materials
   - Production tracking

6. **Transfer Management**
   - Inter-warehouse transfers
   - Transfer approvals
   - Stock movements

7. **Reporting & Analytics**
   - Sales reports
   - Inventory reports
   - Financial analytics
   - Real-time dashboards

8. **Multi-tenant Architecture**
   - User roles and permissions
   - Biller management
   - Warehouse isolation

### Security Features

- Row Level Security (RLS) policies
- JWT token authentication
- Role-based permissions
- Secure API endpoints
- Data encryption