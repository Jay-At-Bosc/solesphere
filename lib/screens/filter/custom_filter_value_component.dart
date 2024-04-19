// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/filter/filter_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/colors.dart';

class CustomFilterValueComponent extends GetView<FilterController> {
  const CustomFilterValueComponent({super.key, required this.values});

  final List<dynamic> values;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 14.0),
        width: 60.0.getWidth(),
        child: GetBuilder<FilterController>(
            id: controller.valueId,
            builder: (context) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: List.generate(values.length, (index) {
                    if (controller.seletedFilterType == "color") {
                      return InkWell(
                        onTap: () {
                          controller.valueSelect(index);
                        },
                        child: Container(
                          height: 10.0.getWidth(),
                          width: 10.0.getWidth(),
                          decoration: BoxDecoration(
                            color: Color(int.parse(values[index])),
                            border: controller.isValueSelected(index)
                                ? Border.all(color: SColors.accent, width: 1.5)
                                : null,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      );
                    }

                    return OutlinedButton(
                      onPressed: () {
                        controller.valueSelect(index);
                      },
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                        foregroundColor: MaterialStatePropertyAll(
                            controller.isValueSelected(index)
                                ? SColors.textWhite
                                : SColors.accent),
                        backgroundColor: MaterialStatePropertyAll(
                            controller.isValueSelected(index)
                                ? SColors.accent
                                : Colors.white24),
                        side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black.withOpacity(0.1)),
                        ),
                      ),
                      child: Text(
                        values[index].toString().capitalizeFirst!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                ),
              );
            }));
  }
}
