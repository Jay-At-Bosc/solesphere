import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.text,
    this.style,
    this.padding = SSizes.defaultSpace / 2,
  });
  final String text;
  final double padding;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Text(
        text,
        style: style,
        textScaler: const TextScaler.linear(1),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}