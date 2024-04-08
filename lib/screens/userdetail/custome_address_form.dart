// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solesphere/screens/userdetail/user_detail_controller.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';
import 'package:solesphere/utils/theme/widget_themes/text_theme.dart';
import 'package:solesphere/utils/validators/validations.dart';
import 'package:solesphere/widgets/custom_simple_input.dart';

import '../../utils/constants/labels.dart';
import '../../utils/theme/widget_themes/checkbox_theme.dart';

import '../../widgets/custom_label.dart';
import 'custom_address_tab.dart';

class CustomAddressForm extends GetView<UserDetailsController> {
  const CustomAddressForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLabelText(labelText: SLabels.mobileNumber),
        CustomSimpleInput(
          hintText: SLabels.mobileNumber,
          controller: controller.phoneNo,
          keyboardType: TextInputType.phone,
          validator: (v) => SValidator.validateIndianPhoneNumber(v.toString().trim()),
        ),
        paddingBetweenFields,

        // Address Type Selection
        CustomLabelText(labelText: SLabels.address),
        CustomAddressTab(), //TabBar of Address
        paddingBetweenFields,

        // Addressline 1
        CustomSimpleInput(
          hintText: SLabels.addresslineOne,
          controller: controller.addressLine1,
          // enable: controller.isSaveLoading,
          validator: (v) =>
              SValidator.validateAddress(v.toString().trim(), SLabels.addresslineOne),
          keyboardType: TextInputType.multiline,
          maxLength: 1,
        ),
        paddingBetweenFields,

        // Addressline 2
        CustomSimpleInput(
          hintText: SLabels.addresslineTwo,
          controller: controller.addressLine2,
          keyboardType: TextInputType.multiline,
          validator: (v) =>
              SValidator.validateAddress(v.toString().trim(), SLabels.addresslineTwo),
          maxLength: 1,
        ),
        paddingBetweenFields,

        // City
        CustomSimpleInput(
          hintText: SLabels.city,
          controller: controller.city,
          keyboardType: TextInputType.multiline,
          validator: (v) => SValidator.validateAddress(v.toString().trim(), SLabels.city),
          maxLength: 1,
        ),
        paddingBetweenFields,

        // State And Zipcode
        Row(
          children: [
            Flexible(
              child: CustomSimpleInput(
                hintText: SLabels.state,
                controller: controller.state,
                validator: (v) => SValidator.validateAddress(v.toString().trim(), SLabels.state),
                maxLength: 1,
              ),
            ),
            Flexible(
              child: CustomSimpleInput(
                hintText: SLabels.zipcode,
                controller: controller.zipcode,
                keyboardType: TextInputType.number,
                validator: (v) => SValidator.validateIndianZipCode(v.toString().trim()),
                maxLength: 1,
              ),
            ),
          ],
        ),

        // Default address as check mark
        Row(
          children: [
            CheckboxTheme(
                data: SCheckboxTheme.lightCheckboxTheme,
                child: Checkbox(
                  value: controller.isAcceptPolicies,
                  onChanged: (value) {
                    controller.isAcceptPolicies = value ?? false;
                  },
                )),
            Text(
              SLabels.termsAndConditions,
              style: STextTheme.lightTextTheme.bodySmall,
            ),
          ],
        ),
        paddingBetweenFields,
      ],
    );
  }

  SizedBox get paddingBetweenFields => SizedBox(height: 1.0.getHeight());
}
