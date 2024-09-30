import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/images/siaj_circlar_image.dart';
import 'package:siaj_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';

class SiajUserProfileTile extends StatelessWidget {
  const SiajUserProfileTile({
    super.key, this.onPress,
  });

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const SiajCircularImage(
        image: SiajImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: SiajColors.white),
      ),
      subtitle:  Text(controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: SiajColors.white),
      ),
      trailing: IconButton(onPressed: onPress,
          icon: const Icon(Iconsax.edit, color: SiajColors.white)),
    );
  }
}