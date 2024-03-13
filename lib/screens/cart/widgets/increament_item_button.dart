import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class IncreaseItemButton extends StatelessWidget {
  const IncreaseItemButton({
    super.key,
    required this.icon,
    this.color = Colors.white,
    this.iconColor,
    this.iconSize,
    required this.onTap,
  });
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
        child: Icon(
          icon,
          color: iconColor,
          size: 6.0.getWidth(),
        ),
      ),
    );
  }
}