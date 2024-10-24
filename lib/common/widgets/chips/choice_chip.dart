import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helpers/helper_function.dart';
import 'package:siaj_ecommerce/utils/http/http_client.dart';

class SiajChoiceChip extends StatelessWidget {
  const SiajChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isColor = SiajHelperFunctions.getColor(text) != null;
    print("object 11 --> $selected");
    print("object 12 --> $onSelected");
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? SiajColors.white : null),
        avatar: isColor
            ? SiajCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: SiajHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: SiajHelperFunctions.getColor(text),
      ),
    );
  }
}
