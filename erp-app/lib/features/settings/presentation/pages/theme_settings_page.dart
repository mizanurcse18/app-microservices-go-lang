import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp_app/features/settings/presentation/bloc/theme_bloc.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PRIMARY BRAND COLOR',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.1),
                ),
                const SizedBox(height: 16),
                _ColorPicker(
                  selectedColor: state.primaryColor,
                  onColorSelected: (color) {
                    context.read<ThemeBloc>().add(ChangePrimaryColor(color));
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'MENU STYLE',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.1),
                    ),
                    Text(
                      '${state.menuStyle == AppMenuStyle.grid ? "Grid" : "Categorized"} Selected',
                      style: TextStyle(fontSize: 12, color: state.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _MenuStyleToggle(
                  selectedStyle: state.menuStyle,
                  primaryColor: state.primaryColor,
                  onStyleChanged: (style) {
                    context.read<ThemeBloc>().add(ChangeMenuStyle(style));
                  },
                ),
                const SizedBox(height: 40),
                const Text(
                  'MODE',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.1),
                ),
                const SizedBox(height: 16),
                _ThemeModePicker(
                  selectedMode: state.themeMode,
                  primaryColor: state.primaryColor,
                  onModeChanged: (mode) {
                    context.read<ThemeBloc>().add(ChangeThemeMode(mode));
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Save Theme Preferences', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.check_circle_outline, size: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const _ColorPicker({required this.selectedColor, required this.onColorSelected});

  final List<Color> colors = const [
    Color(0xFFE60000), // Red
    Color(0xFF2962FF), // Blue
    Color(0xFF00C853), // Green
    Color(0xFFFFAB00), // Orange
    Color(0xFF6200EA), // Purple
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: colors.map((color) {
          final isSelected = selectedColor.value == color.value;
          return GestureDetector(
            onTap: () => onColorSelected(color),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: theme.colorScheme.onSurface.withOpacity(0.3), width: 4) : null,
              ),
              child: isSelected ? const Icon(Icons.check, color: Colors.white) : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _MenuStyleToggle extends StatelessWidget {
  final AppMenuStyle selectedStyle;
  final Color primaryColor;
  final Function(AppMenuStyle) onStyleChanged;

  const _MenuStyleToggle({
    required this.selectedStyle,
    required this.primaryColor,
    required this.onStyleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Row(
        children: [
          Expanded(
            child: _ToggleItem(
              title: 'Grid',
              icon: Icons.grid_view_rounded,
              isSelected: selectedStyle == AppMenuStyle.grid,
              color: primaryColor,
              onTap: () => onStyleChanged(AppMenuStyle.grid),
            ),
          ),
          Expanded(
            child: _ToggleItem(
              title: 'Categorized',
              icon: Icons.list_alt_rounded,
              isSelected: selectedStyle == AppMenuStyle.categorized,
              color: primaryColor,
              onTap: () => onStyleChanged(AppMenuStyle.categorized),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _ToggleItem({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, 
              color: isSelected ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.4), 
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.4),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeModePicker extends StatelessWidget {
  final ThemeMode selectedMode;
  final Color primaryColor;
  final Function(ThemeMode) onModeChanged;

  const _ThemeModePicker({
    required this.selectedMode,
    required this.primaryColor,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ModeItem(
            title: 'Light Mode',
            color: primaryColor,
            isSelected: selectedMode == ThemeMode.light,
            onTap: () => onModeChanged(ThemeMode.light),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.wb_sunny_outlined, color: Colors.orange, size: 32),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _ModeItem(
            title: 'Dark Mode',
            color: primaryColor,
            isSelected: selectedMode == ThemeMode.dark,
            onTap: () => onModeChanged(ThemeMode.dark),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.nightlight_round_outlined, color: Colors.amberAccent, size: 32),
            ),
          ),
        ),
      ],
    );
  }
}

class _ModeItem extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _ModeItem({
    required this.title,
    required this.child,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: isSelected ? Border.all(color: color, width: 2) : null,
            ),
            child: child,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? color : theme.colorScheme.onSurface.withOpacity(0.3), width: 2),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
