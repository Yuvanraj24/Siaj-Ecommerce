import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/shop/models/product_model.dart';
import 'package:siaj_ecommerce/utils/constants/colors.dart';
import 'package:siaj_ecommerce/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// -- Get All Images from product and variables
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);
    print("set Images length --> ${images.length}");

    // Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Get all images from the Product Model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }
    print("set Images length 3 --> ${images.length}");
    // Get all images from the Product Variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    print("set Images length 4 --> ${images.length}");
    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(fullscreenDialog: true, () => Dialog.fullscreen(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: SiajSizes.defaultSpace * 2, horizontal: SiajSizes.defaultSpace),
            child: CachedNetworkImage(imageUrl: image)
          ),
          const SizedBox(height: SiajSizes.spaceBtwSections),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150,
              child: OutlinedButton(
                onPressed: () => Get.back(),
                child: const Text("Close",style: TextStyle(color: SiajColors.dark),),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
