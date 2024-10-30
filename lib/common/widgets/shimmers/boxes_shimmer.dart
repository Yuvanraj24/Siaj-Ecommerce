import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/shimmer_effect.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajBoxesShimmer extends StatelessWidget {
  const SiajBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: SiajShimmerEffect(width: 150, height: 110,)),
            SizedBox(width: SiajSizes.spaceBtwItems),
            Expanded(child: SiajShimmerEffect(width: 150, height: 110)),
            SizedBox(width: SiajSizes.spaceBtwItems),
            Expanded(child: SiajShimmerEffect(width: 150, height: 110))
          ],
        )
      ],
    );
  }
}
