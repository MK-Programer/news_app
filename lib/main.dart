import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/providers/bookmark_provider.dart';
import 'package:news_app/resources/route_manager.dart';
import 'package:news_app/resources/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ArticlesProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return BookMarkProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NEWS APP',
        theme: ThemeManager.themeData(),
        initialRoute: Routes.fetchRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
