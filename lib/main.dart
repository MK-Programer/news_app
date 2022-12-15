import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/resources/route_manager.dart';
import 'package:news_app/resources/theme_manager.dart';
import 'package:provider/provider.dart';

import 'inner_screens/news_details_screen.dart';
import 'screens/fetch_screen.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NEWS APP',
        theme: ThemeManager.themeData(),
        // home: const FetchScreen(),
        // home: NewsDetailsScreen(),
        initialRoute: Routes.fetchRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
