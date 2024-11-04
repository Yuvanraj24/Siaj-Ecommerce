import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/controllers/category_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/category_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:siaj_ecommerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/cloud_helper_fuctions.dart';

class SiajCategoryTab extends StatelessWidget {
  const SiajCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(children: [
            /// Brands
            CategoryBrands(category: category),
            const SizedBox(height: SiajSizes.spaceBtwItems),

            /// Products
            FutureBuilder(
              future: controller.getCategoryProducts(categoryId: category.id),
              builder: (context, snapshot) {

                final widget = SiajCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const SiajVerticalProductShimmer());
                if(widget != null) return widget;

                /// Record found
                final products = snapshot.data!;


                return Column(
                  children: [
                    SiajSectionHeading(
                      title: "You might like",
                      onPressed: () => Get.to(() => AllProducts(title: category.name,
                      futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                      )),
                    ),
                    const SizedBox(height: SiajSizes.spaceBtwItems),
                    SiajGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) =>
                            SiajProductCardVertical(product: products[index])),
                  ],
                );
              }
            ),

            // const SizedBox(height: SiajSizes.spaceBtwSections)
          ]),
        ),
      ],
    );
  }
}
