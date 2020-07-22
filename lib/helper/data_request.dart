import 'package:http/http.dart' as http;
import 'package:news_app_api/models/ResponseBerita.dart';
import 'dart:convert';

String apiKey = "846208a48e754b088f85a85bc50d7381";

class News {
  Future<ResponseBerita> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&excludeDomains=stackoverflow.com"
        "&sortBy=publishedAt&language=en&apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseBerita.fromJsonMap(jsonData);
  }
}

class RequestByCategorie {
  Future<ResponseBerita> getNewsByCategory(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&category=$category&"
        "apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseBerita.fromJsonMap(jsonData);
  }
}
