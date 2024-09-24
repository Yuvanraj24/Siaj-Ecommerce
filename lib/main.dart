import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/app.dart';
import 'package:siaj_ecommerce/firebase_options.dart';

Future<void> main() async {

  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Init Payment Methods
  // Todo: Await Native Splash
  // Todo: Initiative Firebase

  await  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository())
  );
  
  runApp(const MyApp()
  );
}


