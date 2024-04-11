// ignore_for_file: prefer_const_constructors

import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/filter/filter_controller.dart';
import 'package:solesphere/utils/constants/labels.dart';

class FilterButtonsWithTitle extends GetView<FilterController> {
  const FilterButtonsWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: controller.resetFilter(),
          child: Text(SLabels.reset),
        ),
        Text(SLabels.filter),
        TextButton(
            onPressed: () async {
              await controller.filterApply();
            },
            child: Text(SLabels.apply)),
      ],
    );
  }
}
