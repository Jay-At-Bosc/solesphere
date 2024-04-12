// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/filter/custom_filter_type_component.dart';
import 'package:solesphere/screens/filter/custom_filter_value_component.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';
import 'filter_controller.dart';

class FilterScreen extends GetView<FilterController> {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60.0.getHeight(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: GetBuilder<FilterController>(
        id: controller.filterId,
        builder: ((controller) {
          if (controller.filters.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: SColors.accent,
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 0.8.getHeight(),
                ),
                Container(
                  height: 0.6.getHeight(),
                  width: 16.0.getWidth(),
                  decoration: BoxDecoration(
                      color: Color(0xFFE9ECEF),
                      borderRadius: BorderRadius.circular(16)),
                ),

                // Reset, Apply button and Filter title
                //FilterButtonsWithTitle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async{
                        await controller.resetFilter();
                      },
                      child: Text(SLabels.reset),
                    ),
                    Text(SLabels.filter),
                    TextButton(
                        onPressed: () async {
                          await controller.filterApply();
                        },
                        child: Text(SLabels.apply)),
                  ],
                ),

                // Main Filter Types and Values
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: [
                      // List of filter types
                      CustomFilterTypeComponent(
                          keys: controller.filters.keys.toList()),

                      // List of values of selecetd filter type
                      CustomFilterValueComponent(
                          values: controller
                              .filters[controller.seletedFilterType]!
                              .toList()),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
