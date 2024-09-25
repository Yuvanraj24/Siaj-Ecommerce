import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/widgets/onboard_dot_navigation.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/device/device_utility.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());



    return Scaffold(
      body: Stack(children: [
        ///Horizontal Scrollable pages
        PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,

            children: const [
          OnBoardingPage(image: SiajImages.onBoardingImage1, title: SiajTexts.onBoardingTitle1, subTitle: SiajTexts.onBoardingSubTitle1),
          OnBoardingPage(image: SiajImages.onBoardingImage2, title: SiajTexts.onBoardingTitle2, subTitle: SiajTexts.onBoardingSubTitle2),
          OnBoardingPage(image: SiajImages.onBoardingImage3, title: SiajTexts.onBoardingTitle3, subTitle: SiajTexts.onBoardingSubTitle3),
        ]),

        /// Skip Button
        const OnBoardingSkip(),
        
        /// Dot Navigation SmoothPageIndicator
        const OnBoardDotNavigation(),

        /// Circular button
        const OnBoardingNextButton()
      ]),
    );
  }
}



