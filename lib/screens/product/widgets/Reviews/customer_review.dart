import 'package:flutter/material.dart';

import '../../../../common/widgets/product/rating_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: SColors.textHint, borderRadius: BorderRadius.circular(50)),
        ),
        const SizedBox(
          width: SSizes.spaceBtwItems / 2,
        ),
        Column(
          children: [
            Text(
              'Unknown',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.black),
            ),
            const SRatingBar(rating: 4)
          ],
        ),
      ],
    );
  }
}