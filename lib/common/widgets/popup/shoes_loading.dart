import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';



class ShoesLoading extends StatelessWidget {
  const ShoesLoading({super.key, required this.loader});
  final String loader;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Column(
          children: [
            Lottie.asset(
              loader,
              width: 30.0.getWidth(),
              height: 30.0.getWidth(),
            ),
            const Text(
              'Loading',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
