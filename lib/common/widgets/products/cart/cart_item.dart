import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajCartItem extends StatelessWidget {
  const SiajCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image of product
        SiajRoundedImage(imageUrl: SiajImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(SiajSizes.sm),
          backgroundColor: SiajHelperFunctions.isDarkMode(context) ? SiajColors.darkerGrey : SiajColors.light,

        ),
        const SizedBox(width: SiajSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SiajBrandTitleWithVerifiedIcon(title: "Nike"),
              const Flexible(
                child: SiajProductTitleText(title: "Black Sports shoes",
                    maxLines: 1),
              ),

              /// Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: "Color",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                            text: "Green",
                            style: Theme.of(context).textTheme.bodySmall
                        ),

                        TextSpan(
                          text: "Size",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                            text: "UK 08",
                            style: Theme.of(context).textTheme.bodySmall
                        ),
                      ]
                  )
              )
            ],
          ),
        )

      ],
    );
  }
}