import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imgPath, this.imgHeight, this.imgWidth});

  final String imgPath;
  final double? imgHeight;
  final double? imgWidth;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imgPath,height: imgHeight,width: imgWidth);
  }
}
