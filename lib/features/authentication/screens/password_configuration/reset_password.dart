import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/login.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            children: [

              ///Image
              Image(
                image:  const AssetImage(SiajImages.deliveredEmailIllustration),
                width: SiajHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Email, Title & Subtitle
              Text(SiajTexts.changeYourPasswordTitle,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              Text(SiajTexts.changeYourPasswordSubTitle,
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              ///Buttons
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(SiajTexts.done)),),
              const SizedBox(height: SiajSizes.spaceBtwItems),
              SizedBox(width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                    child: const Text(SiajTexts.resendEmail)))
            ]),
      ),
    ));
  }
}
