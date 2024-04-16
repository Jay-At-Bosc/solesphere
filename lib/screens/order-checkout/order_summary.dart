import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/common/widgets/heading/section_heading1.dart';
import 'package:solesphere/common/widgets/text/text_style.dart';
import 'package:solesphere/screens/notification/widgets/notification_image_container.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';

import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../common/widgets/heading/label_and_price.dart';
import '../../utils/constants/labels.dart';

class OrderSummary extends GetView<OrderController> {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      id: controller.summaryId,
      builder: (ctx) => SizedBox(
        // color: Colors.red.withOpacity(0.1),
        // height: Get.size.height * 0.5,
        width: double.infinity,
        // margin: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(
                text: SLabels.itemDetails,
                style: Theme.of(context).textTheme.headlineMedium,
                padding: 7.0,
              ),
              Card(
                color: Colors.white,
                elevation: 2,
                // decoration: BoxDecoration(

                //   borderRadius: BorderRadius.circular(1.0.getHeight()),
                //   color: Colors.white.withOpacity(0.9),
                // ),
                child: GetBuilder<OrderController>(
                  builder: (controller) => Column(
                    children: [
                      for (int i = 0;
                          i < controller.orderSummary[0].cartItems.length;
                          i++)
                        SummaryItemTile(index: i),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.0.getHeight(),
              ),

              //delivery address section
              SectionHeading(
                text: SLabels.deliveryAddress,
                style: Theme.of(context).textTheme.headlineMedium,
                padding: 7.0,
              ),
              GetBuilder<OrderController>(
                id: controller.updateAddressId,
                builder: (ctx) => ListTile(
                  contentPadding: EdgeInsets.all(4.0.getWidth()),
                  tileColor: SColors.primary,
                  title: STextStyle(
                    text: controller.user!.displayName.toString(),
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLine: 1,
                  ),
                  subtitle: STextStyle(
                    text:
                        '${ctx.orderSummary[0].address.house},${ctx.orderSummary[0].address.area},${ctx.orderSummary[0].address.town},${ctx.orderSummary[0].address.state} - ${ctx.orderSummary[0].address.pincode}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w300),
                    maxLine: 4,
                  ),
                ),
              ),
              SizedBox(
                height: 3.0.getHeight(),
              ),

              //Payment Model Selection
              SectionHeading(
                text: SLabels.paymentMethod,
                style: Theme.of(context).textTheme.headlineMedium,
                padding: 7.0,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(4.0.getWidth()),
                tileColor: SColors.primary,
                title: STextStyle(
                  text: controller.paymentTitle[
                      int.parse(controller.selectedPaymentMode.toString())],
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(fontSizeFactor: 1.2),
                  maxLine: 1,
                ),
              ),
              SizedBox(
                height: 3.0.getHeight(),
              ),
              //Order summery section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  STextStyle(
                    text: SLabels.orderSummary,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeFactor: 1.1)
                        .copyWith(fontWeight: FontWeight.w700),
                    maxLine: 1,
                  ),
                  SizedBox(
                    height: 1.0.getHeight(),
                  ),
                  LabelAndPrice(
                    title: SLabels.totalAmount,
                    price: ctx.orderSummary[0].totalActualAmount,
                    padding: 0,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.black),
                  ),
                  LabelAndPrice(
                    title: SLabels.discount,
                    price: ctx.orderSummary[0].totalDiscount,
                    padding: 0,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w300, color: SColors.warning),
                    sign: "-",
                  ),
                  LabelAndPrice(
                    title: "Delivery Fees / Shipping Cost",
                    price: ctx.orderSummary[0].deliveryCharge,
                    padding: 0,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w300, color: SColors.success),
                    sign: "+",
                  ),
                  const Divider(),
                  LabelAndPrice(
                    title: SLabels.grandTotal,
                    price: ctx.orderSummary[0].totalDiscountedAmount +
                        ctx.orderSummary[0].deliveryCharge,
                    padding: 0,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(fontSizeFactor: 1.1)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryItemTile extends GetView<OrderController> {
  const SummaryItemTile({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 4.0.getWidth(), vertical: 2.0.getWidth()),
        child: Row(
          children: [
            NotificationImageContainer(
              url: controller.orderSummary[0].cartItems[index].imgUrl,
            ),
            SizedBox(
              width: 3.0.getWidth(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  STextStyle(
                    text:
                        controller.orderSummary[0].cartItems[index].productName,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: Colors.black),
                    maxLine: 1,
                  ),
                  STextStyle(
                    text: controller
                        .orderSummary[0].cartItems[index].discountedPrice
                        .toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLine: 1,
                  )
                ],
              ),
            ),
            STextStyle(
              text:
                  "Qty: ${controller.orderSummary[0].cartItems[index].quantity}",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.black),
              maxLine: 1,
            ),
          ],
        ),
      ),
    );
  }
}
