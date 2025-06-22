import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextNormal extends StatelessWidget {
  final String text;
  const TextNormal({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        text,
        style: GoogleFonts.plusJakartaSans(
            fontSize: 16.6,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: AppColors.textColor),
      ),
    );
  }
}

class TextSmall extends StatelessWidget {
  final String text;
  const TextSmall({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        text,
        style: GoogleFonts.plusJakartaSans(
            fontSize: 13.6,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: AppColors.textColor),
      ),
    );
  }
}
