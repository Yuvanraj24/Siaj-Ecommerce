import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';
import 'package:siaj_ecommerce/features/shop/models/banner_model.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_category_model.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/features/shop/models/category_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_category_model.dart';
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
  static final UserModel user =
      UserModel.empty(); // Need to add data on constructor

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

  /// List of all Brand
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: SiajImages.nikeLogo,
        name: "Nike",
        isFeatured: true,
        productCount: 50),
    BrandModel(id: '2', image: SiajImages.adidasLogo, name: "Adidas"),
    BrandModel(id: '3', image: SiajImages.appleLogo, name: "Apple"),
    BrandModel(id: '4', image: SiajImages.jordanLogo, name: "Jordan"),
    BrandModel(
        id: '5',
        image: SiajImages.pumaLogo,
        name: "Puma",
        isFeatured: true,
        productCount: 22),
    BrandModel(
        id: '5',
        image: SiajImages.zaraLogo,
        name: "Zara",
        isFeatured: true,
        productCount: 22),
    BrandModel(id: '4', image: SiajImages.kenwoodLogo, name: "Key Wood"),
    BrandModel(
        id: '4', image: SiajImages.hermanMillerLogo, name: "Herman Miller"),
    BrandModel(id: '4', image: SiajImages.ikeaLogo, name: "ikea"),
    BrandModel(id: '4', image: SiajImages.acerLogo, name: "acer"),
  ];

  /// List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),
    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),
    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),
    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),
    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),
    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),
    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),
    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  /// List of all Products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: SiajImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(
            id: '1',
            image: SiajImages.nikeLogo,
            name: 'Nike',
            productCount: 265,
            isFeatured: true),
        images: [
          SiajImages.productImage1,
          SiajImages.productImage23,
          SiajImages.productImage21,
          SiajImages.productImage9
        ],
        salesPrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 14,
              price: 134,
              salePrice: 122.6,
              image: SiajImages.productImage1,
              description:
                  'This is a Product description for Green Nike sports shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: SiajImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: SiajImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: SiajImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: SiajImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: SiajImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '002',
        title: 'Blue T-shirt for all ages',
        stock: 15,
        price: 35,
        isFeatured: true,
        thumbnail: SiajImages.productImage69,
        description:
            'This is a product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practising nothing else',
        brand: BrandModel(id: '6', image: SiajImages.zaraLogo, name: 'ZARA'),
        images: [
          SiajImages.productImage68,
          SiajImages.productImage69,
          SiajImages.productImage5,
        ],
        salesPrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Black']),
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ],
        productType: 'ProductType.single'),

    ProductModel(
        id: '003',
        title: 'Leather brown Jacket',
        stock: 15,
        price: 38000,
        isFeatured: false,
        thumbnail: SiajImages.productImage69,
        description:
            'This is a product description for Leather brown Jacket. There are more things that can be added but i am just practising nothing else.',
        brand: BrandModel(id: '6', image: SiajImages.zaraLogo, name: 'ZARA'),
        images: [
          SiajImages.productImage64,
          SiajImages.productImage65,
          SiajImages.productImage66,
          SiajImages.productImage67,
        ],
        salesPrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Black']),
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ],
        productType: 'ProductType.single'),

    ProductModel(
        id: '004',
        title: '4 Color collar t-shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: SiajImages.productImage1,
        description: '4 Color collar t-shirt dry fit',
        brand: BrandModel(id: '6', image: SiajImages.zaraLogo, name: 'ZARA'),
        images: [
          SiajImages.productImage60,
          SiajImages.productImage61,
          SiajImages.productImage62,
          SiajImages.productImage63
        ],
        salesPrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Yellow', 'Blue', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: SiajImages.productImage60,
              description:
                  'This is a Product description for 4 Color collar t-shirt dry fit',
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: SiajImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: SiajImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: SiajImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: SiajImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: SiajImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '7',
              stock: 0,
              price: 334,
              image: SiajImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '8',
              stock: 11,
              price: 332,
              image: SiajImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '005',
        title: 'Nike Air Jordon Shoes',
        stock: 15,
        price: 35,
        isFeatured: true,
        thumbnail: SiajImages.productImage10,
        description:
            'Nike Air Jordon Shoes for running. Quality Product, Long Lasting',
        brand: BrandModel(
            id: '1',
            image: SiajImages.nikeLogo,
            name: 'Nike',
            productCount: 265,
            isFeatured: true),
        images: [
          SiajImages.productImage7,
          SiajImages.productImage8,
          SiajImages.productImage9,
          SiajImages.productImage10
        ],
        salesPrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Orange', 'Black', 'Brown']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 16,
              price: 36,
              salePrice: 12.6,
              image: SiajImages.productImage8,
              description:
                  'This is a Product description for Nike Air Jordon Shoes',
              attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 35,
              image: SiajImages.productImage7,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 14,
              price: 34,
              image: SiajImages.productImage9,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 13,
              price: 33,
              image: SiajImages.productImage7,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '5',
              stock: 12,
              price: 32,
              image: SiajImages.productImage9,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 31,
              image: SiajImages.productImage8,
              attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '006',
        title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
        stock: 15,
        price: 750,
        isFeatured: false,
        thumbnail: SiajImages.productImage11,
        description:
            'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
        brand:
            BrandModel(id: '7', image: SiajImages.samsungLogo, name: 'Samsung'),
        images: [
          SiajImages.productImage11,
          SiajImages.productImage12,
          SiajImages.productImage13,
          SiajImages.productImage12,
        ],
        salesPrice: 650,
        sku: 'ABR4568',
        categoryId: '2',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Black']),
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ],
        productType: 'ProductType.single'),

    ProductModel(
        id: '007',
        title: 'TOMI dog food',
        stock: 15,
        price: 20,
        isFeatured: false,
        thumbnail: SiajImages.productImage18,
        description: 'This  is a product description for TOMI dog food',
        brand: BrandModel(id: '7', image: SiajImages.dogLogo, name: 'TOMI'),
        salesPrice: 10,
        sku: 'ABR4568',
        categoryId: '4',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Black']),
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ],
        productType: 'ProductType.single'),

    /// video number : 43
    /// duration : 7.50
  ];

// static const String nikeLogo = "assets/icons/brands/nike.png";
// static const String adidasLogo = "assets/icons/brands/adidas-logo.png";
// static const String appleLogo = "assets/icons/brands/apple-logo.png";
// static const String jordanLogo = "assets/icons/brands/jordan-logo.png";
// static const String pumaLogo = "assets/icons/brands/puma-logo.png";
// static const String zaraLogo = "assets/icons/brands/zara-logo.png";
// static const String kenwoodLogo = "assets/icons/brands/kenwood-logo.png";
// static const String hermanMillerLogo = "assets/icons/brands/herman-miller-logo.png";
// static const String ikeaLogo = "assets/icons/brands/ikea_logo.png";
// static const String acerlogo = "assets/icons/brands/acer_logo.png";
}
