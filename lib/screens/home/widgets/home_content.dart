import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/screens/search/search.dart';
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
    Get.put(CustomDrawerController());

    return GetBuilder<CustomDrawerController>(
      id: controller.drawerId,
      builder: (drawerController) {
        return AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: drawerController.isDrawerOpen ? SColors.textWhite : null,
          ),
          duration:
              Duration(milliseconds: drawerController.isDrawerOpen ? 0 : 500),
          transform: Matrix4.translationValues(
            drawerController.isDrawerOpen ? 50.0.getWidth() : 0,
            drawerController.isDrawerOpen ? 20.0.getHeight() : 0,
            0,
          )
            ..scale(drawerController.isDrawerOpen ? 0.80 : 1.00)
            ..rotateZ(drawerController.isDrawerOpen ? -44.16 : 0),
          child: Scaffold(
            backgroundColor: drawerController.isDrawerOpen
                ? SColors.textPrimaryWith60
                : null,
            appBar: const SAppBar(),
            body: GetBuilder<ProductController>(
              id: ProductController.instance.homeId,
              builder: (productController) => RefreshIndicator(
                onRefresh: () async {
                  await productController.fetchBrands();
                  await productController.fetchProducts();
                },
                child: AbsorbPointer(
                  absorbing: drawerController.isDrawerOpen,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 38.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => Get.to(() => const Search()),
                              child: const TSearchContainer(
                                  text: "Search in SoleSphere",
                                  icon: Iconsax.search_normal,
                                  isSuffix: true,
                                  suffixIcon: Iconsax.microphone,
                                  isDisable: true),
                            ),
                          ),
                          const SizedBox(height: SSizes.spaceBtwSections),
                          // Product
                          productController.isMainLoading()
                              ? const ShoesLoading(loader: SJsons.loader)
                              : Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SHomeCategories(
                                        list: productController.brandList),
                                    const SSectionTitle(),
                                    SProductGridView(
                                        list: productController
                                            .filterProductList),
                                  ],
                                ),
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
