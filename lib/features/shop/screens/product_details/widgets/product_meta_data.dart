import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductMetaData extends StatelessWidget {
  const SiajProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale price
        Row(children: [
          /// Sale tag
          SiajRoundedContainer(
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
          SizedBox(width: SiajSizes.spaceBtwItems),

          /// Price
          Text("\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough)),
          SizedBox(width: SiajSizes.spaceBtwItems),
          SiajProductPriceText(price: "175", isLarge: true)
        ]),
        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

        /// Title
        const SiajProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

        /// Stock status
        Row(
          children: [
            const SiajProductTitleText(title: "Status"),
            const SizedBox(width: SiajSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SiajCircularImage(image: SiajImages.shoeIcon,
            width: 32,
              height: 32,
              overlayColor: darkMode ? SiajColors.white : SiajColors.black,
            ),
            const SizedBox(width: SiajSizes.spaceBtwItems / 2),
            const SiajBrandTitleWithVerifiedIcon(
                title: "Nike", brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
