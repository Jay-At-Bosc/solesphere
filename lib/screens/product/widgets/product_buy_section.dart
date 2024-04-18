import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/services/routes/app_pages.dart';

import '../../../auth/signup/signup_screen.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'soled_by_rich_text.dart';

class ProductBuySection extends GetView<ProductDetailController> {
  const ProductBuySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Obx(
        //   () => Text(
        //     'Total: ₹${controller.productDetail.variants[controller.selectedVarient.value].sizes[controller.selectedSize.value].discounted_price}',
        //     style: Theme.of(context)
        //         .textTheme
        //         .headlineLarge!
        //         .apply(color: Colors.black),
        //   ),
        // ),
        // const SizedBox(
        //   height: SSizes.spaceBtwItems,
        // ),
        GetBuilder<ProductDetailController>(
          id: controller.cartBtnId,
          builder: (controller) => CustomButton(
              btnText: "Add To Cart",
              foregroundColor: Colors.black,
              backgroundColor: SColors.cartBtnColor,
              onPressed: () {
                controller.isCartLoading.value
                    ? null
                    : controller.addToCartApi(controller.productDetail);
              }),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        CustomButton(
            btnText: "Buy Now",
            foregroundColor: Colors.black,
            backgroundColor: SColors.buyBtnColor,
            onPressed: () {
              controller.isCartLoading.value
                  ? null
                  : controller.addToCartApi(controller.productDetail);
              Get.toNamed(Routes.order);
            }),
        const SoledByRichText(),
      ],
    );
  }
}
