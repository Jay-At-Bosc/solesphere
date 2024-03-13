import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/sizes.dart';

import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../common/widgets/brands/brand_categories.dart';
import '../../../common/widgets/container/search_container.dart';
import '../../../common/widgets/heading/section_heading.dart';
import '../../../common/widgets/product/product_gride.dart';
import '../../../utils/constants/colors.dart';

import '../controller/drawer_controller.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    // final controllerHome = Get.put(HomeController());
    final controllerDrawer = Get.put(CustomDrawerController());
   

    // log(controllerDrawer.xOffset);
    // log(controllerDrawer.yOffset);

    return GetBuilder<CustomDrawerController>(
      init: CustomDrawerController(),
      builder: (controller1) => AnimatedContainer(
        //  if(controllerDrawer.isDrawerOpen.value)
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color:
                controllerDrawer.isDrawerOpen.value ? SColors.textWhite : null),
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.translationValues(
            controllerDrawer.xOffset.value, controllerDrawer.xOffset.value, 0)
          ..scale(controllerDrawer.isDrawerOpen.value ? 0.80 : 1.00)
          ..rotateZ(controllerDrawer.isDrawerOpen.value ? -44.16 : 0),
        child: Scaffold(
          backgroundColor: controllerDrawer.isDrawerOpen.value
              ? SColors.textPrimaryWith60
              : null,
          appBar: const SAppBar(),
          // drawer: Drawer(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: SColors.textWhite,
          //       borderRadius: BorderRadiusDirectional.circular(50),
          //     ),
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(Iconsax.menu5),
          //       iconSize: 24,
          //     ),
          //   ),
          // ),
          body: AbsorbPointer(
            absorbing: controllerDrawer.isDrawerOpen.value ? true : false,
            child: SingleChildScrollView(
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

                    Obx(() => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SHomeCategories(list: controller.brandList)),

                    const SizedBox(
                      height: SSizes.defaultSpace / 4,
                    ),

                    //Product
                    const SSectionTitle(),

                    //Card

                    Obx(
                      () => controller.isProdcutLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SProductGridView(
                              list: controller.filterProductList,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
