import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SAvailableColors extends StatelessWidget {
  const SAvailableColors({
    super.key,
    required this.totalColor,
  });
  final int totalColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: SColors.accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          totalColor.toString(),
          style: const TextStyle(fontSize: 10),
          textScaler: const TextScaler.linear(1),
        ),
      ),
    );
  }
}
