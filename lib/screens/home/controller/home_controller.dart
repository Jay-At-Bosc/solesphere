import 'package:get/get.dart';
import 'package:solesphere/models/category_model.dart';

import '../../../data/category_data.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final categories = RxList<Categories>([]);
  RxInt selectedItem = 0.obs;

  @override
  void onInit() {
    categories.addAll(categoryList);

    super.onInit();
  }

  void onItemClick(int index) {
    selectedItem.value = index;
    update();
  }
}
