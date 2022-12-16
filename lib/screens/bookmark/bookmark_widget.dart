import 'package:flutter/material.dart';
import 'package:news_app/models/bookmark_model.dart';
import 'package:news_app/resources/font_manager.dart';
import 'package:news_app/resources/values_manager.dart';
import 'package:news_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/articles_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/route_manager.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookmarkModel = Provider.of<BookMarkModel>(context);
    final articlesProvider = Provider.of<ArticlesProvider>(context);
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
                    Text(
                      '${item.title}',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: FontSize.s16,
                              ),
                    ),
                    const SizedBox(
                      height: AppMargin.m5,
                    ),
                    Text(
                      '${item.author}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorManager.black,
                          ),
                    ),
                    const SizedBox(
                      height: AppMargin.m5,
                    ),
                    Text(
                      '${item.publishedAt}',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorManager.black,
                            fontSize: FontSize.s12,
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
