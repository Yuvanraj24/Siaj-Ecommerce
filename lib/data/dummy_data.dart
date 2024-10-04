import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';
import 'package:siaj_ecommerce/features/shop/models/banner_model.dart';
import 'package:siaj_ecommerce/features/shop/models/category_model.dart';
import 'package:siaj_ecommerce/routes/routes.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';

class SiajDummyData {
  /// Banners

  static final List<BannerModel> banners = [
    BannerModel(imageUrl: SiajImages.banner1, targetScreen: SiajRoutes.order, active: false),
    BannerModel(imageUrl: SiajImages.banner2, targetScreen: SiajRoutes.cart, active: true),
    BannerModel(imageUrl: SiajImages.banner3, targetScreen: SiajRoutes.favourites, active: true),
    BannerModel(imageUrl: SiajImages.banner4, targetScreen: SiajRoutes.search, active: true),
    BannerModel(imageUrl: SiajImages.banner5, targetScreen: SiajRoutes.settings, active: true),
    BannerModel(imageUrl: SiajImages.banner6, targetScreen: SiajRoutes.userAddress, active: true),
    BannerModel(imageUrl: SiajImages.banner8, targetScreen: SiajRoutes.checkout, active: false),
  ];

  /// User
  ///Cart
  ///Order

  /// List of all Categories
    static final List<CategoryModel> categories = [
      CategoryModel(id: "1", image: SiajImages.sportIcon, name: "Sports", isFeatured: true),
      CategoryModel(id: "5", image: SiajImages.furnitureIcon, name: "Furniture", isFeatured: true),
      CategoryModel(id: "2", image: SiajImages.electronicsIcon, name: "Electronics", isFeatured: true),
      CategoryModel(id: "3", image: SiajImages.clothIcon, name: "Clothes", isFeatured: true),
      CategoryModel(id: "4", image: SiajImages.animalIcon, name: "Animals", isFeatured: true),
      CategoryModel(id: "6", image: SiajImages.shoeIcon, name: "Shoes", isFeatured: true),
      CategoryModel(id: "7", image: SiajImages.cosmeticsIcon, name: "Cosmetics", isFeatured: true),
      CategoryModel(id: "14", image: SiajImages.jeweleryIcon, name: "Jewelery", isFeatured: true),

      /// Sub-categories
      CategoryModel(id: "8", image: SiajImages.sportIcon, name: "Sport Shoes",parentId: "1", isFeatured: false),
      CategoryModel(id: "9", image: SiajImages.sportIcon, name: "Track Suits",parentId: "1", isFeatured: false),
      CategoryModel(id: "10", image: SiajImages.sportIcon, name: "Sports Equipments",parentId: "1", isFeatured: false),

      // Furniture
      CategoryModel(id: "11", image: SiajImages.furnitureIcon, name: "Bedroom furniture",parentId: "5", isFeatured: false),
      CategoryModel(id: "12", image: SiajImages.furnitureIcon, name: "Kitchen furniture",parentId: "5", isFeatured: false),
      CategoryModel(id: "13", image: SiajImages.furnitureIcon, name: "Office furniture",parentId: "5", isFeatured: false),

      // electronics
      CategoryModel(id: "14", image: SiajImages.electronicsIcon, name: "Laptop",parentId: "2", isFeatured: false),
      CategoryModel(id: "15", image: SiajImages.electronicsIcon, name: "Mobile",parentId: "2", isFeatured: false),
    ];
}
