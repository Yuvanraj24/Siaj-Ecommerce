import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:siaj_ecommerce/common/widgets/texts/siaj_brand_title_text_with_verified_icon.dart';
import 'package:siaj_ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductMetaData extends StatelessWidget {
  const SiajProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salesPrice);
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale price
        Row(children: [
          /// Sale tag
          SiajRoundedContainer(
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
          const SizedBox(width: SiajSizes.spaceBtwItems),

          /// Price
          if(product.productType == ProductType.single.toString() && product.salesPrice > 0)
          Text("\$${product.price}",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough)),
          if(product.productType == ProductType.single.toString() && product.salesPrice > 0) const SizedBox(width: SiajSizes.spaceBtwItems),
          SiajProductPriceText(price: controller.getProductPrice(product), isLarge: true)
        ]),
        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

        /// Title
         SiajProductTitleText(title: product.title),
        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

        /// Stock status
        Row(
          children: [
            const SiajProductTitleText(title: "Status"),
            const SizedBox(width: SiajSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: SiajSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SiajCircularImage(
              image: product.brand != null ? product.brand!.image : "",
            width: 32,
              height: 32,
              overlayColor: darkMode ? SiajColors.white : SiajColors.black,
            ),
            const SizedBox(width: SiajSizes.spaceBtwItems / 2),
             SiajBrandTitleWithVerifiedIcon(
                title:product.brand != null ? product.brand!.name : "", brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
