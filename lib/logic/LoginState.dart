import 'package:flutter/material.dart';
import 'package:fluttertask/data/services/AuthService.dart';

import '../data/services/ProfileService.dart';

class LoginProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  // ~ On Login chek input fields
  Future<String> userlogin(String email, String password) async {
    if (email.isEmpty && password.isEmpty) {
      return 'There is a empty field!';
    } else {
      String result =
          await AuthService().login(email: email, password: password);
      if (result != 'success') {
        return result;
      } else {
        return 'success';
      }
    }
  }

  // ~ Is User logged
  bool get isAuth => _profileService.unAuth;
}
