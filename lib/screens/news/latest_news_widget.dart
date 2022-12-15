import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/articles_model.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../utils/utils.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final articlesModel = Provider.of<ArticlesModel>(context);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: SizedBox(
        height: AppSize.s200,
        child: Stack(
          children: [
            Positioned(
              top: AppSize.s20,
              left: AppSize.s0,
              child: Container(
                height: AppSize.s180,
                width: size.width,
                decoration: BoxDecoration(color: ColorManager.white),
              ),
            ),
            Positioned(
              top: AppSize.s0,
              left: AppSize.s5,
              child: Container(
                height: AppSize.s180,
                width: size.width * AppSize.s0_35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  image: DecorationImage(
                    image: NetworkImage('${articlesModel.urlToImage}'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppSize.s40,
              left: size.width * AppSize.s0_4,
              child: SizedBox(
                height: AppSize.s140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * AppSize.s0_6,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "${articlesModel.title}",
                          style: Theme.of(context).textTheme.headlineMedium,
                          maxLines: AppSize.s2.toInt(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${articlesModel.publishedAt}",
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
