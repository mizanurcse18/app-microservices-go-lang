import 'package:go_router/go_router.dart';
import 'package:erp_app/features/auth/presentation/pages/splash_page.dart';
import 'package:erp_app/features/auth/presentation/pages/login_page.dart';
import 'package:erp_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:erp_app/features/auth/presentation/pages/change_password_page.dart';
import 'package:erp_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:erp_app/features/profile/presentation/pages/profile_page.dart';
import 'package:erp_app/features/core/presentation/pages/not_found_page.dart';
import 'package:erp_app/features/settings/presentation/pages/theme_settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/forgot-password',
      name: 'forgot_password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/change-password',
      name: 'change_password',
      builder: (context, state) => const ChangePasswordPage(),
    ),
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const ThemeSettingsPage(),
    ),
  ],
);
