import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/brands/brand_repository.dart';
import 'package:siaj_ecommerce/data/repositories/product/product_repository.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading Brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch (e) {
      SiajLoaders.errorSnackBar(title: 'Oh Snap! on getFeaturedBrands', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

/// Get Brands for category

/// Get Brand specific products from your data source
    Future<List<ProductModel>> getBrandProducts(String brandId) async {
      try {
        final products = await ProductRepository.instance.getProductsFromBrand( brandId: brandId);
        return products;
      } catch(e) {
        SiajLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        return [];
      }
    }
}