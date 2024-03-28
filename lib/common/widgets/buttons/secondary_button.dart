import 'package:flutter/material.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/order/order_detail.screen.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.forground = Colors.black,
    this.background = const Color.fromARGB(255, 237, 236, 236),
    this.elevation = 0,
    required this.style,
    required this.label,
  });
  final Color forground;
  final Color background;
  final double? elevation;
  final TextStyle style;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.0.getWidth(),
      child: ElevatedButton(
        onPressed: () => Get.to(const OrderDetailScreen()),
        style: ElevatedButton.styleFrom(
          foregroundColor: forground,
          backgroundColor: background,
          padding:
              EdgeInsets.symmetric(vertical: 1.5.getHeight()), // Button padding

          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: style,
        ),
        child: Text(label),
      ),
    );
  }
}
