import 'package:easy_stepper/easy_stepper.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order/view_order_controller.dart';
import 'package:solesphere/screens/order/widget/my_order_card.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../common/widgets/heading/label_and_price.dart';
import '../../common/widgets/text/text_style.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';

class OrderDetailScreen extends GetView<ViewOrderController> {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map args = Get.arguments ?? {};
    final int index = args['index'] ?? 0;

    return Scaffold(
      backgroundColor: SColors.lightBackground.withOpacity(0.99),
      appBar: AppBar(
        title: Text(
          SLabels.orderDetails,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GetBuilder<ViewOrderController>(
          id: controller.ordersStatusId,
          builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              await controller.getUserOrders();
              await controller.getOrderStatus(index);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  MyOrderCard(
                    j: index,
                    child: OrderStatusStepper(index: index),
                  ),
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
                        price: int.parse(
                            double.parse(controller.orders[index].totalAmount)
                                .toStringAsFixed(0)),
                        padding: 0,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      LabelAndPrice(
                        sign: "+",
                        title: SLabels.discount,
                        price: int.parse(
                            double.parse(controller.orders[index].totalDiscount)
                                .toStringAsFixed(0)),
                        padding: 0,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w300,
                                color: SColors.success),
                      ),
                      LabelAndPrice(
                        sign: "-",
                        title: "Delivery Fees / Shipping Cost",
                        price: int.parse(double.parse(
                                        controller.orders[index].totalAmount)
                                    .toStringAsFixed(0)) <
                                500
                            ? 40
                            : 0,
                        padding: 0,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                fontWeight: FontWeight.w300, color: Colors.red),
                      ),
                      const Divider(),
                      LabelAndPrice(
                        title: SLabels.grandTotal,
                        price: (int.parse(double.parse(
                                    controller.orders[index].totalAmount)
                                .toStringAsFixed(0))) -
                            (int.parse(double.parse(
                                    controller.orders[index].totalDiscount)
                                .toStringAsFixed(0))) +
                            (int.parse(double.parse(controller
                                            .orders[index].totalAmount)
                                        .toStringAsFixed(0)) <
                                    500
                                ? 40
                                : 0),
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
        ),
      ),
    );
  }
}

class OrderStatusStepper extends GetView<ViewOrderController> {
  const OrderStatusStepper({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: controller.orderStatus,
      stepShape: StepShape.rRectangle,
      stepBorderRadius: 3.0.getWidth(),
      borderThickness: 2,
      stepRadius: 3.4.getHeight(),
      finishedStepBorderColor:
          controller.orderStatus != 4 ? SColors.accent : Colors.black,
      finishedStepBackgroundColor: Colors.white,
      showLoadingAnimation: false,
      steps: [
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: 1,
              child: Icon(
                Iconsax.box,
                size: 8.0.getWidth(),
                color:
                    controller.orderStatus >= 1 && controller.orderStatus != 4
                        ? SColors.accent
                        : null,
              ),
            ),
          ),
          customTitle: const Text(
            SLabels.placed,
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: 1,
              child: Icon(
                Iconsax.truck_fast,
                size: 8.0.getWidth(),
                color:
                    controller.orderStatus >= 2 && controller.orderStatus != 4
                        ? SColors.accent
                        : Colors.black,
              ),
            ),
          ),
          customTitle: const Text(
            SLabels.shipped,
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: 1,
              child: Icon(Iconsax.truck_tick,
                  color:
                      controller.orderStatus >= 3 && controller.orderStatus != 4
                          ? SColors.accent
                          : Colors.black,
                  size: 8.0.getWidth()),
            ),
          ),
          customTitle: const Text(
            SLabels.delivered,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
