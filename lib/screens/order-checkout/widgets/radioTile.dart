
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../common/widgets/text/text_style.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../order_controller.dart';

class CustomRadioListTile extends GetView<OrderController> {
  const CustomRadioListTile({
    super.key,
    required this.option,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

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
        subtitle: STextStyle(
          text: subTitle,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w300,
              color: SColors.textPrimaryWith80,
              fontSize: SSizes.md),
          maxLine: 2,
        ),
        value: option,
        groupValue: controller.selectedOption.value,
        onChanged: (value) {
          controller.setSelectedOption(value!);
        },
      ),
    );
  }
}
