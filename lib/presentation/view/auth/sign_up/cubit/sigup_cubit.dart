import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digital_sleek/data/model/auth/signup_model.dart';
import 'package:digital_sleek/data/services/auth/signup_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpService _signUpService;

  SignUpCubit({required SignUpService signUpService})
      : _signUpService = signUpService,
        super(InitialState());

  Future<void> signUp(String email, String password, String userName) async {
    try {
      final SignUpModel signUpModel = SignUpModel();
      emit(LoadingState());
      // String uid = _signUpService.uid.toString();
      final user = await _signUpService.signUp(email, password);
      emit(AuthenticatedState());
      _signUpService.getCreateCurrentUser(
        userName,
        email,
        '',
      );
      log('UID: $user');
      // emit(AuthenticatedState(user: true));
      // return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(ErrorState(error: 'Email id already register'));
      } else if (e.code == 'invalid-email') {
        emit(ErrorState(error: 'Invalid email address'));
      } else if (e.code == 'weak-password') {
        emit(ErrorState(error: 'The password is week!'));
      }
    } catch (e) {
      // emit(ErrorState(error: e.toString()));
      log('ABCDD: ${e.toString()}');
      // return false;
    }
  }
}

// Future<bool> isSignIn() async => auth.currentUser?.uid != null;