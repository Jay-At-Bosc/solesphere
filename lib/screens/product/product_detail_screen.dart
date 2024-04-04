import 'package:iconsax/iconsax.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';
import 'package:solesphere/common/widgets/text/text_style.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/screens/product/widgets/Reviews/customer_review.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import 'package:solesphere/utils/constants/colors.dart';
import 'package:solesphere/utils/constants/icons.dart';
import 'package:solesphere/utils/constants/labels.dart';

import 'package:solesphere/utils/constants/sizes.dart';
import 'package:solesphere/utils/extensions/responsive_extension.dart';

import '../../common/widgets/heading/section_heading1.dart';

import 'widgets/deal_section.dart';
import 'widgets/header.dart';

import 'widgets/product_buy_section.dart';
import 'widgets/product_color_section.dart';
import 'widgets/product_material.dart';
import 'widgets/product_size_section.dart';
import 'widgets/product_slider.dart';

class ProductDetail extends GetView<ProductDetailController> {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<ProductDetailController>(
          builder: (controller) => SingleChildScrollView(
            child: SafeArea(
              child: controller.isLoading.value
                  ? const ShoesLoading(loader: SJsons.loader)
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ProductDetailHeader(),

                          //Short Description of product and slider
                          const ProductSlider(),

                          //Colors of Brand
                          const SProductColors(),
                          const SizedBox(
                            height: SSizes.spaceBtwSections / 2,
                          ),

                          //Sizes
                          const ProductSizeSection(),

                          //Deal of the day
                          const ProductDealOfTheDay(),
                          const Divider(),

                          //Buy Section
                          const ProductBuySection(),
                          const Divider(),

                          //Product Details section
                          SectionHeading(
                            text: 'Product Details',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .apply(color: Colors.black),
                          ),

                          const ProductmaterialType(),
                          const Divider(),

                          //About Product Section
                          SectionHeading(
                              text: 'About Product',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .apply(color: Colors.black)),
                          Text(
                            controller.productDetail.longDescription,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(color: SColors.textPrimaryWith60),
                            textScaler: const TextScaler.linear(1),
                          ),
                          const Divider(),

                          //Customer review
                          if (controller.productDetail.review.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionHeading(
                                  text: 'Customer Reviews',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .apply(color: Colors.black),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 2.0.getHeight()),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    tileColor: SColors.textWhite,
                                    title:
                                        const STextStyle(text: SLabels.review),
                                    trailing: const Icon(Iconsax.arrow_right_3),
                                  ),
                                ),
                                SizedBox(
                                  // height: 300,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller
                                          .productDetail.review.length,
                                      itemBuilder: (context, index) =>
                                          CustomerReview(index: index)),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
