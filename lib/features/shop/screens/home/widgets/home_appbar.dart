import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';

class SiajHomeAppBar extends StatelessWidget {
  const SiajHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SiajAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SiajTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SiajColors.grey)),
          Text(SiajTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: SiajColors.white)),
        ],
      ),
      actions: [
        SiajCartCounterIcon(onPressed: () {}, iconColor: SiajColors.white)
      ],
    );
  }
}