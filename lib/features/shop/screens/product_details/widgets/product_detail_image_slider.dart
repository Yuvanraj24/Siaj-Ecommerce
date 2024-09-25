import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductImageSlider extends StatelessWidget {
  const SiajProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return SiajCurvedEdgeWidget(
      child: Container(
        color: darkMode ? SiajColors.darkerGrey : SiajColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding:
                EdgeInsets.all(SiajSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(SiajImages.productImage5),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SiajSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: SiajSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => SiajRoundedImage(
                      width: 80,
                      backgroundColor:
                      darkMode ? SiajColors.dark : SiajColors.white,
                      border:
                      Border.all(color: SiajColors.primaryColor),
                      padding: const EdgeInsets.all(SiajSizes.sm),
                      imageUrl: SiajImages.productImage3),
                ),
              ),
            ),

            /// Appbar Icons
            const SiajAppBar(showBackArrow: true, actions: [
              SiajCircularIcon(icon: Iconsax.heart5, color: Colors.red)
            ])
          ],
        ),
      ),
    );
  }
}