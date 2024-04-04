import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../../../common/widgets/heading/deal_label.dart';
import '../../../utils/constants/colors.dart';

class ProductDealOfTheDay extends GetView<ProductDetailController> {
  const ProductDealOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DealLabel(
          text: 'Deal Of The Day',
          color: SColors.accent,
          padding: 10.0,
          radius: 10,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: Colors.white),
        ),
        Obx(
          () => RichText(
            text: TextSpan(
              text:
                  '-${controller.calculateDiscountPercentage(controller.productDetail.variants[controller.selectedVarient.value].sizes[controller.selectedSize.value].actual_price, controller.productDetail.variants[controller.selectedVarient.value].sizes[controller.selectedSize.value].discounted_price)}% ',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(color: Colors.red, fontSizeFactor: 0.9),
              children: <TextSpan>[
                TextSpan(
                  text:
                      '₹${controller.productDetail.variants[controller.selectedVarient.value].sizes[controller.selectedSize.value].discounted_price}'
                          .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(color: Colors.black, fontSizeFactor: 1.2),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => Text(
            'M.R.P.: ₹${controller.productDetail.variants[controller.selectedVarient.value].sizes[controller.selectedSize.value].actual_price}',
            style: Theme.of(context).textTheme.titleSmall!.apply(
                color: SColors.textPrimaryWith80,
                decoration: TextDecoration.lineThrough),
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: SColors.textPrimaryWith80,
                ),
            children: <TextSpan>[
              TextSpan(
                text: "FREE delivery",
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: SColors.accent,
                    ),
              ),
              const TextSpan(
                text: ' on orders above ₹500 ',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
