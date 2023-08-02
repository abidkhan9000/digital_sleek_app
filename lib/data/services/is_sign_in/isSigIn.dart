
import 'package:firebase_auth/firebase_auth.dart';

class IsSigIn {
  final FirebaseAuth auth = FirebaseAuth.instance ;
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;
}