import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_show_case.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:siaj_ecommerce/features/shop/controllers/brand_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/category_model.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/cloud_helper_fuctions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        /// Handle Loader, No record, Error message
        const loader = Column(
          children: [
            SiajListTileShimmer(),
            SizedBox(height: SiajSizes.spaceBtwItems),
            SiajBoxesShimmer(),
            SizedBox(height: SiajSizes.spaceBtwItems)
          ],
        );

        final widget = SiajCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if(widget != null) return widget;

        /// Record found
        final brands = snapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_,index){
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {

                  final widget = SiajCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  /// Record found
                  final products = snapshot.data!;

                  return SiajBrandShowcase(
                    brand: brand,
                    images: products.map((product) => product.thumbnail).toList());
                }
              );
            });

      }
    );
  }
}
