import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';

import '../filter/filter_controller.dart';


class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ProductController>(ProductController());
    Get.put<FilterController>(FilterController());
  }
}
