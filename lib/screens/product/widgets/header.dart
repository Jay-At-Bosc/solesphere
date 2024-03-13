import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../../../common/widgets/product/rating_bar.dart';
import '../../../utils/constants/colors.dart';

class ProductDetailHeader extends GetView<ProductDetailController> {
  const ProductDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // log('name: ${controller.productDetailList[0].productName}');

    return Padding(
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
                  // controller.productDetailList.clear();
                  // log("Deleted: ${controller.productDetailList.length}");
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          Column(
            children: [
              Text(
                controller.productDetail.productName,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: Colors.black.withOpacity(0.6)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SRatingBar(rating: 4),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: SColors.textWhite,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                )),
          ),
        ],
      ),
    );
  }
}
