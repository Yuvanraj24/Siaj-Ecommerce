import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/device/device_utility.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Positioned(
        right: SiajSizes.defaultSpace,
        bottom: SiajDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: ()=> OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ?  SiajColors.buttonPrimary:Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}