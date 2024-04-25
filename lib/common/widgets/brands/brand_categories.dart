import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/drawer_controller.dart';

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
    final d = Get.put(CustomDrawerController());

    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Column(
        children: [
          //Scrolable Catgories
          GetBuilder<ProductController>(
            // init: ProductController(),
            id: ProductController.instance.catId,
            builder: (controller) => SizedBox(
              key: d.brands,
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
                      
                    },
                    onDoubleTap: () {
                      controller.onItemClick('0', '');
                    },
                    child: SVerticalImageText(
                      image: controller.brandList[index].brandIcon,
                      textColor: SColors.primary,
                      backgroundColor: SColors.primary,
                      title: controller.brandList[index].brand.capitalize
                          .toString(),
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
