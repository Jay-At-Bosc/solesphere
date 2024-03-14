import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';

class SSizeRoundedContainer extends GetView<ProductDetailController> {
  const SSizeRoundedContainer({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectedSize.value = index,
      child: Obx(
        () => Container(
          width: 12.0.getWidth(),
          height: 12.0.getWidth(),
          decoration: controller.selectedSize.value == index
              ? BoxDecoration(
                  color: SColors.accent,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                      BoxShadow(color: SColors.accent, blurRadius: 5)
                    ])
              : BoxDecoration(
                  color: SColors.textHint,
                  borderRadius: BorderRadius.circular(100),
                ),
          child: Center(
            child: Text(
              controller.productDetail
                  .variants[controller.selectedVarient.value].sizes[index].size
                  .toString(),
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: controller.selectedSize.value == index
                      ? SColors.textWhite
                      : null),
            ),
          ),
        ),
      ),
    );
  }
}
