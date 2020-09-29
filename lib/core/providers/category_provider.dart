part of 'providers.dart';

class CategoryProvider extends ChangeNotifier {
  ApiResponse<List<Category>> _apiResponse;
  List<Category> _categories;

  ApiResponse<List<Category>> get apiResponse => _apiResponse;
  List<Category> get categories => _categories;

  CategoryProvider() {
    getCategoriesData();
  }

  getCategoriesData() async {
    _apiResponse = ApiResponse.loading("Loading ...");
    notifyListeners();

    try {
      _categories = getCategories();
      _apiResponse = ApiResponse.completed(_categories);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error("Failed to Load Data");
      notifyListeners();
    }
  }
}
