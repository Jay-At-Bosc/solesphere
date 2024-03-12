import 'package:get/get.dart';


class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // final categories = RxList<Categories>([]);
  RxInt selectedItem = (-1).obs;

  @override
  void onInit() {
    // categories.addAll(categoryList);

    super.onInit();
  }

  void onItemClick(int index) {
    selectedItem.value = index;
    update();
  }
}
