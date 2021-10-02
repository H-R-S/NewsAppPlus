import 'package:dio/dio.dart';
import 'package:news_app_plus/models/articleResponce.dart';
import 'package:news_app_plus/models/sourceResponce.dart';

class NewsApi {
  static String apiUrl = "https://newsapi.org/v2/";
  final String apiKey = "3bba92f4994941f2a1c4c802fb70c0c2";

  final Dio _dio = Dio();

  var getSourcesUrl = "$apiUrl/source";
  var getTopHeadlinesUrl = "$apiUrl/top-headlines";
  var everythingUrl = "$apiUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "all"};

    try {
      Response response = await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SourceResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {
      "apiKey": apiKey,
      "country" : "all"};
    try {
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> search(String value) async {
    var params = {
      "apiKey": apiKey,
      "q" : value,
      "sortBy": "popularity"};
    try {
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getHotNews() async {
    var params = {
      "apiKey": apiKey,
      "q" : "apple",
      "sortBy": "popularity"};
    try {
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {
      "apiKey": apiKey,
      "sources" : sourceId};
    try {
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
  
}
