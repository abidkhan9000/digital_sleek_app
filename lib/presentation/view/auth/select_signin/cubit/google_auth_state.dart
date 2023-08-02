part of 'google_auth_cubit.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

class GoogleAuthInitialState extends GoogleAuthState {}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSucssessState extends GoogleAuthState {}

class GoogleAuthErrorState extends GoogleAuthState {
  Object? error;

  GoogleAuthErrorState({this.error});

  @override
  List<Object> get props => [];
}
