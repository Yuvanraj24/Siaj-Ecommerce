import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class SiajOrderListItems extends StatelessWidget {
  const SiajOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: SiajSizes.spaceBtwItems),
        itemCount: 31,
        itemBuilder: (context, index) => SiajRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(SiajSizes.md),
          backgroundColor: darkMode ? SiajColors.dark : SiajColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Row 1
              Row(
                children: [
                  /// 1 - Icon
                  const Icon(Iconsax.ship),
                  const SizedBox(width: SiajSizes.spaceBtwItems / 2),

                  /// 2 - Status & Date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Processing",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: SiajColors.primaryColor,
                                fontWeightDelta: 1)),
                        Text("07 Nov 2024",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),

                  /// 3 - Icon
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_34,
                          size: SiajSizes.iconSm)),
                ],
              ),

              SizedBox(height: SiajSizes.spaceBtwItems),

              /// Row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        /// 1 - Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(width: SiajSizes.spaceBtwItems / 2),

                        /// 2 - Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order",
                                  style: Theme.of(context).textTheme.labelMedium),
                              Text("[#Siaj-465]",
                                  style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        /// 1 - Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: SiajSizes.spaceBtwItems / 2),

                        /// 2 - Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Shipping Date",
                                  style: Theme.of(context).textTheme.labelMedium),
                              Text("03 Feb 2025",
                                  style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
