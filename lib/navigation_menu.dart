import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siaj_ecommerce/features/personalization/screens/settings/settings.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/home.dart';
import 'package:siaj_ecommerce/features/shop/screens/store/store.dart';
import 'package:siaj_ecommerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/helper/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final darkMode = SiajHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
            elevation: 0,
            selectedIndex: navigationController.selectedIndex.value,
            onDestinationSelected: (index) => navigationController.selectedIndex.value = index,
            backgroundColor: darkMode? SiajColors.black : SiajColors.white,
            indicatorColor: darkMode? SiajColors.white.withOpacity(0.1) : SiajColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
              NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ]),

      ),
      body: Obx(() => navigationController.screens[navigationController.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Store(),
   const FavouriteScreen(),
    const SettingsScreen()
  ];

}
