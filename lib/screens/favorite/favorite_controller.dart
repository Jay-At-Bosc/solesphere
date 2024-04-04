import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/models/product_model.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();
  List<Products> favoriteList = <Products>[].obs;

  @override
  void onInit() async {
    getFavoriteList();
    super.onInit();
  }

  Future<void> getFavoriteList() async {
    try {
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
        List<dynamic> responseData = response.data;
        List<Products> fav =
            responseData.map((json) => Products.fromMap(json)).toList();
        favoriteList = fav;

        // TLoaders.successSnackBar(
        //     title: "Removed From Favorites",
        //     message: "Product removed from your favorites list!");
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
