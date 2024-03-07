import 'package:flutter/material.dart';
import 'package:solesphere/services/models/product_model.dart';

import '../../../utils/constants/sizes.dart';

import 'product_name.dart';
import 'product_price.dart';
import 'product_review.dart';

class SProductDetails extends StatelessWidget {
  const SProductDetails({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: SSizes.spaceBtwItems / 2, top: SSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SProductName(product: product),
          SProductPrice(product: product),
          SProductReview(product: product),
        ],
      ),
    );
  }
}
