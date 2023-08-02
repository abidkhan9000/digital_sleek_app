import 'package:bloc/bloc.dart';
import 'package:digital_sleek/data/services/auth/google_auth_service.dart';
import 'package:digital_sleek/data/services/auth/signup_service.dart';
import 'package:equatable/equatable.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final GoogleAuthService _googleService;
  final SignUpService _signUpService = SignUpService();

  GoogleAuthCubit({required GoogleAuthService googleAuthService})
      : _googleService = googleAuthService,
        super(GoogleAuthInitialState());

  Future googleAuth() async {
    emit(GoogleAuthLoadingState());
    try {
      final user = await _googleService.signInWithGoogle();
      _signUpService.getCreateCurrentUser(
        user.displayName,
        user.email,
        user.photoURL,
      );
      emit(GoogleAuthSucssessState());
    } catch (e) {
      emit(GoogleAuthErrorState(error: e.toString()));
    }
  }
}
