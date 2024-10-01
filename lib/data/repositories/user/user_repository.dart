import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siaj_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:siaj_ecommerce/features/authentication/models/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to fetch user details based on User ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }

    /// * Important want to handle exception
    on FirebaseAuthException catch (e) {
      throw "${e.code} - FirebaseAuth Exception : ${e.message}";
    } on FirebaseException catch (e) {
      throw "${e.code} - Firebase Exception : ${e.message}";
    } on FormatException catch (_) {
      throw "Format Exception";
    } on PlatformException catch (e) {
      throw "${e.code} - Platform Exception : ${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
