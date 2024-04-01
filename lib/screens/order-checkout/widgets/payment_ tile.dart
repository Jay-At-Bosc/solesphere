import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/text/text_style.dart';
import '../../../utils/constants/colors.dart';
import '../order_controller.dart';

class CustomRadioListPaymentTile extends GetView<OrderController> {
  const CustomRadioListPaymentTile({
    super.key,
    required this.option,
    required this.title,
  });
  final String title;

  final String option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0.getHeight()),
      child: RadioListTile<String>(
        contentPadding: const EdgeInsets.all(10),
        tileColor: Colors.white,
        activeColor: SColors.accent,
        title: STextStyle(
          text: title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        value: option,
        groupValue: controller.selectedPaymentMode.value,
        onChanged: (value) {
          controller.setPaymentMode(value!);
        },
      ),
    );
  }
}
