import 'package:flutter/material.dart';

class ModuleConfig {
  static const List<Map<String, dynamic>> modules = [
    {
      "id": "hrm",
      "title": "HRM",
      "icon": "people_outline",
      "color": "0xFFE60000",
      "category": "Enterprise"
    },
    {
      "id": "finance",
      "title": "Finance",
      "icon": "account_balance_wallet_outlined",
      "color": "0xFFE60000",
      "category": "Enterprise"
    },
    {
      "id": "crm",
      "title": "CRM",
      "icon": "handshake_outlined",
      "color": "0xFFE60000",
      "category": "Enterprise"
    },
    {
      "id": "inventory",
      "title": "Inventory",
      "icon": "inventory_2_outlined",
      "color": "0xFFE60000",
      "category": "Operations"
    },
    {
      "id": "sales",
      "title": "Sales",
      "icon": "trending_up_outlined",
      "color": "0xFFE60000",
      "category": "Operations"
    },
    {
      "id": "payroll",
      "title": "Payroll",
      "icon": "payments_outlined",
      "color": "0xFFE60000",
      "category": "High Priority"
    },
    {
      "id": "purchase",
      "title": "Purchase",
      "icon": "shopping_cart_outlined",
      "color": "0xFFE60000",
      "category": "Operations"
    },
    {
      "id": "logistics",
      "title": "Logistics",
      "icon": "local_shipping_outlined",
      "color": "0xFFE60000",
      "category": "Operations"
    },
    {
      "id": "assets",
      "title": "Assets",
      "icon": "precision_manufacturing_outlined",
      "color": "0xFFE60000",
      "category": "Enterprise"
    }
  ];

  static const List<Map<String, dynamic>> quickAccess = [
    {
      "id": "attendance",
      "title": "Attendance",
      "icon": "calendar_today_outlined",
      "color": "0xFFE60000"
    },
    {
      "id": "expenses",
      "title": "Expenses",
      "icon": "receipt_long_outlined",
      "color": "0xFFE60000"
    },
    {
      "id": "reports",
      "title": "Reports",
      "icon": "bar_chart_outlined",
      "color": "0xFFE60000"
    }
  ];
}
