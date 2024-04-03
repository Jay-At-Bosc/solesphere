import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';

import 'package:solesphere/screens/home/controller/product_controller.dart';

import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/icons.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../common/widgets/brands/brand_categories.dart';
import '../../../common/widgets/container/search_container.dart';
import '../../../common/widgets/heading/section_heading.dart';
import '../../../common/widgets/product/product_gride.dart';
import '../../../utils/constants/colors.dart';

import '../controller/drawer_controller.dart';

class HomeScreenContent extends GetView<CustomDrawerController> {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());
    // final productController = Get.put(ProductDetailController());
    // final controller = Get.put(CustomDrawerController());

    // log(controllerDrawer.xOffset);
    // log(controllerDrawer.yOffset);

    return GetBuilder<CustomDrawerController>(
      // init: CustomDrawerController(),
      id: "drawer",
      builder: (controller1) {
        // print('home content:vishal');

        return AnimatedContainer(
          //  if(controllerDrawer.isDrawerOpen.value)
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: controller.isDrawerOpen ? SColors.textWhite : null),
          duration: Duration(milliseconds: controller.isDrawerOpen ? 00 : 500),
          transform: Matrix4.translationValues(
              controller.isDrawerOpen ? 50.0.getWidth() : 0,
              controller.isDrawerOpen ? 20.0.getHeight() : 0,
              0)
            ..scale(controller.isDrawerOpen ? 0.80 : 1.00)
            ..rotateZ(controller.isDrawerOpen ? -44.16 : 0),
          child: Scaffold(
            backgroundColor:
                controller.isDrawerOpen ? SColors.textPrimaryWith60 : null,
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
            body: GetBuilder<ProductController>(
              id: 'home',
              builder: (pctx) => RefreshIndicator(
                onRefresh: () async {
                  await pctx.fetchBrands();
                  await pctx.fetchProducts();
                },
                child: AbsorbPointer(
                  absorbing: controller.isDrawerOpen ? true : false,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 38.0),
                            child: TSearchContainer(
                              text: "Search in SoleSphere",
                              icon: Iconsax.search_normal,
                              isSuffix: true,
                              suffixIcon: Iconsax.microphone,
                            ),
                          ),

                          const SizedBox(
                            height: SSizes.spaceBtwSections,
                          ),
                          //Categories

                          // Obx(() => controller.isLoading.value
                          //     ? const Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //     : SHomeCategories(list: controller.brandList)),

                          // const SizedBox(
                          //   height: SSizes.defaultSpace / 4,
                          // ),

                          //Product
                          GetBuilder<ProductController>(
                            id: 'home',
                            builder: (controller) => controller.isMainLoading()
                                ? const ShoesLoading(loader: SJsons.loader)
                                : Column(
                                    children: [
                                      SHomeCategories(
                                          list: controller.brandList),
                                      const SSectionTitle(),
                                      SProductGridView(
                                        list: controller.filterProductList,
                                      )
                                    ],
                                  ),
                          ),

                          //Card

                          // Obx(
                          //   () => controller.isProdcutLoading.value
                          //       ? const Center(
                          //           child: CircularProgressIndicator(),
                          //         )
                          //       : SProductGridView(
                          //           list: controller.filterProductList,
                          //         ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
