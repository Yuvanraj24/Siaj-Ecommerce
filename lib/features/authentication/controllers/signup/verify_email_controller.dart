import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:siaj_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimeForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SiajLoaders.successSnackBar(
          title: "Email sent",
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      SiajLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email verification
  setTimeForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: SiajImages.successfullyRegisterAnimation,
            title: SiajTexts.yourAccountCreatedTitle,
            subTitle: SiajTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect()
        ));
      }
    });
  }

  /// Manually check if Email verified
 checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
          image: SiajImages.successfullyRegisterAnimation,
          title: SiajTexts.yourAccountCreatedTitle,
          subTitle: SiajTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()
      ));
    }
 }
}
