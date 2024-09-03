import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';

class SiajLoginForm extends StatelessWidget {
  const SiajLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
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
                      onPressed: () => Get.to(() => const SignupScreen()),

                      child: const Text(SiajTexts.createAccount,style: TextStyle(color: Colors.black),))),
            ],
          ),
        ));
  }
}