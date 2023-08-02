part of 'signin_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInSuccess extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInError extends SignInState {
  final String? errorMessage;

  const SignInError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage!];
}





// abstract class SignInState extends Equatable {
//   const SignInState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class SignInInitial extends SignInState {}
//
// class SignInLoadingState extends SignInState {}
//
// class SignInErrorState extends SignInState{}
//
