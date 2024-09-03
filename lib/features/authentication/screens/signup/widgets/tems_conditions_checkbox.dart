import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajTermsAndConditionCheckBox extends StatelessWidget {
  const SiajTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(
          width: SiajSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "${SiajTexts.iAgreeTo} ",
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: "${SiajTexts.privacyPolicy} ",
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark
                    ? SiajColors.white
                    : SiajColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark
                    ? SiajColors.white
                    : SiajColors.primaryColor,
              )),
          TextSpan(
              text: "${SiajTexts.and} ",
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: "${SiajTexts.termsOfUse} ",
              style:
              Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark
                    ? SiajColors.white
                    : SiajColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: dark
                    ? SiajColors.white
                    : SiajColors.primaryColor,
              )),
        ]))
      ],
    );
  }
}