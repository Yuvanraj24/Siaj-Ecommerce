import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          child: Container(
        color: SiajHelperFunctions.isDarkMode(Get.context!)
            ? SiajColors.dark
            : SiajColors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 250),
            SiajAnimationLoaderWidget(text: text, animation: animation)
          ],
        ),
      )),
    );
  }

  /// Stop te currently open loading dialog
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
