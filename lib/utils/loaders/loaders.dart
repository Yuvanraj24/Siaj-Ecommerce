import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajLoaders {

  static hideSnackBae() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
          elevation: 0,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: SiajHelperFunctions.isDarkMode(Get.context!) ? SiajColors.darkerGrey.withOpacity(.9) : SiajColors.grey.withOpacity(.9)
            ),
            child: Center(
              child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
          ))
    );
  }

  static successSnackBar({required title, message = "", duration = 3}){
    Get.snackbar(title, message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: SiajColors.white,
      backgroundColor: SiajColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: SiajColors.white)
    );
  }

  static warningSnackBar({required title, message = ""}){
    Get.snackbar(title, message,

        isDismissible: true,
        shouldIconPulse: true,
        colorText: SiajColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: SiajColors.white)
    );
  }

  static errorSnackBar({required title, message = ""}){
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: SiajColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: SiajColors.white)
    );
  }
}