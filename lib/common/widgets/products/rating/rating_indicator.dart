import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';

class SiajRatingBarIndicator extends StatelessWidget {
  const SiajRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: SiajColors.grey,
      itemBuilder: (_, __) => const Icon(Iconsax.star, color: SiajColors.primaryColor,),
    );
  }
}