import 'package:flutter/material.dart';
import 'package:erp_app/core/constants/module_data.dart';
import 'package:erp_app/config/theme/app_colors.dart';

class AppMenuDrawer extends StatelessWidget {
  const AppMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var m in ModuleConfig.modules) {
      final cat = m['category'] ?? 'General';
      grouped.putIfAbsent(cat, () => []).add(m);
    }

    final categories = grouped.keys.toList();

    return Drawer(
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final modules = grouped[category]!;

                return ExpansionTile(
                  leading: Icon(_getCategoryIcon(category)),
                  title: Text(
                    category,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: modules.map((m) {
                    return ListTile(
                      contentPadding: const EdgeInsets.only(left: 32, right: 16),
                      leading: Icon(_getIcon(m['icon']), size: 20, color: AppColors.primary),
                      title: Text(m['title'], style: const TextStyle(fontSize: 14)),
                      onTap: () {
                        Navigator.pop(context); // Close drawer
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: const AssetImage('assets/images/kite.png'),
          fit: BoxFit.none,
          alignment: Alignment.topRight,
          scale: 3,
          opacity: 0.1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/kite.png'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Johnathan Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Operations Manager',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.dividerColor.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          const Icon(Icons.logout, color: AppColors.primary),
          const SizedBox(width: 16),
          Text(
            'LOGOUT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'hr & people': return Icons.people_outline;
      case 'finance': return Icons.account_balance_wallet_outlined;
      case 'crm': return Icons.handshake_outlined;
      case 'inventory': return Icons.inventory_2_outlined;
      case 'sales': return Icons.trending_up_outlined;
      case 'logistics': return Icons.local_shipping_outlined;
      case 'production': return Icons.precision_manufacturing_outlined;
      default: return Icons.category_outlined;
    }
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'people_outline': return Icons.people_outline;
      case 'account_balance_wallet_outlined': return Icons.account_balance_wallet_outlined;
      case 'handshake_outlined': return Icons.handshake_outlined;
      case 'inventory_2_outlined': return Icons.inventory_2_outlined;
      case 'trending_up_outlined': return Icons.trending_up_outlined;
      case 'payments_outlined': return Icons.payments_outlined;
      case 'shopping_cart_outlined': return Icons.shopping_cart_outlined;
      case 'local_shipping_outlined': return Icons.local_shipping_outlined;
      case 'precision_manufacturing_outlined': return Icons.precision_manufacturing_outlined;
      default: return Icons.apps;
    }
  }
}
