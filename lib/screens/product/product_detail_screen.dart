import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/screens/product/widgets/Reviews/customer_review.dart';
import 'package:solesphere/services/routes/app_route_exports.dart';

import 'package:solesphere/utils/constants/colors.dart';

import 'package:solesphere/utils/constants/sizes.dart';

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
    // final details = Get.put(ProductDetailController());
    // print("product list: ${details.productDetailList.length}");
    // print('name: ${details.productDetailList[0].productName}');
    // print('ratting: ${details.productDetailList[0].review.length}');
    // print('short dessc: ${details.productDetailList[0].shortDescription}');
    // print('Images: ${details.productDetailList[0].variants[0].image_urls}');
    // print('Colors: ${details.productDetailList[0].variants[0].color}');
    // print('Sizes: ${details.productDetailList[0].variants[0].sizes}');
    // print('Sizes type: ${details.productDetailList[0].sizeType}');
    // print('Clouser type: ${details.productDetailList[0].closureType}');
    // print('material: ${details.productDetailList[0].material}');
    // print('Long desc: ${details.productDetailList[0].longDescription}');
    // print(
    //     'Price: ${details.productDetailList[0].variants[0].sizes[0].discounted_price}');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
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
                  height: SSizes.spaceBtwSections,
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
                 "Description",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: SColors.textPrimaryWith60),
                  textScaler: const TextScaler.linear(1),
                ),
                const Divider(),

                //Customer review
                // if (controller.productDetailList[0].review.isNotEmpty)
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
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                            itemCount: 1,
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
    );
  }
}
