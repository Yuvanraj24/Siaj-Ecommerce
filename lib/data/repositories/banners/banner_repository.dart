import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/shop/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variable
final _db = FirebaseFirestore.instance;

/// Get all order related to current user
Future<List<BannerModel>> fetchBanners() async {
  try {
    final result = await _db.collection("Banners").where("active", isEqualTo: true).get();
    return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

  }on FirebaseException catch (e) {
    throw "${e.code} - FirebaseException : ${e.message}";
  } on FormatException catch(_) {
    throw "Format Exception";
  } on PlatformException catch (e) {
    throw "${e.code} - PlatformException : ${e.message}";
  } catch (e) {
    throw "Something went wrong. Please try again";
  }

}

/// Upload Banners to the Cloud Firebase
}