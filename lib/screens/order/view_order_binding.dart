import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import 'view_order_controller.dart';

class OrderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ViewOrderController>(ViewOrderController());
    Get.put<ProductDetailController>(ProductDetailController());
  }
}
