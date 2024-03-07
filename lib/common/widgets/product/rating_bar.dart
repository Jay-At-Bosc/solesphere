import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../popup/loaders.dart';

class SRatingBar extends StatelessWidget {
  const SRatingBar({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: SSizes.md,
      itemPadding: const EdgeInsets.only(right: 1.0),
      itemBuilder: (context, _) => const Icon(
        Iconsax.star4,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        Get.closeCurrentSnackbar();
        TLoaders.successSnackBar(
            title: "Wow 🤩!", message: "Thanks  For Rating us $rating ⭐");
      },
    );
  }
}
