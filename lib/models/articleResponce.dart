import 'dart:convert';

import 'article.dart';

class ArticleResponse {
  final List<ArticaleModel> articles;
  final String error;

  ArticleResponse(this.articles, this.error);

  ArticleResponse.fromJson(Map<String, dynamic> json)
      : articles = (json["articles"] as List)
            .map((i) => new ArticaleModel.fromJson(i))
            .toList(),
        error = "";

  ArticleResponse.withError(String errorValue)
      : articles = List.empty(),
        error = errorValue;
}
