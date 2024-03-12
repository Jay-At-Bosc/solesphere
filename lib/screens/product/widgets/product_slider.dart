import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import 'image_slider.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: SColors.textSecondary.withOpacity(0.9)),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),
        const ProductImageSlider(
          images: [
            SImages.shoe1,
            SImages.shoe1,
            SImages.shoe8,
            SImages.shoe1,
          ],
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections / 2,
        ),
      ],
    );
  }
}