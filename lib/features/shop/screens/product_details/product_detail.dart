import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SiajHelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: SiajBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. Product Image Slider
            SiajProductImageSlider(),

            /// 2. Product Details
            Padding(padding: EdgeInsets.only(right: SiajSizes.defaultSpace, left: SiajSizes.defaultSpace, bottom: SiajSizes.defaultSpace),
            child: Column(
              children: [
                /// Rating & Share Button
                const SiajRatingAndShare(),

                /// Price, Title, Stock & Brand
                const SiajProductMetaData(),
                const SizedBox(height: SiajSizes.spaceBtwItems ),

                /// Attributes
                const SiajProductAttributes(),
                const SizedBox(height: SiajSizes.spaceBtwSections),

                /// Checkout Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                const SizedBox(height: SiajSizes.spaceBtwSections),

                /// Description
                const SiajSectionHeading(title: "Description"),
                const SizedBox(height: SiajSizes.spaceBtwItems),
                const ReadMoreText("This is a product description fro Blue Nike Sleeves less vest. There are more things that can be added",
                trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: " Show more",
                  trimExpandedText: " Less",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),


                /// Reviews
                const Divider(),
                const SizedBox(height: SiajSizes.spaceBtwItems),
                Row(
                  children: [
                    const SiajSectionHeading(title: "Reviews(199)", showActionButton: false),
                    IconButton(onPressed: ()=> Get.to(()=> const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18))
                  ],
                ),
                const SizedBox(height: SiajSizes.spaceBtwSections),

              ],
            ),

            )
          ],
        ),
      ),
    );
  }
}



