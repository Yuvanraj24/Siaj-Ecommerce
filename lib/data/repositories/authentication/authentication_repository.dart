import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/login.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Call from main.dart on app Launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  /// Functions to show relevant screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnboardingScreen());
  }

/*--------------------------------------------------------- Email & Password sign in -------------------------------------------------------*/

  /// (Email Authentication) - Sign In

  /// (Email Authentication) - Sign Up
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    // on FirebaseAuthException catch(e){
    //   return ;
    // }
    catch (e) {
      throw "Something went wrong. Please try again";
    }
  }



/*--------------------------------------------------------- Email & Password sign in -------------------------------------------------------*/
}
