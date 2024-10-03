import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';
import 'package:shimmer/shimmer.dart';

class SiajShimmerEffect extends StatelessWidget {
  const SiajShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final darkMode = SiajHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: darkMode ? Colors.grey[850]! :  Colors.grey[300]!, highlightColor: darkMode ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (darkMode ? SiajColors.darkerGrey : SiajColors.white),
            borderRadius: BorderRadius.circular(radius)
          ),
        ) );
  }
}
