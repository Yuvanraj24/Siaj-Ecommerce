import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/data/services/firebase_storage_service.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try{
      print("get all brands called");
      final snapshot = await _db.collection('Brands').get();
      print("Result of get brands $snapshot");
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      print("Result of get brands $result");
      return result;

    } on FirebaseException catch (e) {
    throw "${e.code} - FirebaseException : ${e.message}";
    } on FormatException catch(_) {
    throw "Format Exception";
    } on PlatformException catch (e) {
    throw "${e.code} - PlatformException : ${e.message}";
    } catch (e) {
    throw "Something went wrong. Please try again";
    }
  }

/// Get Brands for category

  /// Upload Brands to the Cloud Firebase
  Future<void> uploadBannerDummyData(List<BrandModel> brands) async {
    try{
      print("Upload Start");
      // Upload all the Categories along with their Images
      final storage = Get.put(SiajFirebaseStorageService());
      // Loop through each category
      for(var brand in brands) {
        // Get ImageData link from local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData("Brands", file, "brand_${brands.indexOf(brand)}");

        // Assign URL to Category.image attribute
        brand.image = url;

        // Store Category in Firestore
        await _db.collection("Brands").doc().set(brand.toJson());
        print("Upload Completed");

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