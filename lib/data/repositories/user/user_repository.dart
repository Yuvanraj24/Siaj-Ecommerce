import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e){
      throw "Something went wrong. Please try again";
    }
  }


}