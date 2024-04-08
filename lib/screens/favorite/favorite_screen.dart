import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solesphere/common/widgets/product/product_gride.dart';
import 'package:solesphere/screens/favorite/favorite_controller.dart';
import 'package:solesphere/utils/constants/labels.dart';

import '../../utils/constants/colors.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          SLabels.favourite,
          style: Theme.of(context).textTheme.headlineMedium!.apply(),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await controller.getFavoriteList();
              },
              icon: Icon(Iconsax.refresh)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getFavoriteList();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<FavoriteController>(
              init: FavoriteController(),
              id: 'favorite',
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: controller.isLoading
                    ? LinearProgressIndicator(
                        backgroundColor: SColors.accent.withOpacity(0.6),
                        color: SColors.accent,
                      )
                    : SProductGridView(list: controller.favoriteList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
