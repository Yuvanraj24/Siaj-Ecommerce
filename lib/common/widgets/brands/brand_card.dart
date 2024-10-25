import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajBrandCard extends StatelessWidget {
  const SiajBrandCard({
    super.key,
    required this.showBorder,
    this.onTap, required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: SiajRoundedContainer(
        padding: const EdgeInsets.all(SiajSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(children: [
          /// Icon
          Flexible(
            child: SiajCircularImage(
              isNetworkImage: true,
              image: brand.image,
              backgroundColor: Colors.transparent,
              overlayColor: SiajHelperFunctions.isDarkMode(context)
                  ? SiajColors.white
                  : SiajColors.black,
            ),
          ),
          const SizedBox(width: SiajSizes.spaceBtwItems / 2),

          /// Text
          Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SiajBrandTitleWithVerifiedIcon(
                      title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    "${brand.productCount ?? 0} products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ))
        ]),
      ),
    );
  }
}