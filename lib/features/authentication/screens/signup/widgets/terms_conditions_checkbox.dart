import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajTermsAndConditionCheckBox extends StatelessWidget {
  const SiajTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value)),
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
      ]
    );
  }
}