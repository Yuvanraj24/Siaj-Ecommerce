import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:siaj_ecommerce/features/shop/models/brand_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salesPrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salesPrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations
  });

  /// Empty function
  static ProductModel empty() =>
      ProductModel(id: "",
          title: "",
          stock: 0,
          price: 0,
          thumbnail: "",
          productType: "");

  /// Json format
  toJson() {
    return {
      "sku": sku,
      "title": title,
      "stock": stock,
      "price": price,
      "images": images ?? [],
      "thumbnail": thumbnail,
      "salePrice": salesPrice,
      "isFeatured": isFeatured,
      "categoryId": categoryId,
      "brand": brand!.toJson(),
      "description": description,
      "productType": productType,
      "productAttributes": productAttributes != null ? productAttributes!.map((
          element) => element.toJson()).toList() : [],
      "productVariations": productVariations != null ? productVariations!.map((
          element) => element.toJson()).toList() : []
    };
  }

  /// Map JSON oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        sku: data["sku"],
        title: data["title"],
        stock: data["stock"] ?? 0,
        isFeatured: data["isFeatured"] ?? false,
        price: double.parse((data["price"] ?? 0.0).toString()),
        salesPrice: double.parse((data["salePrice"] ?? 0.0).toString()),
        thumbnail: data["thumbnail"] ?? "",
        categoryId: data["categoryId"] ?? "",
        description: data["description"] ?? "",
        productType: data["productType"] ?? "",
        brand: BrandModel.fromJson(data["brand"]),
        images: data["images"] != null ? List<String>.from(data["images"]) : [],
        productAttributes: (data["productAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariations: (data["productVariations"] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList()
    );
  }
}