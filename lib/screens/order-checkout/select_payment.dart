import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';

import 'widgets/radioTile.dart';

// ignore: must_be_immutable
class PaymentSelection extends GetView<OrderController> {
  PaymentSelection({super.key});

  List<String> title = ['Razorpay', 'Cash On Delivery'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      id: 'payment',
      builder: (ctx) => SizedBox(
        height: Get.size.height * 0.5,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            final option = 'Option ${index + 1}';
            return CustomRadioListTile(
              option: option,
              title: title[index],
              subTitle: '',
            );
          },
        ),
      ),
    );
  }
}
