import 'package:flutter/material.dart';
import 'package:news_app/resources/route_manager.dart';
import 'package:news_app/resources/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEWS APP',
      theme: ThemeManager.themeData(),
      initialRoute: Routes.mainRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
