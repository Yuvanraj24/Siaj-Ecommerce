import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:siaj_ecommerce/common/widgets/shimmers/shimmer_effect.dart';

class SiajBrandShimmer extends StatelessWidget {
  const SiajBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SiajGridLayout(itemCount: itemCount, itemBuilder: (_, __) => const SiajShimmerEffect(width: 300, height: 80,));
  }
}
