import 'package:flutter/cupertino.dart';
import 'package:news_app/models/bookmark_model.dart';

class BookMarkProvider with ChangeNotifier {
  static final Map<String, BookMarkModel> _bookmarkList = {};

  Map<String, BookMarkModel> get getBookmarkList {
    return _bookmarkList;
  }

  void addArticleToBookmark({required int id, required String type}) {
    _bookmarkList.putIfAbsent(
        id.toString() + type, () => BookMarkModel(id: id, type: type));
    notifyListeners();
  }

  void removeArticleFromBookMark({required int id, required String type}) {
    _bookmarkList.remove(id.toString() + type);
    notifyListeners();
  }
}
