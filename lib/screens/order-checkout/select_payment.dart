
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';


import 'widgets/radioTile.dart';

class PaymentSelection extends GetView<OrderController> {
  const PaymentSelection({super.key});

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
              title: "Razor Pay",
              subTitle: '',
            );
          },
        ),
      ),
    );
  }
}
