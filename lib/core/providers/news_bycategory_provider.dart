part of 'providers.dart';

class NewsBycategoryProvider extends ChangeNotifier {
  NewsRepository _newsRepository;
  ApiResponse<NewsRespon> _apiResponse = ApiResponse.loading("Loading ...");

  ApiResponse<NewsRespon> get apiResponse => _apiResponse;

  NewsBycategoryProvider() {
    _newsRepository = NewsRepository();
  }

  fetchNews(String category) async {
    try {
      NewsRespon newsRespon = await _newsRepository.getNewsByCategory(category);
      _apiResponse = ApiResponse.completed(newsRespon);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error("Failed to Load Data");
      notifyListeners();
    }
  }
}