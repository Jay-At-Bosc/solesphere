import 'package:flutter/material.dart';
import '../text/text_style.dart';

class LabelAndPrice extends StatelessWidget {
  const LabelAndPrice(
      {super.key,
      required this.title,
      required this.price,
      this.padding = 0.0,
      this.style,
      this.sign = ""});
  final String title;
  final int price;
  final double? padding;
  final TextStyle? style;
  final String? sign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          STextStyle(
            text: title,
            style: style,
            maxLine: 1,
          ),
          STextStyle(
            text: "${sign} ₹$price.00",
            style: style,
            maxLine: 1,
          )
        ],
      ),
    );
  }
}
