# SalesProRedwoodsKenyan - Project Structure

## Frontend Structure

```
src/
├── components/           # Reusable UI components
│   ├── ui/              # Shadcn/ui components
│   ├── layout/          # Layout components
│   ├── forms/           # Form components
│   └── common/          # Common components
├── pages/               # Page components
│   ├── auth/           # Authentication pages
│   ├── dashboard/      # Dashboard pages
│   ├── pos/            # POS interface
│   ├── products/       # Product management
│   ├── inventory/      # Inventory management
│   ├── sales/          # Sales management
│   ├── purchases/      # Purchase management
│   ├── customers/      # Customer management
│   ├── manufacturing/ # Manufacturing module
│   ├── transfers/      # Transfer management
│   ├── reports/        # Reports and analytics
│   └── settings/       # Settings pages
├── hooks/              # Custom React hooks
│   ├── useAuth.ts     # Authentication hook
│   ├── useProducts.ts # Product management
│   ├── useSales.ts    # Sales operations
│   └── useInventory.ts# Inventory management
├── store/              # Zustand state management
│   ├── authStore.ts   # Authentication state
│   ├── cartStore.ts   # Shopping cart state
│   ├── inventoryStore.ts # Inventory state
│   └── settingsStore.ts # Settings state
├── lib/                # Utility libraries
│   ├── utils.ts       # General utilities
│   ├── api.ts         # API utilities
│   ├── validations.ts # Form validations
│   └── constants.ts   # App constants
├── types/              # TypeScript type definitions
│   ├── auth.ts        # Authentication types
│   ├── product.ts     # Product types
│   ├── sale.ts        # Sales types
│   └── inventory.ts   # Inventory types
├── integrations/       # External integrations
│   ├── supabase/      # Supabase client and types
│   ├── stripe/        # Stripe integration
│   └── paypal/        # PayPal integration
└── styles/             # Global styles
    ├── globals.css    # Global CSS
    └── components.css # Component styles
```

## Backend Structure (Supabase)

```
supabase/
├── migrations/         # Database migrations
├── functions/          # Edge functions
│   ├── auth/          # Authentication functions
│   ├── sales/         # Sales processing
│   ├── inventory/     # Inventory management
│   ├── reports/       # Report generation
│   └── payments/      # Payment processing
└── config.toml        # Supabase configuration
```

## Documentation Structure

```
docs/
├── SYSTEM.md          # System overview
├── MODULES.md         # Module breakdown
├── PROJECT_STRUCTURE.md # Project structure
├── API.md             # API documentation
├── PAGES.md           # Page documentation
├── DASHBOARD.md       # Dashboard components
├── AUTH.md            # Authentication system
├── DATA.md            # Data models and database
└── PLAN.md            # Implementation plan
```

## Configuration Files

```
root/
├── package.json       # Dependencies and scripts
├── package-lock.json  # Dependency lock file
├── vite.config.ts     # Vite configuration
├── tailwind.config.ts # Tailwind CSS configuration
├── tsconfig.json      # TypeScript configuration
├── index.html         # Main HTML file
└── .env               # Environment variables
```