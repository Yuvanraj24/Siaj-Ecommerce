import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SiajAppTheme.lightTheme,
      darkTheme: SiajAppTheme.darkTheme,
      home: const Scaffold(
        backgroundColor: SiajColors.primaryColor,
        body: Center(child: CircularProgressIndicator(color: SiajColors.white)),),
    );
  }
}