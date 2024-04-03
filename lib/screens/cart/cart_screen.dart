import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';

import 'package:solesphere/screens/cart/cart_controller.dart';
import 'package:solesphere/services/routes/app_pages.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/icons.dart';

import '../../common/widgets/heading/label_and_price.dart';
import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/text_theme.dart';
import '../../widgets/custom_accent_color_button.dart';

import 'widgets/cart_item.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: STextTheme.lightTextTheme.bodyLarge,
        leadingWidth: 64.0,
        // leading: Padding(
        //   padding: const EdgeInsets.only(
        //     left: 20.0,
        //   ),
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: SColors.textWhite,
        //       // borderRadius: BorderRadius.circular(SSizes.buttonRadius),
        //       shape: BoxShape.circle,
        //     ),
        //     child: IconButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         icon: const Icon(Iconsax.arrow_left)),
        //   ),
        // ),
        title: const Text(
          SLabels.myCart,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear(1),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: GetBuilder<CartController>(
              init: CartController(),
              id: 'CartList',
              builder: (controller) => controller.isCartLoading.value
                  ? const ShoesLoading(
                      loader: SJsons.loader,
                    )
                  : controller.cartItemsList.isEmpty
                      ? const Center(child: Text("Cart Is Empty"))
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height / 2,
                              // color: Colors.red,
                              child: ListView.builder(
                                itemCount: controller.cartItemsList.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.cartItemsList[index];
                                  return CartItem(product: product);
                                },
                              ),
                            ),
                            GetBuilder<CartController>(
                              id: 'amount',
                              builder: (ctx) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kBottomNavigationBarHeight,
                                    left: 0,
                                    right: 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      LabelAndPrice(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        title: 'Subtotal',
                                        price: ctx.totalAmount.value,
                                      ),
                                      LabelAndPrice(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .apply(color: SColors.success),
                                        title: 'Shipping',
                                        price: ctx.totalAmount.value < 499
                                            ? ctx.deliveryCharge.value
                                            : 0,
                                        sign: "+",
                                      ),
                                      const Divider(),
                                      LabelAndPrice(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        title: 'Total Cost',
                                        price: ctx.totalAmount.value < 499
                                            ? ctx.totalAmount.value +
                                                ctx.deliveryCharge.value
                                            : ctx.totalAmount.value,
                                      ),
                                      CustomAccentColorButton(
                                        buttonLabel: 'Process Checkout',
                                        isLoading: false,
                                        onPressed: () =>
                                            Get.toNamed(Routes.order),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
