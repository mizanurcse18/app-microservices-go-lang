import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:erp_app/config/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    // Staggered start to give the system time to handle plugin verification
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
        _controller.forward();
      }
    });

    // Precise transition timer
    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) {
        context.go('/login');
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache the logo to prevent flicker during the scale animation
    precacheImage(const AssetImage('assets/images/kite.png'), context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: _isVisible 
        ? Stack(
            children: [
              // Simplified static background
              const _StaticDecorations(),
              
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _LogoBox(),
                        const SizedBox(height: 20),
                        const _AppName(),
                        const SizedBox(height: 48),
                        const _LoadingIndicator(),
                      ],
                    ),
                  ),
                ),
              ),
              
              const _BottomMessage(),
            ],
          )
        : const SizedBox.shrink(), // Blank until initial system jank passes
    );
  }
}

class _StaticDecorations extends StatelessWidget {
  const _StaticDecorations();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned(
          top: -40,
          right: -40,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: theme.primaryColor.withOpacity(0.03),
          ),
        ),
        Positioned(
          bottom: -40,
          left: -40,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: theme.primaryColor.withOpacity(0.03),
          ),
        ),
      ],
    );
  }
}

class _LogoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'assets/images/kite.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _AppName extends StatelessWidget {
  const _AppName();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'opseek',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: theme.colorScheme.onBackground,
            letterSpacing: -1.5,
          ),
        ),
        Text(
          '.',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
      ),
    );
  }
}

class _BottomMessage extends StatelessWidget {
  const _BottomMessage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            'YOUR BUSINESS, SIMPLIFIED',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground.withOpacity(0.3),
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 80,
            height: 3,
            decoration: BoxDecoration(
              color: theme.dividerColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ],
      ),
    );
  }
}
