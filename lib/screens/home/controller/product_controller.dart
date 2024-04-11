// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/screens/filter/filter_controller.dart';
import 'package:solesphere/screens/filter/filter_screen.dart';
import 'package:solesphere/services/api/end_points.dart';
import '../../../services/models/category_model.dart';
import '../../../services/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  String get homeId => "HomeId";

  TextEditingController searchProduct = TextEditingController();

  final selectedCategory = ''.obs;
  final isLoading = false.obs;
  final isSearching = false.obs;
  final isProdcutLoading = false.obs;
  bool isBrandSelected = false;
  final brandName = ''.obs;

  final productList = <Products>[].obs;
  final filterProductList = <Products>[].obs;
  final searchProductList = <Products>[].obs;

  final brandList = RxList<Brands>([]);

  @override
  void onInit() {
    fetchBrands();
    fetchProducts();
    super.onInit();
  }

  bool isMainLoading() => isLoading.value || isProdcutLoading.value;

  Future<void> fetchBrands() async {
    isLoading.value = true;
    final response = await http.get(
        Uri.parse('https://solesphere-backend.onrender.com/api/v1/brands/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> brandsData = responseData['data']['brands'];
      final List<Brands> brands =
          brandsData.map((item) => Brands.fromMap(item)).toList();
      brandList.assignAll(brands);
    } else {
      TLoaders.errorSnackBar(title: "Oops!", message: "Failed to load data");
    }
    isLoading.value = false;
    update([homeId]);
  }

  Future<void> fetchProducts() async {
    filterProductList.clear();
    isProdcutLoading.value = true;
    final response = await http.get(
        Uri.parse('https://solesphere-backend.onrender.com/api/v1/products/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      productList.value = data.map((item) => Products.fromMap(item)).toList();
      productList.sort((a, b) => b.id.compareTo(a.id));
      filterProductList.addAll(productList);
      log('Products Count: ${productList.length}');
    } else {
      throw Exception('Failed to load products');
    }
    isProdcutLoading.value = false;
    update([homeId]);
  }

  void onItemClick(String id, String name) {
    selectedCategory.value = id;
    if (selectedCategory.value != '') {
      filterProductList.clear();
      brandName.value = name;
      filterProductList
          .addAll(productList.where((product) => product.brand.id == id));
    } else {
      brandName.value = '';
      filterProductList.clear();
      filterProductList.addAll(productList);
    }
    update(["categories", "Favorite", "title"]);
  }

  String calculateDiscount(int actualPrice, int discountedPrice) {
    double discountPercentage =
        (((actualPrice - discountedPrice) / actualPrice) * 100).toDouble();
    return discountPercentage.toStringAsFixed(0);
  }

  Future<void> search(String query) async {
    try {
      isSearching.value = true;
      searchProductList.clear();
      var dio = Dio();
      var response = await dio.request(
        EndPoints.search,
        options: Options(method: 'GET'),
        queryParameters: {'q': query},
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['data']['responseData'];
        searchProductList
            .addAll(responseData.map((json) => Products.fromMap(json)));
        log('Search Results Count: ${searchProductList.length}');
      } else {
        log(response.statusMessage.toString());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isSearching.value = false;
      update(['search']);
    }
  }

  filterOpen() async {
    await FilterController.instance.fetchData();
    Get.bottomSheet(
      FilterScreen(),
      isScrollControlled: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
