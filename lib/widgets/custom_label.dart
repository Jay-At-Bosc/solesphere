// --------------------------- Start CustomLabelText ---------------------------

import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.labelText,
    this.labelStyle, 
  });

  final String labelText;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
      textScaler: const TextScaler.linear(1),
    );
  }
}

// --------------------------- End CustomLabelText ---------------------------