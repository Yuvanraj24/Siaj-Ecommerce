import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/category_shimmer.dart';
import 'package:siaj_ecommerce/features/shop/controllers/category_controller.dart';
import 'package:siaj_ecommerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';

class SiajHomeCategories extends StatelessWidget {
  const SiajHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(
      () {
        if(categoryController.isLoading.value) return const SiajCategoryShimmer();
        if(categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categoryController.featuredCategories[index];
              return SiajVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        );
      },
    );
  }
}