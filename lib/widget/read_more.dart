import 'package:flutter/material.dart';

import '../util/colors.dart';

class BuildText extends StatelessWidget {
  final String text;
  final bool isReadmore;
  const BuildText({super.key, required this.text, required this.isReadmore});

  @override
  Widget build(BuildContext context) {
    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style:
          Theme.of(context).textTheme.bodyLarge?.copyWith(color: tulisanColor),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
