import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/models/category_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajCategoryTab extends StatelessWidget {
  const SiajCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const SiajBrandShowcase(
                images: [
                  SiajImages.productImage1,
                  SiajImages.productImage2,
                  SiajImages.productImage3,
                ],
              ),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              /// Products
              SiajSectionHeading(
                title: "You might like",
                onPressed: () {},
              ),
              const SizedBox(height: SiajSizes.spaceBtwItems),

              SiajGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => SiajProductCardVertical(product: ProductModel.empty())),
              const SizedBox(height: SiajSizes.spaceBtwSections)
            ],
          ),
        ),
      ],
    );
  }
}
