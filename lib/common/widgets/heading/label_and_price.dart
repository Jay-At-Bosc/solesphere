import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../text/text_style.dart';

class LabelAndPrice extends StatelessWidget {
  const LabelAndPrice({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0.getHeight()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          STextStyle(
            text: title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          STextStyle(
            text: "₹$price.00",
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
