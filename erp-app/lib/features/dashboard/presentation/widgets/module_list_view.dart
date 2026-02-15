import 'package:flutter/material.dart';
import 'package:erp_app/core/constants/module_data.dart';
import 'package:erp_app/config/theme/app_colors.dart';

class ModuleListView extends StatelessWidget {
  const ModuleListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Move grouping logic out of the build loop in a real app, 
    // but for now, we'll keep it simple and efficient.
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var m in ModuleConfig.modules) {
      final cat = m['category'] ?? 'General';
      grouped.putIfAbsent(cat, () => []).add(m);
    }

    final categories = grouped.keys.toList();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: categories.map((category) {
        final modules = grouped[category]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                category.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.textSecondaryDark : Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: modules.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: theme.dividerColor.withOpacity(0.1),
                ),
                itemBuilder: (context, index) {
                  final m = modules[index];
                  return ListTile(
                    leading: Icon(
                      _getIcon(m['icon']), 
                      color: isDark ? AppColors.textPrimaryDark.withOpacity(0.8) : Colors.black87,
                    ),
                    title: Text(
                      m['title'], 
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isDark ? AppColors.textPrimaryDark : Colors.black87,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
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
