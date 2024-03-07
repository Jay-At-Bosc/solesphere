import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';

import '../../../models/product_model.dart';
import '../../../utils/constants/colors.dart';

class SFavoriteIcon extends StatelessWidget {
  const SFavoriteIcon({
    super.key,
    required this.dark,
    required this.product,
    required this.controller,
  });
  final Product product;
  final ProductController controller;

  final bool dark;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());
    final isFavorite = controller.favoriteList.value.contains(product);
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: dark
              ? SColors.accent.withOpacity(0.9)
              : SColors.textSecondary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(40),
        ),
        child: IconButton(
          onPressed: isFavorite
              ? () => controller.removeToFavorite(product)
              : () => controller.addToFavorite(product),
          icon: Icon(
            Iconsax.heart,
            color: isFavorite ? Colors.red : Colors.black,
          ),
          iconSize: 20,
        ),
      ),
    );
  }
}
