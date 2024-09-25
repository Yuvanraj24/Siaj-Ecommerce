
import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajFormDivider extends StatelessWidget {

  final String dividerText;

  const SiajFormDivider({
    super.key,
    required this.dividerText
  });


  @override
  Widget build(BuildContext context) {
    final dark = SiajHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Flexible(child: Divider(color: dark? SiajColors.darkerGrey : SiajColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark? SiajColors.darkerGrey : SiajColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),

      ],
    );
  }
}