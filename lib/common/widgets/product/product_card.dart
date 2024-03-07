import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';

import '../../../models/product_model.dart';
import '../../../screens/home/controller/product_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../container/rounded_container.dart';
import '../container/rounded_image.dart';
import 'product_detail.dart';
import 'product_favorite_icon.dart';

class SProductCardVertical extends StatelessWidget {
  const SProductCardVertical({
    super.key,
    required this.index,
    required this.product,
    required this.onFavoriteToggle,
  });
  final Product product;
  final Function(int) onFavoriteToggle;
  final int index;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductController());

    return GestureDetector(
      onTap: () {
        Get.closeCurrentSnackbar();
        TLoaders.successSnackBar(
            title: "Product", message: "You Tapped on Product: ${index + 1}");
      },
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: SColors.secondary.withOpacity(0.1),
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(SSizes.productImageRadius),
            color: dark ? SColors.secondary : SColors.textWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Thumbnail
            TRoundedContainer(
              height: 100,
              // padding: const EdgeInsets.only(
              //     left: SSizes.sm, right: SSizes.sm, top: SSizes.sm),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  //image
                  TRoundedImage(
                    imageUrl: product.imageUrl,
                    onPress: () {},
                    applyImageRadius: true,
                  ),
                  //Favorite Icon Button
                  SFavoriteIcon(
                    product: product,
                    dark: dark,
                    controller: controller,
                  )
                ],
              ),
            ),
            //Details
            SProductDetails(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
