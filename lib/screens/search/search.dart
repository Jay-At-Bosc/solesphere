import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/container/search_container.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../common/widgets/popup/shoes_loading.dart';
import '../../common/widgets/product/product_gride.dart';
import '../../utils/constants/icons.dart';
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
                prefficOnTap: () => Get.back(),
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
                  id: 'search',
                  builder: (controller) => controller.isMainLoading()
                      ? const ShoesLoading(loader: SJsons.loader)
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
