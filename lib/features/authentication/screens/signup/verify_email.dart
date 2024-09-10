import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/login.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens
        child: Padding(
          padding: EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(SiajImages.deliveredEmailIllustration),
                width: SiajHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              ///Title & Subtitle
              Text(SiajTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SiajSizes.spaceBtwItems),
              Text("support@siajdynamicinnovations.in",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: SiajSizes.spaceBtwItems),
              Text(SiajTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              ///Buttons
              SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(() =>  SuccessScreen(
                image: SiajImages.staticSuccessIllustration, title: SiajTexts.yourAccountCreatedTitle, subTitle: SiajTexts.yourAccountCreatedSubTitle, onPressed: () =>  Get.to(() => LoginScreen()),)), child: const Text(SiajTexts.siajContinue)),),

              const SizedBox(height: SiajSizes.spaceBtwItems),

              SizedBox(width: double.infinity,
                child: TextButton(onPressed: () {

                }, child: const Text(SiajTexts.resendEmail)),),

            ],
          ),
        ),
      ),
    );
  }
}
