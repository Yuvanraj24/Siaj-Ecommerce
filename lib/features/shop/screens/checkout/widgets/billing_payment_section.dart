import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';

class SiajBillingPaymentSection extends StatelessWidget {
  const SiajBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool darkMode = SiajHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SiajSectionHeading(
            title: "Payment Method", buttonTitle: "Change", onPressed: () {}),
        const SizedBox(height: SiajSizes.spaceBtwItems / 2),
        Row(
          children: [
            SiajRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: darkMode ? SiajColors.light : SiajColors.white,
              padding: const EdgeInsets.all(SiajSizes.sm),
              child: const Image(
                  image: AssetImage(SiajImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: SiajSizes.spaceBtwItems / 2),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
