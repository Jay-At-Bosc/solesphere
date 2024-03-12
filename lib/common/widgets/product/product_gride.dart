import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/utils/helpers/helper_function.dart';
import '../../../services/models/product_model.dart';
import '../../../utils/constants/sizes.dart';
import 'product_card.dart';

class SProductGridView extends StatelessWidget {
  const SProductGridView({
    super.key,
    required this.list,
  });
  final List<Products> list;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(Get.context!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12),
      child: GetBuilder<ProductController>(
        id: "Favorite",
        builder: (ctx) => list.isNotEmpty
            ? GridView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: SSizes.gridViewSpacing,
                  crossAxisSpacing: SSizes.gridViewSpacing,
                  mainAxisExtent: 230,
                ),
                itemBuilder: (context, index) => SProductCardVertical(
                  index: index,
                  product: list[index],
                  onFavoriteToggle: (_) => {},
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Iconsax.heart_slash,
                      size: 100,
                      color: dark
                          ? Colors.white.withOpacity(0.6)
                          : Colors.black.withOpacity(0.6),
                    ),
                    Text(
                      "Products Not Found",
                      style: Theme.of(context).textTheme.titleLarge!.apply(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
