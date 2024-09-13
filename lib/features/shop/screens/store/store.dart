import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
        title: const Text("Store"),
        actions: [
          SiajCartCounterIcon(iconColor: SiajColors.white, onPressed: () {

          },)
        ],
      ),
    );
  }
}
