import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
            fontSize: 98,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: AppColors.textColor),
        displayMedium: GoogleFonts.montserrat(
            fontSize: 61,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            color: AppColors.textColor),
        displaySmall: GoogleFonts.montserrat(
            fontSize: 49,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        headlineMedium: GoogleFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.25,
            color: AppColors.textColor),
        headlineSmall: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        titleLarge: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
            color: AppColors.textColor),
        titleMedium: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
            color: AppColors.textColor),
        titleSmall: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: AppColors.textColor),
        bodyLarge: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: AppColors.textColor),
        bodyMedium: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: AppColors.textColor),
        bodySmall: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            color: AppColors.textColor),
        labelLarge: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.25,
            color: AppColors.textColor),
        labelMedium: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            color: AppColors.textColor),
        labelSmall: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xff29AAD3),
      ),
      useMaterial3: true);
}
