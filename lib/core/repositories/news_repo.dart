part of 'repositories.dart';

class NewsRepository {
  Future<NewsRespon> getNews() async {
    final respon = await HttpClient.instance.fetchData(
        APIPathHelper.getValue(APIPath.TOP_HEADLINES),
        params: {'country': 'id', 'apiKey': APIBase.apiKey});
    print("Respon - $respon");
    return NewsRespon.fromJsonMap(respon);
  }

  Future<NewsRespon> getNewsByCategory(String category) async {
    final respon = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.TOP_HEADLINES), params: {
      'country': 'id',
      'category': category,
      'apiKey': APIBase.apiKey
    });
    print("Respon - $respon");
    return NewsRespon.fromJsonMap(respon);
  }
}
