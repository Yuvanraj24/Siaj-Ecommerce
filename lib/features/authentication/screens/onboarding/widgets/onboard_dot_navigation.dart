import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/device/device_utility.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardDotNavigation extends StatelessWidget {
  const OnBoardDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: SiajDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SiajSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count:  3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(activeDotColor: dark? SiajColors.light : SiajColors.dark, dotHeight: 6),


      ),
    );
  }
}