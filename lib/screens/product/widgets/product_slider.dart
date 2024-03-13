
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../../../utils/constants/colors.dart';

import '../../../utils/constants/sizes.dart';
import 'image_slider.dart';

class ProductSlider extends GetView<ProductDetailController> {
  const ProductSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Short Desc",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: SColors.textSecondary.withOpacity(0.9)),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),
        ProductImageSlider(images: [SImages.shoe1],),
        const SizedBox(
          height: SSizes.spaceBtwSections / 2,
        ),
      ],
    );
  }
}
