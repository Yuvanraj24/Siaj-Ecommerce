import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajBrandShowcase extends StatelessWidget {
  const SiajBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SiajRoundedContainer(
      showBorder: true,
      borderColor: SiajColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: SiajSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Product Count
          const SiajBrandCard(showBorder: false),
          const SizedBox(height: SiajSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: SiajRoundedContainer(
        height: 100,
        backgroundColor: SiajHelperFunctions.isDarkMode(context)
            ? SiajColors.darkerGrey
            : SiajColors.light,
        margin: const EdgeInsets.only(right: SiajSizes.sm),
        padding: const EdgeInsets.all(SiajSizes.md),
        child:  Image(
            fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}