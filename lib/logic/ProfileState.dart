import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/data/services/AuthService.dart';
import 'package:fluttertask/data/services/ProfileService.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  final AuthService _authService = AuthService();

// ~ Get User Email, Password, Avatar
  String get email => _profileService.email;

  Future<DocumentSnapshot> get getInfoSnap => _profileService.getInfoSnap();

// ~ Update User Email
  void updateEmail(String newEmail) {
    _profileService.updateEmail(newEmail);
    notifyListeners();
  }

// ~ Is User logged
  bool get isAuth => _profileService.unAuth;

// ~ Log Out User
  void logOut() => _authService.logOut();
}
