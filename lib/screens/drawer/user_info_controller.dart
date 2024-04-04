import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/services/models/user_data_model.dart';
import 'package:solesphere/utils/local_storage/app_storage.dart';

class UserInfoController extends GetxController {
  static UserInfoController get instance => Get.find();

  // ignore: prefer_typing_uninitialized_variables
  UserDataModel? user;

  @override
  void onInit() {
    // getuser();
    super.onInit();
  }

  final appStorage = Get.find<AppStorage>();

  // void getuser() {
  //   user = appStorage.getUserData()!;
  //   log("User Details fromd asdf  adhfiuh");
  //   // log(user!.name);
  // }
}
