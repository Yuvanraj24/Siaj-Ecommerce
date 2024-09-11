import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';

class SiajCircularContainer extends StatelessWidget {
  const SiajCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = SiajColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double? padding;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}