import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/user/user_repository.dart';
import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save the user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Covert Name to First an Last Name
        final nameParts =
            UserModel.nameparts(userCredentials.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? "");

        // Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            fireName: nameParts.first,
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            email: userCredentials.user!.email ?? "",
            phoneNumber: userCredentials.user!.phoneNumber ?? "",
            userName: username,
            profilePicture: userCredentials.user!.photoURL ?? "");

        // Save user data
        await userRepository.saveUserRecord(user);
        }
    } catch (e) {
      SiajLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your information. You can re-save your data in your Profile");
    }
  }
}
