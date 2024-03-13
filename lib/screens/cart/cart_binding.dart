import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartController>(CartController());
  }
}
