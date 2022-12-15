import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_model.dart';

import '../services/api_handler.dart';

class ArticlesProvider with ChangeNotifier {
  static List<Articles> _newsList = [];
  List<Articles> get getNews {
    return _newsList;
  }

  Future<void> getEgyptData() async {
    var result = await APIHandler.getEgyptData();
    for (var res in result['articles']) {
      _newsList.add(Articles.fromJson(res));
    }
    notifyListeners();
  }
}
