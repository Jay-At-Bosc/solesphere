import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/screens/home/home.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../favorite/favorite_controller.dart';
import '../filter/filter_controller.dart';
import '../order/view_order_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
    Get.put<ProductController>(ProductController());
    Get.put<ProductDetailController>(ProductDetailController());
    Get.put<FilterController>(FilterController());
    Get.put<ViewOrderController>(ViewOrderController());
    Get.put<HomeController>(HomeController());
    Get.put<FavoriteController>(FavoriteController());
    // Get.put<CartController>(CartController());
  }
}
