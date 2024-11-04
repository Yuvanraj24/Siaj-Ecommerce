import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/services/firebase_storage_service.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where("isFeatured", isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "${e.code} - FirebaseException : ${e.message}";
    } on PlatformException catch (e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where("isFeatured", isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw "${e.code} - FirebaseException : ${e.message}";
    } on PlatformException catch (e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Get products based on the Brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw "${e.code} - FirebaseException : ${e.message}";
    } on PlatformException catch (e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Get products based on the Brand
  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {

      final querySnapshot = limit == -1
          ? await _db.collection('Products').where('brand.id', isEqualTo: brandId).get()
          : await _db.collection('Products').where('brand.id', isEqualTo: brandId).limit(limit).get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw "${e.code} - FirebaseException : ${e.message}";
    } on PlatformException catch (e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Get products based on the Brand
  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try {

      // Query to get all documents where productId matches the provided categoryId & Fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
          : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      //Extract brands name or other  relevant data from the documents
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;

    } on FirebaseException catch (e) {
      throw "${e.code} - FirebaseException : ${e.message}";
    } on PlatformException catch (e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }






  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadProductsDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(SiajFirebaseStorageService());

      // Loop through each category
      for (var product in products) {
        // Get ImageData link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData(
            "Products/Images", thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Products list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                "Products/Images", assetImage, image);

            // Assign URL's to imagesUrl attribute
            imagesUrl.add(url);
          }

          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                "Products/Images", assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store Category in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw "${e.code} - FirebaseException : ${e.message}";
    } on PlatformException catch (e) {
      throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
