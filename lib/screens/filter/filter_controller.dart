// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/utils/exceptions/custom_exception.dart';
import 'package:solesphere/utils/exceptions/exception_handler.dart';

import '../../services/models/product_model.dart';

class FilterController extends GetxController {
  static FilterController get instance => Get.find();

  final controller = Get.find<ProductController>();
  String get keyId => "keys";
  String get valueId => "values";
  String get filterId => "Filters";
  int selectedFilterIndex = 0;
  int? selectedFilterValueIndex;

  Map<String, List<dynamic>> selecetdFilters = {};
  Map<String, List<dynamic>> filters = {};

  String generateFilterParams(Map<String, List<dynamic>> selectedFilters) {
    List<String> params = [];

    selectedFilters.forEach((key, value) {
      for (var item in value) {
        params.add('$key=$item');
      }
    });

    return '?${params.join('&')}';
  }

  resetFilter() async {
    selecetdFilters.clear();
    await controller.fetchProducts();
    update([filterId, controller.homeId]);
    controller.update([controller.homeId]);
    Get.back();
  }

  filterApply() async {
    try {
      controller.isProdcutLoading.value = true;
      controller.update([controller.homeId]);
      if (selecetdFilters.isNotEmpty) {
        String query = generateFilterParams(selecetdFilters);

        String uri = "https://solesphere-backend.onrender.com/api/v1/products/";

        var dio = Dio();
        var response =
            await dio.request("$uri$query", options: Options(method: 'GET'));

        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['data'];
          controller.productList.value =
              data.map((item) => Products.fromMap(item)).toList();

          controller.filterProductList.clear();
          controller.filterProductList.addAll(controller.productList);
          controller.isProdcutLoading.value = false;
          Get.back();


          controller.update([controller.homeId]);
        } else if (response.statusCode == 404) {
          Get.back();
          throw CustomException(title: "Opps!", message: "No Product Found!");
        } else {
          controller.isProdcutLoading.value = false;
          controller.update([controller.homeId]);
          Get.back();
          throw CustomException(
              title: response.statusCode.toString(),
              message: response.statusMessage.toString());
        }
      } else {
        controller.isProdcutLoading.value = false;
        controller.update([controller.homeId]);
        Get.back();
        throw CustomException(
            title: "No filters applied",
            message:
                "Please apply filters to refine your search and view results.");
      }
    } catch (e) {
      ExceptionHandler.errorHandler(e, () => filterApply());
    }
  }

  fetchData() async {
    var dio = Dio();

    try {
      var response = await dio.request(
        'https://solesphere-backend.onrender.com/api/v1/enums/',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        storeData(response.data['data']);
        print("${filters.runtimeType}");
        print(filters);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  keySelect(int index) {
    selectedFilterIndex = index;

    update([filterId]);
  }

  valueSelect(int index) {
    selectedFilterValueIndex = index;

    if (selecetdFilters.containsKey(seletedFilterType)) {
      if (selecetdFilters[seletedFilterType]!.contains(selectedFilterValue)) {
        selecetdFilters[seletedFilterType]!.remove(
            selectedFilterValue); // remove item if it's already in selected filter

        selecetdFilters.removeWhere((seletedFilterType, value) => value
            .isEmpty); // if any filter type is empty than remove from selected filters
      } else {
        selecetdFilters[seletedFilterType]!.add(
            selectedFilterValue); // add item if it's not in selected filter
      }
    } else {
      selecetdFilters[seletedFilterType] = [
        selectedFilterValue
      ]; // add key and item is add if it's not in selected filter
    }

    update([valueId]);
    print(selecetdFilters);
  }

  // Getter for getting currenty selected filter type value
  String get seletedFilterType => filters.keys.toList()[selectedFilterIndex];

  // Getter for getting currenty selected filter value
  dynamic get selectedFilterValue =>
      filters[seletedFilterType]![selectedFilterValueIndex!];

  // For checking that is value selected or not from selected filters
  bool isValueSelected(int index) {
    // print("is selected : ${filters[seletedFilterType]![index]}");
    return selecetdFilters[seletedFilterType]
            ?.contains(filters[seletedFilterType]![index]) ??
        false;
  }

  // to store data from api response to cache
  storeData(Map<String, dynamic> data) {
    data.forEach((key, value) {
      filters[key] = value is List ? value : [value];
    });
    update([filterId]);
  }
}
