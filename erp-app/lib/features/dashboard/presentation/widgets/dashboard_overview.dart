import 'package:flutter/material.dart';
import 'package:erp_app/config/theme/app_colors.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            context,
            'Sales Today',
            '\$12,450',
            Icons.trending_up,
            Colors.green,
            '+12% from yesterday',
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            context,
            'Pending Tasks',
            '24',
            Icons.assignment_outlined,
            Colors.orange,
            '4 urgent tickets',
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            context,
            'Active Projects',
            '8',
            Icons.speed,
            Colors.blue,
            'All systems operational',
          ),
          const SizedBox(height: 24),
          _buildRecentActivity(context),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color, String sub) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12, 
                    color: theme.colorScheme.onBackground.withOpacity(0.5), 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                Text(
                  sub,
                  style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onBackground,
          ),
        ),
        const SizedBox(height: 12),
        _buildActivityItem(context, 'John updated inventory', '2 mins ago'),
        _buildActivityItem(context, 'New sale recorded #1029', '15 mins ago'),
        _buildActivityItem(context, 'System backup completed', '1 hour ago'),
      ],
    );
  }

  Widget _buildActivityItem(BuildContext context, String title, String time) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
          const SizedBox(width: 12),
          Text(
            title, 
            style: TextStyle(
              fontSize: 13, 
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onBackground.withOpacity(0.8),
            ),
          ),
          const Spacer(),
          Text(
            time, 
            style: TextStyle(
              fontSize: 11, 
              color: theme.colorScheme.onBackground.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
