import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

abstract class AppTextStyles {
  static TextStyle get headlineLarge => GoogleFonts.cairo(
    fontSize:
        28,
    fontWeight:
        FontWeight.bold,
    color:
        AppColors.textPrimary,
  );

  static TextStyle get headlineMedium => GoogleFonts.cairo(
    fontSize:
        20,
    fontWeight:
        FontWeight.w600,
    color:
        AppColors.textPrimary,
  );

  static TextStyle get bodyLarge => GoogleFonts.cairo(
    fontSize:
        16,
    fontWeight:
        FontWeight.normal,
    color:
        AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => GoogleFonts.cairo(
    fontSize:
        14,
    color:
        AppColors.textSecondary,
  );

  static TextStyle get labelLarge => GoogleFonts.cairo(
    fontSize:
        14,
    fontWeight:
        FontWeight.w600,
  );
}
