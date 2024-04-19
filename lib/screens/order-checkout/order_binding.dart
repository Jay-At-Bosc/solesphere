import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order-checkout/order_controller.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController());
    Get.put<ProductDetailController>(ProductDetailController());
  }
}
