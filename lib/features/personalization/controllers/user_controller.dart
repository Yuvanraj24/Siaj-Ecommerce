import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siaj_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:siaj_ecommerce/data/repositories/user/user_repository.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/network_manager/network_manager.dart';
import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/login.dart';
import 'package:siaj_ecommerce/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';
import 'package:siaj_ecommerce/utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save the user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update  Rx User and then check if user data is already stored.  if not store a new data.
      await fetchUserRecord();

      // If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Covert Name to First an Last Name
          final nameParts =
              UserModel.nameparts(userCredentials.user!.displayName ?? "");
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? "");

          // Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts.first,
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
              email: userCredentials.user!.email ?? "",
              phoneNumber: userCredentials.user!.phoneNumber ?? "",
              userName: username,
              profilePicture: userCredentials.user!.photoURL ?? "");

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SiajLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your information. You can re-save your data in your Profile");
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SiajSizes.md),
        title: "Delete Account",
        middleText:
            "Are your sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.",
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: SiajSizes.lg),
              child: Text("Delete"),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("Cancel")));
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      SiajFullScreenLoader.openLoadingDialog(
          "Processing", SiajImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          SiajFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      SiajFullScreenLoader.stopLoading();
      SiajLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      SiajFullScreenLoader.openLoadingDialog(
          "Processing", SiajImages.docerAnimation);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        SiajFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      SiajFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      SiajFullScreenLoader.stopLoading();
      SiajLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);

        // Update user Image record
        Map<String, dynamic> json = {"profilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        SiajLoaders.successSnackBar(
            title: "Congratulations",
            message: "Your Profile Image has been updated!");
      }
    } catch (e) {
      SiajLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Something went wrong");
    } finally {
      imageUploading.value = false;
    }
  }
}
