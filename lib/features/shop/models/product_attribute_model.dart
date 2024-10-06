class ProductAttributeModel {

  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  /// Json Format
  toJson() {
    return {
      "name" : name,
      "values" : values
    };
  }

  /// Map JSON oriented document snapshot from Firebase to model
    factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if(data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey("name") ? data["name"] : "",
      values: List<String>.from(data["values"])
    );
  }
}