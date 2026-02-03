import 'package:flutter/material.dart';
import 'theme/colors.dart';
import 'theme/fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3:
          true,
      brightness:
          Brightness.light,

      colorScheme: ColorScheme.fromSeed(
        seedColor:
            AppColors.primary,
        brightness:
            Brightness.light,
        primary:
            AppColors.primary,
        secondary:
            AppColors.accent,
        error:
            AppColors.error,
        surface: const Color.fromARGB(
          255,
          100,
          194,
          180,
        ),
        background:
            AppColors.background,
        onPrimary:
            Colors.white,
        onSecondary:
            Colors.white,
        onSurface:
            AppColors.textPrimary,
        onBackground:
            AppColors.textPrimary,
      ),

      scaffoldBackgroundColor:
          AppColors.background,

      // Icon Theme
      iconTheme: IconThemeData(
        color:
            AppColors.textPrimary,
        size:
            24.0,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(
          255,
          186,
          235,
          221,
        ),
        foregroundColor: const Color.fromARGB(
          255,
          92,
          94,
          94,
        ),
        elevation:
            0,
        centerTitle:
            true,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(
            255,
            101,
            103,
            103,
          ),
          size:
              28.0,
        ),
        actionsIconTheme: const IconThemeData(
          color: Color.fromARGB(
            255,
            69,
            206,
            190,
          ),
          size:
              24.0,
        ),
        titleTextStyle: AppTextStyles.headlineMedium.copyWith(
          color: const Color.fromARGB(
            255,
            114,
            118,
            117,
          ),
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge:
            AppTextStyles.headlineLarge,
        displayMedium:
            AppTextStyles.headlineMedium,
        displaySmall:
            AppTextStyles.headlineMedium,
        headlineLarge:
            AppTextStyles.headlineLarge,
        headlineMedium:
            AppTextStyles.headlineMedium,
        headlineSmall:
            AppTextStyles.bodyLarge,
        bodyLarge:
            AppTextStyles.bodyLarge,
        bodyMedium:
            AppTextStyles.bodyMedium,
        bodySmall:
            AppTextStyles.bodyMedium,
        labelLarge:
            AppTextStyles.labelLarge,
        labelMedium:
            AppTextStyles.labelLarge,
        labelSmall:
            AppTextStyles.bodyMedium,
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primary,
          foregroundColor:
              Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal:
                24,
            vertical:
                12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          elevation:
              2,
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color.fromARGB(
            255,
            18,
            217,
            94,
          ),
          side: BorderSide(
            color: const Color.fromARGB(
              255,
              22,
              210,
              182,
            ),
            width:
                1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal:
                24,
            vertical:
                12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color:
            AppColors.surface,
        elevation:
            2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        shadowColor: Colors.black.withOpacity(
          0.1,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled:
            true,
        fillColor:
            Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal:
              16,
          vertical:
              12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color:
                AppColors.textSecondary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color: AppColors.textSecondary.withOpacity(
              0.3,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color:
                AppColors.primary,
            width:
                2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color:
                AppColors.error,
            width:
                1.5,
          ),
        ),
        labelStyle: TextStyle(
          color:
              AppColors.textSecondary,
        ),
        hintStyle: TextStyle(
          color: AppColors.textSecondary.withOpacity(
            0.6,
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:
            AppColors.primary,
        foregroundColor:
            Colors.white,
        elevation:
            4,
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: AppColors.textSecondary.withOpacity(
          0.2,
        ),
        thickness:
            1,
        space:
            1,
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            Colors.white,
        selectedItemColor:
            AppColors.primary,
        unselectedItemColor:
            AppColors.textSecondary,
        type:
            BottomNavigationBarType.fixed,
        elevation:
            8,
      ),
    );
  }

  // ============== Dark Theme ==============
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3:
          true,
      brightness:
          Brightness.dark,

      colorScheme: ColorScheme.fromSeed(
        seedColor:
            AppColors.primary,
        brightness:
            Brightness.dark,
        primary:
            AppColors.primary,
        secondary:
            AppColors.accent,
        error:
            AppColors.error,
        surface:
            AppColors.darkSurface,
        background:
            AppColors.darkBackground,
        onPrimary:
            Colors.white,
        onSecondary:
            Colors.white,
        onSurface: Colors.white.withOpacity(
          0.87,
        ),
        onBackground: Colors.white.withOpacity(
          0.87,
        ),
      ),

      scaffoldBackgroundColor:
          AppColors.darkBackground,

      // Icon Theme
      iconTheme: IconThemeData(
        color: Colors.white.withOpacity(
          0.87,
        ),
        size:
            24.0,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(
          255,
          85,
          244,
          201,
        ),
        foregroundColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ),
        elevation:
            0,
        centerTitle:
            true,
        iconTheme: const IconThemeData(
          color:
              Colors.white,
          size:
              28.0,
        ),
        actionsIconTheme: const IconThemeData(
          color: Color.fromARGB(
            255,
            10,
            169,
            119,
          ),
          size:
              24.0,
        ),
        titleTextStyle: AppTextStyles.headlineMedium.copyWith(
          color:
              Colors.white,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headlineLarge.copyWith(
          color:
              Colors.white,
        ),
        displayMedium: AppTextStyles.headlineMedium.copyWith(
          color:
              Colors.white,
        ),
        displaySmall: AppTextStyles.headlineMedium.copyWith(
          color:
              Colors.white,
        ),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color:
              Colors.white,
        ),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(
          color:
              Colors.white,
        ),
        headlineSmall: AppTextStyles.bodyLarge.copyWith(
          color:
              Colors.white,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: Colors.white.withOpacity(
            0.87,
          ),
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: Colors.white.withOpacity(
            0.6,
          ),
        ),
        bodySmall: AppTextStyles.bodyMedium.copyWith(
          color: Colors.white.withOpacity(
            0.6,
          ),
        ),
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color:
              Colors.white,
        ),
        labelMedium: AppTextStyles.labelLarge.copyWith(
          color:
              Colors.white,
        ),
        labelSmall: AppTextStyles.bodyMedium.copyWith(
          color: Colors.white.withOpacity(
            0.6,
          ),
        ),
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primary,
          foregroundColor:
              Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal:
                24,
            vertical:
                12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          elevation:
              4,
        ),
      ),

      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor:
              AppColors.primary,
          side: BorderSide(
            color:
                AppColors.primary,
            width:
                1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal:
                24,
            vertical:
                12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: const Color.fromARGB(
          255,
          20,
          221,
          151,
        ),
        elevation:
            4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        shadowColor: Colors.black.withOpacity(
          0.3,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled:
            true,
        fillColor: const Color.fromARGB(
          255,
          220,
          222,
          221,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal:
              16,
          vertical:
              12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(
              0.3,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(
              0.3,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(
            color:
                Colors.white,
            width:
                2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(
            color:
                AppColors.error,
            width:
                1.5,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(
            0.7,
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(
            0.5,
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:
            AppColors.primary,
        foregroundColor:
            Colors.white,
        elevation:
            6,
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(
          0.2,
        ),
        thickness:
            1,
        space:
            1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            AppColors.darkSurface,
        selectedItemColor:
            AppColors.primary,
        unselectedItemColor: Colors.white.withOpacity(
          0.6,
        ),
        type:
            BottomNavigationBarType.fixed,
        elevation:
            8,
      ),
    );
  }
}
