import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF845460);
  static const Color secondary = Color(0xFFEAD3CB);
  static const Color surface = Color(0xFFBDC7C9);
  static const Color accent = Color(0xFF5FA4B8);
  static const Color darkAccent = Color(0xFF2B4F60);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: accent,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),

    scaffoldBackgroundColor: const Color(0xFFF5EFEC),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      foregroundColor: primary,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 6,
      shadowColor: primary.withOpacity(.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: const BorderSide(
          color: primary,
          width: 1.5,
        ),
        minimumSize: const Size.fromHeight(55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: primary,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: primary,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFB88495),
      secondary: Color(0xFF5FA4B8),
      surface: Color(0xFF1C252B),
    ),

    scaffoldBackgroundColor: const Color(0xFF141A1F),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: Color(0xFF1E293B),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accent,
        side: const BorderSide(
          color: accent,
        ),
        minimumSize: const Size.fromHeight(55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),
  );
}