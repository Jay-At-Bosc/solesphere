import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../services/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../text/text_style.dart';

class SProductName extends StatelessWidget {
  const SProductName({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        STextStyle(
          text: product.productName.capitalize.toString(),
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: Colors.black),
        ),
        SizedBox(
          height: 0.2.getHeight(),
        ),
        STextStyle(
          text: product.shortDescription.toString(),
          maxLine: 2,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: SColors.textPrimaryWith60)
              .copyWith(height: 1.1),
        ),
      ],
    );
  }
}
