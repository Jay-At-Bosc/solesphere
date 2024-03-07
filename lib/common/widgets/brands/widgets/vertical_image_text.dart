import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/home/controller/home_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class SVerticalImageText extends StatelessWidget {
  const SVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SColors.primary,
    this.backgroundColor = SColors.primary,
    required this.index,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.only(right: SSizes.spaceBtwItems),
      child: Column(
        children: [
          controller.selectedItem.value != index
              ? Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(SSizes.sm),
                  decoration: BoxDecoration(
                    color: backgroundColor ??
                        (dark ? SColors.primary : SColors.dark),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      color: SColors.dark,
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: SColors.accent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  // width: 94,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(SSizes.xs),
                          decoration: BoxDecoration(
                            color: backgroundColor ??
                                (dark ? SColors.primary : SColors.dark),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Image(
                              width: 24,
                              height: 24,
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                              color: SColors.dark,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: SSizes.spaceBtwItems / 3,
                        ),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textScaler: const TextScaler.linear(1),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(fontSizeFactor: 0.8)
                              .apply(color: SColors.primary),
                        ),
                        const SizedBox(
                          width: SSizes.xs,
                        ),
                      ],
                    ),
                  ),
                )
          // const SizedBox(
          //   height: TSizes.spaceBtwItems / 2,
          // ),
          // SizedBox(
          //   width: 56,
          //   child: Text(
          //     title,
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.center,
          //     style: Theme.of(context)
          //         .textTheme
          //         .labelMedium!
          //         .apply(color: textColor),
          //   ),
          // )
        ],
      ),
    );
  }
}
