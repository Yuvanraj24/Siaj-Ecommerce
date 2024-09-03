import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/styles/spacing_styles.dart';
import 'package:siaj_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:siaj_ecommerce/common/widgets/login_signup/social_buttons.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: SiajSpacingStyle.paddingWithAppBarHeight,
        child: Column(children: [
          /// Logo title & sub-title
          const SiajLoginHeader(),

          /// Form
          const SiajLoginForm(),

          ///Divider
          SiajFormDivider(dividerText: SiajTexts.orSignInWith.capitalize!,),

          const SizedBox(height: SiajSizes.spaceBtwItems),

          ///Footer
          const SiajSocialButtons(),

        ]),
      ),
    );
  }
}




