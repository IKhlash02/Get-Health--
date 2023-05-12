import 'package:flutter/material.dart';

class TextNormal extends StatelessWidget {
  final String text;
  const TextNormal({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
    );
  }
}
