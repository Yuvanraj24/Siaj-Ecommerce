import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/shimmer_effect.dart';

class SiajCategoryShimmer extends StatelessWidget {
  const SiajCategoryShimmer({super.key, this.itemCount = 6 });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: SiajSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SiajShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: SiajSizes.spaceBtwItems / 2),

              /// Text
              SiajShimmerEffect(width: 55, height: 8)
            ]);
        },
      ),
    );
  }
}
