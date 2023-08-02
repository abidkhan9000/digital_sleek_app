import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class SignInService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    log('AAAB: ${authResult.user}');
    if (authResult.user != null) {
      return true;
    } else {
      log('adf: ${authResult.user!.emailVerified}');
      return false;
    }
    // log('SIGNIN: ${authResult.user}');
  }

  Future<String> getCurrentUserId() async => _firebaseAuth.currentUser!.uid;
}
