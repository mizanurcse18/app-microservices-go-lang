import 'package:flutter/material.dart';
import 'package:erp_app/core/constants/module_data.dart';
import 'package:erp_app/config/theme/app_colors.dart';

class ModuleGridView extends StatelessWidget {
  const ModuleGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? AppColors.textPrimaryDark : Colors.black87;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            'QUICK ACCESS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.textSecondaryDark : Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: ModuleConfig.quickAccess.length,
            itemBuilder: (context, index) {
              final item = ModuleConfig.quickAccess[index];
              final isRed = item['id'] == 'attendance';
              
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: isRed ? theme.primaryColor : theme.cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: !isRed ? Border.all(color: theme.dividerColor.withOpacity(0.1)) : null,
                        boxShadow: [
                          BoxShadow(
                            color: isRed ? theme.primaryColor.withOpacity(0.3) : Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Icon(
                        _getIcon(item['icon']),
                        color: isRed ? Colors.white : textColor.withOpacity(0.8),
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title'], 
                      style: TextStyle(
                        fontSize: 11, 
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            'ENTERPRISE MODULES',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.textSecondaryDark : Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemCount: ModuleConfig.modules.length,
          itemBuilder: (context, index) {
            final module = ModuleConfig.modules[index];
            final isFinance = module['id'] == 'finance';
            
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isFinance ? theme.primaryColor : theme.dividerColor.withOpacity(0.1), 
                        width: isFinance ? 2 : 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        _getIcon(module['icon']),
                        color: isFinance ? theme.primaryColor : textColor.withOpacity(0.8),
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  module['title'],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isFinance ? FontWeight.bold : FontWeight.w500,
                    color: isFinance ? theme.primaryColor : textColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          },
        ),
      ],
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
      case 'calendar_today_outlined': return Icons.calendar_today_outlined;
      case 'receipt_long_outlined': return Icons.receipt_long_outlined;
      case 'bar_chart_outlined': return Icons.bar_chart_outlined;
      default: return Icons.apps;
    }
  }
}
