import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';

class SiajPrimaryHeaderContainer extends StatelessWidget {
  const SiajPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SiajCurvedEdgeWidget(
      child: Container(
        color: SiajColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: SiajCircularContainer(
                    backgroundColor: SiajColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: SiajCircularContainer(
                    backgroundColor: SiajColors.textWhite.withOpacity(0.1))),
            child
          ],
        ),
      ),
    );
  }
}