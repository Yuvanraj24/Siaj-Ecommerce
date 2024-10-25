import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:siaj_ecommerce/common/widgets/chips/choice_chip.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/features/shop/controllers/product/variation_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductAttributes extends StatelessWidget {
  const SiajProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          /// Selected attribute pricing & Description
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            SiajRoundedContainer(
              padding: const EdgeInsets.all(SiajSizes.md),
              backgroundColor:
                  darkMode ? SiajColors.darkerGrey : SiajColors.grey,
              child: Column(children: [
                /// Title, Price & Stock status
                Row(children: [
                  const SiajSectionHeading(
                      title: "Variation", showActionButton: false),
                  const SizedBox(width: SiajSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SiajProductTitleText(
                          title: "Price", smallSize: true),
                      Row(
                        children: [
                          /// Actual price
                          if (controller.selectedVariation.value.salePrice > 0)
                            Text(
                                "\$${controller.selectedVariation.value.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration:
                                            TextDecoration.lineThrough)),
                          const SizedBox(width: SiajSizes.spaceBtwItems),

                          /// Sale price
                          SiajProductPriceText(
                              price: controller.getVariationPrice())
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const SiajProductTitleText(
                              title: "Stock", smallSize: true),
                          Text(controller.variationStockStatus.value,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ]),

                /// Variation description
                SiajProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                )
              ]),
            ),

          const SizedBox(height: SiajSizes.spaceBtwItems),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SiajSectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        const SizedBox(height: SiajSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                return SiajChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            print("selected => $selected");
                                            print("available => $available");
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
