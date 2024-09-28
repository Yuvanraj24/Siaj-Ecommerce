import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/login.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:siaj_ecommerce/navigation_menu.dart';

class   AuthenticationRepository extends GetxController {
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
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

/*--------------------------------------------------------- Email & Password sign in -------------------------------------------------------*/

  /// [Email Authentication] - Sign In

  /// [Email Authentication] - Sign Up
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    }

    /// * Important want to handle exception
    catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// [ReAuthentication] - ReAuthenticate User
/// [EmailAuthenticate] -  Forget Password

/*--------------------------------------------------------- Federated identify & social sign-in -------------------------------------------------------*/
/// [GoogleAuthentication] - Google
/// [FacebookAuthentication] - Facebook

/*--------------------------------------------------------- Email & Password sign in -------------------------------------------------------*/

/// [Logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch(e) {
      throw "${e.code} - FirebaseAuthException : ${e.message}";
    } on FirebaseException catch(e){
      throw "${e.code} - FirebaseException : ${e.message}";
    } on FormatException catch (_){
      throw "FormatException";
    } on PlatformException catch(e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }
/// [DeleteUser] - Remove user Auth and FireStore Account
}
