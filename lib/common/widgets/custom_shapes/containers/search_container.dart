import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/device/device_utility.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajSearchContainer extends StatelessWidget {
  const SiajSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackGround = true,
    this.showBorder = true,
    this.onTap
  });

  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = SiajHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SiajSizes.defaultSpace),
        child: Container(
          width: SiajDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SiajSizes.md),
          decoration: BoxDecoration(
              color: showBackGround
                  ? darkMode
                      ? SiajColors.dark
                      : SiajColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(SiajSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: SiajColors.grey) : null),
          child: Row(
            children: [
              Icon(icon, color: SiajColors.darkerGrey),
              const SizedBox(width: SiajSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
