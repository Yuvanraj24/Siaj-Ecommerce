import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SiajAppBar(
        title: Text("Sports"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SiajSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            const SiajRoundedImage(
              width: double.infinity,
              imageUrl: SiajImages.promoBanner3, applyImageRadius: true),
            const SizedBox(height: SiajSizes.spaceBtwSections),

            /// Sub-Categories
            Column(
              children: [
                /// Heading
                SiajSectionHeading(title: "Sports shirts",
                onPressed: () {}),
                const SizedBox(height: SiajSizes.spaceBtwItems / 2),
                
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: SiajSizes.spaceBtwItems),
                    itemBuilder: (context, index) => const SiajProductCardHorizontal(),
                    
                  ),
                )

              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
