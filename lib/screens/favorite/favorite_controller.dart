import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/models/product_model.dart';

import '../../common/widgets/popup/loaders.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  List<Products> favoriteList = <Products>[].obs;
  bool isLoading = false;

  @override
  void onInit() {
    getFavoriteList();
    super.onInit();
  }

  bool isFav(String id) {
    update(['fav_icon']);
    return favoriteList.any((product) => product.id == id);
  }

  Future<void> getFavoriteList() async {
    try {
      isLoading = true;
      update(['favorite']);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };

      var dio = Dio();
      var response = await dio.request(
        EndPoints.getFavorite,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey("data")) {
          List<dynamic> responseData = response.data["data"];
          List<Products> fav =
              responseData.map((json) => Products.fromMap(json)).toList();
          favoriteList = fav;

          for (var i = 0; i < favoriteList.length; i++) {
            log(favoriteList[i].id);
          }
        } else {
          print("Invalid response format");
        }
        isLoading = false;

        update(['favorite']);
        // TLoaders.successSnackBar(
        //     title: "Removed From Favorites",
        //     message: "Product removed from your favorites list!");
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      isLoading = false;
      update(['favorite']);
      log(e.toString());
    }
    // if (!favoriteList.value.contains(product)) {
    //   TLoaders.warningSnackBar(
    //       title: "Opps!!", message: "Product Not Found in Favorite");
    // } else {
    //   favoriteList.value.remove(product);
    //   // products.value[product].isFavorite = false;

    //   TLoaders.successSnackBar(
    //       title: "Removed from Favorites",
    //       message: "Product removed from your favorites list!");
    //   update(["Favorite"]); // Update the UI
    // }
  }

  Future<void> addToFavorite(String id) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };
      var data = json.encode({"product_id": id});
      var dio = Dio();
      var response = await dio.request(
        EndPoints.addToFavorite,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        TLoaders.successSnackBar(
            title: "Added to Favorites",
            message: "Product added to your favorites list!");
        getFavoriteList();
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      log(e.toString());
    }

    // if (favoriteList.value.contains(product)) {
    //   Get.closeAllSnackbars();
    //   TLoaders.warningSnackBar(
    //       title: "Opps!!", message: "Product already added to the favorite");
    // } else {
    //   favoriteList.value.add(product);
    //   // products.value[product].isFavorite = true;

    //   TLoaders.successSnackBar(
    //       title: "Added to Favorites",
    //       message: "Product added to your favorites list!");
    //   update(["Favorite"]); // Update the UI
    // }
  }

  Future<void> removeToFavorite(Products product) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };
      var data = json.encode({"product_id": product.id});
      var dio = Dio();
      var response = await dio.request(
        EndPoints.getFavorite,
        options: Options(
          method: 'PUT',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        TLoaders.successSnackBar(
            title: "Removed From Favorites",
            message: "Product removed from your favorites list!");
        getFavoriteList();
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      log(e.toString());
    }
    // if (!favoriteList.value.contains(product)) {
    //   TLoaders.warningSnackBar(
    //       title: "Opps!!", message: "Product Not Found in Favorite");
    // } else {
    //   favoriteList.value.remove(product);
    //   // products.value[product].isFavorite = false;

    //   TLoaders.successSnackBar(
    //       title: "Removed from Favorites",
    //       message: "Product removed from your favorites list!");
    //   update(["Favorite"]); // Update the UI
    // }
  }
}
