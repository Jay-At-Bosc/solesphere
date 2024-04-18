import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/api/end_points.dart';
import 'package:solesphere/services/models/product_model.dart';
import '../../common/widgets/popup/loaders.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  List<Products> favoriteList = <Products>[].obs;
  bool isLoading = false;

  String get favoriteId => 'favoriteId';

  @override
  void onInit() {
    getFavoriteList();
    super.onInit();
  }

  // bool isFav(String id) {
  //   update(['fav_icon']);
  //   return favoriteList.any((product) => product.id == id);
  // }

  Future<void> getFavoriteList() async {
    try {
      isLoading = true;
      update([favoriteId]);

      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };

      var dio = Dio();
      var response = await dio.get(
        EndPoints.getFavorite,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey("data")) {
          favoriteList = (response.data["data"] as List<dynamic>)
              .map((json) => Products.fromMap(json))
              .toList();
        }
        // } else {
        //   print("Invalid response format");
        // }

        isLoading = false;
        update([favoriteId]);
      } else {
        TLoaders.warningSnackBar(
            title: "Opps!!", message: response.statusMessage);
      }
    } catch (e) {
      isLoading = false;
      TLoaders.warningSnackBar(title: "Opps!!", message: e.toString());
      update([favoriteId]);
    }
  }

  Future<void> addToFavorite(String id) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };

      var data = json.encode({"product_id": id});

      var dio = Dio();
      var response = await dio.post(
        EndPoints.addToFavorite,
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        TLoaders.successSnackBar(
          title: "Added to Favorites",
          message: "Product added to your favorites list!",
        );

        await getFavoriteList();

        // await FirebaseAnalytics.instance.logAddToCart(
        //   currency: 'INR',
        //   value: ,
        //   items: [toAnalyticsEventItem()],
        // );
        update([favoriteId]);
      } else {
        log(response.statusMessage.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removeToFavorite(String id) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };

      var data = json.encode({"product_id": id});

      var dio = Dio();
      var response = await dio.put(
        EndPoints.getFavorite,
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        TLoaders.successSnackBar(
          title: "Removed From Favorites",
          message: "Product removed from your favorites list!",
        );

        getFavoriteList();
        update([favoriteId]);
      } else {
        log(response.statusMessage.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // AnalyticsEventItem toAnalyticsEventItem() {
  //   String itemName = favoriteList;
  //   String itemId = productDetail.id;
  //   String itemCategory = productDetail.category.category;
  //   double price =
  //       productDetail.variants.first.sizes.first.discountedPrice.toDouble();
  //   String? currency = 'INR'; // Assuming currency is in the first variant

  //   String? brand =
  //       productDetail.brand.brand; // Assuming Brand has a 'name' property

  //   return AnalyticsEventItem(
  //     itemId: itemId,
  //     itemName: itemName,
  //     itemCategory: itemCategory,
  //     price: price,
  //     currency: currency,
  //     itemBrand: brand,
  //   );
  // }
}
