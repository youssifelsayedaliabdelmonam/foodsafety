import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider
    extends
        ChangeNotifier {
  bool _isDarkMode =
      false;
  static const String _themeKey =
      'isDarkMode';

  bool get isDarkMode =>
      _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  // Load theme from shared preferences
  Future<
    void
  >
  _loadTheme() async {
    final prefs =
        await SharedPreferences.getInstance();
    _isDarkMode =
        prefs.getBool(
          _themeKey,
        ) ??
        false;
    notifyListeners();
  }

  // Toggle theme and save to shared preferences
  Future<
    void
  >
  toggleTheme() async {
    _isDarkMode =
        !_isDarkMode;
    notifyListeners();

    final prefs =
        await SharedPreferences.getInstance();
    await prefs.setBool(
      _themeKey,
      _isDarkMode,
    );
  }

  // Light Theme
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3:
          true,
      brightness:
          Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(
          0xFF4F46E5,
        ),
        secondary: Color(
          0xFF6366F1,
        ),
        surface: Color(
          0xFFFFFFFF,
        ),
        background: Color(
          0xFFF8FAFC,
        ),
        error: Color(
          0xFFEF4444,
        ),
        onPrimary:
            Colors.white,
        onSecondary:
            Colors.white,
        onSurface: Color(
          0xFF1E293B,
        ),
        onBackground: Color(
          0xFF1E293B,
        ),
      ),
      scaffoldBackgroundColor: const Color(
        0xFFF8FAFC,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor:
            Colors.white,
        foregroundColor: Color(
          0xFF1E293B,
        ),
        elevation:
            0,
      ),
      cardTheme: CardTheme(
        color:
            Colors.white,
        elevation:
            0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(
          0xFF64748B,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(
            0xFF1E293B,
          ),
          fontWeight:
              FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: Color(
            0xFF1E293B,
          ),
          fontWeight:
              FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Color(
            0xFF475569,
          ),
        ),
        bodyMedium: TextStyle(
          color: Color(
            0xFF64748B,
          ),
        ),
      ),
    );
  }

  // Dark Theme
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3:
          true,
      brightness:
          Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(
          0xFF6366F1,
        ),
        secondary: Color(
          0xFF818CF8,
        ),
        surface: Color(
          0xFF1E293B,
        ),
        background: Color(
          0xFF0F172A,
        ),
        error: Color(
          0xFFEF4444,
        ),
        onPrimary:
            Colors.white,
        onSecondary:
            Colors.white,
        onSurface: Color(
          0xFFF1F5F9,
        ),
        onBackground: Color(
          0xFFF1F5F9,
        ),
      ),
      scaffoldBackgroundColor: const Color(
        0xFF0F172A,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(
          0xFF1E293B,
        ),
        foregroundColor: Color(
          0xFFF1F5F9,
        ),
        elevation:
            0,
      ),
      cardTheme: CardTheme(
        color: const Color(
          0xFF1E293B,
        ),
        elevation:
            0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(
          0xFF94A3B8,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(
            0xFFF1F5F9,
          ),
          fontWeight:
              FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: Color(
            0xFFF1F5F9,
          ),
          fontWeight:
              FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Color(
            0xFFCBD5E1,
          ),
        ),
        bodyMedium: TextStyle(
          color: Color(
            0xFF94A3B8,
          ),
        ),
      ),
    );
  }

  // Get current theme based on mode
  ThemeData get currentTheme =>
      _isDarkMode
          ? darkTheme
          : lightTheme;
}
