import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/repositories/product/product_repository.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/loaders/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;

  final RxString selectedSortOption = 'Name'.obs;
  RxList<ProductModel> products = <ProductModel> [].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      SiajLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption){
      selectedSortOption.value = sortOption;

      switch(sortOption){
        case "Name" :
          products.sort((a,b) => a.title.compareTo(b.title));
          break;
      case "Higher Price" :
        products.sort((a,b) => b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a,b) => a.price.compareTo(b.price));
        break;
      case "Sale":
        products.sort((a,b) {
          if(b.salesPrice > 0){
            return b.salesPrice.compareTo(a.salesPrice);
          } else if(a.salesPrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
        case "Newest":
          products.sort((a,b) => a.date!.compareTo(b.date!));
          break;
        default:
          products.sort((a,b) => a.title.compareTo(b.title));
      }
  }


  void assignProducts(List<ProductModel> products) {
    // Assign products to the 'products' list
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
