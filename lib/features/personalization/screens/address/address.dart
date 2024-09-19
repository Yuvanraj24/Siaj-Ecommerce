import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:siaj_ecommerce/features/personalization/screens/address/add_new_address.dart';
import 'package:siaj_ecommerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () => Get.to(()=> const AddNewAddressScreen()),
          backgroundColor: SiajColors.primaryColor,
        child: const Icon(Iconsax.add, color: SiajColors.white),
        ),
      appBar: SiajAppBar(
        showBackArrow: true,
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(SiajSizes.defaultSpace),
        child: Column(
          children: [
              SiajSingleAddress(selectedAddress: true),
              SiajSingleAddress(selectedAddress: false),
          ],
        ),
        ),
      ),
    );
  }
}
