import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/shop/screens/cart/cart.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajCartCounterIcon extends StatelessWidget {
  const SiajCartCounterIcon({
    super.key,
     this.iconColor,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon:  Icon(Iconsax.shopping_bag,color: darkMode ? SiajColors.light : SiajColors.dark)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: darkMode ? SiajColors.light : SiajColors.dark.withOpacity(0.9),
                borderRadius: BorderRadius.circular(100)
            ),
            child:  Center(
              child: Text('2',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: darkMode ? SiajColors.dark : SiajColors.light, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}