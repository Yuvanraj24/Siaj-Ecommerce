import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/tabbar.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';
import 'package:siaj_ecommerce/utils/http/http_client.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: SiajAppBar(
            title: Text(
              "Store",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [SiajCartCounterIcon(onPressed: () {})]),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: SiajHelperFunctions.isDarkMode(context)
                      ? SiajColors.black
                      : SiajColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(SiajSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// Search bar
                        const SizedBox(height: SiajSizes.spaceBtwItems),
                        const SiajSearchContainer(
                          text: "Search in store",
                          showBorder: true,
                          showBackGround: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: SiajSizes.spaceBtwSections),

                        /// Featured Brands
                        SiajSectionHeading(
                            title: "Featured Brands", onPressed: () {}),
                        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

                        /// Brands GRID
                        SiajGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const SiajBrandCard(showBorder: false);
                          },
                        )
                      ],
                    ),
                  ),

                  /// Tabs
                  bottom: const SiajTabBar(
                    tabs: [
                      Tab(child: Text("Sports")),
                      Tab(child: Text("Furniture")),
                      Tab(child: Text("Electronics")),
                      Tab(child: Text("Clothes")),
                      Tab(child: Text("Cosmetics")),
                    ],
                  ),
                )
              ];
            },

            /// Body
            body: const TabBarView(
              children: [
                SiajCategoryTab(),
                SiajCategoryTab(),
                SiajCategoryTab(),
                SiajCategoryTab(),
                SiajCategoryTab(),
              ],
            )),
      ),
    );
  }
}

///------------------------------------------------
