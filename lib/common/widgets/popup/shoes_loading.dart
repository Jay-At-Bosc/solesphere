import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/icons.dart';

class ShoesLoading extends StatelessWidget {
  const ShoesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Lottie.asset(
        SJsons.loader,
        width: 30.0.getWidth(),
        height: 30.0.getWidth(),
      ),
      title: const Text(
        'Loading',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
