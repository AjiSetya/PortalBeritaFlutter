part of 'providers.dart';

class NewsProvider extends ChangeNotifier {
  NewsRepository _newsRepository;

  ApiResponse<NewsRespon> _apiResponse;

  ApiResponse<NewsRespon> get apiResponse => _apiResponse;

  NewsProvider() {
    _newsRepository = NewsRepository();
    fetchNews();
  }

  fetchNews() async {
    _apiResponse = ApiResponse.loading("Loading ...");
    notifyListeners();

    try {
      NewsRespon newsRespon = await _newsRepository.getNews();
      _apiResponse = ApiResponse.completed(newsRespon);
      notifyListeners();
    } catch (e) {
      _apiResponse = ApiResponse.error("Failed to Load Data");
      notifyListeners();
    }
  }
}
