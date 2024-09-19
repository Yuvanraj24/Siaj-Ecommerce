import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/products/rating/rating_indicator.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {

    final bool darkMode = SiajHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(SiajImages.userProfileImage1)),
                SizedBox(width: SiajSizes.spaceBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.titleLarge)
              ]),

            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ]),

        const SizedBox(height: SiajSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const SiajRatingBarIndicator(rating: 4),
            const SizedBox(width: SiajSizes.spaceBtwItems),
            Text("01 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

        const SizedBox(height: SiajSizes.spaceBtwItems),
        const ReadMoreText("The user interfance of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!",
        trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " Show less",
          trimCollapsedText: " Show more",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: SiajColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: SiajColors.primaryColor),
        ),

        const SizedBox(height: SiajSizes.spaceBtwItems),

        /// Company Review
        SiajRoundedContainer(
          backgroundColor: darkMode ? SiajColors.darkerGrey : SiajColors.grey,
          child: Padding(padding: const EdgeInsets.all(SiajSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Siaj's Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: SiajSizes.spaceBtwItems),
                const ReadMoreText("The user interfance of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " Show less",
                  trimCollapsedText: " Show more",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: SiajColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: SiajColors.primaryColor),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
