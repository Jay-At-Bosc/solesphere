import 'package:flutter/material.dart';

import '../../../auth/signup/signup_screen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'soled_by_rich_text.dart';

class ProductBuySection extends StatelessWidget {
  const ProductBuySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total: ₹499',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .apply(color: Colors.black),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        CustomButton(
            btnText: "Add To Cart",
            foregroundColor: Colors.black,
            backgroundColor: SColors.cartBtnColor,
            onPressed: () {}),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        CustomButton(
            btnText: "Buy Now",
            foregroundColor: Colors.black,
            backgroundColor: SColors.buyBtnColor,
            onPressed: () {}),
        const SoledByRichText(),
      ],
    );
  }
}
