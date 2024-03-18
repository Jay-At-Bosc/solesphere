import 'package:get/get.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/text_theme.dart';
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
          child: GetBuilder<CartController>(
            init: CartController(),
            id: 'CartList',
            builder: (controller) => controller.isCartLoading.value
                ? const ShoesLoading()
                : controller.cartItemsList.isEmpty
                    ? Center(child: Text("Cart Is Empty"))
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: Get.height / 2,
                            // color: Colors.red,
                            child: ListView.builder(
                              itemCount: controller.cartItemsList.length,
                              itemBuilder: (context, index) {
                                final product = controller.cartItemsList[index];
                                return CartItem(product: product);
                              },
                            ),
                          ),
                          GetBuilder<CartController>(
                              id: 'amount',
                              builder: (controller) =>
                                  Text("Total ${controller.totalAmount}")),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
