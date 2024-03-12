import 'package:flutter/material.dart';
import 'package:solesphere/utils/constants/colors.dart';

import '../../../services/models/product_model.dart';
import '../text/text_style.dart';

import 'rating_bar.dart';

class SProductReview extends StatelessWidget {
  const SProductReview({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          STextStyle(
            text: product.avgRating.toString(),
            style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: SColors.accent,
                  fontSizeFactor: 0.9,
                ),
          ),
          SRatingBar(rating: product.avgRating),
          STextStyle(
            text: "(${product.totalReview})",
            style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: SColors.textPrimaryWith60,
                  fontSizeFactor: 0.9,
                ),
          ),
          const SizedBox(
            width: 1,
          ),
          // SAvailableColors(totalColor: product.availableColors.length),
        ],
      ),
    );
  }
}
