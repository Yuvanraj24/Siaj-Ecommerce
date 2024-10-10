import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/styles/shadows.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/features/shop/controllers/product_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_details/product_detail.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductCardVertical extends StatelessWidget {
  const SiajProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salesPrice);
    final darkMode = SiajHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(()=>  ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [SiajShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(SiajSizes.productImageRadius),
            color: darkMode ? SiajColors.darkerGrey : SiajColors.white),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag,
            SiajRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(SiajSizes.sm),
              backgroundColor: darkMode ? SiajColors.dark : SiajColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                   Center(
                     child: SiajRoundedImage(
                        imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                   ),
      
                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: SiajRoundedContainer(
                      radius: SiajSizes.sm,
                      backgroundColor: SiajColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          vertical: SiajSizes.xs, horizontal: SiajSizes.sm),
                      child: Text(
                        "$salePercentage %",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: SiajColors.black),
                      ),
                    ),
                  ),
      
                  /// Favourite icon button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: SiajCircularIcon(
                          icon: Iconsax.heart5, color: Colors.red))
                ],
              ),
            ),
      
            const SizedBox(height: SiajSizes.spaceBtwItems / 2),
      
            /// Details
             Padding(
              padding: const EdgeInsets.only(left: SiajSizes.sm),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SiajProductTitleText(
                    title: product.title, smallSize: true),
                const SizedBox(height: SiajSizes.spaceBtwItems / 2),
                SiajBrandTitleWithVerifiedIcon(title: product.brand!.name,)
              ]),
            ),
            const Spacer(),

            /// Price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Price
                 Flexible(
                   child: Column(
                     children: [
                       if(product.productType == ProductType.single.toString() && product.salesPrice > 0)
                         Padding(padding: const EdgeInsets.only(left: SiajSizes.sm),
                         child: Text(
                           product.price.toString(),
                           style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                         )
                         ),

                       /// Price, show sale price as main price if sale exist.
                       Padding(
                        padding: const EdgeInsets.only(left: SiajSizes.sm),
                        child: SiajProductPriceText(price: controller.getProductPrice(product)),
                                       ),
                     ],
                   ),
                 ),

                /// Add to cart button
                Container(
                  decoration: const BoxDecoration(
                      color: SiajColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SiajSizes.cardRadiusMd),
                          bottomRight:
                          Radius.circular(SiajSizes.productImageRadius))),
                  child: const SizedBox(
                    width: SiajSizes.iconLg * 1.2,
                    height: SiajSizes.iconLg * 1.2,
                    child: Icon(Iconsax.add, color: SiajColors.white),
                  ),
                )
              ],
            )
          ]),
      ),
    );
  }
}



