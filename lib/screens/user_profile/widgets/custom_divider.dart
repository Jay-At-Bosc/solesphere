import 'package:flutter/material.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 2.0.getWidth(),
      endIndent: 2.0.getWidth(),
      thickness: 0,
    );
  }
}