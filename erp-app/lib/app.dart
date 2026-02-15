import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp_app/config/theme/app_theme.dart';
import 'package:erp_app/config/router/app_router.dart';
import 'package:erp_app/features/settings/presentation/bloc/theme_bloc.dart';
import 'package:erp_app/injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          // Set system overlay style based on mode
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: state.themeMode == ThemeMode.dark ? Brightness.light : Brightness.dark,
            ),
          );

          return MaterialApp.router(
            title: 'Stitch ERP',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme(state.primaryColor, Brightness.light),
            darkTheme: AppTheme.getTheme(state.primaryColor, Brightness.dark),
            themeMode: state.themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
