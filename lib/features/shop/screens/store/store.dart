import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
          title: Text("Store",
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          actions: [
            SiajCartCounterIcon(
                onPressed: () {}
            )
          ]),
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
                  padding: EdgeInsets.all(SiajSizes.defaultSpace),

                  child: ListView(
                    shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                    children: [

                      /// Search bar
                      SizedBox(height: SiajSizes.spaceBtwItems),
                      SiajSearchContainer(text: "Search in store",
                        showBorder: true,
                        showBackGround: false,
                        padding: EdgeInsets.zero,),
                      SizedBox(height: SiajSizes.spaceBtwSections),

                      /// Featured Brands
                      SiajSectionHeading(
                          title: "Featured Brands", onPressed: () {}),
                      const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

                      SiajGridLayout(itemCount: 4, mainAxisExtent:80,itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: null,
                          child: SiajRoundedContainer(
                            padding: const EdgeInsets.all(SiajSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child:Row(
                              children: [
                                /// Icon
                                Flexible(
                                  child: SiajCircularImage(
                                    isNetworkImage: false,
                                    image: SiajImages.clothIcon,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: SiajHelperFunctions.isDarkMode(context) ? SiajColors.white : SiajColors.black,
                                  ),
                                ),
                                const SizedBox(width: SiajSizes.spaceBtwItems / 2),

                                /// Text
                                Expanded(child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SiajBrandTitleWithVerifiedIcon(title: "Nike",
                                        brandTextSize: TextSizes.large),
                                    Text("256 Products",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    )
                                  ],
                                ))
                              ]),
                          ),
                        );
                      },)
                    ],
                  ),
                ),
              )
            ];
          }, body: Container()),
    );
  }
}


