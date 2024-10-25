import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productCount});

  /// Empty helper function
  static BrandModel empty() => BrandModel(id: "", image: "", name: "");

  /// Convert model to JSON structure so that you can store data in Firebase-Firestore
  toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "productCount": productCount,
      "isFeatured": isFeatured
    };
  }

  /// Map JSON oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data["id"] ?? "",
        image: data["image"] ?? "",
        name: data["name"] ?? "",
        isFeatured: data["isFeatured"] ?? false,
        productCount: int.parse((data["productCount"] ?? 0).toString())
    );
  }

  /// Map JSON oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
          id: document.id,
          image: data["image"] ?? "",
          name: data["name"] ?? "",
          isFeatured: data["isFeatured"] ?? false,
          productCount: data["productCount"] ?? ''
      );
    } else {
      return BrandModel.empty();
    }

  }



}
