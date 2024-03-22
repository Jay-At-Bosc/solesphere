import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/heading/label_and_price.dart';
import 'package:solesphere/common/widgets/heading/section_heading1.dart';
import 'package:solesphere/common/widgets/text/text_style.dart';
import 'package:solesphere/screens/notification/widgets/notification_image_container.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';

import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/labels.dart';

class OrderSummary extends GetView<OrderController> {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      id: 'summary',
      builder: (ctx) => Container(
        // color: Colors.red.withOpacity(0.1),
        height: Get.size.height * 0.5,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
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
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++) const SummaryItemTile(),
                  ],
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
              ListTile(
                contentPadding: EdgeInsets.all(4.0.getWidth()),
                tileColor: SColors.primary,
                title: STextStyle(
                  text: "John Anderson",
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLine: 1,
                ),
                subtitle: STextStyle(
                  text: controller.fullAddress(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w300),
                  maxLine: 4,
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
                price: 10,
                padding: 0,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              LabelAndPrice(
                title: SLabels.discount,
                price: 40,
                padding: 0,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              LabelAndPrice(
                title: "Delivery Fees / Shipping Cost",
                price: 40,
                padding: 0,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              const Divider(),
              LabelAndPrice(
                title: SLabels.grandTotal,
                price: 40,
                padding: 0,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(fontSizeFactor: 1.1)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryItemTile extends StatelessWidget {
  const SummaryItemTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4.0.getWidth(), vertical: 2.0.getWidth()),
      child: Row(
        children: [
          const NotificationImageContainer(
            url: SImages.shoe1,
          ),
          SizedBox(
            width: 3.0.getWidth(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                STextStyle(
                  text: "Nike Air Max adf adf",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.black),
                  maxLine: 1,
                ),
                STextStyle(
                  text: "₹499",
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLine: 1,
                )
              ],
            ),
          ),
          STextStyle(
            text: "Qty: 10",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.black),
            maxLine: 1,
          ),
        ],
      ),
    );
  }
}
