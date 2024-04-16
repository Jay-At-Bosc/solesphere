import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/screens/product/review_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.put<ReviewController>(ReviewController());
  }
}
