import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/product/product_repository.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show Loader while loading products
      isLoading.value = true;

      // Fetch products
      final products = await productRepository.getFeaturedProducts();

      // Assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      SiajLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch products
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      SiajLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }


  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variations exist, return the simple price or sale price
    if(product.productType  == ProductType.single.toString()){
      return (product.salesPrice > 0 ? product.salesPrice : product.price).toString();
    } else {
      // Calculate the smallest and largest price among variations
      for(var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if(priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if(priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest price are the same, return a single price
      if(smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else{
        // Otherwise, return a price range
        return "$smallestPrice - \$$largestPrice";
      }
    }
  }

  /// Calculate Discount Percentage
    String ? calculateSalePercentage(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <=0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
    }

    /// Check Product Status
    getProductStockStatus(int stock){
      return stock > 0 ? "In Stock" : "Out of Stock";
    }




}
