import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:erp_app/features/settings/presentation/bloc/theme_bloc.dart';
import 'package:erp_app/features/dashboard/presentation/widgets/module_grid_view.dart';
import 'package:erp_app/features/dashboard/presentation/widgets/module_list_view.dart';
import 'package:erp_app/features/dashboard/presentation/widgets/app_menu_drawer.dart';
import 'package:erp_app/features/dashboard/presentation/widgets/dashboard_overview.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isCategorized = state.menuStyle == AppMenuStyle.categorized;

        return Scaffold(
          key: _scaffoldKey,
          drawer: isCategorized ? const AppMenuDrawer() : null,
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: _buildHeader(context, theme, state),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  sliver: SliverToBoxAdapter(
                    child: state.menuStyle == AppMenuStyle.grid
                        ? const ModuleGridView()
                        : const DashboardOverview(),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              if (index == 0 && state.menuStyle == AppMenuStyle.categorized) {
                _scaffoldKey.currentState?.openDrawer();
              }
              if (index == 3) {
                context.push('/profile');
              }
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Menu'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_none_rounded), label: 'Updates'),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, ThemeState state) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (state.menuStyle == AppMenuStyle.categorized)
                IconButton(
                  icon: Icon(Icons.menu_rounded, color: theme.primaryColor, size: 28),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opseek Suite',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  Text(
                    'ENTERPRISE MANAGEMENT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onBackground.withOpacity(0.5),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTapDown: (details) => _showContextMenu(context, details.globalPosition, state),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/kite.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: state.primaryColor.withOpacity(0.2), width: 2),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 18, color: theme.colorScheme.onBackground.withOpacity(0.3)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find module or command...',
                hintStyle: TextStyle(color: theme.colorScheme.onBackground.withOpacity(0.3), fontSize: 13),
                prefixIcon: Icon(Icons.search, color: theme.colorScheme.onBackground.withOpacity(0.3), size: 20),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: Colors.transparent, // Let container handle the background
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showContextMenu(BuildContext context, Offset position, ThemeState state) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      items: <PopupMenuEntry<dynamic>>[
        PopupMenuItem(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Johnathan Doe',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                'Operations Manager',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
              const Divider(height: 24),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Future.delayed(Duration.zero, () {
              if (mounted) context.push('/profile');
            });
          },
          child: Row(
            children: [
              Icon(Icons.person_outline, color: Colors.grey.shade700, size: 20),
              const SizedBox(width: 12),
              const Text('Profile', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            // Delay navigation slightly to let the menu close
            Future.delayed(Duration.zero, () {
              if (mounted) context.push('/settings');
            });
          },
          child: Row(
            children: [
              Icon(Icons.settings_outlined, color: Colors.grey.shade700, size: 20),
              const SizedBox(width: 12),
              const Text('Settings', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            Future.delayed(Duration.zero, () {
              if (mounted) context.push('/change-password');
            });
          },
          child: Row(
            children: [
              Icon(Icons.lock_person_outlined, color: Colors.grey.shade700, size: 20),
              const SizedBox(width: 12),
              const Text('Change Password', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.help_outline, color: Colors.grey.shade700, size: 20),
              const SizedBox(width: 12),
              const Text('Help & Support', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          onTap: () {
            context.go('/login');
          },
          child: Row(
            children: [
              Icon(Icons.logout, color: state.primaryColor, size: 20),
              const SizedBox(width: 12),
              Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: state.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
