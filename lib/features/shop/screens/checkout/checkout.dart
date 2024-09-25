import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/coupon_widget.dart';
import 'package:siaj_ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:siaj_ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:siaj_ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:siaj_ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:siaj_ecommerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:siaj_ecommerce/navigation_menu.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SiajHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SiajAppBar(
          showBackArrow: true,
          title: Text("Order Review",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SiajSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              const SiajCartItems(showAddRemoveButtons: false),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Coupon TextField
              const SiajCouponCode(),
              const SizedBox(height: SiajSizes.spaceBtwSections),

              /// Billing Section
              SiajRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(SiajSizes.md),
                backgroundColor: darkMode ? SiajColors.black : SiajColors.white,
                child: const Column(
                  children: [

                    /// Pricing
                    SiajBillingAmountSection(),
                    SizedBox(height: SiajSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: SiajSizes.spaceBtwItems),

                    /// Payment Methods
                    SiajBillingPaymentSection(),
                    SizedBox(height: SiajSizes.spaceBtwItems),

                    /// Address
                    SiajBillingAddressSection()
                  ],
                )
              )
            ]),
        ),
      ),
      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SiajSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(()=> SuccessScreen(
                image: SiajImages.successfulPaymentIcon,
                title: "Payment Success!",
                subTitle: "Your item will be shipped soon!",
                onPressed: () => Get.offAll(() => const NavigationMenu()))), child: const Text("Checkout \$256.00")),
      ),
    );
  }
}
