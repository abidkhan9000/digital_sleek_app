import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_sleek/data/model/auth/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

// global firebase auth

class SignUpService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<String> signUp(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = authResult.user!.uid;

    // final userCollection = _firestore.collection("users");
    //  await _firestore.collection("users").doc(uid).set({

    //     });
    return uid;
    // log("uid:: ${authResult.user!.uid}");
    // if (authResult.user != null) {
    //   return true;
    // } else {
    //   log('adf: ${authResult.user}');
    //   return false;
    // }

    // return authResult.user;
  }

  // Future<String> getCurrentUserId() async => auth.currentUser!.uid;

  Future<void> getCreateCurrentUser(
    String name,
    String email,
    String photoUrl,
  ) async {
    final userCollection = _firestore.collection("users");

    final uid = await getCurrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = SignUpModel(
        name: name,
        email: email,
        uid: uid,
        photoUrl: photoUrl,
      ).toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
      return;
    });
  }

  Future<String> getCurrentUserId() async => _firebaseAuth.currentUser!.uid;
}
