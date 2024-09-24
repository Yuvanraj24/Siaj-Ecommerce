import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SiajAppBar(
        title: Text("Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SiajSizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            const SiajSectionHeading(title: "Brands"),
            const SizedBox(height: SiajSizes.spaceBtwItems),

            /// Brands
            SiajGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) =>  SiajBrandCard(showBorder: true,onTap: () => Get.to(() => const BrandProducts())))

          ]),
        ),
      ),
    );
  }
}
