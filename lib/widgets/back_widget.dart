import 'package:flutter/material.dart';
import 'package:news_app/resources/color_manager.dart';
import 'package:news_app/resources/values_manager.dart';

import '../utils/utils.dart';

class BackWidget extends StatelessWidget {
  final Color? colorPassed;
  final Function? fct;
  const BackWidget({
    Key? key,
    this.colorPassed,
    this.fct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (fct != null) {
          fct!();
        }
        Navigator.canPop(context) ? Navigator.of(context).pop() : null;
      },
      borderRadius: BorderRadius.circular(AppSize.s12),
      child: Icon(
        Icons.arrow_back,
        color: ColorManager.black,
        size: 24.0,
      ),
    );
  }
}
