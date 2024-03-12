import 'package:get/get.dart';
import 'package:solesphere/screens/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteController>(FavoriteController());
    // Get.put<ProductController>(ProductController());
  }
}