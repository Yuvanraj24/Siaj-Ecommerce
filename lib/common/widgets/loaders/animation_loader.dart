import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const SiajAnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: Get.width * 0.8),
          const SizedBox(height: SiajSizes.defaultSpace),
          Text(text,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              textAlign: TextAlign.center
          ),
          const SizedBox(height: SiajSizes.defaultSpace),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: SiajColors.dark),
                child: Text(actionText!,
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: SiajColors.light),
            )),
          ) : const SizedBox()
        ],
      ),
    );
  }
}
