import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned( top: SiajDeviceUtils.getAppBarHeight(),right: SiajSizes.defaultSpace,child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: const Text("Skip")));
  }
}