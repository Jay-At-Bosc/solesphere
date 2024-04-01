import 'package:solesphere/auth/auth_exports.dart';

import 'view_order_controller.dart';

class OrderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ViewOrderController>(ViewOrderController());
  }
}
