import 'package:flutter/material.dart';

import 'package:get_healt/presentation/screen/login.dart';
import 'package:get_healt/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: GoogleFonts.montserrat(
                fontSize: 98,
                fontWeight: FontWeight.w300,
                letterSpacing: -1.5,
                color: tulisanColor),
            displayMedium: GoogleFonts.montserrat(
                fontSize: 61,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.5,
                color: tulisanColor),
            displaySmall: GoogleFonts.montserrat(
                fontSize: 49, fontWeight: FontWeight.w400, color: tulisanColor),
            headlineMedium: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.25,
                color: tulisanColor),
            headlineSmall: GoogleFonts.montserrat(
                fontSize: 24, fontWeight: FontWeight.w400, color: tulisanColor),
            titleLarge: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.15,
                color: tulisanColor),
            titleMedium: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.15,
                color: tulisanColor),
            titleSmall: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: tulisanColor),
            bodyLarge: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: tulisanColor),
            bodyMedium: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
                color: tulisanColor),
            bodySmall: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
                color: tulisanColor),
            labelLarge: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.25,
                color: tulisanColor),
            labelMedium: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                color: tulisanColor),
            labelSmall: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xff29AAD3))),
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
