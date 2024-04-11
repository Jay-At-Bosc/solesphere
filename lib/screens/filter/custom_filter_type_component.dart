// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:solesphere/screens/filter/filter_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/colors.dart';

class CustomFilterTypeComponent extends GetView<FilterController> {
  CustomFilterTypeComponent({
    required this.keys,
  });

  final List<String> keys;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0.getWidth(),
      child: ListView.builder(
          itemCount: keys.length,
          itemBuilder: (context, index) {
            return GetBuilder<FilterController>(
              id: controller.keyId,
              builder: (context) {
                return InkWell(
                  onTap: () {
                    controller.keySelect(index);
                  },
                  child: Container(
                    color: controller.selectedFilterIndex == index ? Colors.white : Colors.grey[100],
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 14),
                    child: Text(
                        keys[index].toString().capitalizeFirst!,
                        style: TextStyle(
                          fontSize: 16,
                          color: controller.selectedFilterIndex == index
                              ? SColors.accent
                              : Colors.black,
                        ),
                      ),
                  ),
                );
              },
            );
          }),
    );
  }
}
