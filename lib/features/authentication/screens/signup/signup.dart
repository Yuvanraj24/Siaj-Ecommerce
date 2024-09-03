import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:siaj_ecommerce/common/widgets/login_signup/social_buttons.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                SiajTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Form
              const SiajSignUpForm(),

              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Divider
              SiajFormDivider(dividerText: SiajTexts.orSignUpWith.capitalize!),

              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Social Buttons (or) Footer
              const SiajSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}


