import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController());
  }
}
