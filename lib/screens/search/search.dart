import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/container/search_container.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';
import '../../common/widgets/product/product_gride.dart';
import '../home/controller/product_controller.dart';

class Search extends GetView<ProductController> {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
              child: TSearchContainer(
                text: "Search in SoleSphere",
                prefficOnTap: () {
                  controller.searchProductList.clear();
                  controller.searchProduct.text = "";
                  Get.back();
                },
                isSuffix: true,
                icon: Iconsax.arrow_left,
                suffixIcon: Iconsax.search_normal,
                suffixOnTap: () {
                  controller.search(controller.searchProduct.text);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<ProductController>(
                  id: "search",
                  builder: (controller) => controller.isSearching.value
                      ? LinearProgressIndicator(
                          color: SColors.accent,
                          backgroundColor: SColors.accent.withOpacity(0.6),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SProductGridView(
                            list: controller.searchProductList,
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
