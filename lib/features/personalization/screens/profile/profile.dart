import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SiajSizes.defaultSpace),
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
                onPressed: () {},
                title: "Name",
                value: "Coding with Siaj",
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "Username",
                value: "coding_with_siaj",
              ),

              SizedBox(height: SiajSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: SiajSizes.spaceBtwItems),

              /// Heading Personal Info
              SiajSectionHeading(
                  title: "Personal Information", showActionButton: false),
              SizedBox(height: SiajSizes.spaceBtwItems),

              SiajProfileMenu(
                onPressed: () {},
                title: "User ID",
                value: "45689",
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "E-mail",
                value: "coding_with_siaj",
              ),
              SiajProfileMenu(
                onPressed: () {},
                title: "Phone Number",
                value: "+91 9150296989",
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
