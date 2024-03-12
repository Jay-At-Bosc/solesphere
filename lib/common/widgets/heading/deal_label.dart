import 'package:flutter/material.dart';

class DealLabel extends StatelessWidget {
  const DealLabel({
    super.key,
    this.color,
    required this.radius,
    required this.padding,
    required this.text,
    this.style,
  });

  final Color? color;
  final double radius;
  final double padding;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}