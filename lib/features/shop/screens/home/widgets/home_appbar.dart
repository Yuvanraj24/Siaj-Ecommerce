import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/shimmer/shimmer_effect.dart';

class SiajHomeAppBar extends StatelessWidget {
  const SiajHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SiajAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SiajTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: SiajColors.grey)),
          Obx(
            () {
              if(controller.profileLoading.value){
                // Display a shimmer loader
                return const SiajShimmerEffect(width: 80, height: 15);
              }else {
                return Text(controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: SiajColors.white));
              }

            },
          ),
        ],
      ),
      actions: [
        SiajCartCounterIcon(onPressed: () {}, iconColor: SiajColors.white)
      ],
    );
  }
}
