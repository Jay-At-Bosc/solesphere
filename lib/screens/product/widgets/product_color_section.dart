import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'image_color_container.dart';

class SProductColors extends GetView<ProductDetailController> {
  const SProductColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Color',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: SColors.textPrimaryWith80),
            children: const <TextSpan>[
              TextSpan(
                text: '',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        // SImageColorContainer(),
        SizedBox(
          height: 12.0.getWidth(),
          child: ListView.builder(
            itemCount: controller.productDetail.variants.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: SSizes.spaceBtwItems),
              child: SImageColorContainer(index: index),
            ),
          ),
        )
        // GridView.builder(
        //   itemCount: controller.productDetail.variants.length,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 5,
        //     mainAxisSpacing: SSizes.gridViewSpacing / 2,
        //     crossAxisSpacing: SSizes.gridViewSpacing,
        //     // mainAxisExtent: 10.0.getWidth(),
        //   ),
        //   itemBuilder: (context, index) => SImageColorContainer(index: index),
        // ),
      ],
    );
  }
}
