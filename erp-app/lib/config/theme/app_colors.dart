import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFFE60000); 
  static const Color secondary = Color(0xFF1E1E1E);
  
  // Neutral Colors - Light
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Colors.white;
  static const Color borderLight = Color(0xFFE5E7EB);
  
  // Neutral Colors - Dark (Modern AMOLED-friendly but not pure black)
  static const Color backgroundDark = Color(0xFF0F0F0F);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color borderDark = Color(0xFF262626);
  
  // Text Colors - Light
  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF4B5563);
  
  // Text Colors - Dark
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
  
  static const Color textHint = Color(0xFF94A3B8);
  static const Color textOnPrimary = Colors.white;
  
  // Text Aliases for Backward Compatibility
  static const Color textPrimary = textPrimaryLight;
  static const Color textSecondary = textSecondaryLight;
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}
