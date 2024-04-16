import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/product/rating_bar.dart';
import '../../../utils/constants/colors.dart';
import '../../favorite/favorite_controller.dart';

class ProductDetailHeader extends GetView<ProductDetailController> {
  const ProductDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // log('name: ${controller.productDetailList[0].productName}');

    return GetBuilder<ProductDetailController>(
      id: controller.detailedProductId,
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: SColors.textWhite,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                  onPressed: () {
                    controller.isLoading.value = false;
                    controller.selectedVarient.value = 0;
                    controller.selectedSize.value = 0;
                    // log("Deleted: ${controller.productDetailList.length}");
                    Get.back();
                    // Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            Spacer(),
            Column(
              children: [
                SizedBox(
                  width: 50.0.getWidth(),
                  child: Text(
                    controller.productDetail.productName.capitalize.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .apply(color: Colors.black.withOpacity(0.6)),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    textScaler: const TextScaler.linear(1),
                  ),
                ),
                const SRatingBar(rating: 4),
              ],
            ),
            Spacer()
            // GetBuilder<FavoriteController>(
            //   id: 'fav_icon',
            //   builder: (fctr) => Container(
            //     decoration: BoxDecoration(
            //       color: SColors.textWhite,
            //       borderRadius: BorderRadius.circular(100),
            //     ),
            //     child: IconButton(
            //       onPressed: () {
            //         fctr.addToFavorite(controller.productDetail.id);
            //       },
            //       icon: Icon(
            //         Iconsax.heart,
            //         color: fctr.isFav(controller.productDetail.id)
            //             ? Colors.red
            //             : Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
