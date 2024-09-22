import 'package:flutter/material.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/features/shop/screens/order/widgets/orders_list.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
        title: Text("My Orders", style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(padding: const EdgeInsets.all(SiajSizes.defaultSpace),

        /// Orders
        child: SiajOrderListItems(),

      ),
    );
  }
}
