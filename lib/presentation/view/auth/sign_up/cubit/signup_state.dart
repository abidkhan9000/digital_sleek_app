part of 'sigup_cubit.dart';

@immutable
abstract class SignUpState {}

class InitialState extends SignUpState {}

class LoadingState extends SignUpState {}

class ErrorState extends SignUpState {
  Object? error;
  ErrorState({this.error});
}

class AuthenticatedState extends SignUpState {
  final bool? user;
  AuthenticatedState({this.user});
}

class UnauthenticatedState extends SignUpState {}
