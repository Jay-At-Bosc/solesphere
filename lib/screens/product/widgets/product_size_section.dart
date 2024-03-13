
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

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
              "UK",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: SColors.textPrimaryWith80),
            ),
          ],
        ),
        const SSizeRoundedContainer(),
        const Divider(),
      ],
    );
  }
}