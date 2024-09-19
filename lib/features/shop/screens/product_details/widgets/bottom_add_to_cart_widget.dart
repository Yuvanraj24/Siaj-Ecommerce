import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajBottomAddToCart extends StatelessWidget {
  const SiajBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SiajHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SiajSizes.defaultSpace, vertical: SiajSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: darkMode ? SiajColors.darkerGrey : SiajColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SiajSizes.cardRadiusLg),
          topRight: Radius.circular(SiajSizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            const SiajCircularIcon(icon: Iconsax.minus,
              backgroundColor: SiajColors.darkerGrey,
              width: 40,
              height: 40,
              color: SiajColors.white,
            ),
            const SizedBox(width: SiajSizes.spaceBtwItems),
            Text("2", style:  Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: SiajSizes.spaceBtwItems),
            const SiajCircularIcon(icon: Iconsax.add,
              backgroundColor: SiajColors.black,
              width: 40,
              height: 40,
              color: SiajColors.white,
            ),
          ],
        ),

        ElevatedButton(onPressed: () {
          
        },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(SiajSizes.md),
              backgroundColor: SiajColors.black,
              side: const BorderSide(color: SiajColors.black)
            ),
            child: const Text("Add to cart"))
        
      ],),
    );
  }
}
