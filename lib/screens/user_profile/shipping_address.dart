import 'dart:developer';

import 'package:iconsax/iconsax.dart';

import 'package:solesphere/screens/user_profile/shipping_address_controller.dart';
import 'package:solesphere/screens/user_profile/widgets/address_bottomsheet.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import '../../common/widgets/text/text_style.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/labels.dart';

class ShippingAddress extends GetView<ShippingAdddressController> {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShippingAdddressController());

    return GetBuilder<ShippingAdddressController>(
      id: 'update_btn',
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: SColors.textWhite,
          title: Text(
            SLabels.address,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        floatingActionButton: controller.user.length == 3
            ? null
            : FloatingActionButton(
                backgroundColor: SColors.accent,
                foregroundColor: SColors.textWhite,
                splashColor: Colors.transparent,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                tooltip: "Add Address",
                onPressed: () {
                  controller.setInitialValue(-1);
                  Get.bottomSheet(const AddressBottomSheet(
                    index: -1,
                  ));
                },
                child: const Icon(Iconsax.add),
              ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: GetBuilder<ShippingAdddressController>(
              id: 'user_address',
              builder: (ctx) => ctx.user.isEmpty
                  ? const Text("Not Found")
                  : SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ctx.user.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                STextStyle(
                                  text: ctx.user[index].adType,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                  maxLine: 1,
                                ),
                                STextStyle(
                                  text: ctx.fullAddress(index),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontWeight: FontWeight.w300),
                                  maxLine: 6,
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: "Update Address",
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    ctx.setInitialValue(index);
                                    Get.bottomSheet(AddressBottomSheet(
                                      index: index,
                                    ));
                                  },
                                  icon: const Icon(
                                    Iconsax.edit,
                                    color: SColors.accent,
                                  ),
                                ),
                                IconButton(
                                  tooltip: "Delete Address",
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    controller.deleteAddress(index);
                                  },
                                  icon: const Icon(
                                    Iconsax.trash,
                                    color: SColors.error,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
