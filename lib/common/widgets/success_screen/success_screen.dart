import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/styles/spacing_styles.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';

import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: SiajSpacingStyle.paddingWithAppBarHeight * 2,
            child: Column(
              children: [

                ///Image
                Image(
                  image:  AssetImage(image),
                  width: SiajHelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(height: SiajSizes.spaceBtwSections),

                ///Title & Subtitle
                Text(title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: SiajSizes.spaceBtwItems),

                Text(subTitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: SiajSizes.spaceBtwSections),

                ///Buttons
                SizedBox(width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(SiajTexts.siajContinue)),),
              ],
            )
        ),

      ),
    );
  }
}
