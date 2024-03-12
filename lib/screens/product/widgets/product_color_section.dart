import 'package:solesphere/auth/auth_exports.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'image_color_container.dart';

class SProductColors extends StatelessWidget {
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
            text: 'Color: ',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: SColors.textPrimaryWith80),
            children: const <TextSpan>[
              TextSpan(
                text: 'Blue',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections / 2,
        ),
        // SImageColorContainer(),
        GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: SSizes.gridViewSpacing / 2,
            crossAxisSpacing: SSizes.gridViewSpacing,
            // mainAxisExtent: 20.0.getWidth(),
          ),
          itemBuilder: (context, index) => const SImageColorContainer(),
        ),
      ],
    );
  }
}
