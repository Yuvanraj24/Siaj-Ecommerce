import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:siaj_ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SiajAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SiajCircularImage(
                        image: SiajImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: SiajSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              const SiajSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              SiajProfileMenu(
                onPressed: () => Get.to(() => ChangeName()),
                title: "Name",
                value: controller.user.value.fullName,
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "Username",
                value: controller.user.value.userName,
              ),

              const SizedBox(height: SiajSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              /// Heading Personal Info
              const SiajSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              SiajProfileMenu(
                onPressed: () {},
                title: "User ID",
                value: controller.user.value.id,
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "E-mail",
                value: controller.user.value.email,
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "Gender",
                value: "Male",
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "Date of Birth",
                value: "24 Dec 2000",
              ),

              const Divider(),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
