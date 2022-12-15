import 'package:flutter/cupertino.dart';

import 'source_model.dart';

class ArticlesModel with ChangeNotifier {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesModel(
      {source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? SourceModel.fromJson(json['source']) : null;
    author = json['author'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    url = json['url'] ?? '';
    urlToImage = json['urlToImage'] ?? 'https://dummyimage.com/16:9x1080/';
    publishedAt = json['publishedAt'] ?? '';
    content = json['content'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
