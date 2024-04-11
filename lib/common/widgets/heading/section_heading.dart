// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/labels.dart';

class SSectionTitle extends StatelessWidget {
  const SSectionTitle({
    super.key,
    this.heading = "",
    this.suffix,
  });

  final String heading;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      id: "title",
      builder: (ctx) => Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ctx.selectedCategory.value != ''
                  ? ctx.brandName.value.capitalize!.toString()
                  : SLabels.newArrivals,
              overflow: TextOverflow.ellipsis,
              textScaler: const TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // TextButton(
            //   onPressed: () {
            //     Get.closeAllSnackbars();
            //     TLoaders.warningSnackBar(
            //         title: "Oh noo", message: "There is nothing to see");
            //   },
            //   child: const Icon(
            //     Iconsax.filter,
            //     color: SColors.accent,
            //   ),
            // ),
            IconButton(
              onPressed: () {
                ctx.filterOpen();
              },
              icon: Icon(
                Icons.format_align_left_sharp,
                color: SColors.textPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
