import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_rounded_image.dart';
import 'package:siaj_ecommerce/features/shop/controllers/home_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';


class SiajPromoSlider extends StatelessWidget {
  const SiajPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => SiajRoundedImage(imageUrl: url)).toList()
        ),
        const SizedBox(height: SiajSizes.spaceBtwItems),
        Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < banners.length; i++)
               SiajCircularContainer(
                width: 20,
                height: 4,
                margin: const EdgeInsets.only(right: 10),
                backgroundColor: controller.carousalCurrentIndex.value == i ? SiajColors.primaryColor : Colors.grey,
              ),
          ],
        ))
      ],
    );
  }
}