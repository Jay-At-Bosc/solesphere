import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/utils/constants/sizes.dart';

import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../common/widgets/brands/brand_categories.dart';
import '../../../common/widgets/container/search_container.dart';
import '../../../common/widgets/heading/section_heading.dart';
import '../../../common/widgets/product/product_gride.dart';
import '../../../utils/constants/colors.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final controllerHome = Get.put(HomeController());
    // final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const SAppBar(),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: SColors.textWhite,
            borderRadius: BorderRadiusDirectional.circular(50),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.menu5),
            iconSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 38.0),
                child: TSearchContainer(
                  text: "Looking for a shoes",
                  icon: Iconsax.search_normal,
                  isSuffix: true,
                  suffixIcon: Iconsax.microphone,
                ),
              ),

              const SizedBox(
                height: SSizes.spaceBtwSections,
              ),
              //Categories
              SHomeCategories(list: controllerHome.categories),

              const SizedBox(
                height: SSizes.defaultSpace / 4,
              ),

              //Product
              const SSectionTitle(),

              //Card

              Obx(() => SProductGridView(
                    list: controller.products.value,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
