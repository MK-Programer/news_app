import 'package:flutter/cupertino.dart';

class BookMarkModel with ChangeNotifier {
  int id;
  String type;

  BookMarkModel({
    required this.id,
    required this.type,
  });
}
