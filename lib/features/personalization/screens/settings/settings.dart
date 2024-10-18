import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:siaj_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:siaj_ecommerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:siaj_ecommerce/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:siaj_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:siaj_ecommerce/data/dummy_data.dart';
import 'package:siaj_ecommerce/data/repositories/banners/banner_repository.dart';
import 'package:siaj_ecommerce/data/repositories/categories/category_repository.dart';
import 'package:siaj_ecommerce/data/repositories/product/product_repository.dart';
import 'package:siaj_ecommerce/features/personalization/screens/address/address.dart';
import 'package:siaj_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:siaj_ecommerce/features/shop/screens/order/order.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryRepo = Get.put(CategoryRepository());
    final bannerRepo = Get.put(BannerRepository());
    final productRepo = Get.put(ProductRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            SiajPrimaryHeaderContainer(
                child: Column(
              children: [
                /// Appbar
                SiajAppBar(
                  title: Text("Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: SiajColors.white)),
                ),
                const SizedBox(height: SiajSizes.spaceBtwSections),

                /// User Profile Card
                 SiajUserProfileTile(onPress: () => Get.to(() => const ProfileScreen())),

                const SizedBox(height: SiajSizes.spaceBtwSections)
              ],
            )),

            /// Body
            Padding(
              padding: const EdgeInsets.all(SiajSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Setting
                  const SiajSectionHeading(title: "Account Settings"),
                  const SizedBox(height: SiajSizes.spaceBtwItems),

                   SiajSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subTitle: "Set shopping delivery address", onTap: ()=> Get.to(const UserAddressScreen())),
                  const SiajSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, remove products and move to checkout"),
                   SiajSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "In-progress and Completed Orders",
                      onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const SiajSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Withdraw balance to registered bank account"),
                  const SiajSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all the discounted coupons"),
                  const SiajSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of notification message"),
                  const SiajSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts"),

                  /// App Settings
                  const SizedBox(height: SiajSizes.spaceBtwSections),

                  const SiajSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: SiajSizes.spaceBtwItems),
                   SiajSettingsMenuTile(
                      onTap: () => productRepo.uploadProductsDummyData(SiajDummyData.products),
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload Data to your Cloud Firebase"),

                  /// Tile with Switch button
                  SiajSettingsMenuTile(
                      icon: Iconsax.location,
                      title: "Geolocation",
                      subTitle: "Set recommendation based on location",
                      trailing: Switch(value: false, onChanged: (value) {})),
                  SiajSettingsMenuTile(

                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subTitle: "Search result is safe for all ages",
                      trailing: Switch(value: true, onChanged: (value) {})),
                  SiajSettingsMenuTile(
                      icon: Iconsax.image,
                      title: "HD Image Quality",
                      subTitle: "Set image quality to be seen",
                      trailing: Switch(value: true, onChanged: (value) {})),

                  const SizedBox(height: SiajSizes.spaceBtwSections),

                  /// Logout Button

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Logout")),
                  ),

                  const SizedBox(height: SiajSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
