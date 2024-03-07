import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';

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
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => SizedBox(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onItemClick(index);
                    },
                    child: SVerticalImageText(
                      image: controller.categories[index].imagePath,
                      textColor: SColors.primary,
                      backgroundColor: SColors.primary,
                      title: controller.categories[index].name,
                      index: index,
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
