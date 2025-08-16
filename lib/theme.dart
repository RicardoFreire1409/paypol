import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg   = Color(0xFFD2FFC6); // fondo (tu HEX)
  static const card = Color(0xFFA7EB9B); // tarjetas/botones (tu HEX)
  static const primary = Color(0xFFA7EB9B);
  static const onPrimary = Colors.black87;
  static const muted = Color(0xFF3F4A3F);
  static const danger = Color(0xFFE85D5D);
}

ThemeData buildAppTheme() {
  final righteous = GoogleFonts.righteous();
  final poppins = GoogleFonts.poppins();

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.card,
      onSurface: Colors.black87,
    ),
    textTheme: TextTheme(
      displayLarge: righteous.copyWith(fontSize: 32, fontWeight: FontWeight.w700),
      displayMedium: righteous.copyWith(fontSize: 26, fontWeight: FontWeight.w700),
      titleLarge: righteous.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
      titleMedium: righteous.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
      bodyLarge: poppins.copyWith(fontSize: 16, height: 1.3),
      bodyMedium: poppins.copyWith(fontSize: 14, height: 1.3),
      labelLarge: poppins.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
    ),
  );
}
