import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajCartItems extends StatelessWidget {
  const SiajCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: SiajSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (context, index) => Column(children: [
        const SiajCartItem(),
        if (showAddRemoveButtons)
          const SizedBox(height: SiajSizes.spaceBtwItems),
        if (showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                /// Extra Space
                SizedBox(width: 70),

                /// Add Remove buttons
                SiajProductQuantityWithAddRemoveButton(),
              ]),
              SiajProductPriceText(price: "256")
            ],
          )
      ]),
    );
  }
}
