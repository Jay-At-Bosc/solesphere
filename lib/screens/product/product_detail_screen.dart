import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:solesphere/auth/auth_exports.dart';
import 'package:solesphere/common/widgets/buttons/secondary_button.dart';
import 'package:solesphere/common/widgets/popup/loaders.dart';
import 'package:solesphere/common/widgets/popup/shoes_loading.dart';
import 'package:solesphere/common/widgets/text/text_style.dart';
import 'package:solesphere/screens/favorite/favorite_controller.dart';
import 'package:solesphere/screens/product/product_detail_controller.dart';
import 'package:solesphere/screens/product/review_controller.dart';
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
                          GetBuilder<FavoriteController>(
                              id: FavoriteController.instance.favoriteId,
                              builder: (ctx) => const ProductDetailHeader()),

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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AddReviewTitle(controller.productDetail.id),
                              SizedBox(
                                child: controller
                                        .productDetail.review.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller
                                            .productDetail.review.length,
                                        itemBuilder: (context, index) =>
                                            CustomerReview(index: index))
                                    : Center(
                                        child: STextStyle(
                                        text:
                                            "No review found for this product!!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: SColors.warning),
                                      )),
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

class AddReviewTitle extends GetView<ReviewController> {
  const AddReviewTitle(
    this.id, {
    super.key,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewController>(
      id: controller.reviewFormId,
      init: ReviewController(),
      builder: (controller) => Column(
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
            padding: EdgeInsets.only(bottom: 2.0.getHeight()),
            child: GestureDetector(
              onTap: () async {
                if (await controller.isUserEligible(id)) {
                  Get.dialog(
                    Dialog(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Write Review',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              RatingBar.builder(
                                initialRating: controller.rating,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  controller.rating = rating;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: controller.review,
                                maxLines: 3,
                                maxLength: 100,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your review',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your review';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              SecondaryButton(
                                label: "Submit",
                                background: SColors.accent,
                                forground: SColors.textWhite,
                                onPress: () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    await controller.storeReview(id);
                                    await ProductDetailController.instance
                                        .fetchProductDetails(id);
                                    Get.back(); // Close the dialog
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  TLoaders.warningSnackBar(
                      title: "Not Eligible",
                      message:
                          "You are not eligible to write a review for this product.");
                }
              },
              child: GetBuilder<ReviewController>(
                id: controller.arrowAnimationId,
                builder: (controller) => ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6.0)),
                  tileColor: SColors.textWhite,
                  title: const STextStyle(text: SLabels.review),
                  trailing: controller.isLoading
                      ? Lottie.asset(
                          SJsons.arrow, // Path to your Lottie animation
                          width: 50,
                          height: 30,

                          fit: BoxFit.fill,
                        )
                      : const Icon(Iconsax.arrow_right_3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
