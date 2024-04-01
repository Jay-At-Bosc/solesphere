import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../../../utils/constants/colors.dart';

class SoledByRichText extends GetView<ProductDetailController> {
  const SoledByRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: RichText(
        text: TextSpan(
          text: 'Soled by ',
          style: Theme.of(context).textTheme.labelSmall!.apply(
                color: SColors.textPrimaryWith80,
              ),
          children: <TextSpan>[
            TextSpan(
              text: controller.productDetail.brand.brand.capitalize,
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: SColors.accent,
                  ),
            ),
            const TextSpan(
              text: ' and Fulfilled by ',
            ),
            TextSpan(
              text: 'Solesphere',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: SColors.accent,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
