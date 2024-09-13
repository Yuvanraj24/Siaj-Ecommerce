import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';

import 'package:siaj_ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

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
            padding: EdgeInsets.all(SiajSizes.defaultSpace),
            child: Column(
              children: [
                /// Promo Slider
                const SiajPromoSlider(banners: [
                  SiajImages.promoBanner1,
                  SiajImages.promoBanner2,
                  SiajImages.promoBanner3,
                ]),
                const SizedBox(height: SiajSizes.spaceBtwSections),

                /// Heading
                 SiajSectionHeading(title: "Popular Products", onPressed: (){},),
                const SizedBox(height: SiajSizes.spaceBtwItems),

                /// Popular Products
                SiajGridLayout(
                  itemCount: 5,
                  itemBuilder: (_, index) => const SiajProductCardVertical(),
                ),

              ]),
          )
        ]),
      ),
    );
  }
}
