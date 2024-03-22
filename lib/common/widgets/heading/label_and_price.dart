import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/theme/widget_themes/text_theme.dart';
import '../text/text_style.dart';

class LabelAndPrice extends StatelessWidget {
  const LabelAndPrice(
      {super.key,
      required this.title,
      required this.price,
      this.padding = 0.0,
      this.style});
  final String title;
  final int price;
  final double? padding;
  final TextStyle? style;

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
            text: "₹$price.00",
            style: style,
            maxLine: 1,
          )
        ],
      ),
    );
  }
}
