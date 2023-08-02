import 'package:bloc/bloc.dart';
import 'package:digital_sleek/data/model/category.dart/category_model.dart';
import 'package:digital_sleek/data/services/home_service.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;
  HomeCubit({required HomeService homeService})
      : _homeService = homeService,
        super(HomeInitialState());

  Future<List<CategoryModel>> fetchData() async {
    try {
      emit(HomeLoadingState());
      var categories = await _homeService.fetchCategories();
      emit(HomeScussesState(model: categories));
      return categories;
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
      return [];
    }
  }
}
