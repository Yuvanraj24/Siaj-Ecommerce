import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/update_name_controller.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';
import 'package:siaj_ecommerce/utils/constants/text_strings.dart';
import 'package:siaj_ecommerce/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom Appbar
      appBar: SiajAppBar(
        showBackArrow: true,
        title: Text("Change Name", style: Theme.of(context).textTheme.headlineSmall)
      ),
      body: Padding(padding: const EdgeInsets.all(SiajSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Headings
          Text("Use real name for easy verification. This name appear on several pages.",
          style: Theme.of(context).textTheme.labelMedium,
          ),

          const SizedBox(height: SiajSizes.spaceBtwSections),

          /// Text field and Button
          Form(
            key: controller.updateUserNameFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => SiajValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: SiajTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)
                  ),
                ),

                const SizedBox(height: SiajSizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => SiajValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: SiajTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)
                  ),
                ),

                const SizedBox(height: SiajSizes.spaceBtwSections),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.updateUserName(), child: Text("Save")),
                )
              ],
            ),
          )
        ],
      ),
      ),
    );
  }
}
