import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';
import 'package:siaj_ecommerce/features/shop/models/banner_model.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/features/shop/models/category_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_variation_model.dart';
import 'package:siaj_ecommerce/routes/routes.dart';
import 'package:siaj_ecommerce/utils/constants/image_strings.dart';

class SiajDummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: SiajImages.banner1,
        targetScreen: SiajRoutes.order,
        active: false),
    BannerModel(
        imageUrl: SiajImages.banner2,
        targetScreen: SiajRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: SiajImages.banner3,
        targetScreen: SiajRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: SiajImages.banner4,
        targetScreen: SiajRoutes.search,
        active: true),
    BannerModel(
        imageUrl: SiajImages.banner5,
        targetScreen: SiajRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: SiajImages.banner6,
        targetScreen: SiajRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: SiajImages.banner8,
        targetScreen: SiajRoutes.checkout,
        active: false)
  ];

  /// User

  ///Cart

  ///Order

  /// List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "1", image: SiajImages.sportIcon, name: "Sports", isFeatured: true),
    CategoryModel(
        id: "5",
        image: SiajImages.furnitureIcon,
        name: "Furniture",
        isFeatured: true),
    CategoryModel(
        id: "2",
        image: SiajImages.electronicsIcon,
        name: "Electronics",
        isFeatured: true),
    CategoryModel(
        id: "3",
        image: SiajImages.clothIcon,
        name: "Clothes",
        isFeatured: true),
    CategoryModel(
        id: "4",
        image: SiajImages.animalIcon,
        name: "Animals",
        isFeatured: true),
    CategoryModel(
        id: "6", image: SiajImages.shoeIcon, name: "Shoes", isFeatured: true),
    CategoryModel(
        id: "7",
        image: SiajImages.cosmeticsIcon,
        name: "Cosmetics",
        isFeatured: true),
    CategoryModel(
        id: "14",
        image: SiajImages.jeweleryIcon,
        name: "Jewelery",
        isFeatured: true),

    /// Sub-categories
    CategoryModel(
        id: "8",
        image: SiajImages.sportIcon,
        name: "Sport Shoes",
        parentId: "1",
        isFeatured: false),
    CategoryModel(
        id: "9",
        image: SiajImages.sportIcon,
        name: "Track Suits",
        parentId: "1",
        isFeatured: false),
    CategoryModel(
        id: "10",
        image: SiajImages.sportIcon,
        name: "Sports Equipments",
        parentId: "1",
        isFeatured: false),

    // Furniture
    CategoryModel(
        id: "11",
        image: SiajImages.furnitureIcon,
        name: "Bedroom furniture",
        parentId: "5",
        isFeatured: false),
    CategoryModel(
        id: "12",
        image: SiajImages.furnitureIcon,
        name: "Kitchen furniture",
        parentId: "5",
        isFeatured: false),
    CategoryModel(
        id: "13",
        image: SiajImages.furnitureIcon,
        name: "Office furniture",
        parentId: "5",
        isFeatured: false),

    // electronics
    CategoryModel(
        id: "14",
        image: SiajImages.electronicsIcon,
        name: "Laptop",
        parentId: "2",
        isFeatured: false),
    CategoryModel(
        id: "15",
        image: SiajImages.electronicsIcon,
        name: "Mobile",
        parentId: "2",
        isFeatured: false),
  ];


  static const String nikeLogo = "assets/icons/brands/nike.png";
  static const String adidasLogo = "assets/icons/brands/adidas-logo.png";
  static const String appleLogo = "assets/icons/brands/apple-logo.png";
  static const String jordanLogo = "assets/icons/brands/jordan-logo.png";
  static const String pumaLogo = "assets/icons/brands/puma-logo.png";
  static const String zaraLogo = "assets/icons/brands/zara-logo.png";
  static const String kenwoodLogo = "assets/icons/brands/kenwood-logo.png";
  static const String hermanMillerLogo = "assets/icons/brands/herman-miller-logo.png";
  static const String ikeaLogo = "assets/icons/brands/ikea_logo.png";
  static const String acerlogo = "assets/icons/brands/acer_logo.png";

  /// List of all Brand
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: SiajImages.nikeLogo, name: "Nike",isFeatured: true, productCount: 50),
    BrandModel(id: '2', image: SiajImages.adidasLogo, name: "Adidas"),
    BrandModel(id: '3', image: SiajImages.appleLogo, name: "Apple"),
    BrandModel(id: '4', image: SiajImages.jordanLogo, name: "Jordan"),
    BrandModel(id: '5', image: SiajImages.pumaLogo, name: "Puma",isFeatured: true, productCount: 22),
    BrandModel(id: '5', image: SiajImages.zaraLogo, name: "Zara",isFeatured: true, productCount: 22),
    BrandModel(id: '4', image: SiajImages.kenwoodLogo, name: "Key Wood"),
    BrandModel(id: '4', image: SiajImages.hermanMillerLogo, name: "Herman Miller"),
    BrandModel(id: '4', image: SiajImages.ikeaLogo, name: "ikea"),
    BrandModel(id: '4', image: SiajImages.acerlogo, name: "acer"),
  ];

  /// List of all Product Categories
  /// List of all Brand Categories

  /// List of all Products
  static final List<ProductModel> products = [
    ProductModel(
        id: "001",
        title: "Green Nike sports shoe",
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: SiajImages.productImage1,
        description: "Green Nike sports shoe",
        brand: BrandModel(
            id: "1",
            image: SiajImages.nikeLogo,
            name: "Nike",
            productCount: 265,
            isFeatured: true),
        images: [
          SiajImages.productImage1,
          SiajImages.productImage23,
          SiajImages.productImage21,
          SiajImages.productImage9
        ],
        salesPrice: 30,
        sku: "ABR4568",
        categoryId: "1",
        productAttributes: [
          ProductAttributeModel(
              name: "Color", values: ["Green", "Black", "Red"]),
          ProductAttributeModel(
              name: "Size", values: ["EU 30", "EU 32", "EU 34"]),
        ],
        productVariations: [
          ProductVariationModel(
              id: "1",
              stock: 14,
              price: 134,
              salePrice: 122.6,
              image: SiajImages.productImage1,
              description: "This is a Product description for Green Nike sports shoe",
              attributeValues: {"Color" : "Green", "Size" : "EU 34"}),
          ProductVariationModel(
              id: "2",
              stock: 15,
              price: 132,
              image: SiajImages.productImage23,
              attributeValues: {"Color" : "Black", "Size" : "EU 32"}),
        ],
        productType: "ProductType.variable")
  ];
}
