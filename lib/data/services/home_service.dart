import 'package:dio/dio.dart';
import 'package:digital_sleek/data/model/category.dart/category_model.dart';

class HomeService {
  final String _apiUrl =
      'https://digitalsleek.com/wp-json/wp/v2/categories?_embed';
  final Dio _dio = Dio();

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      var response = await _dio.get(_apiUrl);
      if (response.statusCode == 200) {
        var data = response.data;
        List<CategoryModel> categories = [];
        for (var item in data) {
          categories.add(CategoryModel.fromJson(item));
        }
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
