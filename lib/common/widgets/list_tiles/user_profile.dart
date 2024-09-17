import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';

class SiajUserProfileTile extends StatelessWidget {
  const SiajUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SiajCircularImage(
        image: SiajImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text("Coding with Siaj",
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: SiajColors.white),
      ),
      subtitle:  Text("support@siajdynamicinnovations.in",
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: SiajColors.white),
      ),
      trailing: IconButton(onPressed: () {

      }, icon: const Icon(Iconsax.edit, color: SiajColors.white)),
    );
  }
}