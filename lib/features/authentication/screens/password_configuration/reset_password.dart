import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
        child: Padding(padding: EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            children: [

              ///Image
              Image(
                image:  const AssetImage(SiajImages.deliveredEmailIllustration),
                width: SiajHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              ///Title & Subtitle
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
                    onPressed: (){},
                    child: const Text(SiajTexts.done)),),
              const SizedBox(height: SiajSizes.spaceBtwItems),
              SizedBox(width: double.infinity,
                child: TextButton(
                    onPressed: (){},
                    child: const Text(SiajTexts.resendEmail)))
            ]),
      ),
    ));
  }
}
