class SiajPlatformException implements Exception {

  final String code;

  SiajPlatformException(this.code);

  /// Get the corresponding error  message based on the error code
  String get message {
    /// * important Want to write more error string in switch case
    switch (code) {
      case "email already-in-use" :
        return "The email address is already registered. Please use a different email";
      default: return "";
    }
  }

}