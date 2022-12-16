import 'package:flutter/material.dart';
import 'package:news_app/providers/bookmark_provider.dart';
import 'package:news_app/resources/color_manager.dart';
import 'package:news_app/resources/icon_manager.dart';
import 'package:provider/provider.dart';
import '../../models/articles_model.dart';
import '../../resources/route_manager.dart';
import '../../resources/values_manager.dart';

// ignore: must_be_immutable
class TopBannerWidget extends StatefulWidget {
  int index;
  TopBannerWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<TopBannerWidget> createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  @override
  Widget build(BuildContext context) {
    final articlesModel = Provider.of<ArticlesModel>(context);
    final bookmarkProvider = Provider.of<BookMarkProvider>(context);
    bool isBookMarked =
        bookmarkProvider.getBookmarkList.containsKey('${widget.index}A');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.newsDetailsRoute,
                arguments: {'index': widget.index, 'type': 'A'},
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "${articlesModel.urlToImage}",
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              '${articlesModel.source!.name}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (!isBookMarked) {
                                bookmarkProvider.addArticleToBookmark(
                                    id: widget.index, type: 'A');
                                isBookMarked = true;
                              } else {
                                bookmarkProvider.removeArticleFromBookMark(
                                    id: widget.index, type: 'A');
                                isBookMarked = false;
                              }
                            },
                            child: Icon(
                              isBookMarked
                                  ? IconManager.bookmark
                                  : IconManager.bookmarkOutlined,
                              color: ColorManager.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Text(
                        '${articlesModel.author}',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: AppMargin.m8,
        ),
      ],
    );
  }
}
