# SalesProRedwoodsKenyan - Data Models and Database Schema

## Database Architecture

### Supabase PostgreSQL Schema
- **Primary Schema:** `public` (application data)
- **Auth Schema:** `auth` (managed by Supabase)
- **Storage Schema:** `storage` (file management)

## Core Data Models

### User Management

#### Profiles Table
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

CREATE TYPE user_role AS ENUM (
  'super_admin',
  'admin', 
  'manager',
  'cashier',
  'warehouse_staff',
  'sales_person',
  'accountant'
);
```

### Product Management

#### Products Table
```sql
CREATE TABLE public.products (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  code text UNIQUE NOT NULL,
  type product_type DEFAULT 'standard',
  barcode_symbology text DEFAULT 'CODE128',
  brand_id uuid REFERENCES brands(id),
  category_id uuid NOT NULL REFERENCES categories(id),
  unit_id uuid NOT NULL REFERENCES units(id),
  purchase_unit_id uuid NOT NULL REFERENCES units(id),
  sale_unit_id uuid NOT NULL REFERENCES units(id),
  cost decimal(10,2) NOT NULL DEFAULT 0,
  price decimal(10,2) NOT NULL DEFAULT 0,
  qty decimal(10,2) DEFAULT 0,
  alert_quantity decimal(10,2) DEFAULT 0,
  promotion boolean DEFAULT false,
  promotion_price decimal(10,2),
  starting_date date,
  last_date date,
  tax_id uuid REFERENCES taxes(id),
  tax_method integer DEFAULT 1,
  image text,
  featured boolean DEFAULT false,
  product_details text,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE product_type AS ENUM ('standard', 'combo', 'digital', 'service');
```

#### Categories Table
```sql
CREATE TABLE public.categories (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  parent_id uuid REFERENCES categories(id),
  description text,
  image text,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Brands Table
```sql
CREATE TABLE public.brands (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  description text,
  logo text,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Units Table
```sql
CREATE TABLE public.units (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  code text NOT NULL,
  name text NOT NULL,
  base_unit_id uuid REFERENCES units(id),
  operator text CHECK (operator IN ('+', '-', '*', '/')),
  operation_value decimal(10,4),
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Inventory Management

#### Warehouses Table
```sql
CREATE TABLE public.warehouses (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  phone text,
  email text,
  address text,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Product Warehouse (Stock Levels)
```sql
CREATE TABLE public.product_warehouse (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  product_id uuid NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  warehouse_id uuid NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
  qty decimal(10,2) NOT NULL DEFAULT 0,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  UNIQUE(product_id, warehouse_id)
);
```

### Sales Management

#### Sales Table
```sql
CREATE TABLE public.sales (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  reference_no text NOT NULL UNIQUE,
  customer_id uuid REFERENCES customers(id),
  warehouse_id uuid NOT NULL REFERENCES warehouses(id),
  biller_id uuid NOT NULL REFERENCES billers(id),
  item integer NOT NULL DEFAULT 0,
  total_qty decimal(10,2) NOT NULL DEFAULT 0,
  total_discount decimal(10,2) NOT NULL DEFAULT 0,
  total_tax decimal(10,2) NOT NULL DEFAULT 0,
  total_price decimal(10,2) NOT NULL DEFAULT 0,
  grand_total decimal(10,2) NOT NULL DEFAULT 0,
  order_tax_rate decimal(5,2),
  order_tax decimal(10,2),
  order_discount decimal(10,2),
  shipping_cost decimal(10,2),
  sale_status sale_status DEFAULT 'completed',
  payment_status payment_status DEFAULT 'pending',
  document text,
  paid_amount decimal(10,2) DEFAULT 0,
  sale_note text,
  staff_note text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE sale_status AS ENUM ('pending', 'completed', 'cancelled');
CREATE TYPE payment_status AS ENUM ('pending', 'partial', 'paid', 'overpaid');
```

#### Product Sales (Sale Items)
```sql
CREATE TABLE public.product_sales (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  sale_id uuid NOT NULL REFERENCES sales(id) ON DELETE CASCADE,
  product_id uuid NOT NULL REFERENCES products(id),
  qty decimal(10,2) NOT NULL,
  sale_unit_id uuid NOT NULL REFERENCES units(id),
  net_unit_price decimal(10,2) NOT NULL,
  discount decimal(10,2) DEFAULT 0,
  tax_rate decimal(5,2) DEFAULT 0,
  tax decimal(10,2) DEFAULT 0,
  total decimal(10,2) NOT NULL,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Payments Table
```sql
CREATE TABLE public.payments (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  sale_id uuid REFERENCES sales(id),
  purchase_id uuid REFERENCES purchases(id),
  payment_reference text NOT NULL,
  amount decimal(10,2) NOT NULL,
  paying_method payment_method NOT NULL,
  payment_note text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE payment_method AS ENUM (
  'cash',
  'card',
  'bank_transfer',
  'mobile_money',
  'check',
  'gift_card'
);
```

### Purchase Management

#### Purchases Table
```sql
CREATE TABLE public.purchases (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  reference_no text NOT NULL UNIQUE,
  warehouse_id uuid NOT NULL REFERENCES warehouses(id),
  supplier_id uuid REFERENCES suppliers(id),
  item integer NOT NULL DEFAULT 0,
  total_qty decimal(10,2) NOT NULL DEFAULT 0,
  total_discount decimal(10,2) NOT NULL DEFAULT 0,
  total_tax decimal(10,2) NOT NULL DEFAULT 0,
  total_cost decimal(10,2) NOT NULL DEFAULT 0,
  order_tax_rate decimal(5,2),
  order_tax decimal(10,2),
  order_discount decimal(10,2),
  shipping_cost decimal(10,2),
  grand_total decimal(10,2) NOT NULL DEFAULT 0,
  paid_amount decimal(10,2) DEFAULT 0,
  status purchase_status DEFAULT 'pending',
  payment_status payment_status DEFAULT 'pending',
  document text,
  note text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE purchase_status AS ENUM ('pending', 'ordered', 'received', 'cancelled');
```

#### Product Purchases (Purchase Items)
```sql
CREATE TABLE public.product_purchases (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  purchase_id uuid NOT NULL REFERENCES purchases(id) ON DELETE CASCADE,
  product_id uuid NOT NULL REFERENCES products(id),
  qty decimal(10,2) NOT NULL,
  received decimal(10,2) DEFAULT 0,
  purchase_unit_id uuid NOT NULL REFERENCES units(id),
  net_unit_cost decimal(10,2) NOT NULL,
  discount decimal(10,2) DEFAULT 0,
  tax_rate decimal(5,2) DEFAULT 0,
  tax decimal(10,2) DEFAULT 0,
  total decimal(10,2) NOT NULL,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Customer Management

#### Customers Table
```sql
CREATE TABLE public.customers (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  customer_group_id uuid REFERENCES customer_groups(id),
  name text NOT NULL,
  company_name text,
  email text,
  phone_number text,
  address text,
  city text,
  state text,
  postal_code text,
  country text,
  credit_limit decimal(10,2) DEFAULT 0,
  current_balance decimal(10,2) DEFAULT 0,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Customer Groups Table
```sql
CREATE TABLE public.customer_groups (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  percentage decimal(5,2) DEFAULT 0,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Supplier Management

#### Suppliers Table
```sql
CREATE TABLE public.suppliers (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  company_name text,
  email text,
  phone_number text,
  address text,
  city text,
  state text,
  postal_code text,
  country text,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Manufacturing

#### Productions Table
```sql
CREATE TABLE public.productions (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  reference_no text NOT NULL UNIQUE,
  user_id uuid NOT NULL REFERENCES auth.users(id),
  warehouse_id uuid NOT NULL REFERENCES warehouses(id),
  item integer NOT NULL DEFAULT 0,
  total_qty decimal(10,2) NOT NULL DEFAULT 0,
  total_tax decimal(10,2) NOT NULL DEFAULT 0,
  total_cost decimal(10,2) NOT NULL DEFAULT 0,
  shipping_cost decimal(10,2),
  grand_total decimal(10,2) NOT NULL DEFAULT 0,
  status production_status DEFAULT 'pending',
  document text,
  note text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE production_status AS ENUM ('pending', 'in_progress', 'completed', 'cancelled');
```

#### Product Productions (Production Items)
```sql
CREATE TABLE public.product_productions (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  production_id uuid NOT NULL REFERENCES productions(id) ON DELETE CASCADE,
  product_id uuid NOT NULL REFERENCES products(id),
  qty decimal(10,2) NOT NULL,
  received decimal(10,2) DEFAULT 0,
  purchase_unit_id uuid NOT NULL REFERENCES units(id),
  net_unit_cost decimal(10,2) NOT NULL,
  tax_rate decimal(5,2) DEFAULT 0,
  tax decimal(10,2) DEFAULT 0,
  total decimal(10,2) NOT NULL,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Transfer Management

#### Transfers Table
```sql
CREATE TABLE public.transfers (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  reference_no text NOT NULL UNIQUE,
  status transfer_status DEFAULT 'pending',
  from_warehouse_id uuid NOT NULL REFERENCES warehouses(id),
  to_warehouse_id uuid NOT NULL REFERENCES warehouses(id),
  item integer NOT NULL DEFAULT 0,
  total_qty decimal(10,2) NOT NULL DEFAULT 0,
  total_tax decimal(10,2) NOT NULL DEFAULT 0,
  total_cost decimal(10,2) NOT NULL DEFAULT 0,
  shipping_cost decimal(10,2),
  grand_total decimal(10,2) NOT NULL DEFAULT 0,
  document text,
  note text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE transfer_status AS ENUM ('pending', 'sent', 'received', 'cancelled');
```

#### Product Transfers (Transfer Items)
```sql
CREATE TABLE public.product_transfers (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  transfer_id uuid NOT NULL REFERENCES transfers(id) ON DELETE CASCADE,
  product_id uuid NOT NULL REFERENCES products(id),
  qty decimal(10,2) NOT NULL,
  purchase_unit_id uuid NOT NULL REFERENCES units(id),
  net_unit_cost decimal(10,2) NOT NULL,
  tax_rate decimal(5,2) DEFAULT 0,
  tax decimal(10,2) DEFAULT 0,
  total decimal(10,2) NOT NULL,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### Quotations

#### Quotations Table
```sql
CREATE TABLE public.quotations (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  reference_no text NOT NULL UNIQUE,
  biller_id uuid NOT NULL REFERENCES billers(id),
  supplier_id uuid REFERENCES suppliers(id),
  customer_id uuid NOT NULL REFERENCES customers(id),
  warehouse_id uuid NOT NULL REFERENCES warehouses(id),
  item integer NOT NULL DEFAULT 0,
  total_qty decimal(10,2) NOT NULL DEFAULT 0,
  total_discount decimal(10,2) NOT NULL DEFAULT 0,
  total_tax decimal(10,2) NOT NULL DEFAULT 0,
  total_price decimal(10,2) NOT NULL DEFAULT 0,
  order_tax_rate decimal(5,2),
  order_tax decimal(10,2),
  order_discount decimal(10,2),
  shipping_cost decimal(10,2),
  grand_total decimal(10,2) NOT NULL DEFAULT 0,
  quotation_status quotation_status DEFAULT 'pending',
  document text,
  note text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TYPE quotation_status AS ENUM ('pending', 'sent', 'accepted', 'declined', 'expired');
```

#### Product Quotations (Quotation Items)
```sql
CREATE TABLE public.product_quotations (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  quotation_id uuid NOT NULL REFERENCES quotations(id) ON DELETE CASCADE,
  product_id uuid NOT NULL REFERENCES products(id),
  qty decimal(10,2) NOT NULL,
  sale_unit_id uuid NOT NULL REFERENCES units(id),
  net_unit_price decimal(10,2) NOT NULL,
  discount decimal(10,2) DEFAULT 0,
  tax_rate decimal(5,2) DEFAULT 0,
  tax decimal(10,2) DEFAULT 0,
  total decimal(10,2) NOT NULL,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

### System Configuration

#### Billers Table
```sql
CREATE TABLE public.billers (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  image text,
  company_name text,
  vat_number text,
  email text,
  phone_number text,
  address text,
  city text,
  state text,
  postal_code text,
  country text,
  is_active boolean DEFAULT true,
  pos_accnt_id text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Taxes Table
```sql
CREATE TABLE public.taxes (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  rate decimal(5,2) NOT NULL,
  is_active boolean DEFAULT true,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

#### Variants Table
```sql
CREATE TABLE public.variants (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);
```

## Row Level Security (RLS) Policies

### Basic RLS Pattern
```sql
-- Enable RLS on all tables
ALTER TABLE table_name ENABLE ROW LEVEL SECURITY;

-- Users can only access data from their assigned warehouse
CREATE POLICY "warehouse_isolation" ON table_name
  FOR ALL USING (
    warehouse_id = (
      SELECT warehouse_id FROM profiles 
      WHERE user_id = auth.uid()
    )
  );

-- Role-based access control
CREATE POLICY "role_based_access" ON table_name
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM profiles
      WHERE user_id = auth.uid()
      AND role IN ('admin', 'manager')
    )
  );
```

## Database Functions and Triggers

### Auto-update timestamps
```sql
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply to all tables
CREATE TRIGGER update_products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
```

### Auto-create profile on user signup
```sql
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (user_id, first_name, last_name, email)
  VALUES (
    new.id,
    new.raw_user_meta_data ->> 'first_name',
    new.raw_user_meta_data ->> 'last_name',
    new.email
  );
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();
```

### Stock level updates
```sql
CREATE OR REPLACE FUNCTION update_product_stock()
RETURNS TRIGGER AS $$
BEGIN
  -- Update stock levels after sales/purchases
  -- Implementation details...
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```