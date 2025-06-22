import 'package:flutter/material.dart';
import 'package:get_healt_2/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLogin extends StatelessWidget {
  final bool obscureText;
  final String hinText;
  final TextEditingController controller;
  const ButtonLogin(
      {super.key,
      required this.hinText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: kotakColor,
        filled: true,
        hintText: hinText,
        hintStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: tulisanColor),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.47)),
      ),
      controller: controller,
    );
  }
}
