import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/chips/choice_chip.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductAttributes extends StatelessWidget {
  const SiajProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected attribute pricing & Description
        SiajRoundedContainer(
          padding: const EdgeInsets.all(SiajSizes.md),
          backgroundColor: darkMode ? SiajColors.darkerGrey : SiajColors.grey,
          child: Column(children: [
            /// Title, Price & Stock status
            Row(children: [
              const SiajSectionHeading(
                  title: "Variation", showActionButton: false),
              const SizedBox(width: SiajSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SiajProductTitleText(title: "Price", smallSize: true),
                  Row(
                    children: [
                      /// Actual price
                      Text("\$25",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(decoration: TextDecoration.lineThrough)),
                      const SizedBox(width: SiajSizes.spaceBtwItems),

                      /// Sale price
                      const SiajProductTitleText(title: "20")
                    ],
                  ),

                  /// Stock
                  Row(
                    children: [
                      const SiajProductTitleText(
                          title: "Stock", smallSize: true),
                      Text("In Stock",
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  )
                ],
              ),
            ]),

            /// Variation description
            const SiajProductTitleText(
              title:
                  "This is the Description of the product and it can go up to max 4 lines.",
              smallSize: true,
              maxLines: 4,
            )
          ]),
        ),

        const SizedBox(height: SiajSizes.spaceBtwItems),

        /// Attributes
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SiajSectionHeading(title: "Colors"),
            const SizedBox(height: SiajSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SiajChoiceChip(text: 'Green', selected: false, onSelected: (value) {}),
                SiajChoiceChip(text: 'Blue', selected: true, onSelected: (value) {}),
                SiajChoiceChip(text: 'Yellow', selected: false , onSelected: (value) {}),
              ],
            )
          ],
        ),

         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SiajSectionHeading(title: "Size"),
            const SizedBox(height: SiajSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SiajChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {}),
                SiajChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {}),
                SiajChoiceChip(text: 'EU 38', selected: false , onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
