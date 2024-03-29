import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/icons.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
// import 'package:solesphere/screens/cart/cart_repository.dart';

import '../../services/api/end_points.dart';
import '../../services/models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  static CartController get instance => Get.find<CartController>();

  var cartItemsList = <CartModel>[].obs;
  RxBool isCartLoading = false.obs;
  RxBool isIncreament = false.obs;
  RxBool isDecrement = false.obs;

  RxInt totalAmount = 0.obs;
  RxInt deliveryCharge = 0.obs;

  @override
  void onInit() {
    loadCartFromApi();
    update(['cart_count']);
    // calculateTotalAmount();
    super.onInit();
  }

  Future<void> loadCartFromApi() async {
    try {
      isCartLoading.value = true;
      update(['CartList']);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      log(token!);

      var url =
          "https://solesphere-backend.onrender.com/api/v1/products/get-cart";

      final response = await http.get(Uri.parse(url), headers: {
        'auth-token': token,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> cartItemsJson = jsonResponse['data']['cartItems'];

        for (var item in cartItemsJson) {
          CartModel cartItem = CartModel.fromMap(item);
          // totalAmount += (cartItem.discounted_price * cartItem.quantity);
          cartItemsList.add(cartItem);
        }
        totalAmount.value = jsonResponse['data']['totalAmount'];
        deliveryCharge.value = jsonResponse['data']['deliveryCharge'];
        log("cart-data $cartItemsList");
        isCartLoading.value = false;
        update(['CartList', 'amount', 'cart_count']);
      } else {
        Get.snackbar("Opps1", "Cart is empty");
        isCartLoading.value = false;
        update(['CartList', 'amount', 'cart_count']);
      }
    } catch (e) {
      isCartLoading.value = false;
      update(['CartList', 'cart_count']);
      log(e.toString());
    }
  }

  Future<void> increaseQuantity(CartModel product) async {
    final index = cartItemsList.indexWhere((item) => item.id == product.id);

    try {
      if (index != -1 && cartItemsList[index].quantity < 10) {
        isIncreament.value = true;
        if (isIncreament.value) {
          Get.dialog(
            AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    SJsons.loader,
                    width: 30.0.getWidth(),
                    height: 30.0.getWidth(),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Loading',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            barrierDismissible: false,
          );
        }
        Map<String, dynamic> data = {
          'product_id': cartItemsList[index].productId,
          'productName': cartItemsList[index].productName,
          'color': cartItemsList[index].color,
          'size': cartItemsList[index].size,
        };
        String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
        log('token: $token');

        final jsonData = jsonEncode(data);
        var headers = {'auth-token': token, 'Content-Type': 'application/json'};
        var dio = Dio();
        var response = await dio.request(EndPoints.addToCart,
            options: Options(method: 'POST', headers: headers), data: jsonData);

        if (response.statusCode == 200) {
          log("Updated......................");
          log("cart-data $cartItemsList");
          cartItemsList[index].quantity++;
          totalAmount.value += cartItemsList[index].discountedPrice;

          isIncreament.value = false;
          update(['amount']);
        } else {
          log(response.statusCode.toString());
        }

        update(['quantity']);
      } else {
        Get.snackbar("No", "Cant add more than 10");
      }
    } on DioException catch (_) {
      isIncreament.value = false;
      throw DioException;
    } catch (e) {
      isIncreament.value = false;
      throw "Something Went Wrong";
    }
  }

  Future<void> deleteFromCartApi(CartModel product, int flag) async {
    final index = cartItemsList.indexWhere((item) => item.id == product.id);

    try {
      isDecrement.value = true;
      if (isDecrement.value) {
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  SJsons.loader,
                  width: 30.0.getWidth(),
                  height: 30.0.getWidth(),
                ),
                const SizedBox(
                    height:
                        10.0), // Add some space between Lottie animation and text
                const Text(
                  'Loading',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          barrierDismissible: false,
        );
      }
      // update(['CartList']);
      if (cartItemsList[index].quantity >= 1) {
        String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

        var headers = {'auth-token': token, 'Content-Type': 'application/json'};
        Map<String, dynamic> data = {
          'productName': cartItemsList[index].productName,
          'color': cartItemsList[index].color,
          'size': cartItemsList[index].size,
          "flag": flag
        };
        final jsonData = jsonEncode(data);

        var dio = Dio();
        var response = await dio.request(EndPoints.deleteToCart,
            options: Options(method: 'DELETE', headers: headers),
            data: jsonData);

        if (response.statusCode == 200 &&
            flag == 0 &&
            cartItemsList[index].quantity > 1) {
          cartItemsList[index].quantity--;
          totalAmount -= cartItemsList[index].discountedPrice;
        } else if (response.statusCode == 200 &&
            flag == 0 &&
            cartItemsList[index].quantity == 1) {
          totalAmount -= cartItemsList[index].discountedPrice;
          cartItemsList.removeAt(index);
          // isDecrement.value = false;
          // update(['quantity', 'CartList']);
        } else if (response.statusCode == 200 && flag == 1) {
          totalAmount -= (cartItemsList[index].discountedPrice *
              cartItemsList[index].quantity);
          cartItemsList.removeAt(index);
        } else {
          Get.snackbar("Opps", "Please try again later!!");
        }
        isDecrement.value = false;
        // calculateTotalAmount();
        update(['quantity', 'CartList', 'amount']);
      }
    } on DioException catch (_) {
      isDecrement.value = false;
      // log(DioException);
      throw DioException;
    } catch (e) {
      isDecrement.value = false;
      throw "Something Went Wrong";
    }
  }

  // void calculateTotalAmount() {
  //   totalAmount = calculateShippmentCharge()
  //       ? flag.value
  //           ? (totalAmount + deliveryCharge.value)
  //           : (totalAmount - deliveryCharge.value)
  //       : totalAmount;
  //   update(['amount']);
  // }

  // bool calculateShippmentCharge() {
  //   if (totalAmount > 499) {
  //     return false;
  //   } else {
  //     flag.value = true;
  //     return true;
  //   }
  // }
}
