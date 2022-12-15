import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/api_consts.dart';

import '../models/articles_model.dart';
import '../services/api_handler.dart';

class ArticlesProvider with ChangeNotifier {
  static final List<ArticlesModel> _egyptArticlesList = [];
  static final List<ArticlesModel> _combinedArticlesList = [];
  List<ArticlesModel> get getEgyptArticles {
    return _egyptArticlesList;
  }

  List<ArticlesModel> get getCombinedArticles {
    return _combinedArticlesList;
  }

  ArticlesModel getEgyptArticleById({required int id}) {
    // var articleResult;
    // for (int i = 0; i < _egyptArticlesList.length; i++) {
    //   if (_egyptArticlesList[i].source!.id == id) {
    //     articleResult = _egyptArticlesList[i];
    //   }
    // }
    // return articleResult;
    return _egyptArticlesList[id];
  }

  // Get egypt data from api, convert json to object and add it to the list
  Future<void> getEgyptData() async {
    var data = await APIHandler.getData(url: APIConst.EGYPT_URL);
    var newsModel = NewsModel.fromJson(data);
    var articles = newsModel.articles;
    for (var article in articles!) {
      _egyptArticlesList.add(article);
    }
    notifyListeners();
  }

  // Get combined data from api, convert json to object and add it to the list
  Future<void> getCombinedData() async {
    var data = await APIHandler.getData(url: APIConst.SOURCE_URL);
    var newsModel = NewsModel.fromJson(data);
    var articles = newsModel.articles;
    for (var article in articles!) {
      _combinedArticlesList.add(article);
    }
    notifyListeners();
  }
}
