// --------------------------- Start CustomLabelText ---------------------------

import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.labelText,
    this.labelStyle,
    this.maxLines,
  });

  final String labelText;
  final TextStyle? labelStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
      textScaler: const TextScaler.linear(1),
      maxLines: maxLines,
    );
  }
}

// --------------------------- End CustomLabelText ---------------------------