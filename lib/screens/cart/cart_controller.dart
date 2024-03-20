import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
// import 'package:solesphere/screens/cart/cart_repository.dart';

import '../../services/api/end_points.dart';
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
            'eyJhbGciOiJSUzI1NiIsImtpZCI6ImViYzIwNzkzNTQ1NzExODNkNzFjZWJlZDI5YzU1YmVmMjdhZDJjY2IiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiVklTSEFMIFNPUkFOSSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NKdTVUUjlZUmlaRUNNa2d2NmRGUWFIbHJGVnJYXzhjQlNaeENScUhQWC1GbTQ9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc29sZXNwaGVyZS1hcHAtNzNjMmIiLCJhdWQiOiJzb2xlc3BoZXJlLWFwcC03M2MyYiIsImF1dGhfdGltZSI6MTcxMDkxNDI5MywidXNlcl9pZCI6IlpjMjVRSTdRNXliYjBSZk5aaVlGd2lDUE8yVDIiLCJzdWIiOiJaYzI1UUk3UTV5YmIwUmZOWmlZRndpQ1BPMlQyIiwiaWF0IjoxNzEwOTE0MjkzLCJleHAiOjE3MTA5MTc4OTMsImVtYWlsIjoic29yYW5pdmlzaGFsMTIxMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMjQ4Mjg2NTczNTgxOTUxMzg3NyJdLCJlbWFpbCI6WyJzb3Jhbml2aXNoYWwxMjEyQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.P7keCEmVI45UtaSNkNVdRNbHhjzhdHG39sKgzU2RLmdYzKmX7LRth0FYYIMCv4goLtvqQJSwnhbAu0zz4jzxkkjwDSiFUs-ua0rMEjIlXu4fwFXccLnjk5it2h6c72Ih6UR8IJm5r3UEJG4PqbarDsCGwSllqE6o_jXoPj-Gv2_sQ315ZGwhJx2T6lrl6KpZzJPYzke1llNFs-40lmamat3rsfsOCxu20ldlwnQpaOBBLRq5zQ5gVhzo7mWZALhIbh-A9CouKhnCH0V2UNlMiuz8Drr57EZ6zaSB6-PYcWUa-cG9qpAoK74JZGCX45Ocb62D0Mncqssa4biFjxi9PQ'
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> cartItemsJson = jsonResponse['data']['cartItems'];

        for (var item in cartItemsJson) {
          CartModel cartItem = CartModel.fromMap(item);
          // totalAmount += (cartItem.discounted_price * cartItem.quantity);
          cartItemsList.add(cartItem);
        }
        log("cart-data $cartItemsList");
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

  void increaseQuantity(CartModel product) async {
    final index = cartItemsList.indexWhere((item) => item.id == product.id);
    // if (index != -1 && cartItemsList[index].quantity < 10) {
    //   cartItemsList[index].quantity++;
    //   // totalAmount += cartItemsList[index].discounted_price;
    //   calculateTotalAmount();

    //   update(['quantity']);
    // }
    try {
      Map<String, dynamic> data = {
        'product_id': cartItemsList[index].product_id,
        'productName': cartItemsList[index].productName,
        'color': cartItemsList[index].color,
        'size': cartItemsList[index].size,
      };
      final jsonData = jsonEncode(data);
      var headers = {
        'auth-token':
            'eyJhbGciOiJSUzI1NiIsImtpZCI6ImViYzIwNzkzNTQ1NzExODNkNzFjZWJlZDI5YzU1YmVmMjdhZDJjY2IiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiVklTSEFMIFNPUkFOSSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NKdTVUUjlZUmlaRUNNa2d2NmRGUWFIbHJGVnJYXzhjQlNaeENScUhQWC1GbTQ9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc29sZXNwaGVyZS1hcHAtNzNjMmIiLCJhdWQiOiJzb2xlc3BoZXJlLWFwcC03M2MyYiIsImF1dGhfdGltZSI6MTcxMDkxNDI5MywidXNlcl9pZCI6IlpjMjVRSTdRNXliYjBSZk5aaVlGd2lDUE8yVDIiLCJzdWIiOiJaYzI1UUk3UTV5YmIwUmZOWmlZRndpQ1BPMlQyIiwiaWF0IjoxNzEwOTE0MjkzLCJleHAiOjE3MTA5MTc4OTMsImVtYWlsIjoic29yYW5pdmlzaGFsMTIxMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMjQ4Mjg2NTczNTgxOTUxMzg3NyJdLCJlbWFpbCI6WyJzb3Jhbml2aXNoYWwxMjEyQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.P7keCEmVI45UtaSNkNVdRNbHhjzhdHG39sKgzU2RLmdYzKmX7LRth0FYYIMCv4goLtvqQJSwnhbAu0zz4jzxkkjwDSiFUs-ua0rMEjIlXu4fwFXccLnjk5it2h6c72Ih6UR8IJm5r3UEJG4PqbarDsCGwSllqE6o_jXoPj-Gv2_sQ315ZGwhJx2T6lrl6KpZzJPYzke1llNFs-40lmamat3rsfsOCxu20ldlwnQpaOBBLRq5zQ5gVhzo7mWZALhIbh-A9CouKhnCH0V2UNlMiuz8Drr57EZ6zaSB6-PYcWUa-cG9qpAoK74JZGCX45Ocb62D0Mncqssa4biFjxi9PQ',
        'Content-Type': 'application/json'
      };
      var dio = Dio();
      var response = await dio.request(EndPoints.addToCart,
          options: Options(method: 'POST', headers: headers), data: jsonData);

      // var url =
      //     "https://solesphere-backend.onrender.com/api/v1/products/add-to-cart";
      // final response = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     'auth-token':
      //         'eyJhbGciOiJSUzI1NiIsImtpZCI6ImViYzIwNzkzNTQ1NzExODNkNzFjZWJlZDI5YzU1YmVmMjdhZDJjY2IiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiVklTSEFMIFNPUkFOSSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NKdTVUUjlZUmlaRUNNa2d2NmRGUWFIbHJGVnJYXzhjQlNaeENScUhQWC1GbTQ9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc29sZXNwaGVyZS1hcHAtNzNjMmIiLCJhdWQiOiJzb2xlc3BoZXJlLWFwcC03M2MyYiIsImF1dGhfdGltZSI6MTcxMDkxNDI5MywidXNlcl9pZCI6IlpjMjVRSTdRNXliYjBSZk5aaVlGd2lDUE8yVDIiLCJzdWIiOiJaYzI1UUk3UTV5YmIwUmZOWmlZRndpQ1BPMlQyIiwiaWF0IjoxNzEwOTE0MjkzLCJleHAiOjE3MTA5MTc4OTMsImVtYWlsIjoic29yYW5pdmlzaGFsMTIxMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMjQ4Mjg2NTczNTgxOTUxMzg3NyJdLCJlbWFpbCI6WyJzb3Jhbml2aXNoYWwxMjEyQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.P7keCEmVI45UtaSNkNVdRNbHhjzhdHG39sKgzU2RLmdYzKmX7LRth0FYYIMCv4goLtvqQJSwnhbAu0zz4jzxkkjwDSiFUs-ua0rMEjIlXu4fwFXccLnjk5it2h6c72Ih6UR8IJm5r3UEJG4PqbarDsCGwSllqE6o_jXoPj-Gv2_sQ315ZGwhJx2T6lrl6KpZzJPYzke1llNFs-40lmamat3rsfsOCxu20ldlwnQpaOBBLRq5zQ5gVhzo7mWZALhIbh-A9CouKhnCH0V2UNlMiuz8Drr57EZ6zaSB6-PYcWUa-cG9qpAoK74JZGCX45Ocb62D0Mncqssa4biFjxi9PQ'
      //   },
      //   body: jsonEncode({
      //     "product_id": cartItemsList[index].product_id,
      //     "productName": cartItemsList[index].productName,
      //     "color": cartItemsList[index].color,
      //     "size": cartItemsList[index]..size
      //   }),
      // );
      if (response.statusCode == 200) {
        log("Updated......................");
        log("cart-data $cartItemsList");
        // isCartLoading.value = false;
        // update(['CartList']);
      } else {
        log(response.statusCode.toString());
        // log(response.body);
      }
    } on DioException catch (_) {
      throw DioException;
    } catch (e) {
      throw "Something Went Wrong";
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

      var url =
          "https://solesphere-backend.onrender.com/api/v1/products/delete-cart-item";

      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'auth-token':
              'eyJhbGciOiJSUzI1NiIsImtpZCI6ImViYzIwNzkzNTQ1NzExODNkNzFjZWJlZDI5YzU1YmVmMjdhZDJjY2IiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiVklTSEFMIFNPUkFOSSIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NKdTVUUjlZUmlaRUNNa2d2NmRGUWFIbHJGVnJYXzhjQlNaeENScUhQWC1GbTQ9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc29sZXNwaGVyZS1hcHAtNzNjMmIiLCJhdWQiOiJzb2xlc3BoZXJlLWFwcC03M2MyYiIsImF1dGhfdGltZSI6MTcxMDkxNDI5MywidXNlcl9pZCI6IlpjMjVRSTdRNXliYjBSZk5aaVlGd2lDUE8yVDIiLCJzdWIiOiJaYzI1UUk3UTV5YmIwUmZOWmlZRndpQ1BPMlQyIiwiaWF0IjoxNzEwOTE0MjkzLCJleHAiOjE3MTA5MTc4OTMsImVtYWlsIjoic29yYW5pdmlzaGFsMTIxMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMjQ4Mjg2NTczNTgxOTUxMzg3NyJdLCJlbWFpbCI6WyJzb3Jhbml2aXNoYWwxMjEyQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.P7keCEmVI45UtaSNkNVdRNbHhjzhdHG39sKgzU2RLmdYzKmX7LRth0FYYIMCv4goLtvqQJSwnhbAu0zz4jzxkkjwDSiFUs-ua0rMEjIlXu4fwFXccLnjk5it2h6c72Ih6UR8IJm5r3UEJG4PqbarDsCGwSllqE6o_jXoPj-Gv2_sQ315ZGwhJx2T6lrl6KpZzJPYzke1llNFs-40lmamat3rsfsOCxu20ldlwnQpaOBBLRq5zQ5gVhzo7mWZALhIbh-A9CouKhnCH0V2UNlMiuz8Drr57EZ6zaSB6-PYcWUa-cG9qpAoK74JZGCX45Ocb62D0Mncqssa4biFjxi9PQ'
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
