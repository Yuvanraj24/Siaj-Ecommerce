import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajSocialButtons extends StatelessWidget {
  const SiajSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SiajColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(onPressed: () => controller.googleSignIn(), icon: const Image(
            width: SiajSizes.iconMd,
            height: SiajSizes.iconMd,
            image: AssetImage(SiajImages.google),
          )),
        ),
        const SizedBox(width: SiajSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SiajColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(onPressed: (){}, icon: const Image(
            width: SiajSizes.iconMd,
            height: SiajSizes.iconMd,
            image: AssetImage(SiajImages.facebook),
          )),
        ),
      ],
    );
  }
}