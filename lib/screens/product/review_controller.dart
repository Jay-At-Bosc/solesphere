import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/screens/home/home.dart';
import 'package:solesphere/services/api/end_points.dart';

import '../order/view_order_controller.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  String get reviewFormId => 'review_form';
  String get arrowAnimationId => 'arrow_animation';

  double rating = 0.0;
  bool isLoading = false;
  final TextEditingController review = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> isUserEligible(String productId) async {
    isLoading = true;
    update([arrowAnimationId]);
    await Future.delayed(const Duration(seconds: 3));

    // final orders = Get.put(ViewOrderController());

    for (var order in ViewOrderController.instance.orders) {
      if (order.user == NavigationController.instance.userData['_id']) {
        for (var product in order.products) {
          if (product.productId == productId &&
              order.orderStatus == 'Delivered') {
            isLoading = false;
            update([arrowAnimationId]);
            return true;
          }
        }
      }
    }

    isLoading = false;
    update([arrowAnimationId]);

    return false;
  }

  Future<void> storeReview(String productId) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      var data = json.encode({
        "product_id": productId,
        "rating": rating,
        "review": review.text.trim()
      });
      var dio = Dio();
      var response = await dio.request(
        EndPoints.review,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Get.back();
        review.clear();
        rating = 0.0;
        TLoaders.successSnackBar(
            title: 'Thanks!', message: "Thanks For Your Valuable Feedback!");
        // print(json.encode(response.data));
      } else {
        Get.back();

        TLoaders.warningSnackBar(
            title: 'Something wrong', message: "response.statusMessage");
        // print(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteReview(String reviewId, String productId) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {'auth-token': token, 'Content-Type': 'application/json'};
      var data = json.encode({"_id": reviewId, "product_id": productId});
      var dio = Dio();
      var response = await dio.request(
        EndPoints.review,
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        // Get.back();
        TLoaders.successSnackBar(
            title: 'Deleted!', message: "Your Review was deleted..");
        // print(json.encode(response.data));
      } else {
        // Get.back();
        TLoaders.warningSnackBar(
            title: 'Something wrong', message: "response.statusMessage");
        // print(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    review.text = "";
    super.dispose();
  }
}
