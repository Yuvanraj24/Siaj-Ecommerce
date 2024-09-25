import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajSingleAddress extends StatelessWidget {
  const SiajSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return SiajRoundedContainer(
      padding: const EdgeInsets.all(SiajSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? SiajColors.primaryColor.withOpacity(0.4)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : darkMode
              ? SiajColors.darkerGrey
              : SiajColors.grey,
      margin: const EdgeInsets.only(bottom: SiajSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,

            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? darkMode
                      ? SiajColors.light
                      : SiajColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Yuvanraj",
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: SiajSizes.sm / 2),
              Text("+91 8124545454", maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: SiajSizes.sm / 2),
              Text("24/202, North Street, Thondamuthur, Coimbatore - 641009, TamilNadu, India",
                softWrap: true,
              ),

            ],
          )
        ]),
    );
  }
}
