import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/resources/values_manager.dart';
import 'package:news_app/screens/news/latest_news_widget.dart';
import 'package:news_app/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../resources/color_manager.dart';
import 'top_banner_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  double index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final articlesProvider = Provider.of<ArticlesProvider>(context);
    final egyptArticlesList = articlesProvider.getEgyptArticles;

    final combinedArticlesList = articlesProvider.getCombinedArticles;
    return ListView(
      children: [
        const SizedBox(
          height: AppMargin.m20,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: CarouselSlider.builder(
            itemCount:
                egyptArticlesList.length >= 4 ? 4 : egyptArticlesList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    ChangeNotifierProvider.value(
              value: egyptArticlesList[itemIndex],
              child: TopBannerWidget(
                index: itemIndex,
              ),
            ),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  this.index = index.toDouble();
                });
              },
              height: AppSize.s200,
              aspectRatio: AppSize.s16 / AppSize.s9,
              viewportFraction: AppSize.s0_8,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: AppSize.s3.toInt()),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        DotsIndicator(
          dotsCount:
              egyptArticlesList.length >= 4 ? 4 : egyptArticlesList.length,
          position: index,
          decorator: DotsDecorator(
            color: ColorManager.grey,
            activeColor: ColorManager.orange,
          ),
        ),
        SizedBox(
          height: size.height * AppMargin.m0_02,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            AppString.latestNews,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: combinedArticlesList.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: combinedArticlesList[index],
              child: LatestNews(
                index: index,
              ),
            );
          },
        )
      ],
    );
  }
}
