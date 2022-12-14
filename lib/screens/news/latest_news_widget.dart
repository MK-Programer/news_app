import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../utils/utils.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              child: Container(
                height: 180,
                width: size.width,
                decoration: BoxDecoration(color: ColorManager.white),
              ),
            ),
            Positioned(
              top: 0,
              left: 5,
              child: Card(
                elevation: 2.0,
                child: Container(
                  height: 180,
                  width: size.width * 0.35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://dummyimage.com/16:9x1080/'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: size.width * 0.4,
              child: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: InkWell(
                        onTap: () {
                          print("A New is pressed");
                        },
                        child: Text(
                          "الرابعة في كأس العالم 2022.. ميسي رجل مباراة الأرجنتين وكرواتيا - FilGoal.com",
                          style: Theme.of(context).textTheme.headlineMedium,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "2022-12-13T21:25:00Z",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: FontSize.s14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
