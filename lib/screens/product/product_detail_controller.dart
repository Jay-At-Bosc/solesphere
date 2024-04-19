import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/services/api/end_points.dart';

import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../services/models/product_detail_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailController extends GetxController {
  // static const String rebuildProductDetails = "rebuildProductDetils";

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  static ProductDetailController get instance =>
      Get.find<ProductDetailController>();

  late ProductDetailModel productDetail;
  List<String> imageUrls = [];
  RxBool isLoading = false.obs;
  RxBool isCartLoading = false.obs;
  RxInt selectedVarient = 0.obs;
  RxInt selectedSize = 0.obs;

  AnalyticsEventItem event = AnalyticsEventItem();

  String get detailedProductId => 'detailedProductId';
  String get cartBtnId => 'cartBtn';
  // String productId = '';

  @override
  void onInit() async {
    // FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

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
      log(productId);

      // await FirebaseAnalytics.instance.logViewItem(

      // );

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

        await FirebaseAnalytics.instance.logViewItem(
            currency: "INR",
            value: productDetail.variants.first.sizes.first.discountedPrice
                .toDouble(),
            items: [
              toAnalyticsEventItem(),
            ]);
      } else {
        isLoading.value = false;
        throw Exception('Failed to load product details');
      }
    } catch (error) {
      isLoading.value = false;
      log('Error during API request: $error');
      // Handle error
    } finally {
      // if (isLoading.value == false) {
      //   Get.back();
      // }
    }
    //false
    update();
  }

  //All Images of products
  void getImagesList() {
    imageUrls.clear();
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

  Future<void> addToCartApi(ProductDetailModel product) async {
    try {
      isCartLoading.value = true;

      update(['CartList', cartBtnId]);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      Map<String, dynamic> data = {
        'product_id': product.id,
        'productName': product.productName,
        'image_url': product.variants[selectedVarient.value].imageUrls.first,
        'color': product.variants[selectedVarient.value].color,
        'size': product
            .variants[selectedVarient.value].sizes[selectedSize.value].size,
        'quantity': 1,
        'discounted_price': product.variants[selectedVarient.value]
            .sizes[selectedSize.value].discountedPrice,
        'actual_price': product.variants[selectedVarient.value]
            .sizes[selectedSize.value].actualPrice,
      };
      final jsonData = jsonEncode(data);

      var dio = Dio();
      var response = await dio.request(EndPoints.addToCart,
          options: Options(method: 'POST', headers: headers), data: jsonData);

      if (response.statusCode == 200) {
        isCartLoading.value = false;

        await FirebaseAnalytics.instance.logAddToCart(
          currency: 'INR',
          value: productDetail.variants.first.sizes.first.discountedPrice
              .toDouble(),
          items: [toAnalyticsEventItem()],
        );

      

        update(['CartList', cartBtnId]);
        log("Oooooooooooook");
        TLoaders.successSnackBar(
            title: "Wow 🎉",
            message: "${product.productName} is added to the cart");
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
    } finally {
      isCartLoading.value = false;
      update(['CartList', cartBtnId]);
    }
  }

  @override
  void onClose() {
    imageUrls.clear();

    super.onClose();
  }

  AnalyticsEventItem toAnalyticsEventItem() {
    String itemName = productDetail.productName;
    String itemId = productDetail.id;
    String itemCategory = productDetail.category.category;
    double price =
        productDetail.variants.first.sizes.first.discountedPrice.toDouble();
    String? currency = 'INR'; // Assuming currency is in the first variant

    String? brand =
        productDetail.brand.brand; // Assuming Brand has a 'name' property

    return AnalyticsEventItem(
      itemId: itemId,
      itemName: itemName,
      itemCategory: itemCategory,
      price: price,
      currency: currency,
      itemBrand: brand,
    );
  }
}
