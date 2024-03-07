import 'package:flutter/material.dart';

class STextStyle extends StatelessWidget {
  const STextStyle({
    super.key,
    required this.text,
    this.style,
  });
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: TextOverflow.ellipsis,
      textScaler: const TextScaler.linear(1),
      maxLines: 1,
      textAlign: TextAlign.left,
    );
  }
}
