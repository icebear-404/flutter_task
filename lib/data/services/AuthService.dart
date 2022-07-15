import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertask/data/models/user_model.dart' as model;
import 'package:fluttertask/data/users_info.dart';

// ~ AuthService - takes care of calling http services for authentication

class AuthService {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

// ~ Login with Email and Password
  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = "Error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

// ~ Log Out user
  void logOut() async {
    await _auth.signOut();
  }

// ~ Create users from JSON file: "users_info.dart"
  void createUsersFromJson() {
    users.forEach((user) {
      createUsers(
        user['email'].toString(),
        user['password'].toString(),
        user['avatar'].toString(),
        user['createdAt'].toString(),
      );
    });
  }

  // ~ Create users in Firestore
  void createUsers(
    String email,
    String password,
    String avatar,
    String createdAt,
  ) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final docUser = _firebase.collection('users').doc(userCredential.user!.uid);

    model.User user = model.User(
      createdAt: createdAt,
      avatar: avatar,
      email: email,
      password: password,
      id: docUser.id,
    );

    await docUser.set(user.toMap());
  }
}
