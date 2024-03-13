import 'package:carousel_slider/carousel_slider.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/constants/colors.dart';

import 'rounded_product_image.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(viewportFraction: 1),
      items: images
          .map((url) => SRoundedProductImage(
                imgUrl: url,
                backgroundColor: SColors.primary,
                isNetworkImage: true,
                borderRadius: 0,
              ))
          .toList(),
    );
  }
}
