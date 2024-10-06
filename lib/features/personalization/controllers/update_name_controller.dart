import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/user/user_repository.dart';
import 'package:siaj_ecommerce/data/services/network_manager/network_manager.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:siaj_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';
import 'package:siaj_ecommerce/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();


  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  /// init user data when Home screen appears
  @override
  void onInit() {
    // TODO: implement onInit
initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async  {
    try {
      // Start Loading
      SiajFullScreenLoader.openLoadingDialog("We are updating your information", SiajImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        SiajFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {"firstName" : firstName.text.trim(), "lastName" : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      SiajFullScreenLoader.stopLoading();

      // Show Success Message
      SiajLoaders.successSnackBar(title: "Congratulations", message: "Your Name has been updated.");

      // Move to previous screen
      Get.offAll(() => const ProfileScreen());
    } catch (e) {
        SiajFullScreenLoader.stopLoading();
        SiajLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}