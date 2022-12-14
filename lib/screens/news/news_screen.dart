import 'package:flutter/material.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/resources/values_manager.dart';
import 'package:news_app/screens/news/latest_news_widget.dart';
import 'package:news_app/utils/utils.dart';

import 'top_banner_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return ListView(
      children: [
        const SizedBox(
          height: AppMargin.m20,
        ),
        const Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: TopBannerWidget(),
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
