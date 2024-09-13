import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajRoundedContainer extends StatelessWidget {
  const SiajRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = SiajSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = SiajColors.borderPrimary,
      this.backgroundColor,
      this.padding,
      this.margin});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}
