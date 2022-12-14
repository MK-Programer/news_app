import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/resources/color_manager.dart';
import 'package:news_app/resources/icon_manager.dart';
import '../../resources/values_manager.dart';

import '../../utils/utils.dart';

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
    return Column(
      children: [
        CarouselSlider(
          items: images
              .map(
                (image) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
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
                              "Filgoal.com",
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
                          "Masrawy",
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: AppSize.s16 / AppSize.s9,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: AppSize.s0_8,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: AppMargin.m8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < images.length; i++)
              Container(
                height: AppSize.s12,
                width: AppSize.s12,
                margin: const EdgeInsets.all(AppMargin.m5),
                decoration: BoxDecoration(
                  color: _currentIndex == i
                      ? ColorManager.orange
                      : ColorManager.grey,
                  shape: BoxShape.circle,
                ),
              )
          ],
        ),
      ],
    );
  }
}
