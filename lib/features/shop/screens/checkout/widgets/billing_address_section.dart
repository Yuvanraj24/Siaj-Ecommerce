import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SiajBillingAddressSection extends StatelessWidget {
  const SiajBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SiajSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: (){}),
        Text("Yuvanraj", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: SiajSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: SiajSizes.spaceBtwItems),
            Text("+91 8124612000", style:  Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SiajSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: SiajSizes.spaceBtwItems),
            Expanded(
              child: Text("9/15 Anna nagar, Thondamuthur, Coimbatore - 641109, Tamil nadu, India ", style:  Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
              ),
            ),
          ],
        ),

      ]);
  }
}
