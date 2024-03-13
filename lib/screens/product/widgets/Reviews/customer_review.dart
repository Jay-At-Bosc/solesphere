import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/product/rating_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../product_detail_controller.dart';

class CustomerReview extends GetView<ProductDetailController> {
  const CustomerReview({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: SColors.textHint,
                borderRadius: BorderRadius.circular(50),
                // image: DecorationImage(
                //     image: NetworkImage(controller.productDetailList[0]
                //         .review[index].user.profilePic))),
              ),
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "name",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.black),
                ),
                const SRatingBar(rating: 4)
              ],
            ),
          ],
        ),
        Text(
          "Demo",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: SColors.textPrimaryWith60),
          textScaler: const TextScaler.linear(1),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
