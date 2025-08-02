import 'package:http/http.dart';

class NewsModel {
  List<Articles>? articles;
  int? totalResults;
  NewsModel({required this.articles, required this.totalResults});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    final List<Articles> articlesList = [];
    for (Map<String, dynamic> eachArticles in json["articles"]) {
      Articles articles = Articles.fromJson(eachArticles);
      articlesList.add(articles);
    }

    return NewsModel(
        articles: articlesList, totalResults: json["totalResults"]);
  }
}

class Articles {
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  Source source;
  String? title;
  String? url;
  String? urlToImage;

  Articles(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.source,
      required this.title,
      required this.url,
      required this.urlToImage});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
        author: json["author"],
        content: json["content"],
        description: json["description"],
        publishedAt: json["publishedAt"],
        source: Source.fromJson(json["source"]),
        title: json["title"],
        url: json["url"],
        urlToImage: json["urlToImage"]);
  }
}

class Source {
  String? id;
  String? name;
  Source({required this.id, required this.name});
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? "",
      name: json["name"],
    );
  }
}
