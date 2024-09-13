import 'package:flutter/cupertino.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';

class SiajShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: SiajColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: SiajColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}