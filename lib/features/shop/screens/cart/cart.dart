import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:siaj_ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(SiajSizes.defaultSpace),
        /// Items in cart
        child: SiajCartItems()),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SiajSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(()=> const CheckoutScreen()), child: const Text("Checkout \$256.00")),
      ),
    );
  }
}


