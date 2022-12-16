import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/resources/icon_manager.dart';
import 'package:provider/provider.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';
import '../utils/utils.dart';
import '../widgets/back_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final articleProvider = Provider.of<ArticlesProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final articleData =
        articleProvider.getArticleById(id: args['index'], type: args['type']);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * AppMargin.m0_4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s5),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${articleData.urlToImage}',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            '${articleData.author}',
                            style: Theme.of(context).textTheme.labelSmall,
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          IconManager.message,
                          size: AppSize.s18,
                          color: ColorManager.white,
                        ),
                        Text(
                          "3",
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        const SizedBox(
                          width: AppMargin.m5,
                        ),
                        Icon(
                          IconManager.eye,
                          size: AppSize.s20,
                          color: ColorManager.white,
                        ),
                        Text(
                          "20",
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: AppPadding.p50,
                    left: AppPadding.p20,
                  ),
                  child: BackWidget(),
                ),
              ],
            ),
            const SizedBox(
              height: AppMargin.m18,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p16, right: AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: AppSize.s100,
                        child: VerticalDivider(
                          color: ColorManager.orange,
                          thickness: AppSize.s2,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${articleData.title}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppMargin.m10,
                  ),
                  Text(
                    '${articleData.description}',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: FontSize.s18,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
