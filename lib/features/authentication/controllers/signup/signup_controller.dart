import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:siaj_ecommerce/data/repositories/user/user_repository.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/network_manager/network_manager.dart';
import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';
import 'package:siaj_ecommerce/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  /// SignUp
  void signUp() async {
    try {
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "We are processing your information", SiajImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        SiajLoaders.warningSnackBar(title: "Accept Privacy Policy",
            message: "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
        // SiajFullScreenLoader.stopLoading();
        return;
      }

      print("error");
      // Register User in Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase FireStore
      final newUser = UserModel(id: userCredential.user!.uid,
          fireName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          userName: userName.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      // Show success message
      SiajLoaders.successSnackBar(title: "Congratulations", message: "Your account has been created Verify email to continue.");

      // Move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text));

    } catch (e) {
      // show some Generic Error to the user
      SiajLoaders.errorSnackBar(title: "On Snap!", message: e.toString());
    }
  }
}