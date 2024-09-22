import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SiajProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SiajCircularIcon(icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: SiajSizes.md,
          color: SiajHelperFunctions.isDarkMode(context) ? SiajColors.white : SiajColors.black,
          backgroundColor: SiajHelperFunctions.isDarkMode(context) ? SiajColors.darkerGrey : SiajColors.light,
        ),
        const SizedBox(width: SiajSizes.spaceBtwItems),

        Text("2", style: Theme.of(context).textTheme.titleSmall),

        const SizedBox(width: SiajSizes.spaceBtwItems),

        const SiajCircularIcon(icon: Iconsax.add,
          width: 32,
          height: 32,
          size: SiajSizes.md,
          color: SiajColors.white,
          backgroundColor: SiajColors.primaryColor,
        ),
      ],
    );
  }
}