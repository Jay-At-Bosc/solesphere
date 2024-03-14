import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class SImageColorContainer extends GetView<ProductDetailController> {
  const SImageColorContainer({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedVarient.value = index;
        controller.selectedSize.value = 0;
      },
      child: Obx(
        () => Container(
          width: 12.0.getWidth(),
          height: 12.0.getWidth(),
          decoration: BoxDecoration(
            color: Color(
                int.parse(controller.productDetail.variants[index].color)),
            borderRadius: BorderRadius.circular(10.0.getWidth()),
            // if(controller.selectedVarient.value == index)
            border: Border.all(
                color: controller.selectedVarient.value == index
                    ? SColors.accent.withOpacity(1)
                    : Color(int.parse(
                        controller.productDetail.variants[index].color)),
                width: 2),
          ),
          child: controller.selectedVarient.value == index
              ? Icon(
                  Icons.done,
                  size: 5.0.getWidth(),
                  color: SColors.textWhite,
                )
              : null,
        ),
      ),
    );
  }
}
