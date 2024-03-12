import 'package:solesphere/auth/auth_exports.dart';

import '../../../../common/widgets/heading/section_heading1.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

import 'customer_review.dart';

class ReviewSection extends StatelessWidget {
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
        const CustomerReview(),
        Text(
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: SColors.textPrimaryWith60),
          textScaler: const TextScaler.linear(1),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        const CustomerReview(),
        Text(
          'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: SColors.textPrimaryWith60),
          textScaler: const TextScaler.linear(1),
        ),
      ],
    );
  }
}