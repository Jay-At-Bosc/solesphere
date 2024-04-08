import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/screens/home/home.dart';
import 'package:solesphere/screens/product/review_controller.dart';

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
                image: DecorationImage(
                  image: NetworkImage(
                      controller.productDetail.review[index].user.profilePic),
                ),
              ),
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.productDetail.review[index].user.username,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: Colors.black),
                  ),
                  SRatingBar(
                      rating: controller.productDetail.review[index].rating
                          .toDouble())
                ],
              ),
            ),
            if (controller.productDetail.review[index].user.id ==
                NavigationController.instance.userData['_id'])
              IconButton(
                onPressed: () async {
                  await ReviewController.instance.deleteReview(
                      controller.productDetail.review[index].id,
                      controller.productDetail.id);
                  await controller
                      .fetchProductDetails(controller.productDetail.id);
                },
                icon: const Icon(
                  Iconsax.trash,
                  color: SColors.warning,
                ),
              ),
          ],
        ),
        Text(
          controller.productDetail.review[index].review,
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
