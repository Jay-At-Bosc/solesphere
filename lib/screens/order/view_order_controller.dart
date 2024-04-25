import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/screens/favorite/favorite_controller.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/services/api/end_points.dart';

import '../../services/models/order_model.dart';

class ViewOrderController extends GetxController {
  static ViewOrderController get instance => Get.find();
  List<ViewOrderModel> orders = <ViewOrderModel>[];
  int orderStatus = 1;
  bool isLoading = false;
  bool isCancelLoading = false;

  String get ordersId => 'orders';
  String get ordersStatusId => 'orderStatus';

  

  @override
  void onInit() async {
    Get.put<ProductDetailController>(ProductDetailController());
    Get.put<FavoriteController>(FavoriteController());
    await getUserOrders();
    super.onInit();
  }

  Future<void> getOrderStatus(int index) async {
    String currentStatus = orders[index].orderStatus;

    switch (currentStatus) {
      case 'Placed':
        orderStatus = 1;
        break;
      case 'Shipped':
        orderStatus = 2;
        break;
      case 'Delivered':
        orderStatus = 3;
        break;
      case 'Cancelled':
        orderStatus = 4;
        break;
    }
    update([ordersStatusId]);
  }

  Future<void> getUserOrders() async {
    try {
      isLoading = true;
      update([ordersId]);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

      var headers = {
        'auth-token': token,
      };

      var dio = Dio();

      var response = await dio.get(
        EndPoints.userOrders,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data as Map<String, dynamic>;
        final List<dynamic> dataList = jsonResponse['data'];
        orders = dataList.map((data) => ViewOrderModel.fromMap(data)).toList();
        orders.sort(((a, b) => b.id.compareTo(a.id)));

        isLoading = false;
        update([ordersId, ordersStatusId]);
      } else {
        TLoaders.warningSnackBar(
          title: "Opps",
          message: response.statusMessage ?? 'Failed to load data',
        );
        isLoading = false;
        update([ordersId]);
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: "Opps", message: e.toString());
      isLoading = false;
      update([ordersId]);
    }
  }

  String changeDateFormat(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day} ${_getMonthName(dateTime.month)}, ${dateTime.year}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  Future<void> cancelOrders(String transactionId) async {
    try {
      isCancelLoading = true;
      update([ordersId]);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      // var data = json.encode({'transction_id': transactionId});
      var headers = {'auth-token': token, 'Content-Type': 'application/json'};

      var dio = Dio();

      var response = await dio.post(
        'https://solesphere-backend.onrender.com/api/v1/orders/refund/$transactionId',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        Get.back();
        TLoaders.successSnackBar(
            title: "Order Cancelled..",
            message:
                'Your Order has been Cancelled and ${response.statusMessage}');
        getUserOrders();

        isLoading = false;
        isCancelLoading = false;
        update([ordersId, ordersStatusId]);
        update();
      } else {
        TLoaders.warningSnackBar(
          title: "Opps",
          message: response.statusMessage ?? 'Failed to load data',
        );
        isLoading = false;
        update([ordersId]);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Opps",
          message: 'Something went wrong.. Please try again later.!');

      isLoading = false;
      isCancelLoading = false;
      update([ordersId]);
    }
  }
}
