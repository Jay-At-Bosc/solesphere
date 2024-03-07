import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/common/widgets/product/product_gride.dart';
import 'package:solesphere/screens/home/controller/product_controller.dart';
import 'package:solesphere/utils/constants/labels.dart';
import 'package:solesphere/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Text(
                  SLabels.favourite,
                  style: Theme.of(context).textTheme.headlineMedium!.apply(),
                ),
                const SizedBox(
                  height: SSizes.spaceBtwSections,
                ),
                Obx(
                  () => SProductGridView(list: controller.favoriteList.value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
