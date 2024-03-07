// product_controller.dart

import 'package:get/get.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/services/data/product_data.dart';

import '../../../services/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final products = RxList<Product>([]).obs;
  final favoriteList = RxList<Product>([]).obs;

  @override
  void onInit() {
    products.value.addAll(productsData);
    super.onInit();
  }

  void addToFavorite(product) {
    if (favoriteList.value.contains(product)) {
      Get.closeAllSnackbars();
      TLoaders.warningSnackBar(
          title: "Opps!!", message: "Product already added to the favorite");
    } else {
      favoriteList.value.add(product);
      // products.value[product].isFavorite = true;

      TLoaders.successSnackBar(
          title: "Added to Favorites",
          message: "Product added to your favorites list!");
      update(); // Update the UI
    }
  }

  void removeToFavorite(product) {
    if (!favoriteList.value.contains(product)) {
      TLoaders.warningSnackBar(
          title: "Opps!!", message: "Product Not Found in Favorite");
    } else {
      favoriteList.value.remove(product);
      // products.value[product].isFavorite = false;

      TLoaders.successSnackBar(
          title: "Removed from Favorites",
          message: "Product removed from your favorites list!");
      update(); // Update the UI
    }
  }
}

  // void toggleFavorite(int index) {
  //   products[index].isFavorite = !products[index].isFavorite;
  //   update(); // Update the products list after changing favorite state
  // }