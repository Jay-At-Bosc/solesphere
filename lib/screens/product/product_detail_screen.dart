import 'package:solesphere/auth/auth_exports.dart';

import 'package:solesphere/utils/constants/colors.dart';

import 'package:solesphere/utils/constants/sizes.dart';

import '../../common/widgets/heading/section_heading1.dart';
import 'widgets/Reviews/product_review.dart';
import 'widgets/deal_section.dart';
import 'widgets/header.dart';

import 'widgets/product_buy_section.dart';
import 'widgets/product_color_section.dart';
import 'widgets/product_material.dart';
import 'widgets/product_size_section.dart';
import 'widgets/product_slider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    

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
                  'Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike.... \n\n Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike.... \n\n Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: SColors.textPrimaryWith60),
                  textScaler: const TextScaler.linear(1),
                ),
                const Divider(),

                //Customer review
                const ReviewSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
