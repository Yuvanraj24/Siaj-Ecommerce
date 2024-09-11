import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:siaj_ecommerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';

import 'package:siaj_ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

import 'package:siaj_ecommerce/utils/device/device_utility.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          /// Header
          SiajPrimaryHeaderContainer(
              child: Column(
            children: [
              /// Appbar
              SiajHomeAppBar(),

              SizedBox(height: SiajSizes.spaceBtwSections),

              /// Searchbar
              SiajSearchContainer(
                text: "Search in store",
              ),

              SizedBox(height: SiajSizes.spaceBtwSections),

              /// Categories
              Padding(
                padding: EdgeInsets.only(left: SiajSizes.defaultSpace),
                child: Column(children: [
                  /// Heading
                  SiajSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: SiajColors.white),
                  SizedBox(
                    height: SiajSizes.spaceBtwItems,
                  ),

                  /// Categories list
                  SiajHomeCategories()
                ]),
              )
            ],
          )),

          /// Body
          Padding(
            padding: const EdgeInsets.all(SiajSizes.defaultSpace),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,

                  ),
                  items: const [
                    SiajRoundedImage(imageUrl: SiajImages.promoBanner1),
                    SiajRoundedImage(imageUrl: SiajImages.promoBanner2),
                    SiajRoundedImage(imageUrl: SiajImages.promoBanner3)
                  ],
                ),

                SizedBox(height: SiajSizes.spaceBtwItems),

              ],
            ),
          )
        ]),
      ),
    );
  }
}


