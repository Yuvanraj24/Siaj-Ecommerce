import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siaj_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:siaj_ecommerce/data/services/network_manager/network_manager.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';
import 'package:siaj_ecommerce/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// Email & Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog(
          "Logging you in...", SiajImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // show some Generic Error to the user
      SiajFullScreenLoader.stopLoading();
      SiajLoaders.errorSnackBar(title: "On Snap!", message: e.toString());
    }
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try{
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog("Loading you in...", SiajImages.docerAnimation);

      // Check the internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e){
      // Remove Loader
      SiajFullScreenLoader.stopLoading();
      SiajLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());

    }
  }

  /// Facebook SignIn Authentication
}
