import 'package:flutter/material.dart';
import 'package:news_app/models/bookmark_model.dart';
import 'package:news_app/providers/bookmark_provider.dart';
import 'package:news_app/resources/font_manager.dart';
import 'package:news_app/resources/icon_manager.dart';
import 'package:news_app/resources/values_manager.dart';
import 'package:news_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/articles_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/route_manager.dart';

class BookmarkWidget extends StatefulWidget {
  const BookmarkWidget({Key? key}) : super(key: key);

  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  @override
  Widget build(BuildContext context) {
    final bookmarkModel = Provider.of<BookMarkModel>(context);
    final articlesProvider = Provider.of<ArticlesProvider>(context);
    final bookmarkProvider = Provider.of<BookMarkProvider>(context);
    final item = articlesProvider.getArticleById(
        id: bookmarkModel.id, type: bookmarkModel.type);

    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.newsDetailsRoute,
            arguments: {'index': bookmarkModel.id, 'type': bookmarkModel.type},
          );
        },
        child: Container(
          width: double.infinity,
          height: size.height * AppSize.s0_35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            color: ColorManager.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    image: DecorationImage(
                      image: NetworkImage('${item.urlToImage}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                        child: InkWell(
                          onTap: () {
                            bookmarkProvider.removeArticleFromBookMark(
                                id: bookmarkModel.id, type: bookmarkModel.type);
                          },
                          child: Icon(
                            IconManager.bookmark,
                            color: ColorManager.orange,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${item.title}',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: FontSize.s16,
                                ),
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(
                      height: AppMargin.m5,
                    ),
                    Flexible(
                      child: Text(
                        '${item.author}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorManager.black,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: AppMargin.m5,
                    ),
                    Flexible(
                      child: Text(
                        '${item.publishedAt}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorManager.black,
                              fontSize: FontSize.s12,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
