import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/styles/shadows.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductCardHorizontal extends StatelessWidget {
  const SiajProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [SiajShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SiajSizes.productImageRadius),
          color: darkMode ? SiajColors.darkerGrey : SiajColors.softGrey),
      child: Row(
        children: [
          /// Thumbnail
          SiajRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(SiajSizes.sm),
            backgroundColor: darkMode ? SiajColors.dark : SiajColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: SiajRoundedImage(
                    imageUrl: SiajImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: SiajRoundedContainer(
                    radius: SiajSizes.sm,
                    backgroundColor: SiajColors.secondaryColor.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        vertical: SiajSizes.xs, horizontal: SiajSizes.sm),
                    child: Text(
                      "25 %",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: SiajColors.black),
                    ),
                  ),
                ),

                /// Favourite icon button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: SiajCircularIcon(
                        icon: Iconsax.heart5, color: Colors.red))
              ]),
          ),

          /// Details
           SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: SiajSizes.sm, left: SiajSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SiajProductTitleText(
                          title: "Green Nike Half Sleeves Shirt",
                          smallSize: true),
                      SizedBox(height: SiajSizes.spaceBtwItems / 2),
                      SiajBrandTitleWithVerifiedIcon(title: "Nike"),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const Flexible(child: SiajProductPriceText(price: "256.00 - 25659.60")),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: SiajColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SiajSizes.cardRadiusMd),
                            bottomRight: Radius.circular(SiajSizes.productImageRadius)
                          )
                        ),
                        child: SizedBox(
                          width: SiajSizes.iconLg * 1.2,
                          height: SiajSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: SiajColors.white,),
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
