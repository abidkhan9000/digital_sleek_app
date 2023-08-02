import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digital_sleek/data/services/auth/signin_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInService _signInService;
  SignInCubit({required SignInService signInService})
      : _signInService = signInService,
        super(SignInInitial());

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(SignInLoading());
      await _signInService.signInWithEmailAndPassword(email, password);
      emit(SignInSuccess());
      return true;
    } on FirebaseAuthException catch (e) {
      log('ERROR: $e');
      if (e.code == 'user-not-found') {
        emit(const SignInError(errorMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(const SignInError(errorMessage: 'Incorrect password'));
      } else {
        emit(SignInError(errorMessage: e.message.toString()));
      }
      return false;
    } catch (e) {
      emit(SignInError(errorMessage: e.toString()));
      log('SIGNIN: ${e.toString()}');
      return false;
    }
  }
}


  // Future<void> appStarted() async {
  //   try {
  //     // isSignInUseCase(); //or // then we use call() instead of isSignIn
  //     // final isSignIn = await isSignInUseCase.call();

  //     if (isSignIn) {
  //       final uid = await getCurrentUserIdUseCase.call();
  //       emit(AuthenticatedState(uid: uid));
  //     } else {
  //       emit(UnAuthenticatedState());
  //     }
  //   } on SocketException catch (_) {
  //     emit(UnAuthenticatedState());
  //   }
  // }
