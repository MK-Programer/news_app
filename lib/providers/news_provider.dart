import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_model.dart';

import '../services/api_handler.dart';

class NewsProvider with ChangeNotifier {
  static List<NewsModel> _newsList = [];
  List<NewsModel> get getNews {
    return _newsList;
  }

  Future<void> getEgyptData() async {
    var result = await APIHandler.getEgyptData();
    for (var res in result) {
      _newsList.add(NewsModel.fromJson(res));
    }
    notifyListeners();
  }
}
