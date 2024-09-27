import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:siaj_ecommerce/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  final String fireName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserModel({required this.id,
    required this.fireName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.userName,
    required this.profilePicture});

  /// Helper function to get the full name.
  String get fullName => "$fireName $lastName";

  /// Helper function to format phone number.
  String get formattedPhoneNo => SiajFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first & last name.
  static List<String> nameparts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts.first.toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelcaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelcaseUsername";
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() =>
      UserModel(id: "",
          fireName: "",
          lastName: "",
          email: "",
          phoneNumber: "",
          userName: "",
          profilePicture: "");

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      "firstName": fireName,
      "lastName": lastName,
      "username": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "profilePicture": profilePicture
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapchat
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>>document){
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(id: document.id,
          fireName: data["firstName"] ?? "",
          lastName: data["lastName"] ?? "",
          email: data["email"] ?? "",
          phoneNumber: data["phoneNumber"] ?? "",
          userName: data["username"] ?? "",
          profilePicture: data["profilePicture"] ?? "");
    }
    return empty();
  }
}
