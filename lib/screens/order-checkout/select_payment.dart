import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';
import 'package:solesphere/screens/order-checkout/widgets/payment_tile.dart';

class PaymentSelection extends GetView<OrderController> {
  const PaymentSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      id: controller.paymentId,
      builder: (ctx) => SizedBox(
        height: Get.size.height * 0.5,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return CustomRadioListPaymentTile(
              option: index.toString(),
              title: controller.paymentTitle[index],
            );
          },
        ),
      ),
    );
  }
}
