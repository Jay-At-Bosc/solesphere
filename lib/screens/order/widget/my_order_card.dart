import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/screens/order/order_detail.screen.dart';

import 'package:solesphere/screens/order/view_order_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/buttons/secondary_button.dart';
import '../../../common/widgets/text/text_style.dart';
import '../../../services/routes/app_pages.dart';
import '../../../utils/constants/colors.dart';

import '../../../utils/constants/labels.dart';
import '../../notification/widgets/notification_image_container.dart';
import '../../product/product_detail_controller.dart';

class MyOrderCard extends GetView<ViewOrderController> {
  const MyOrderCard({
    super.key,
    this.j = 0,
    this.child = const SizedBox(),
  });

  final int j;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 2.0.getHeight()),
      color: SColors.textWhite,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //order id
            STextStyle(
              text: "${SLabels.orderId} ${controller.orders[j].id}",
              maxLine: 1,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.black),
            ),

            //Order date
            STextStyle(
              text:
                  "${SLabels.orderDate}  ${controller.changeDateFormat(controller.orders[j].createdAt)}",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: SColors.textPrimaryWith60),
            ),

            //Ordered Product List
            for (int i = 0; i < controller.orders[j].products.length; i++)
              Padding(
                padding: EdgeInsets.only(top: 2.0.getHeight()),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Get.toNamed(Routes.productDetail);
                        await ProductDetailController.instance
                            .fetchProductDetails(
                                controller.orders[j].products[i].productId);
                        ProductDetailController.instance.getImagesList();
                        // log("product id: ${product.id}");
                        // Get.back();
                      },
                      child: NotificationImageContainer(
                        url: controller.orders[j].products[i].imageUrl,
                      ),
                    ),
                    SizedBox(
                      width: 3.0.getWidth(),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          STextStyle(
                            text: controller.orders[j].products[i].productName,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: Colors.black),
                            maxLine: 1,
                          ),
                          STextStyle(
                            text:
                                "₹${controller.orders[j].products[i].discountedPrice}",
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLine: 1,
                          ),
                          Container(
                            padding: EdgeInsets.all(1.0.getWidth()),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color:
                                    SColors.textPrimaryWith60.withOpacity(0.1)),
                            child: STextStyle(
                              text: controller.orders[j].orderStatus,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .apply(color: Colors.blue),
                              maxLine: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                    STextStyle(
                      text: "Qty: ${controller.orders[j].products[i].quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.black),
                      maxLine: 1,
                    ),
                  ],
                ),
              ),

            SizedBox(
              height: 2.0.getHeight(),
            ),

            //child
            child,

            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(
                    label: Get.currentRoute == '/OrderDetailScreen'
                        ? SLabels.cancel
                        : SLabels.viewDetails,
                    style: Theme.of(context).textTheme.labelMedium!,
                    index: j,
                    onPress: Get.currentRoute == '/OrderDetailScreen'
                        ? () {
                            TLoaders.errorSnackBar(title: "asdf");
                            controller.cancelOrders(
                                controller.orders[j].id,
                                controller.orders[j].paymentMethod,
                                controller.orders[j].totalAmount,
                                controller.orders[j].transactionId,
                                controller.orders[j].signature);
                          }
                        : () {
                            Get.to(() => const OrderDetailScreen(),
                                arguments: {'index': j});
                          }),
                SecondaryButton(
                  label: Get.currentRoute == '/OrderDetailScreen'
                      ? SLabels.review
                      : SLabels.reorder,
                  style: Theme.of(context).textTheme.labelMedium!,
                  forground: SColors.textWhite,
                  background: SColors.accent,
                  index: j,
                  onPress: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
