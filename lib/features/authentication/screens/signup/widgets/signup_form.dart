import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/widgets/tems_conditions_checkbox.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajSignUpForm extends StatelessWidget {
  const SiajSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        ///First & Last Name
        Row(children: [
          Expanded(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: SiajTexts.firstName,
                  prefixIcon: Icon(Iconsax.user)),
            ),
          ),
          const SizedBox(width: SiajSizes.spaceBtwInputFields),
          Expanded(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: SiajTexts.firstName,
                  prefixIcon: Icon(Iconsax.user)),
            ),
          ),
        ]),

        const SizedBox(height: SiajSizes.spaceBtwInputFields),

        /// Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SiajTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(height: SiajSizes.spaceBtwInputFields),

        /// Email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SiajTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),

        const SizedBox(height: SiajSizes.spaceBtwInputFields),

        /// Phone number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SiajTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),

        const SizedBox(height: SiajSizes.spaceBtwInputFields),

        /// Password
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: SiajTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),

        const SizedBox(height: SiajSizes.spaceBtwSections),

        /// Terms & Conditions Checkbox
        const SiajTermsAndConditionCheckBox(),

        const SizedBox(height: SiajSizes.spaceBtwSections),

        /// Sign Up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(SiajTexts.createAccount),
          ),
        )
      ],
    ));
  }
}
