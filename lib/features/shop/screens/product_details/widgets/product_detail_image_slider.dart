import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:siaj_ecommerce/common/widgets/icons/siaj_circular_icon.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajProductImageSlider extends StatelessWidget {
  const SiajProductImageSlider({
    super.key,
    required this.product
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    print("images.length print --> ${images.length}");

    return SiajCurvedEdgeWidget(
      child: Container(
        color: darkMode ? SiajColors.darkerGrey : SiajColors.light,
        child: Stack(
          children: [
            /// Main Large Image
             SizedBox(
              height: 400,
              child: Padding(
                padding:
                const EdgeInsets.all(SiajSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return CachedNetworkImage(imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                       CircularProgressIndicator(
                        value: downloadProgress.progress,
                         color: SiajColors.primaryColor,
                      ));
                    }
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
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: SiajSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(
                     () {
                       final imageSelected = controller.selectedProductImage.value == images[index];
                       return SiajRoundedImage(
                           width: 80,
                           backgroundColor:
                           darkMode ? SiajColors.dark : SiajColors.white,
                           border: Border.all(color: imageSelected ? SiajColors.primaryColor : Colors.transparent),
                           padding: const EdgeInsets.all(SiajSizes.sm),
                           isNetworkImage: true,
                           onPressed: () => controller.selectedProductImage.value = images[index],
                           imageUrl: images[index]);
                     },
                  ),
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