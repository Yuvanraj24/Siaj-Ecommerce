import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:siaj_ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:siaj_ecommerce/navigation_menu.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/validators/validation.dart';

class SiajLoginForm extends StatelessWidget {
  const SiajLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: SiajSizes.spaceBtwSections),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator:(value) => SiajValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: SiajTexts.email),
              ),
              const SizedBox(height: SiajSizes.spaceBtwInputFields),

              ///Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => SiajValidator.validateEmptyText("Password",value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: SiajTexts.password,
                      suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(
                          controller.hidePassword.value?
                          Iconsax.eye_slash : Iconsax.eye))
                  ),
                ),
              ),

              const SizedBox(height: SiajSizes.spaceBtwInputFields),

              ///Remember Me & Forget Password
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Remember Me
                    Row(children: [
                      Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                      const Text(SiajTexts.rememberMe)
                    ]),

                    /// Forget Password
                    TextButton(
                        onPressed: () => Get.to(() => const ForgetPassword()),
                        child: const Text(SiajTexts.forgetPassword)),
                  ]),

              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>  controller.emailAndPasswordSignIn(), child: const Text(SiajTexts.signIn))),
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