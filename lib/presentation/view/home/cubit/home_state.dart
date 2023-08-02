part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();

  // @override
  // List<Object> get props => [];
}

class HomeInitialState extends HomeState {
  // @override
  // List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  // @override
  // List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  Object? error;

  HomeErrorState({this.error});

  // @override
  // List<Object> get props => [error.toString()];
}

class HomeScussesState extends HomeState {
  final List<CategoryModel>? model;

  const HomeScussesState({this.model});

  // @override
  // List<Object> get props => [model!];
}
