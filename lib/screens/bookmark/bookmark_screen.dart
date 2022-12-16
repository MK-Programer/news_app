import 'package:flutter/material.dart';
import 'package:news_app/providers/bookmark_provider.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/screens/bookmark/bookmark_widget.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookMarkProvider>(context);
    final bookmarkList =
        bookmarkProvider.getBookmarkList.values.toList().reversed.toList();
    return bookmarkList.isEmpty
        ? Center(
            child: Text(
              AppString.empty,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        : ListView.builder(
            itemCount: bookmarkList.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: bookmarkList[index],
                child: const BookmarkWidget(),
              );
            },
          );
  }
}
