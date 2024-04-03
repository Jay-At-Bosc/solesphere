import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../../../common/widgets/heading/section_heading1.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ProductmaterialType extends GetView<ProductDetailController> {
  const ProductmaterialType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              text: 'Material type',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.black),
              padding: 0,
            ),
            SectionHeading(
              text: controller.productDetail.material.capitalize.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SColors.textPrimaryWith60),
              padding: SSizes.defaultSpace / 2,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              text: 'Closure type',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.black),
              padding: 0,
            ),
            SectionHeading(
              text: controller.productDetail.closureType.capitalize.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SColors.textPrimaryWith60),
              padding: SSizes.defaultSpace / 2,
            ),
          ],
        ),
      ],
    );
  }
}
