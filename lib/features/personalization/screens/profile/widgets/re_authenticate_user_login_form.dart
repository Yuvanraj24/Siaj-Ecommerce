import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar:
          const SiajAppBar(title: Text("Re-Authenticate User"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  TextFormField(
                      controller: controller.verifyEmail,
                      validator: SiajValidator.validateEmail,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: SiajTexts.email)),

                  const SizedBox(height: SiajSizes.spaceBtwInputFields),

                  /// Password
                  Obx(
                    () => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            SiajValidator.validateEmptyText("Password", value),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            labelText: SiajTexts.password,
                            suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: Icon(controller.hidePassword.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye)))),
                  ),

                  const SizedBox(height: SiajSizes.spaceBtwSections),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text("Verify")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
