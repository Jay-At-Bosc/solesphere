import 'package:flutter/material.dart';
import 'package:solesphere/auth/auth_exports.dart';

import '../../../common/widgets/product/rating_bar.dart';
import '../../../utils/constants/colors.dart';

class ProductDetailHeader extends StatelessWidget {
  const ProductDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: SColors.textWhite,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          Column(
            children: [
              Text(
                'Air Jordan',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(color: Colors.black.withOpacity(0.6)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SRatingBar(rating: 5),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: SColors.textWhite,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                )),
          ),
        ],
      ),
    );
  }
}
