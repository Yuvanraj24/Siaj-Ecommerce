import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajVerticalImageText extends StatelessWidget {
  const SiajVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SiajColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true

  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.only(right: SiajSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            SiajCircularImage(
              isNetworkImage: isNetworkImage,
              fit: BoxFit.fitWidth,
              padding: SiajSizes.sm * 1.4,
              image: image,
              backgroundColor: backgroundColor,
              overlayColor: SiajHelperFunctions.isDarkMode(context)
                  ? SiajColors.light
                  : SiajColors.dark,
            ),
            const SizedBox(height: SiajSizes.spaceBtwItems / 2),

            /// Text
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
