import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/utils/helpers/helper_function.dart';
import '../../../models/product_model.dart';
import '../../../utils/constants/sizes.dart';
import 'product_card.dart';

class SProductGridView extends StatelessWidget {
  const SProductGridView({
    super.key,
    required this.list,
  });
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12),
      child: Obx(
        () => list.isNotEmpty
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
                      Iconsax.battery_charging,
                      size: 100,
                      color: dark
                          ? Colors.white.withOpacity(0.6)
                          : Colors.black.withOpacity(0.6),
                    ),
                    Text(
                      "There is no Favorite Product",
                      style: Theme.of(context).textTheme.titleLarge!.apply(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
