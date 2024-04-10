import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/screens/home/home.dart';

import '../filter/filter_controller.dart';
import '../order/view_order_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
    Get.put<HomeController>(HomeController());
    Get.put<ProductController>(ProductController());
    Get.put<FilterController>(FilterController());
    Get.put<ViewOrderController>(ViewOrderController());
    // Get.put<CartController>(CartController());
  }
}
