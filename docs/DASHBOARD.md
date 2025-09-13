# SalesProRedwoodsKenyan - Dashboard Components

## Main Dashboard Layout

### Dashboard Container
- **Component:** `DashboardLayout`
- **Purpose:** Main dashboard wrapper with sidebar and header
- **Features:** Responsive layout, navigation, user menu

### Header Component
- **Component:** `DashboardHeader`
- **Features:** User profile, notifications, search, logout
- **Responsive:** Mobile-friendly with collapsible menu

### Sidebar Navigation
- **Component:** `DashboardSidebar`
- **Features:** Module navigation, role-based menu items
- **Collapsible:** Expandable/collapsible sidebar

## Key Performance Indicators (KPIs)

### Sales KPIs
```typescript
interface SalesKPIs {
  todaySales: number;
  weeklySales: number;
  monthlySales: number;
  salesGrowth: number;
  averageOrderValue: number;
  transactionCount: number;
}
```

### Inventory KPIs
```typescript
interface InventoryKPIs {
  totalProducts: number;
  lowStockItems: number;
  outOfStockItems: number;
  inventoryValue: number;
  topSellingProducts: Product[];
  slowMovingItems: Product[];
}
```

### Financial KPIs
```typescript
interface FinancialKPIs {
  totalRevenue: number;
  grossProfit: number;
  netProfit: number;
  profitMargin: number;
  pendingPayments: number;
  cashFlow: number;
}
```

## Dashboard Cards

### Sales Summary Card
- **Component:** `SalesSummaryCard`
- **Data:** Daily/weekly/monthly sales
- **Features:** Trend indicators, click-through to details
- **Charts:** Mini line charts showing trends

### Inventory Alert Card
- **Component:** `InventoryAlertCard`
- **Data:** Low stock and out-of-stock items
- **Features:** Quick action buttons, alert badges
- **Actions:** Reorder, adjust stock, view details

### Recent Transactions Card
- **Component:** `RecentTransactionsCard`
- **Data:** Latest sales and purchases
- **Features:** Transaction status, amounts, timestamps
- **Actions:** View details, print receipt

### Top Products Card
- **Component:** `TopProductsCard`
- **Data:** Best-selling products
- **Features:** Product images, sales metrics
- **Time periods:** Today, week, month, year

### Customer Activity Card
- **Component:** `CustomerActivityCard`
- **Data:** Recent customer transactions
- **Features:** Customer names, transaction amounts
- **Actions:** View customer profile, transaction details

### Financial Overview Card
- **Component:** `FinancialOverviewCard`
- **Data:** Revenue, profit, expenses
- **Features:** Comparison with previous periods
- **Charts:** Mini donut charts for breakdowns

## Charts and Analytics

### Sales Chart Component
```typescript
interface SalesChartProps {
  period: 'day' | 'week' | 'month' | 'year';
  chartType: 'line' | 'bar' | 'area';
  data: SalesData[];
}
```

### Revenue Chart
- **Component:** `RevenueChart`
- **Chart Type:** Line/Area chart
- **Features:** Multiple time periods, interactive tooltips
- **Data:** Revenue over time with growth indicators

### Product Performance Chart
- **Component:** `ProductPerformanceChart`
- **Chart Type:** Bar chart
- **Features:** Top 10 products, sales quantities/revenue
- **Filters:** Category, brand, time period

### Inventory Turnover Chart
- **Component:** `InventoryTurnoverChart`
- **Chart Type:** Mixed (bar + line)
- **Features:** Turnover rate, stock levels
- **Insights:** Fast/slow moving analysis

### Payment Methods Chart
- **Component:** `PaymentMethodsChart`
- **Chart Type:** Donut/Pie chart
- **Features:** Payment method distribution
- **Data:** Cash, card, digital payments

## Quick Actions Panel

### Quick Actions Component
```typescript
interface QuickAction {
  id: string;
  label: string;
  icon: string;
  route: string;
  permission: string;
  color: string;
}
```

### Available Quick Actions
- **New Sale:** Direct to POS interface
- **Add Product:** Quick product creation
- **New Purchase:** Create purchase order
- **Stock Adjustment:** Quick inventory adjustment
- **New Customer:** Customer registration
- **View Reports:** Navigate to reports
- **Process Payment:** Payment processing
- **Create Transfer:** Warehouse transfer

## Notifications Panel

### Notification Types
```typescript
type NotificationType = 
  | 'low_stock' 
  | 'payment_due' 
  | 'new_order' 
  | 'system_alert'
  | 'approval_required';
```

### Notification Component
- **Component:** `NotificationPanel`
- **Features:** Real-time updates, mark as read, actions
- **Categories:** Alerts, reminders, approvals, info

### Alert System
- **Low Stock Alerts:** Products below reorder level
- **Payment Reminders:** Overdue payments
- **Approval Requests:** Transfers, purchases awaiting approval
- **System Notifications:** Updates, maintenance alerts

## Real-time Updates

### Live Data Updates
```typescript
// Real-time sales tracking
const useLiveSales = () => {
  const [sales, setSales] = useState<Sale[]>([]);
  
  useEffect(() => {
    const subscription = supabase
      .channel('sales_updates')
      .on('postgres_changes', {
        event: 'INSERT',
        schema: 'public',
        table: 'sales'
      }, (payload) => {
        setSales(prev => [payload.new as Sale, ...prev]);
      })
      .subscribe();
      
    return () => subscription.unsubscribe();
  }, []);
  
  return sales;
};
```

### Live Inventory Updates
- **Stock Changes:** Real-time stock level updates
- **Product Updates:** Price changes, new products
- **Transfer Updates:** Transfer status changes

## Dashboard Widgets

### Customizable Widgets
```typescript
interface DashboardWidget {
  id: string;
  type: 'chart' | 'kpi' | 'list' | 'alert';
  title: string;
  size: 'small' | 'medium' | 'large';
  position: { x: number; y: number };
  config: Record<string, any>;
}
```

### Widget Types
- **KPI Widgets:** Numeric metrics with trends
- **Chart Widgets:** Various chart types
- **List Widgets:** Recent items, alerts, tasks
- **Alert Widgets:** System notifications, warnings

### Widget Management
- **Drag & Drop:** Reposition widgets
- **Resize:** Adjust widget sizes
- **Configure:** Customize widget settings
- **Add/Remove:** Manage visible widgets

## Responsive Design

### Mobile Dashboard
- **Stacked Layout:** Vertical card stacking
- **Swipe Navigation:** Gesture-based navigation
- **Touch Optimized:** Large touch targets
- **Simplified Charts:** Mobile-friendly visualizations

### Tablet Dashboard
- **Grid Layout:** 2-3 column grid
- **Touch Navigation:** Touch-friendly interface
- **Optimized Charts:** Medium-sized visualizations
- **Quick Actions:** Prominent action buttons

### Desktop Dashboard
- **Multi-column Layout:** 3-4 column grid
- **Full Charts:** Detailed visualizations
- **Hover Effects:** Interactive elements
- **Keyboard Shortcuts:** Power user features