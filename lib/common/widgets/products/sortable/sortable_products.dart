import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajSortableProducts extends StatelessWidget {
  const SiajSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ].map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),

        const SizedBox(height: SiajSizes.spaceBtwSections),

        /// Products
        SiajGridLayout(itemCount: 4, itemBuilder: (_, index) => const SiajProductCardVertical())
      ],
    );
  }
}