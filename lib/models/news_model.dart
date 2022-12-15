import 'package:flutter/cupertino.dart';

import 'articles_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;

  NewsModel({status, totalResults, articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesModel>[];
      json['articles'].forEach((v) {
        articles!.add(ArticlesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
