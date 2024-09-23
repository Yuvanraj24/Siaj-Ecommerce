import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:siaj_ecommerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';

class SiajHomeCategories extends StatelessWidget {
  const SiajHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SiajVerticalImageText(
            image: SiajImages.shoeIcon,
            title: 'Shoes',
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}