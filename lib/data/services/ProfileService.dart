import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertask/data/services/AuthService.dart';

// ~ ProfileService - takes care of calling http services for getting profile information

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// ~ Get User: Email, Password, Avatar, PublishDate.
  get email => _auth.currentUser!.email;

  Future<DocumentSnapshot> getInfoSnap() {
    final users = FirebaseFirestore.instance.collection('users');
    User? currentUser = _auth.currentUser;

    return users.doc(currentUser!.uid).get().then((DocumentSnapshot snap) {
      return snap;
    });
  }

// ~ Update user email
  void updateEmail(String newEmail) {
    _auth.currentUser!.updateEmail(newEmail);
    final docUser = FirebaseFirestore.instance
        .collection('Users')
        .doc(_auth.currentUser!.uid);
    docUser.update({'email': newEmail});
  }

// ~ Show UnAuthenticated screen
  bool get unAuth => _auth.currentUser != null;
}
