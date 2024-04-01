
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/cart/cart_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class IncreaseItemButton extends GetView<CartController> {
  const IncreaseItemButton( {
    super.key,
    required this.icon,
    this.color = Colors.white,
    this.iconColor,
    this.iconSize,
    required this.onTap,
    required this.isLoading,
  });
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
        child: Icon(
          icon,
          color: iconColor,
          size: 6.0.getWidth(),
        ),
      ),
    );
  }
}
