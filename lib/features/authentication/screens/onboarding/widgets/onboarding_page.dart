import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class OnBoardingPage extends StatelessWidget {

  final String image, title, subTitle;

  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SiajSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: SiajHelperFunctions.screenWidth() * 0.8,
              height: SiajHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SiajSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}