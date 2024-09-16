import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajBrandTitleWithVerifiedIcon extends StatelessWidget {

  const SiajBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = SiajColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: SiajBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(width: SiajSizes.xs),
        Icon(Iconsax.verify5,
            color: iconColor, size: SiajSizes.iconXs)
      ],
    );
  }
}