import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/container/size_rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/labels.dart';

class ProductSizeSection extends GetView<ProductDetailController> {
  const ProductSizeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              SLabels.size,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: SColors.textPrimaryWith80),
            ),
            Text(
              controller.productDetail.sizeType,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: SColors.textPrimaryWith80),
            ),
          ],
        ),
        Obx(
          () => SizedBox(
            height: 12.0.getWidth(), // Adjust height according to your needs
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.productDetail
                  .variants[controller.selectedVarient.value].sizes.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: SSizes.spaceBtwItems),
                child: SSizeRoundedContainer(index: index),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        const Divider(),
      ],
    );
  }
}
