import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/resources/color_manager.dart';
import 'package:news_app/resources/icon_manager.dart';
import 'package:provider/provider.dart';
import '../../resources/values_manager.dart';

class TopBannerWidget extends StatefulWidget {
  const TopBannerWidget({Key? key}) : super(key: key);

  @override
  State<TopBannerWidget> createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  int _currentIndex = 0;

  List<String> images = [
    'https://dummyimage.com/16:9x1080/',
    'https://dummyimage.com/16:9x1080/',
    'https://dummyimage.com/16:9x1080/',
    'https://dummyimage.com/16:9x1080/',
    'https://dummyimage.com/16:9x1080/',
    'https://dummyimage.com/16:9x1080/',
    'https://dummyimage.com/16:9x1080/',
  ];

  bool isBookMarked = true;

  @override
  Widget build(BuildContext context) {
    final newsModel = Provider.of<Articles>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(newsModel.urlToImage.toString()),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newsModel.source!.name.toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isBookMarked = !isBookMarked;
                          });
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
                  const Spacer(),
                  Text(
                    newsModel.author.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                  ),
                ],
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
