import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SiajAppBar(
        showBackArrow: true,
        title: Text(
          "Add new Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SiajSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: "Name",
                )),
                const SizedBox(height: SiajSizes.spaceBtwInputFields),
                TextFormField(
                    decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: "Phone Number",
                )),
                const SizedBox(height: SiajSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: "Street",
                      )),
                    ),
                    SizedBox(width: SiajSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: "Postal Code",
                      )),
                    ),
                  ],
                ),
                const SizedBox(height: SiajSizes.spaceBtwInputFields),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: "City",
                          )),
                    ),
                    SizedBox(width: SiajSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: "State",
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: SiajSizes.spaceBtwInputFields),

                TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      labelText: "Countru",
                    )),

                const SizedBox(height: SiajSizes.defaultSpace),

                SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text("Save")),
                )

              ]),
          ),
        ),
      ),
    );
  }
}
