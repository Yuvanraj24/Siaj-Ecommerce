import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/brand_shimmer.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/controllers/brand_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final  brandController = BrandController.instance;

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

            /// Brands GRID
            Obx(
                  () {
                if(brandController.isLoading.value) return const SiajBrandShimmer();
                if(brandController.featuredBrands.isEmpty) {
                  return Center(child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                }
                return SiajGridLayout(
                  itemCount: brandController.featuredBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brand = brandController.featuredBrands[index];
                    return  SiajBrandCard(showBorder: false, brand: brand,
                    onTap: () => Get.to(() => BrandProducts(brand: brand)),);
                  },
                );
              },
            )

          ]),
        ),
      ),
    );
  }
}
