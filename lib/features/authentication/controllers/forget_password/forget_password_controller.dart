import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:siaj_ecommerce/data/services/network_manager/network_manager.dart';
import 'package:siaj_ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';
import 'package:siaj_ecommerce/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "Processing your request...", SiajImages.docerAnimation);

      // Check the Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Send Mail to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      // Show success screen
      SiajLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email link sent to reset your password".tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      SiajFullScreenLoader.stopLoading();
      SiajLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "Processing your request...", SiajImages.docerAnimation);

      // Check the Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Send Mail to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      // Show success screen
      SiajLoaders.successSnackBar(
          title: "Email Sent",
          message: "Email link sent to reset your password".tr);


    } catch (e) {
      // Remove Loader
      SiajFullScreenLoader.stopLoading();
      SiajLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
