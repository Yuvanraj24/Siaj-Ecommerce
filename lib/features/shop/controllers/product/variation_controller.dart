import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// Selected Attribute and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeName;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );
    print("selectedVariation --> ${selectedVariation}");
    print("selectedVariation.image.isNotEmpty --> ${selectedVariation.image.isNotEmpty}");
    // Show the selected variation image as a Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Assign Selected Variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  /// Check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    print("_isSameAttributeValues - variationAttributes ===> $variationAttributes");
    print("_isSameAttributeValues - selectedAttributes ===> $selectedAttributes");
    // If selectedAttributes contains 3 attributes and current variation contain 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return e.g. [Green, Large] x [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes[key] = Value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check Attribute availability / Stock in Variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            // Check Empty / Out of Stock Attributes
            variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
        // Fetch all non-empty attributes of variation
        .map((variation) =>variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  /// Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = "";
    selectedVariation.value = ProductVariationModel.empty();
  }
}
