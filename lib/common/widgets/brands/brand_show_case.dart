import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/shimmer_effect.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajBrandShowcase extends StatelessWidget {
  const SiajBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: SiajRoundedContainer(
        showBorder: true,
        borderColor: SiajColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: SiajSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Product Count
            SiajBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: SiajSizes.spaceBtwItems),
      
            /// Brand Top 3 Product Images
            Row(
                children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
          ]))
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
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, progress) => const SiajShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
      ),
    );
  }
}
