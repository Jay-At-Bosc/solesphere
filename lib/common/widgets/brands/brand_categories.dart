import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/vertical_image_text.dart';

class SHomeCategories extends StatelessWidget {
  const SHomeCategories({
    super.key,
    required this.list,
  });
  final List list;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        children: [
          //Scrolable Catgories
          GetBuilder<ProductController>(
            init: ProductController(),
            id: "categories",
            builder: (controller) => SizedBox(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onItemClick(controller.brandList[index].id,
                          controller.brandList[index].brand);
                      log('brand id :${controller.brandList[index].id}');
                    },
                    onDoubleTap: () {
                      controller.onItemClick('', '');
                    },
                    child: SVerticalImageText(
                      image: controller.brandList[index].brandIcon,
                      textColor: SColors.primary,
                      backgroundColor: SColors.primary,
                      title: controller.brandList[index].brand,
                      index: controller.brandList[index].id,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
