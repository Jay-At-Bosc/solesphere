import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';

import '../../../../common/widgets/heading/section_heading1.dart';



class ReviewSection extends GetView<ProductDetailController> {
  const ReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          text: 'Customer Reviews',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .apply(color: Colors.black),
        ),
        // const CustomerReview(),
        
      ],
    );
  }
}
