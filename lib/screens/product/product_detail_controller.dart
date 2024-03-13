import 'dart:convert';
import 'dart:developer';
// import 'dart:developer';

import 'package:solesphere/auth/auth_exports.dart';

import '../../services/models/product_detail_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailController extends GetxController {
  static const String rebuildProductDetails = "rebuildProductDetils";
  static ProductDetailController get instance =>
      Get.find<ProductDetailController>();

      @override
  void onInit() {
    //call api and initialize the productDetail
    super.onInit();
  }

  late ProductDetailModel productDetail;
  // Iterate over each ProductDetailModel in productDetailList

  // void getImagesList() {
    
  //     // Iterate over each Variant in the current ProductDetailModel
  //     for (Variant variant in productDetail.variants) {
  //       // Add all image URLs from the current Variant to allImagesList
  //       allImagesList.addAll(variant.image_urls);
  //     }
    
  //   log('total images: ${allImagesList.length}');
  // }

  void setProductDetails(Map<String, dynamic> responseData) {
    try {
      var data = responseData['data'];
      if (data != null) {
        // If data is a string, parse it as JSON
        if (data is String) {
          data = json.decode(data);
        }

        // Ensure data is now a map
        if (data is Map<String, dynamic>) {
          var product = ProductDetailModel.fromMap(data);
          // productDetailList.add(product);
          // log('Product Added: ${productDetailList.length}');
          log('Product Details: $product');
        } else {
          throw const FormatException('Invalid product data structure');
        }
      } else {
        throw const FormatException('No product data found');
      }
    } catch (error) {
      log('Error parsing product details: $error');
      // print(stackTrace);
      // Handle parsing error
    }
  }

  Future<void> fetchProductDetails(String productId) async {
    try {
      //true
      //update([id]);
      final response = await http.get(
        Uri.parse(
          'https://solesphere-backend.onrender.com/api/v1/products/product-detail?product_id=$productId',
        ),
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        setProductDetails(responseData);
      } else {
        throw Exception('Failed to load product details');
      }
    } catch (error) {
      log('Error during API request: $error');
      // Handle error
    }
    //false
    //update
  }
}
