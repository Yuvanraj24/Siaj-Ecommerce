import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:siaj_ecommerce/features/shop/controllers/brand_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/cloud_helper_fuctions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: SiajAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SiajSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand detail
            SiajBrandCard(showBorder: true, brand: brand),
            const SizedBox(height: SiajSizes.spaceBtwSections),
            FutureBuilder(
              future: brandController.getBrandProducts(brand.id),
              builder: (context, snapshot) {
                const loader = SiajVerticalProductShimmer();
                final widget = SiajCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                // Return appropriate widget based on snapshot state
                if(widget != null) return widget;

                // Record found
                final brandProducts = snapshot.data!;
                return  SiajSortableProducts(products: brandProducts);
              }
            ),
          ]),

        ),
      ),
    );
  }
}
