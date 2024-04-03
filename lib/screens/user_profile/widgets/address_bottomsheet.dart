import 'package:flutter/material.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/user_profile/shipping_address_controller.dart';
import 'package:solesphere/screens/user_profile/widgets/address_tab.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../../utils/constants/labels.dart';
import '../../../utils/validators/validations.dart';
import '../../../widgets/custom_label.dart';
import '../../../widgets/custom_simple_input.dart';
import '../../userdetail/custom_address_tab.dart';

class AddressBottomSheet extends GetView<ShippingAdddressController> {
  const AddressBottomSheet( {super.key, required this.index});
  final int index;

  SizedBox get paddingBetweenFields => SizedBox(height: 2.0.getHeight());

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        minChildSize: 0.9,
        initialChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.94),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0.getWidth()),
                topRight: Radius.circular(5.0.getWidth()),
              ),
            ),
            child: ListView(
              controller: scrollController,
              children: [
                // Address Type Selection
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Center(
                        child: CustomLabelText(
                          labelText: SLabels.address,
                          labelStyle: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.updateAddress(index);
                        },
                        child: Text(index != -1 ? "Update" : "Save"))
                  ],
                ),
                if (index == -1) const AddressTab(), //TabBar of Address
                paddingBetweenFields,

                // Addressline 1
                Form(
                    key: controller.address,
                    child: Column(
                      children: [
                        CustomSimpleInput(
                          hintText: SLabels.addresslineOne,
                          controller: controller.addressLine1,
                          // enable: controller.isSaveLoading,
                          // validator: (v) {},
                          keyboardType: TextInputType.multiline,
                          maxLength: 1,
                        ),
                        paddingBetweenFields,

                        // Addressline 2
                        CustomSimpleInput(
                          hintText: SLabels.addresslineTwo,
                          controller: controller.addressLine2,
                          keyboardType: TextInputType.multiline,
                          validator: (v) => SValidator.validateAddress(
                              v, SLabels.addresslineTwo),
                          maxLength: 1,
                        ),
                        paddingBetweenFields,

                        // City
                        CustomSimpleInput(
                          hintText: SLabels.city,
                          controller: controller.city,
                          keyboardType: TextInputType.multiline,
                          validator: (v) =>
                              SValidator.validateAddress(v, SLabels.city),
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
                                validator: (v) => SValidator.validateAddress(
                                    v, SLabels.state),
                                maxLength: 1,
                              ),
                            ),
                            Flexible(
                              child: CustomSimpleInput(
                                hintText: SLabels.zipcode,
                                controller: controller.zipcode,
                                keyboardType: TextInputType.number,
                                validator: (v) =>
                                    SValidator.validateIndianZipCode(v),
                                maxLength: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          );
        });
  }
}
