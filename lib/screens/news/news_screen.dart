import 'package:card_swiper/card_swiper.dart';
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
    final newsProvider = Provider.of<ArticlesProvider>(context);
    final newsList = newsProvider.getNews;
    return ListView(
      children: [
        const SizedBox(
          height: AppMargin.m20,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: SizedBox(
            height: 250,
            child: Swiper(
              onIndexChanged: (index) {
                setState(() {
                  this.index = index.toDouble();
                });
              },
              itemCount: newsList.length >= 4 ? 4 : newsList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: newsList[index],
                  child: const TopBannerWidget(),
                );
              },
              autoplay: true,
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: newsList.length >= 4 ? 4 : newsList.length,
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
          itemCount: 4,
          itemBuilder: (context, index) {
            return const LatestNews();
          },
        )
      ],
    );
  }
}
