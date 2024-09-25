import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajLoginHeader extends StatelessWidget {
  const SiajLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image(
          height: 150,
          image: AssetImage(
              dark ? SiajImages.darkAppLogo : SiajImages.lightAppLogo)),
      Text(SiajTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: SiajSizes.sm),
      Text(SiajTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium),
    ]);
  }
}