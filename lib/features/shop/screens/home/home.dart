import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:siaj_ecommerce/features/shop/screens/all_products/all_products.dart';

import 'package:siaj_ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [

          /// Header
          const SiajPrimaryHeaderContainer(
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
                      SiajHomeCategories(),
                    ]),
                  ),

                  SizedBox(height: SiajSizes.spaceBtwSections)
                ],
              )),

          /// Body
          Padding(
            padding: const EdgeInsets.all(SiajSizes.defaultSpace),
            child: Column(children: [

              /// Promo Slider
              const SiajPromoSlider(),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Heading
              SiajSectionHeading(
                title: "Popular Products",
                onPressed: () => Get.to(() => AllProducts(
                  title: 'Popular Products',
                  futureMethod: controller.fetchAllFeaturedProducts(),
                )),
              ),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              /// Popular Products
              Obx(
                      () {
                    if (controller.isLoading.value)
                      return const SiajVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text("No Data Found", style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium));
                    }
                    return SiajGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) =>
                          SiajProductCardVertical(product: controller
                              .featuredProducts[index]),
                    );
                  }
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
