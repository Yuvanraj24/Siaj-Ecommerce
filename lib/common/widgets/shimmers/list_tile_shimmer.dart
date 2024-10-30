import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/shimmer_effect.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajListTileShimmer extends StatelessWidget {
  const SiajListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            SiajShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: SiajSizes.spaceBtwItems),
            Column(
              children: [
                SiajShimmerEffect(width: 100, height: 15),
                SizedBox(height: SiajSizes.spaceBtwItems / 2),
                SiajShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
