import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/sizes.dart';

class SImageColorContainer extends StatelessWidget {
  const SImageColorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0.getWidth(),
      height: 20.0.getWidth(),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(SSizes.md),
      ),
      child: Image.asset(
        SImages.shoe1,
        fit: BoxFit.contain,
      ),
    );
  }
}
