import 'package:flutter/material.dart';

class AppColors {
  // Exact color values derived from HSL in index.css
  
  // Light Mode (Root)
  static const Color primaryLight = Color(0xFF06DDFB);
  static const Color secondaryLight = Color(0xFF9D36E1);
  static const Color accentLight = Color(0xFFF041B5);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color foregroundLight = Color(0xFF1E293B);
  static const Color cardLight = Color(0xFFF8FAFC);
  static const Color mutedLight = Color(0xFFF1F5F9);
  static const Color mutedForegroundLight = Color(0xFF64748B);
  static const Color borderLight = Color(0xFFE2E8F0);

  // Dark Mode (.dark)
  static const Color primaryDark = Color(0xFF19E2FB);
  static const Color secondaryDark = Color(0xFFA84DEC);
  static const Color accentDark = Color(0xFFF367C4);
  static const Color backgroundDark = Color(0xFF0B0D11);
  static const Color foregroundDark = Color(0xFFF8FAFC);
  static const Color cardDark = Color(0xFF111419);
  static const Color mutedDark = Color(0xFF1E293B);
  static const Color mutedForegroundDark = Color(0xFF94A3B8);
  static const Color borderDark = Color(0xFF2D3748);

  // Dynamic Getters
  static Color primary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? primaryDark : primaryLight;
  static Color secondary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? secondaryDark : secondaryLight;
  static Color accent(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? accentDark : accentLight;
  
  static LinearGradient primaryGradient(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return LinearGradient(
      colors: isDark ? [primaryDark, secondaryDark] : [primaryLight, secondaryLight],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient accentGradient(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return LinearGradient(
      colors: isDark ? [secondaryDark, accentDark] : [secondaryLight, accentLight],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient skillProgressGradient(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return LinearGradient(
      colors: isDark 
        ? [primaryDark, secondaryDark, accentDark] 
        : [primaryLight, secondaryLight, accentLight],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  static RadialGradient backgroundRadial(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return RadialGradient(
      center: Alignment.center,
      radius: 1.5,
      colors: isDark
          ? [
              const Color(0xFF1E293B), // Dark slate
              const Color(0xFF0B0D11), // Background dark
            ]
          : [
              const Color(0xFFF1F5F9), // Light slate
              const Color(0xFFFFFFFF), // Background light
            ],
    );
  }
}
