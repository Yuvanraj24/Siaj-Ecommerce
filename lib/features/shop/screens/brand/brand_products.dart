import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:siaj_ecommerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(SiajSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand detail
            SiajBrandCard(showBorder: true),
            SizedBox(height: SiajSizes.spaceBtwSections),

            SiajSortableProducts(),

          ],
        ),

        ),
      ),
    );
  }
}
