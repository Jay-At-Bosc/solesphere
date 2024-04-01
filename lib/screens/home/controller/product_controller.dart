// product_controller.dart

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';

import '../../../services/models/category_model.dart';
import '../../../services/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../../cart/cart_controller.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final selectedCategory = ''.obs;
  final isLoading = false.obs;
  final isProdcutLoading = false.obs;
  final brandName = ''.obs;

  final productList = <Products>[].obs;
  final filterProductList = <Products>[].obs;
  // final categoryProducts = RxList<Product>([]).obs;
  final favoriteList = RxList<Products>([]).obs;

  final brandList = RxList<Brands>([]);
  // RxInt selectedItem = (-1).obs;

  @override
  void onInit() async {
    // productList.value.addAll(productsData);
    // categories.addAll(categoryList);
    // ProductDetailController pd = ProductDetailController();
    fetchBrands();
    fetchProducts();
    await CartController.instance.loadCartFromApi();
    super.onInit();
  }

  bool isMainLoading() {
    // ignore: unrelated_type_equality_checks
    if (isLoading == true || isProdcutLoading == true) {
      return true;
    } else {
      return false;
    }
  }

  //fetch data
  Future<void> fetchBrands() async {
    isLoading.value = true;
    final response = await http.get(
        Uri.parse('https://solesphere-backend.onrender.com/api/v1/brands/'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> responseData =
          json.decode(response.body) as Map<String, dynamic>;

      // Extract the list of brands from the nested "brands" key
      final List<dynamic> brandsData =
          responseData['data']['brands'] as List<dynamic>;

      // Map the list to your Brands model
      final List<Brands> brands =
          brandsData.map((item) => Brands.fromMap(item)).toList();

      // Update the observable list
      brandList.assignAll(brands);

      isLoading.value = false;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      isLoading.value = false;
      TLoaders.errorSnackBar(title: "Oops!", message: "Failed to load data");
      // throw Exception('Failed to load data');
    }
    update(['home']);
  }

  //end

  //Fetch Products
  Future<void> fetchProducts() async {
    filterProductList.clear();
    isProdcutLoading.value = true;
    final response = await http.get(
        Uri.parse('https://solesphere-backend.onrender.com/api/v1/products/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      productList.value =
          data.map((item) => Products.fromMap(item)).toList().obs;
      filterProductList.addAll(productList);
      isProdcutLoading.value = false;
      log(productList.length.toString());
    } else {
      isProdcutLoading.value = false;

      throw Exception('Failed to load products');
    }
    update(['home']);
  }
  //end product

//onTap categories
  void onItemClick(String id, String name) {
    selectedCategory.value = id;
    if (selectedCategory.value != '') {
      filterProductList.clear();
      brandName.value = name;
      filterProductList.value =
          productList.where((product) => product.brand.id == id).toList();
    } else {
      brandName.value = '';
      filterProductList.clear();
      filterProductList.addAll(productList);
    }
    log("Index: $selectedCategory");
    log("length: ${productList.length}");
    update(["categories", "Favorite", "title"]);
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
      update(["Favorite"]); // Update the UI
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
      update(["Favorite"]); // Update the UI
    }
  }

  String calculateDiscount(int actualPrice, int discountedPrice) {
    double discountPercentage =
        (((actualPrice - discountedPrice) / actualPrice) * 100).toDouble();
    String formattedDiscountPercentage = discountPercentage.toStringAsFixed(0);
    return formattedDiscountPercentage;
  }
}

// void toggleFavorite(int index) {
//   products[index].isFavorite = !products[index].isFavorite;
//   update(); // Update the products list after changing favorite state
// }


