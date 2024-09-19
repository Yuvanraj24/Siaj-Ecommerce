import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class SiajOverallProductRating extends StatelessWidget {
  const SiajOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text("4.8", style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              SiajRatingProgressIndicator(text: '5', value: 1.0),
              SiajRatingProgressIndicator(text: '4', value: 0.8),
              SiajRatingProgressIndicator(text: '3', value: 0.6),
              SiajRatingProgressIndicator(text: '2', value: 0.4),
              SiajRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}