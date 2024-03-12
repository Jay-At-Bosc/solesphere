import 'package:flutter/material.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';

import '../../../services/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../text/text_style.dart';

class SProductPrice extends StatelessWidget {
  const SProductPrice({
    super.key,
    required this.product,
  });
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        STextStyle(
          text: "₹${product.discountedPrice.toString()}",
          style: Theme.of(context).textTheme.labelLarge!.apply(
            color: Colors.black,
            fontSizeFactor: 1.5,
            fontFeatures: [const FontFeature.superscripts()],
          ),
        ),
        const SizedBox(
          width: 2.0,
        ),
        STextStyle(
          text: product.actualPrice.toString(),
          style: Theme.of(context).textTheme.labelSmall!.apply(
                color: SColors.textPrimaryWith60,
                fontSizeFactor: 0.9,
                decoration: TextDecoration.lineThrough,
              ),
        ),
        const SizedBox(
          width: 2.0,
        ),
        STextStyle(
          text:
              "(${ProductController.instance.calculateDiscount(product.actualPrice, product.discountedPrice)}%)",
          style: Theme.of(context).textTheme.labelSmall!.apply(
                color: SColors.textPrimaryWith60,
                fontSizeFactor: 0.9,
              ),
        ),
      ],
    );
  }
}
