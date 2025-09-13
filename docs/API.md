# SalesProRedwoodsKenyan - API Documentation

## Supabase API Endpoints

### Authentication APIs

#### User Authentication
- `POST /auth/signup` - User registration
- `POST /auth/signin` - User login
- `POST /auth/signout` - User logout
- `POST /auth/reset-password` - Password reset
- `GET /auth/user` - Get current user

#### Profile Management
- `GET /profiles` - Get user profiles
- `POST /profiles` - Create user profile
- `PUT /profiles/:id` - Update user profile
- `DELETE /profiles/:id` - Delete user profile

### Product Management APIs

#### Products
- `GET /products` - List all products
- `GET /products/:id` - Get product details
- `POST /products` - Create new product
- `PUT /products/:id` - Update product
- `DELETE /products/:id` - Delete product
- `GET /products/search?q=:query` - Search products

#### Categories
- `GET /categories` - List categories
- `POST /categories` - Create category
- `PUT /categories/:id` - Update category
- `DELETE /categories/:id` - Delete category

#### Brands
- `GET /brands` - List brands
- `POST /brands` - Create brand
- `PUT /brands/:id` - Update brand
- `DELETE /brands/:id` - Delete brand

#### Units
- `GET /units` - List units
- `POST /units` - Create unit
- `PUT /units/:id` - Update unit
- `DELETE /units/:id` - Delete unit

### Inventory Management APIs

#### Warehouses
- `GET /warehouses` - List warehouses
- `POST /warehouses` - Create warehouse
- `PUT /warehouses/:id` - Update warehouse
- `DELETE /warehouses/:id` - Delete warehouse

#### Stock Management
- `GET /product_warehouse` - Get stock levels
- `POST /product_warehouse` - Update stock
- `GET /stock/alerts` - Get low stock alerts
- `POST /stock/adjustment` - Stock adjustment

### Sales Management APIs

#### Sales
- `GET /sales` - List sales
- `GET /sales/:id` - Get sale details
- `POST /sales` - Create new sale
- `PUT /sales/:id` - Update sale
- `DELETE /sales/:id` - Delete sale

#### Quotations
- `GET /quotations` - List quotations
- `POST /quotations` - Create quotation
- `PUT /quotations/:id` - Update quotation
- `DELETE /quotations/:id` - Delete quotation
- `POST /quotations/:id/convert` - Convert to sale

#### Payments
- `GET /payments` - List payments
- `POST /payments` - Record payment
- `PUT /payments/:id` - Update payment
- `DELETE /payments/:id` - Delete payment

### Purchase Management APIs

#### Purchases
- `GET /purchases` - List purchases
- `GET /purchases/:id` - Get purchase details
- `POST /purchases` - Create purchase
- `PUT /purchases/:id` - Update purchase
- `DELETE /purchases/:id` - Delete purchase

#### Suppliers
- `GET /suppliers` - List suppliers
- `POST /suppliers` - Create supplier
- `PUT /suppliers/:id` - Update supplier
- `DELETE /suppliers/:id` - Delete supplier

### Customer Management APIs

#### Customers
- `GET /customers` - List customers
- `GET /customers/:id` - Get customer details
- `POST /customers` - Create customer
- `PUT /customers/:id` - Update customer
- `DELETE /customers/:id` - Delete customer

#### Customer Groups
- `GET /customer_groups` - List customer groups
- `POST /customer_groups` - Create customer group
- `PUT /customer_groups/:id` - Update customer group
- `DELETE /customer_groups/:id` - Delete customer group

### Manufacturing APIs

#### Productions
- `GET /productions` - List productions
- `GET /productions/:id` - Get production details
- `POST /productions` - Create production
- `PUT /productions/:id` - Update production
- `DELETE /productions/:id` - Delete production

### Transfer Management APIs

#### Transfers
- `GET /transfers` - List transfers
- `GET /transfers/:id` - Get transfer details
- `POST /transfers` - Create transfer
- `PUT /transfers/:id` - Update transfer
- `DELETE /transfers/:id` - Delete transfer
- `POST /transfers/:id/approve` - Approve transfer

### Reporting APIs

#### Sales Reports
- `GET /reports/sales/daily` - Daily sales report
- `GET /reports/sales/monthly` - Monthly sales report
- `GET /reports/sales/yearly` - Yearly sales report

#### Inventory Reports
- `GET /reports/inventory/stock` - Stock report
- `GET /reports/inventory/movement` - Inventory movement
- `GET /reports/inventory/valuation` - Inventory valuation

#### Financial Reports
- `GET /reports/financial/profit-loss` - Profit & Loss
- `GET /reports/financial/balance-sheet` - Balance Sheet
- `GET /reports/financial/cash-flow` - Cash Flow

## Edge Functions

### Payment Processing
- `POST /functions/v1/process-payment` - Process payment
- `POST /functions/v1/refund-payment` - Refund payment

### Report Generation
- `POST /functions/v1/generate-report` - Generate custom reports
- `GET /functions/v1/export-data` - Export data to CSV/PDF

### Inventory Automation
- `POST /functions/v1/auto-reorder` - Automatic reorder
- `POST /functions/v1/stock-alerts` - Send stock alerts

## Real-time Subscriptions

### Product Updates
```typescript
supabase
  .channel('products')
  .on('postgres_changes', { event: '*', schema: 'public', table: 'products' }, payload => {
    // Handle product changes
  })
  .subscribe()
```

### Sales Updates
```typescript
supabase
  .channel('sales')
  .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'sales' }, payload => {
    // Handle new sales
  })
  .subscribe()
```

### Inventory Updates
```typescript
supabase
  .channel('inventory')
  .on('postgres_changes', { event: '*', schema: 'public', table: 'product_warehouse' }, payload => {
    // Handle inventory changes
  })
  .subscribe()
```