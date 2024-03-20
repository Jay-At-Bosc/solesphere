
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/colors.dart';


class NotificationImageContainer extends GetView<CartController> {
  const NotificationImageContainer({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0.getWidth(),
      height: 20.0.getWidth(),
      decoration: BoxDecoration(
        color: SColors.primary,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: SColors.textPrimaryWith60.withOpacity(0.1),
        ),
      ),
      child: ClipRRect(
        child: Center(
          child: Image.network(
            url,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
