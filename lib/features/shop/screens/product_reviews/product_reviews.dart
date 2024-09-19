
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/products/rating/rating_indicator.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: SiajAppBar(
        showBackArrow: true,
        title: Text("Reviews & Ratings"),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              /// Overall Product Ratings
              const SiajOverallProductRating(),
              const SiajRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// User Review List
                UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}






