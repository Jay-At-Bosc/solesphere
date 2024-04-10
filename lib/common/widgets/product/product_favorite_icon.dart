import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:solesphere/screens/favorite/favorite_controller.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';

import '../../../services/models/product_model.dart';
import '../../../utils/constants/colors.dart';

class SFavoriteIcon extends StatelessWidget {
  const SFavoriteIcon({
    super.key,
    required this.dark,
    required this.product,
    required this.controller,
  });

  final Products product;
  final FavoriteController controller;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final pctr = Get.find<ProductController>();
    final isFavorite = controller.favoriteList.contains(product);

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
          onPressed: () {
            if (isFavorite) {
              controller.removeToFavorite(product);
            } else {
              controller.addToFavorite(product.id);
            }
            controller.update();
            pctr.update(['Favorite']);
          },
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
