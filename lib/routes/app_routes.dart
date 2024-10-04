import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/authentication/screens/login/login.dart';
import 'package:siaj_ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:siaj_ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:siaj_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:siaj_ecommerce/features/personalization/screens/address/address.dart';
import 'package:siaj_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:siaj_ecommerce/features/personalization/screens/settings/settings.dart';
import 'package:siaj_ecommerce/features/shop/screens/cart/cart.dart';
import 'package:siaj_ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:siaj_ecommerce/features/shop/screens/home/home.dart';
import 'package:siaj_ecommerce/features/shop/screens/order/order.dart';
import 'package:siaj_ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:siaj_ecommerce/features/shop/screens/store/store.dart';
import 'package:siaj_ecommerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:siaj_ecommerce/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: SiajRoutes.home, page: () => const HomeScreen()),
    GetPage(name: SiajRoutes.store, page: () => const StoreScreen()),
    GetPage(name: SiajRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: SiajRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: SiajRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: SiajRoutes.order, page: () => const OrderScreen()),
    GetPage(name: SiajRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: SiajRoutes.cart, page: () => const CartScreen()),
    GetPage(name: SiajRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: SiajRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: SiajRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: SiajRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: SiajRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: SiajRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: SiajRoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}