import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

enum AppMenuStyle { grid, categorized }

class ThemeState extends Equatable {
  final Color primaryColor;
  final ThemeMode themeMode;
  final AppMenuStyle menuStyle;

  const ThemeState({
    required this.primaryColor,
    required this.themeMode,
    required this.menuStyle,
  });

  factory ThemeState.initial() {
    return const ThemeState(
      primaryColor: Color(0xFFE60000), // Default Red
      themeMode: ThemeMode.light,
      menuStyle: AppMenuStyle.grid,
    );
  }

  ThemeState copyWith({
    Color? primaryColor,
    ThemeMode? themeMode,
    AppMenuStyle? menuStyle,
  }) {
    return ThemeState(
      primaryColor: primaryColor ?? this.primaryColor,
      themeMode: themeMode ?? this.themeMode,
      menuStyle: menuStyle ?? this.menuStyle,
    );
  }

  @override
  List<Object?> get props => [primaryColor, themeMode, menuStyle];
}

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object?> get props => [];
}

class ChangePrimaryColor extends ThemeEvent {
  final Color color;
  const ChangePrimaryColor(this.color);
  @override
  List<Object?> get props => [color];
}

class ChangeThemeMode extends ThemeEvent {
  final ThemeMode mode;
  const ChangeThemeMode(this.mode);
  @override
  List<Object?> get props => [mode];
}

class ChangeMenuStyle extends ThemeEvent {
  final AppMenuStyle style;
  const ChangeMenuStyle(this.style);
  @override
  List<Object?> get props => [style];
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangePrimaryColor>((event, emit) => emit(state.copyWith(primaryColor: event.color)));
    on<ChangeThemeMode>((event, emit) => emit(state.copyWith(themeMode: event.mode)));
    on<ChangeMenuStyle>((event, emit) => emit(state.copyWith(menuStyle: event.style)));
  }
}
