import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siaj_ecommerce/app.dart';
import 'package:siaj_ecommerce/firebase_options.dart';

import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {

  /// -- Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- Getx Local Storage
  await GetStorage.init();

  // Todo: Init Payment Methods

  /// -- Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initiative Firebase & Authentication Repository
  await  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform)
      .then(

      (FirebaseApp value) => Get.put(AuthenticationRepository())
  );
  
  runApp(const MyApp()
  );
}


