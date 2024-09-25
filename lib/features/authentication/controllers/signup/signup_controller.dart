import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();



  /// SignUp
  Future<void> signUp() async {
    try {

      // Start Loading
      SiajFullScreenLoader();
      // Check Internet Connectivity
      // Form Validation
      // Privacy Policy Check
      // Register User in Firebase Authentication & Save user data in the Firebase
      // Save   Authenticated user data in the Firebase FireStore
      // Show success message
      // Move to verify email screen

    } catch(e){
      // show some Generic Error to the user
    } finally{
      // Remove Loader
    }
  }
}