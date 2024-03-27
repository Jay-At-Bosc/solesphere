import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/services/api/end_points.dart';

import 'package:solesphere/utils/constants/icons.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../services/models/product_detail_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailController extends GetxController {
  // static const String rebuildProductDetails = "rebuildProductDetils";

  static ProductDetailController get instance =>
      Get.find<ProductDetailController>();

  late ProductDetailModel productDetail;
  List<String> imageUrls = [];
  RxBool isLoading = false.obs;
  RxBool isCartLoading = false.obs;
  RxInt selectedVarient = 0.obs;
  RxInt selectedSize = 0.obs;

  @override
  void onInit() {
    //call api and initialize the productDetail
    super.onInit();
  }

  // Iterate over each ProductDetailModel in productDetailList

  void setProductDetails(Map<String, dynamic> responseData) {
    try {
      var data = responseData['data'];
      if (data != null) {
        // If data is a string, parse it as JSON
        if (data is String) {
          data = json.decode(data);
        }

        if (data is Map<String, dynamic>) {
          productDetail = ProductDetailModel.fromMap(data);
          // productDetailList.add(product);
          // log('Product Added: ${productDetailList.length}');
          log('Product Details: $productDetail');
        } else {
          throw const FormatException('Invalid product data structure');
        }
      } else {
        throw const FormatException('No product data found');
      }
    } catch (error) {
      log('Error parsing product details: $error');
      // log(stackTrace);
      // Handle parsing error
    }
  }

  Future<void> fetchProductDetails(String productId) async {
    try {
      isLoading.value = true;
      if (isLoading.value == true) {
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white, // White background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Square shape
            ),
            icon: Lottie.asset(SJsons.loader,
                width: 30.0.getWidth(), height: 30.0.getWidth()),
            title: const Text(
              'Loading',
              style: TextStyle(color: Colors.black), // Black title
            ),
          ),
          barrierDismissible: false,
        );
      }
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
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw Exception('Failed to load product details');
      }
    } catch (error) {
      isLoading.value = false;
      log('Error during API request: $error');
      // Handle error
    } finally {
      if (isLoading.value == false) {
        Get.back();
      }
    }
    //false
    update();
  }

  //calculate total rating of product

  // List<Review> parseReviews(String productDetail.review) {
  //   final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  //   return parsed.map<Review>((json) => Review.fromJson(json)).toList();
  // }

  // double calculateAverageRating(List<Review> reviews) {
  //   if (reviews.isEmpty) return 0;

  //   final totalRating =
  //       reviews.map((review) => review.rating).reduce((a, b) => a + b);
  //   return totalRating / reviews.length;
  // }

  //All Images of products
  void getImagesList() {
    // Iterate over each Variant in the current ProductDetailModel
    for (Variant variant in productDetail.variants) {
      // Add all image URLs from the current Variant to allImagesList
      imageUrls.addAll(variant.imageUrls);
    }

    log('total images: ${imageUrls.length}');
    // }
  }

  int calculateDiscountPercentage(int actualPrice, int discountedPrice) {
    double discountPercentage =
        ((actualPrice - discountedPrice) / actualPrice) * 100;
    return discountPercentage
        .floor(); // Round the double value to the nearest integer
  }

  Future<void> addToCartApi(String id, String name, String image, String color,
      int size, int qty, int discountedPrice, int actualPrice) async {
    try {
      isCartLoading.value = true;
      // if (isCartLoading.value == true) {
      //   const ShoesLoading();
      // }
      update(['CartList', 'cartBtn']);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      Map<String, dynamic> data = {
        'product_id': id,
        'productName': name,
        'image_url': image,
        'color': color,
        'size': size,
        'quantity': qty,
        'discounted_price': discountedPrice,
        'actual_price': actualPrice,
      };
      final jsonData = jsonEncode(data);

      var dio = Dio();
      var response = await dio.request(EndPoints.addToCart,
          options: Options(method: 'POST', headers: headers), data: jsonData);

      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonResponse = json.decode(response.body);
        // final List<dynamic> cartItemsJson = jsonResponse['data']['cartItems'];

        // for (var item in cartItemsJson) {
        //   CartModel cartItem = CartModel.fromMap(item);
        //   totalAmount += (cartItem.discounted_price * cartItem.quantity);
        //   cartItemsList.add(cartItem);
        // }
        // log("cart-data ${cartItemsList}");
        isCartLoading.value = false;
        // if (isCartLoading.value == false) {
        //   Get.back();
        // }
        update(['CartList', 'cartBtn']);
        log("Oooooooooooook");
        TLoaders.successSnackBar(
            title: "Wow 🎉", message: "$name is added to the cart");
      }
    } on SocketException catch (e) {
      // Handle SocketException (e.g., no internet connection)
      log('SocketException: $e');
    } on HttpException catch (e) {
      // Handle HttpException (e.g., 404 Not Found)
      log('HttpException: $e');
    } catch (e) {
      // Catch any other error that might occur
      log('Error: $e');
    }
  }
}
