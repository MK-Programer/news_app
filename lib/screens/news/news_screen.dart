import 'package:flutter/material.dart';
import 'package:news_app/resources/string_manager.dart';
import 'package:news_app/resources/values_manager.dart';

import 'top_banner_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
        const Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: TopBannerWidget(),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            AppString.latestNews,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
