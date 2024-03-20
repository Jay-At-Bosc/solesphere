
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';

import '../../utils/constants/labels.dart';

import 'widgets/radioTile.dart';

class OrderSummary extends GetView<OrderController> {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      id: 'summary',
      builder: (ctx) => SizedBox(
        height: Get.size.height * 0.5,
        child: ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) {
            final option = 'Option ${index + 1}';
            return CustomRadioListTile(
              option: option,
              title: SLabels.work,
              subTitle: '4517 Washington Ave. Manchester, Kentuky 39495',
            );
          },
        ),
      ),
    );
  }
}