import 'package:flutter/material.dart';
import 'package:get_healt/util/colors.dart';

class ButtonInput extends StatelessWidget {
  final bool obscureText;
  final String hinText;
  final String message;
  const ButtonInput(
      {super.key,
      required this.hinText,
      required this.message,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: kotakColor,
        filled: true,
        hintText: hinText,
        hintStyle: const TextStyle(color: tulisanColor),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.47)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message;
        }
        return null;
      },
    );
  }
}
