import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/styles/spacing_styles.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: SiajSpacingStyle.paddingWithAppBarHeight,
        child: Column(children: [
          /// Logo title & sub-title
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image(
                height: 150,
                image: AssetImage(
                    dark ? SiajImages.darkAppLogo : SiajImages.lightAppLogo)),
            Text(SiajTexts.loginTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: SiajSizes.sm),
            Text(SiajTexts.loginSubTitle,
                style: Theme.of(context).textTheme.bodyMedium),
          ]),

          /// Form
          Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: SiajSizes.spaceBtwSections),
            child: Column(
              children: [
                ///Email
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: SiajTexts.email),
                ),
                const SizedBox(height: SiajSizes.spaceBtwInputFields),

                ///Password
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: SiajTexts.password,
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),

                const SizedBox(height: SiajSizes.spaceBtwInputFields),

                ///Remember Me & Forget Password
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Remember Me
                      Row(children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text(SiajTexts.rememberMe)
                      ]),

                      /// Forget Password
                      TextButton(
                          onPressed: () {},
                          child: const Text(SiajTexts.forgetPassword)),
                    ]),

                const SizedBox(height: SiajSizes.spaceBtwSections),

                /// Sign In Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text(SiajTexts.signIn))),
                const SizedBox(height: SiajSizes.spaceBtwItems),

                /// Create Account Button
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(SiajTexts.createAccount))),
              ],
            ),
          )),

          ///Divider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Flexible(child: Divider(color: dark? SiajColors.darkerGrey : SiajColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
              Text(SiajTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium,),
              Flexible(child: Divider(color: dark? SiajColors.darkerGrey : SiajColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),

            ],
          )

        ]),
      ),
    );
  }
}
