import 'package:flutter/material.dart';

import '../../../services/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../text/text_style.dart';

class SProductName extends StatelessWidget {
  const SProductName({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        STextStyle(
          text: product.productName.toString(),
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: Colors.black),
        ),
        STextStyle(
          text: product.shortDescription.toString(),
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: SColors.textPrimaryWith60),
        ),
      ],
    );
  }
}
