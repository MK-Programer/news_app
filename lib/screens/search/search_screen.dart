import 'package:flutter/material.dart';
import 'package:news_app/resources/string_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppString.search),
    );
  }
}
