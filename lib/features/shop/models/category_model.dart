import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({required this.id,
    required this.image,
    required this.name,
    required this.isFeatured,
    this.parentId = ""});

  /// Empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: "", name: "", image: "", isFeatured: false);

  /// Convert model to JSON structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "parentId": parentId,
      "isFeatured": isFeatured
    };
  }

  /// Map JSON oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CategoryModel(
          id: document.id, name: data["name"] ?? "", image: data["image"] ?? "",
          parentId: data["parentId"] ?? "",
          isFeatured: data["isFeatured"] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
}
