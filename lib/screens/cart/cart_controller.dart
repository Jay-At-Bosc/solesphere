import 'dart:convert';
import 'dart:developer';

import 'package:solesphere/auth/auth_exports.dart';
// import 'package:solesphere/screens/cart/cart_repository.dart';

import '../../services/models/cart_model.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  static CartController get instance => Get.find<CartController>();
  // CartRepository cartRepository = CartRepository();
  var cartItemsList = <CartModel>[].obs;
  RxBool isCartLoading = false.obs;
  RxInt totalAmount = 0.obs;

  // loadCartFromApi() async {
  //   var cartItemList = cartRepository.loadCartFromApi();

  //   for (var item in cartItemList) {
  //     CartModel cartItem = CartModel.fromMap(item);
  //     cartItemsList.add(cartItem);
  //   }
  //   log(cartItemsList.toString());
  // }
  @override
  void onInit() async {
    await loadCartFromApi();
    calculateTotalAmount();
    super.onInit();
  }

  Future<void> loadCartFromApi() async {
    try {
      isCartLoading.value = true;
      update(['CartList']);

      var url =
          "https://solesphere-backend.onrender.com/api/v1/products/get-cart";

      final response = await http.get(Uri.parse(url), headers: {
        'auth-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWUxODJmMGE0ODRlNjcwYzY4ODcwNTciLCJlbWFpbCI6ImtpcnRhbmRhdmVAYm9zY3RlY2hsYWJzLmNvbSIsImlhdCI6MTcwOTI3NzkzNn0.apiL-taCwpQs_6KFYYbgMx-ATLNd3RMQQG8YjlHzC68'
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> cartItemsJson = jsonResponse['data']['cartItems'];

        for (var item in cartItemsJson) {
          CartModel cartItem = CartModel.fromMap(item);
          // totalAmount += (cartItem.discounted_price * cartItem.quantity);
          cartItemsList.add(cartItem);
        }
        log("cart-data ${cartItemsList}");
        isCartLoading.value = false;
        update(['CartList']);
      }
    } catch (e) {
      isCartLoading.value = false;
      update(['CartList']);
      log(e.toString());
    }
  }

  void addToCart(CartModel product) {
    final index = cartItemsList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      cartItemsList[index].quantity++;
      update(['quantity']);
    } else {
      cartItemsList.add(product);
    }
  }

  void removeFromCart(CartModel product) {
    cartItemsList.removeWhere((item) => item.id == product.id);
    // totalAmount -= cartItemsList[index].discounted_price;
  }

  void increaseQuantity(CartModel product) {
    final index = cartItemsList.indexWhere((item) => item.id == product.id);
    if (index != -1 && cartItemsList[index].quantity < 10) {
      cartItemsList[index].quantity++;
      // totalAmount += cartItemsList[index].discounted_price;
      calculateTotalAmount();

      update(['quantity']);
    }
  }

  void decreaseQuantity(CartModel product) {
    final index = cartItemsList.indexWhere((item) => item.id == product.id);

    if (cartItemsList[index].quantity > 1) {
      cartItemsList[index].quantity--;

      // totalAmount -= cartItemsList[index].discounted_price;
    } else {
      cartItemsList.removeAt(index);
    }

    calculateTotalAmount();
    update(['CartList', 'quantity']);
  }

  Future<void> deleteFromCartApi(String name, String color, int size) async {
    try {
      // isCartLoading.value = true;
      update(['CartList']);

      var url = "https://solesphere-backend.onrender.com/api/v1/products/delete-cart-item";

      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWUxODJmMGE0ODRlNjcwYzY4ODcwNTciLCJlbWFpbCI6ImtpcnRhbmRhdmVAYm9zY3RlY2hsYWJzLmNvbSIsImlhdCI6MTcwOTI3NzkzNn0.apiL-taCwpQs_6KFYYbgMx-ATLNd3RMQQG8YjlHzC68'
        },
        body: jsonEncode({
          'productName': name,
          'color': color,
          'size': size,
        }),
      );
      if (response.statusCode == 200) {
        // ignore: collection_methods_unrelated_type
        cartItemsList.remove((item) =>
            item.productName == name &&
            item.color == color &&
            item.size == size);
        update(['CartList']);

        log("Deleted............");
      }
    } catch (e) {
      // isCartLoading.value = false;
      // update(['CartList']);
      log(e.toString());
    }
  }

  void calculateTotalAmount() {
    totalAmount.value = 0;
    if (cartItemsList.isNotEmpty) {
      for (var item in cartItemsList) {
        totalAmount += (item.quantity * item.discounted_price);
      }
    }
    totalAmount = calculateShippmentCharge() ? (totalAmount + 40) : totalAmount;
    update(['amount']);
  }

  bool calculateShippmentCharge() {
    if (totalAmount > 499) {
      return false;
    } else {
      return true;
    }
  }
}
